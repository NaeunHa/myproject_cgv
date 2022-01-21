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
		System.out.println(username);
		User user = userRepository.getUserById(username);
		if(user == null) {
			throw new UsernameNotFoundException(username + " is not found.");
		}else {
			UserDetails principalDetails = new PrincipalDetails(user);
			System.out.println(principalDetails);
			return principalDetails;
		}
	}
}
