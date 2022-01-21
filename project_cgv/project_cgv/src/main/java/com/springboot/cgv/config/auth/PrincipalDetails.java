package com.springboot.cgv.config.auth;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.springboot.cgv.domain.user.User;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class PrincipalDetails implements UserDetails{

	private static final long serialVersionUID = 1L;
	
	private User user;
		
	// 일반 로그인
//	public PrincipalDetails(User user) {
//		this.user = user;
//	}

	@Override
	public String getPassword() {
		return user.getPassword();
	}

	@Override
	public String getUsername() {
		return user.getUserid();
	}

	// 계정 만료 - true 
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	// 계정 lock - true
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	// 1년 이상 계정을 사용하지 않으면 휴면계정
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	// 계정 임시탈퇴
	@Override
	public boolean isEnabled() {
		return true;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return null;
	}
	
}
