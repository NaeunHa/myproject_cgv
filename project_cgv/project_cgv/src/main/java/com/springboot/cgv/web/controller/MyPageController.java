package com.springboot.cgv.web.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.springboot.cgv.config.auth.PrincipalDetails;
import com.springboot.cgv.web.dto.mypage.MyPageReqDto;
import com.springboot.cgv.web.service.MyPageService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/user/my-cgv/")
public class MyPageController {
	
	private final MyPageService myPageSevice;
	
	@PostMapping("check-nickname/{nickname}")
	public int checkNickname(@PathVariable String nickname) {
		return myPageSevice.checkNickname(nickname);
	}
	
	@PatchMapping("update-info")
	public boolean updateUser(MyPageReqDto myPageReqDto, @AuthenticationPrincipal PrincipalDetails principalDetails) {
		return myPageSevice.updateUserInfo(principalDetails, myPageReqDto);
	}
	
	@PostMapping("check-password")
	public boolean checkPassword(@AuthenticationPrincipal PrincipalDetails principalDetails, String password) {
		return myPageSevice.checkPassword(principalDetails, password);
	}
	
	@PatchMapping("update-personal-info")
	public boolean updatePersonal(MyPageReqDto myPageReqDto, @AuthenticationPrincipal PrincipalDetails principalDetails) {
		return myPageSevice.updatePersonalInfo(principalDetails, myPageReqDto);
	}
}
