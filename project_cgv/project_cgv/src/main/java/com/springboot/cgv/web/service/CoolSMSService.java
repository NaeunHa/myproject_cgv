package com.springboot.cgv.web.service;

import java.util.HashMap;
import java.util.Random;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import net.minidev.json.JSONArray;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class CoolSMSService {

	private final String API_KEY = "NCS8Q6LVHCM3OS9Q";
	private final String API_SECRET_KEY = "UQWKHOLYKLVIRYH3XWFP3TEXABZBZKW0";
	private final String ADMIN_PHONENUM = "01066704411";
	
	// 인증코드 생성 메서드
	public String createAuthenticationCode() {
		String authenticationCode = "";
		Random randomNumber = new Random();
		int codeLength = 6;
		
		for(int i = 0; i < codeLength; i++) {
			String randomCode = Integer.toString(randomNumber.nextInt(10));
			authenticationCode += randomCode;
		}
		
		return authenticationCode;
	}
	
	// 코드 전송 메서드
	public String sendAuthenticationCode(String phoneNumber) {
		// coolSMS SDK 라이브러리
		Message coolSMS = new Message(API_KEY, API_SECRET_KEY);
		String authenticationCode = createAuthenticationCode();
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phoneNumber);
		params.put("from", ADMIN_PHONENUM);
		params.put("type", "SMS");
		params.put("text", "CGV project 회원가입 인증번호\n인증번호는 ["+authenticationCode+"] 입니다.");
		params.put("app_version", "cgv project app 1.0");
		
		try {
			coolSMS.send(params);
		} catch (CoolsmsException e) {
			e.printStackTrace();
		}
		
		return authenticationCode;
	}
	
}
