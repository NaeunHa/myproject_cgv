package com.springboot.cgv.web.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.cgv.web.service.KobisService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/admin/")
public class KobisController {
	
	private final KobisService kobisService;

	// 최신 영화 목록
	@GetMapping("latest-movie-list")
	public ModelAndView latestMovieListPage(@RequestParam String page) {
		ModelAndView mav = new ModelAndView("admin/latest_movie_list");
		mav.addObject("movieListData", kobisService.getMovieList(page));
		return mav;
	}
	
	// 영화 등록
	@GetMapping("kobis-add-movie")
	public ModelAndView addMoviePage(@RequestParam String movieCd) {
		ModelAndView mav = new ModelAndView("admin/add_movies");
		mav.addObject("movieDetailData", kobisService.getMovieDetailList(movieCd));
		return mav;
	}
}
