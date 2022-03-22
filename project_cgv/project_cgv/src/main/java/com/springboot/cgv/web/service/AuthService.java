package com.springboot.cgv.web.service;

import org.springframework.validation.BindingResult;

import com.springboot.cgv.config.auth.PrincipalDetails;
import com.springboot.cgv.web.dto.auth.PasswordReqDto;
import com.springboot.cgv.web.dto.auth.PasswordRespDto;
import com.springboot.cgv.web.dto.auth.SignUpReqDto;
import com.springboot.cgv.web.dto.auth.SignUpRespDto;

public interface AuthService {
	public int checkPhone(String phone);
	public int confirmId(String userId);
	public SignUpRespDto<?> validCheck(SignUpReqDto signUpReqDto, BindingResult bindingResult);
	public String findUserId(String phone);
	PasswordRespDto updatePassword(PasswordReqDto passwordReqDto);
}
