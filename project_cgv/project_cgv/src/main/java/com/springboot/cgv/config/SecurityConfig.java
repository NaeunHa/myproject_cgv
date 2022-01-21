package com.springboot.cgv.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configurers.RememberMeConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.LogoutHandler;

import com.springboot.cgv.config.auth.LoginFailService;
import com.springboot.cgv.config.auth.PrincipalDetailsService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@EnableWebSecurity
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	private LoginFailService loginFailService;
	
	@Bean
	PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.csrf().disable();
		
		http.authorizeRequests() // 사용자의 인증 객체
			.antMatchers("/user/**") // 해당 mapping 들은
			.authenticated() // 인증이 필요하다.
			.anyRequest() // 이외의 mapping 들은
			.permitAll() // 허용한다.
			.and()
			.formLogin() // 로그인페이지 커스텀
			.loginPage("/auth/sign-in") // get 요청
			.loginProcessingUrl("/auth/sign-in") // post 요청
			.failureHandler(loginFailService)
			.defaultSuccessUrl("/")
			.and()
			.logout() // 로그아웃
			.logoutUrl("/auth/logout")
			.logoutSuccessUrl("/")
			.invalidateHttpSession(true)
			.and()
			.rememberMe() // 쿠키설정
			.key("remember-me")
			.rememberMeParameter("remember-me")
			.tokenValiditySeconds(86400 * 30);
			
	}
	
}