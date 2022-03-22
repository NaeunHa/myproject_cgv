package com.springboot.cgv.web.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import com.springboot.cgv.config.auth.PrincipalDetails;
import com.springboot.cgv.domain.user.User;
import com.springboot.cgv.domain.user.UserRepository;
import com.springboot.cgv.web.dto.auth.PasswordReqDto;
import com.springboot.cgv.web.dto.auth.PasswordRespDto;
import com.springboot.cgv.web.dto.auth.SignUpReqDto;
import com.springboot.cgv.web.dto.auth.SignUpRespDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AuthServiceImpl implements AuthService{
	
	private final UserRepository userRepository;
	
	@Override
	public int checkPhone(String phone) {
		int result = userRepository.checkPhone(phone);
		if(result != 0) { // 중복된 번호가 있음
			result = 1;
		}
		return result;
	}
	
	@Override
	public int confirmId(String userId) {
		int result = 0;
		result = userRepository.checkUserId(userId); 
		return result;
	}
	
	@Override
	public SignUpRespDto<?> validCheck(SignUpReqDto signUpReqDto, BindingResult bindingResult) {
		
		if(bindingResult.hasErrors()) {
			Map<String, String> errorMap = new HashMap<String, String>();
			
			for(FieldError error : bindingResult.getFieldErrors()) {
				errorMap.put(error.getField(), error.getDefaultMessage());
			}
			System.out.println(errorMap);
			SignUpRespDto<Map<String, String>> signUpRespDto = new SignUpRespDto<Map<String, String>>();
			signUpRespDto.setCode(400);
			signUpRespDto.setMsg(errorMap);
			
			return signUpRespDto;
		}else {
			// 회원가입 가능
			User userEntity = signUpReqDto.toEntity();
			System.out.println(userEntity);
			userRepository.insertUser(userEntity);
			
			SignUpRespDto<String> signUpRespDto = new SignUpRespDto<String>();
			signUpRespDto.setCode(200);
			signUpRespDto.setMsg("회원가입 성공.\n로그인페이지로 이동합니다.");

			return signUpRespDto;
		}
	}
	
	@Override
	public String findUserId(String phone) {
		return userRepository.getUserIdByPhone(phone);
	}
	
	
	
	
}

