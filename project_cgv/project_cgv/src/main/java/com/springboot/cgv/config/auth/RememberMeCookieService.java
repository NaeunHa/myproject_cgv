//package com.springboot.cgv.config.auth;
//
//import java.security.SecureRandom;
//import java.util.Base64;
//import java.util.Base64.Encoder;
//import java.util.Date;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.dao.DataAccessException;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.security.web.authentication.rememberme.AbstractRememberMeServices;
//import org.springframework.security.web.authentication.rememberme.CookieTheftException;
//import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
//import org.springframework.security.web.authentication.rememberme.PersistentRememberMeToken;
//import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
//import org.springframework.security.web.authentication.rememberme.RememberMeAuthenticationException;
//import org.springframework.stereotype.Service;
//
//@Service
//public class RememberMeCookieService extends AbstractRememberMeServices{
//	
//	// DB
//	PersistentTokenRepository rememberMeRepository = new JdbcTokenRepositoryImpl();
//	// token 값 신규 생성을 위한 랜덤 넘버 생성 객체
//	SecureRandom randomToken;
//	
//	// 생성자
//	protected RememberMeCookieService(String key, UserDetailsService userDetailsService) {
//		super(key, userDetailsService);
//		randomToken = new SecureRandom();
//	}
//
//	// 토큰생성메서드
//	private String generateTokenValue() {
//		byte[] newToken = new byte[16];
//		randomToken.nextBytes(newToken);
//		Encoder encoder = Base64.getEncoder();
//		return new String(encoder.encode(newToken));
//	}
//			
//	@Override
//	protected void onLoginSuccess(HttpServletRequest request, HttpServletResponse response,
//			Authentication successfulAuthentication) {
//		
//		String cookieValue = super.extractRememberMeCookie(request);
//		
//		if(cookieValue != null) {
//			rememberMeRepository.removeUserTokens(cookieValue);
//			rememberMeRepository.removeUserTokens(successfulAuthentication.getName());
//		}
//		
//		// 새로운 series, token 값 생성
//		String username = successfulAuthentication.getName();
//		String newSeriesValue = generateTokenValue();
//		String newTokenValue = generateTokenValue();
//		
//		// 쿠기 발급 및 DB insert
//		try {
//			PersistentRememberMeToken newToken = new PersistentRememberMeToken(username, newSeriesValue, newTokenValue, new Date());
//			rememberMeRepository.createNewToken(newToken);
//			
//			String[] rawCookieValues = new String[] {newSeriesValue, newTokenValue};
//			super.setCookie(rawCookieValues, getTokenValiditySeconds(), request, response);
//			
//		} catch (DataAccessException e) {
//			e.printStackTrace();
//		}
//	}
//
//
//	@Override
//	protected UserDetails processAutoLoginCookie(String[] cookieTokens, HttpServletRequest request,
//			HttpServletResponse response) throws RememberMeAuthenticationException, UsernameNotFoundException {
//		
//		if(cookieTokens.length != 2) {
//			throw new RememberMeAuthenticationException("잘못된 쿠키");
//		}
//		
//		String cookieSeries = cookieTokens[0];
//		String cookieToken = cookieTokens[1];
//		
//		PersistentRememberMeToken cookieUser = rememberMeRepository.getTokenForSeries(cookieSeries);
//		
//		if(cookieUser == null) {
//			throw new RememberMeAuthenticationException("존재하지 않는 series");
//		}
//		
//		// DB에 series는 있는데 Token 값이 같지 않을 경우
//		if(! cookieToken.equals(cookieUser.getTokenValue())) {
//			// DB에서 해당 데이터 삭제
//			rememberMeRepository.removeUserTokens(cookieUser.getUsername());
//			
//			throw new CookieTheftException("변조된 쿠키 발견");
//		}
//		
//		// 신규 token 값으로 업데이트
//		String newTokenValue = generateTokenValue();
//		
//		try {
//			// DB에 새로운 token값 업데이트
//			rememberMeRepository.updateToken(cookieSeries, newTokenValue, new Date());
//			
//			// 변경된 token 값으로 새로운 쿠키 발행
//			String[] rawCookieValues = new String[] {cookieSeries, newTokenValue};
//			super.setCookie(rawCookieValues, getTokenValiditySeconds(), request, response);
//			
//		} catch (DataAccessException e) {
//			e.printStackTrace();
//		}
//		
//		return getUserDetailsService().loadUserByUsername(cookieUser.getUsername());
//	}
//
//	
//	
//}
