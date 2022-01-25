package com.springboot.cgv.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper;

import com.springboot.cgv.config.auth.PrincipalDetailsService;
import com.springboot.cgv.config.oauth2.PrincipalOauth2UserService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@EnableWebSecurity
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	private final PrincipalDetailsService principalDetailsService;
	private final PrincipalOauth2UserService  oauth2UserService;
	@Qualifier("dataSource")
	private final DataSource dataSource;
	
	@Bean
	PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	PersistentTokenRepository tokenRepository() {
		JdbcTokenRepositoryImpl jdbcTokenRepository = new JdbcTokenRepositoryImpl();
		jdbcTokenRepository.setDataSource(dataSource);
		return jdbcTokenRepository;
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
			.loginProcessingUrl("/login") // post 요청 mapping
			.defaultSuccessUrl("/")
			.and()
			.oauth2Login()
			.loginPage("/auth/sign-in")
			.userInfoEndpoint()
			.userService(oauth2UserService)
			.and()
			.defaultSuccessUrl("/")
			.and()
			.logout() // 로그아웃
			.logoutUrl("/logout")
			.logoutSuccessUrl("/")
			.invalidateHttpSession(true)
			.deleteCookies("remember-me", "JSESSIONID")
			.and()
			.rememberMe() // 쿠키설정
			.key("remember-me")
			.tokenRepository(tokenRepository())
			.userDetailsService(principalDetailsService)
			.tokenValiditySeconds(86400 * 30);
			
			
	}
	
}