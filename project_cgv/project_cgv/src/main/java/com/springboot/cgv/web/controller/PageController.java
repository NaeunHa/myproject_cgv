package com.springboot.cgv.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class PageController {

	@GetMapping({"/", "/index"})
	public String indexPage() {
		return "index";
	}
	
	@GetMapping("/auth/signin")
	public String signinPage() {
		return "auth/sign_in";
	}
	
	@GetMapping("/auth/signup")
	public String signupPage() {
		return "auth/sign_up";
	}
	
	@GetMapping("/user/mycgv")
	public String mycgvPage() {
		return "mypage";
	}
	
	@GetMapping("/user/mycgv/wish")
	public String mycgvWishPage() {
		return "dtl_wish";
	}
	
	@GetMapping("/user/mycgv/watched")
	public String mycgvWatchedPage() {
		return "dtl_watched";
	}
	
	@GetMapping("/user/mycgv/review")
	public String mycgvReviewPage() {
		return "dtl_review";
	}
	
	@GetMapping("/movies")
	public String moviesPage() {
		return "movie_chart";
	}
	
	@GetMapping("/movies/detail-view")
	public String moviesDeatilPage() {
		return "movie_dtl";
	}
}
