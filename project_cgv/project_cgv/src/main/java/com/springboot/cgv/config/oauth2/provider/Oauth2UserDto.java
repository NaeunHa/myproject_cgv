package com.springboot.cgv.config.oauth2.provider;

import javax.validation.constraints.NotBlank;

import com.springboot.cgv.domain.user.User;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class Oauth2UserDto {

	private int id;
	@NotBlank
	private String userid;
	@NotBlank
	private String username;
	private String password;
	private String birthday;
	@NotBlank
	private String phone;
	private String email;
	private String provider;
	private String role;
	
	public User toEntity() {
		return User.builder()
				.userid(userid)
				.username(username)
				.password(password)
				.birthday(birthday)
				.phone(phone)
				.email(email)
				.provider(provider)
				.role(role)
				.build();
				
	}
	
}
