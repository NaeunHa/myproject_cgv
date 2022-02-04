package com.springboot.cgv.web.dto.mypage;

import org.springframework.web.multipart.MultipartFile;

import com.springboot.cgv.domain.user.User;

import lombok.Data;

@Data
public class MyPageReqDto {

	private int id;
	private String nickname;
	private MultipartFile file;
	
	private String password;
	private String birthday;
	private String phone;
	private String email;
	
	public User toEntity(int id) {
		return User.builder()
				.id(id)
				.nickname(nickname)
				.build();
	}
	
	public User personalEntitiy(int id) {
		return User.builder()
				.id(id)
				.password(password)
				.birthday(birthday)
				.phone(phone)
				.email(email)
				.build();
	}
	
}
