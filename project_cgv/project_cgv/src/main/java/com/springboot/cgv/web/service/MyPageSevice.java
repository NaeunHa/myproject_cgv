package com.springboot.cgv.web.service;

import com.springboot.cgv.config.auth.PrincipalDetails;
import com.springboot.cgv.web.dto.mypage.MyPageReqDto;

public interface MyPageSevice {
	public int checkNickname(String nickname);
	boolean updateUserInfo(PrincipalDetails principalDetails, MyPageReqDto myPageReqDto);
}
