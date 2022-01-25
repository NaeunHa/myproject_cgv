package com.springboot.cgv.config.oauth2;

import java.util.Map;
import java.util.UUID;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.springboot.cgv.config.auth.PrincipalDetails;
import com.springboot.cgv.config.oauth2.provider.Oauth2UserDto;
import com.springboot.cgv.domain.user.User;
import com.springboot.cgv.domain.user.UserRepository;
import com.springboot.cgv.web.service.AuthService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class PrincipalOauth2UserService extends DefaultOAuth2UserService{
	
	private final UserRepository userRepository;
	private AuthService authService;
	
	public OAuth2User loadUser(OAuth2UserRequest userRequest) {
		System.out.println(userRequest.getClientRegistration());
		System.out.println(userRequest.getAccessToken());
		System.out.println(super.loadUser(userRequest).getAttributes());
		
		OAuth2User oAuth2User = super.loadUser(userRequest);
		Map<String, Object> attributes = (Map<String, Object>) oAuth2User.getAttributes().get("response");
		
		// 정보 가공
		String provider = userRequest.getClientRegistration().getRegistrationId();
		System.out.println(provider);
		String email = (String)attributes.get("email");
		String userid = email.substring(0, email.lastIndexOf("@"));
		
		String phone  = (String)attributes.get("mobile");
		phone = "010" + phone.substring(4, 8) + phone.substring(9, 13); 
		
		String birthday = null;
		if(attributes.get("birthday") != null) {
			birthday = (String)attributes.get("birthday");
			String birthyear = (String)attributes.get("birthyear");
			birthday = birthyear + birthday.substring(0, 2) + birthday.substring(3, 5);
		}
		
		User userEntity = userRepository.getUserById(userid);
		if(userEntity == null) {
			// 첫 로그인
			Oauth2UserDto oauth2UserDto = Oauth2UserDto.builder()
													.userid(userid)
													.username((String)attributes.get("name"))
													.password(new BCryptPasswordEncoder().encode(UUID.randomUUID().toString()))
													.birthday(birthday)
													.phone(phone)
													.email(email)
													.role("ROLE_USER")
													.provider(provider)
													.build();
			
			userEntity = oauth2UserDto.toEntity();
			System.out.println(userEntity);
			userRepository.insertUser(userEntity);
		}
		
		return new PrincipalDetails(userEntity, attributes);
		
	}
	
}
