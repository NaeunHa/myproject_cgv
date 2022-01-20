package com.springboot.cgv.web.controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.springboot.cgv.web.dto.auth.SignUpReqDto;
import com.springboot.cgv.web.service.AuthService;
import com.springboot.cgv.web.service.CoolSMSService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/auth")
public class AuthController {

	private final AuthService authService;
	private final CoolSMSService coolSMSService;
	
	@PostMapping("/sign-up/sendSMS/{phonNum}")
	public String sendSMS(@PathVariable String phonNum) {
		String authenticationCode = "123456";
//		authenticationCode = coolSMSService.sendAuthenticationCode(phonNum);
		return authenticationCode;
	}
	
	@PostMapping("/sign-up/confirm-id/{userId}")
	public int confirmId(@PathVariable String userId) {
		System.out.println(userId);
		int result = 0;
		result = authService.confirmId(userId);
		System.out.println(result);
		return result;
	}
	
	@PostMapping("/sign-up")
	public int signup(@RequestBody SignUpReqDto signUpReqDto) {
		System.out.println(signUpReqDto);
		int result = 0;
		result = authService.signup(signUpReqDto);
		return result;
	}
	
}
