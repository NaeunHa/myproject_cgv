package com.springboot.cgv.web.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.cgv.config.auth.PrincipalDetails;
import com.springboot.cgv.web.service.MovieService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class PageController {
	
	private final MovieService movieService;

	@GetMapping({"/", "/index"})
	public String indexPage() {
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
		return "auth/find_id";
	}
	
	@GetMapping("/find-password")
	public String findPwPage() {
		return "auth/find_pw";
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
	
	@GetMapping("/user/account/check/password")
	public String mycgvCheckPasswordPage() {
		return "mypage/dtl_checkpassword";
	}
	
	@GetMapping("/user/account/redirect/personal")
	public String mycgvPersonalRedirect(@AuthenticationPrincipal PrincipalDetails principalDetails) {
		if(principalDetails.getUser().getProvider() != null) {
			return "redirect:/user/account/personal";
		}
		return "redirect:/user/account/check/password?redirect=personal";
	}
	
	@GetMapping("/user/account/redirect/withdrawal")
	public String withdrawalRedirect(@AuthenticationPrincipal PrincipalDetails principalDetails) {
		if(principalDetails.getUser().getProvider() != null) {
			return "redirect:/user/account/withdrawal";
		}
		return "redirect:/user/account/check/password?redirect=withdrawal";
	}
	
	@GetMapping("user/account/personal")
	public String mycgvPersonalPage() {
		return "mypage/dtl_personal";
	}
	
	@GetMapping("user/account/withdrawal")
	public String withdrawalPage() {
		return "mypage/dtl_withdrawal";
	}
	
	
	@GetMapping("/movies")
	public String moviesPage() {
		return "movie/movie_chart";
	}
	
	@GetMapping("/admin/add-movie")
	public String addmoviePage() {
		return "admin/add_movies";
	}

}
