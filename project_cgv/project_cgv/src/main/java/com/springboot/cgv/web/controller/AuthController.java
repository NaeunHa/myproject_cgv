package com.springboot.cgv.web.controller;

import javax.validation.Valid;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.springboot.cgv.config.auth.PrincipalDetails;
import com.springboot.cgv.web.dto.auth.PasswordReqDto;
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
		String authenticationCode = "";
		int result = authService.checkPhone(phonNum);
		if(result != 1) {
			authenticationCode = "123456";
//			authenticationCode = coolSMSService.sendAuthenticationCode(phonNum);	
		}else {
			authenticationCode = Integer.toString(result);
		}
		return authenticationCode;
	}
	
	@PostMapping("/confirm-id/{userId}")
	public int confirmId(@PathVariable String userId) {
		int result = 0;
		result = authService.confirmId(userId);
		System.out.println(result);
		return result;
	}
	
	@PostMapping("/sign-up")
	public Object signup(@Valid SignUpReqDto signUpReqDto, BindingResult bindingResult) {
		System.out.println(signUpReqDto);
		return  authService.validCheck(signUpReqDto, bindingResult);
	}
	
	@PostMapping("/find/check-phone/{phoneNum}")
	public String checkphoneNum(@PathVariable String phoneNum) {
		String code = "";
		int result = authService.checkPhone(phoneNum);
		if(result == 1) {
			code = "123456";
//			code = coolSMSService.sendAuthenticationCode(phonNum);
		}else {
			code = null;
		}
		return code;
	}
	
	@PostMapping("/find/checked-phone/{phoneNum}")
	public String getUserId(@PathVariable String phoneNum) {
		return authService.findUserId(phoneNum);
	}
	
	@PatchMapping("/update/password")
	public Object updatePassword(PasswordReqDto passwordReqDto) {
		System.out.println(passwordReqDto);
		return authService.updatePassword(passwordReqDto);
	}
	
}
