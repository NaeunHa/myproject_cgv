package com.springboot.cgv.web.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.springboot.cgv.config.auth.PrincipalDetails;
import com.springboot.cgv.web.dto.mypage.MyPageReqDto;
import com.springboot.cgv.web.service.MyPageSevice;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/user/my-cgv/")
public class MyPageController {
	
	private final MyPageSevice myPageSevice;
	
	@PostMapping("check-nickname/{nickname}")
	public int checkNickname(@PathVariable String nickname) {
		return myPageSevice.checkNickname(nickname);
	}
	
	@PatchMapping("update-info")
	public boolean updateUser(MyPageReqDto myPageReqDto, @AuthenticationPrincipal PrincipalDetails principalDetails) {
		return myPageSevice.updateUserInfo(principalDetails, myPageReqDto);
	}
	
}
