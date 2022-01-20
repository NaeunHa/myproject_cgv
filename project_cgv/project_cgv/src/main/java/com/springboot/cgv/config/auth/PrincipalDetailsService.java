package com.springboot.cgv.config.auth;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.springboot.cgv.domain.user.User;
import com.springboot.cgv.domain.user.UserRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class PrincipalDetailsService implements UserDetailsService {

	private final UserRepository userRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = userRepository.getUser(username);
		if(user == null) {
			return null;
		}else {
			UserDetails principalDetails = new PrincipalDetails(user);
			System.out.println(user);
			return principalDetails;
		}
	}

	
}
