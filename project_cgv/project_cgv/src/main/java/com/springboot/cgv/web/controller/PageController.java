package com.springboot.cgv.web.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.cgv.config.auth.PrincipalDetails;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class PageController {

	@GetMapping({"/", "/index"})
	public String indexPage(@AuthenticationPrincipal PrincipalDetails principalDetails) {
		return "index";
	}
	
	@GetMapping("/auth/check-phone")
	public String signupCheckPhonePage() {
		return "auth/check_phone";
	}
	
	@GetMapping("/auth/sign-up")
	public String signupPage(Model model, @PathVariable @RequestParam String phone) {
		model.addAttribute("phone", phone);
		return "auth/sign_up";
	}
	
	@GetMapping("/auth/sign-in")
	public String signInPage() {
		return "auth/sign_in";
	}
	
	@GetMapping("/find-id")
	public String findIdPage() {
		return "find_id";
	}
	
	@GetMapping("/find-password")
	public String findPwPage() {
		return "find_pw";
	}
	
	@GetMapping("/user/my-cgv")
	public String mycgvPage() {
		return "mypage/mypage";
	}
	
	@GetMapping("/user/my-cgv/wish")
	public String mycgvWishPage() {
		return "mypage/dtl_wish";
	}
	
	@GetMapping("/user/my-cgv/watched")
	public String mycgvWatchedPage() {
		return "mypage/dtl_watched";
	}
	
	@GetMapping("/user/my-cgv/review")
	public String mycgvReviewPage() {
		return "mypage/dtl_review";
	}
	
	@GetMapping("/user/my-cgv/check-password")
	public String mycgvCheckPasswordPage() {
		return "mypage/dtl_checkpassword";
	}
	
	@GetMapping("/user/my-cgv/personal")
	public String mycgvPersonalPage() {
		return "mypage/dtl_personal";
	}
	
	@GetMapping("/movies")
	public String moviesPage() {
		return "movie_chart";
	}
	
	@GetMapping("/movies/detail-view")
	public String moviesDeatilPage() {
		return "movie_dtl";
	}
	
	@GetMapping("/admin/add-movie")
	public String addmoviePage() {
		return "admin/add_movies";
	}
	
	@GetMapping("/admin/cgv-movie-list")
	public String movieList() {
		return "admin/cgv_movie_list";
	}

}
