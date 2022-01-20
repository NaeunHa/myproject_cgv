package com.springboot.cgv.web.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.springboot.cgv.domain.user.User;
import com.springboot.cgv.domain.user.UserRepository;
import com.springboot.cgv.web.dto.auth.SignUpReqDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AuthServiceImpl implements AuthService{
	
	private final UserRepository userRepository;
	
	@Override
	public int confirmId(String userId) {
		int result = 0;
		result = userRepository.checkUserId(userId); 
		return result;
	}
	
	@Override
	public int signup(SignUpReqDto signUpReqDto) {
		User user = signUpReqDto.toEntity();
		user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
		user.setRole("ROLE_USER");
		int signupResult = userRepository.signup(user);
		return signupResult;
	}	
}

