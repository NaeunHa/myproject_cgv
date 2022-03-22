package com.springboot.cgv.web.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.springboot.cgv.config.auth.PrincipalDetails;
import com.springboot.cgv.web.dto.auth.PasswordReqDto;
import com.springboot.cgv.web.dto.mypage.MyPageReqDto;
import com.springboot.cgv.web.service.AccountService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/user/account/")
public class AccountController {
	
	private final AccountService accountService;
	
	@PostMapping("check/{nickname}")
	public int checkNickname(@PathVariable String nickname) {
		return accountService.checkNickname(nickname);
	}
	
	@PatchMapping("update/user-detail")
	public boolean updateUser(MyPageReqDto myPageReqDto, @AuthenticationPrincipal PrincipalDetails principalDetails) {
		return accountService.updateUserInfo(principalDetails, myPageReqDto);
	}

	@PostMapping("check/password")
	public boolean checkPassword(@AuthenticationPrincipal PrincipalDetails principalDetails, String password) {
		return accountService.checkPassword(principalDetails, password);
	}
	
	@PatchMapping("update/user")
	public boolean updatePersonal(MyPageReqDto myPageReqDto, @AuthenticationPrincipal PrincipalDetails principalDetails) {
		return accountService.updatePersonalInfo(principalDetails, myPageReqDto);
	}
	
	@DeleteMapping("withdrawal")
	public int deleteUser(@AuthenticationPrincipal PrincipalDetails principalDetails) {
		System.out.println("회원탈퇴");
		return accountService.withdrawalUser(principalDetails);
	}
	
}
