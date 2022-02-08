package com.springboot.cgv.config.auth;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import com.springboot.cgv.domain.movie.Movie;
import com.springboot.cgv.domain.user.User;

import lombok.Data;

@Data
public class PrincipalDetails implements UserDetails, OAuth2User{

	private static final long serialVersionUID = 1L;
	
	private User user;
	private Map<String, Object> attributes;
		
	 //일반 로그인
	public PrincipalDetails(User user) {
		this.user = user;
	}
	
	// Oauth2 로그인
	public PrincipalDetails(User user, Map<String, Object> attributes) {
		this.user = user;
		this.attributes = attributes;
	}

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
		Collection<GrantedAuthority> collection = new ArrayList<GrantedAuthority>();
		collection.add(new GrantedAuthority() {
			
			private static final long serialVersionUID = 1L;
			
			@Override
			public String getAuthority() {
				return user.getRole();
			}
		});
		return collection;
	}

	@Override
	public String getName() {
		return (String)attributes.get("name");
	}
	
}
