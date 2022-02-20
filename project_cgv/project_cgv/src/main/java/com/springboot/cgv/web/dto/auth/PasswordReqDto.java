package com.springboot.cgv.web.dto.auth;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.springboot.cgv.domain.user.User;

import lombok.Data;

@Data
public class PasswordReqDto {
	private String userid;
	private String newPassword;
	
	public User toEntity() {
		return User.builder()
					.userid(userid)
					.password(new BCryptPasswordEncoder().encode(newPassword))
					.build();
	}
}
