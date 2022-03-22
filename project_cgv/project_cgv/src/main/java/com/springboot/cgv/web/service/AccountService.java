package com.springboot.cgv.web.service;

import com.springboot.cgv.config.auth.PrincipalDetails;
import com.springboot.cgv.web.dto.auth.PasswordReqDto;
import com.springboot.cgv.web.dto.auth.PasswordRespDto;
import com.springboot.cgv.web.dto.mypage.MyPageReqDto;

public interface AccountService {
	
	int checkNickname(String nickname);
	boolean updateUserInfo(PrincipalDetails principalDetails, MyPageReqDto myPageReqDto);
	boolean checkPassword(PrincipalDetails principalDetails, String password);
	boolean updatePersonalInfo(PrincipalDetails principalDetails, MyPageReqDto myPageReqDto);
	PasswordRespDto updatePassword(PasswordReqDto passwordReqDto);
	int withdrawalUser(PrincipalDetails principalDetails);
}
