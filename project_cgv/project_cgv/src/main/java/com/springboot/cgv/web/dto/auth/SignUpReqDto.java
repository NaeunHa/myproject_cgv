package com.springboot.cgv.web.dto.auth;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import com.springboot.cgv.domain.user.User;

import lombok.Data;

@Data
public class SignUpReqDto { // Request Dto (요청)
	@Size(min = 2, max = 20)
	@NotBlank
	private String userid;
	@NotBlank
	private String username;
	@NotBlank
	private String password;
	@NotBlank
	private String birthday;
	@NotBlank
	private String phone;
	@NotBlank
	private String email;
	
	public User toEntity() {
		return User.builder()
				.userid(userid)
				.username(username)
				.password(password)
				.birthday(birthday)
				.phone(phone)
				.email(email)
				.build();
	}
}
