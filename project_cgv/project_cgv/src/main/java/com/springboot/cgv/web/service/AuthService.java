package com.springboot.cgv.web.service;

import com.springboot.cgv.web.dto.auth.SignUpReqDto;

public interface AuthService {
	public int confirmId(String userId);
	public int signup(SignUpReqDto signUpReqDto);
}
