package com.springboot.cgv.web.dto.mypage;

import org.springframework.web.multipart.MultipartFile;

import com.springboot.cgv.domain.user.User;

import lombok.Data;

@Data
public class MyPageReqDto {

	private int id;
	private String nickname;
	private MultipartFile file;
	
	public User toEntity(int id) {
		return User.builder()
				.id(id)
				.nickname(nickname)
				.build();
	}
	
}
