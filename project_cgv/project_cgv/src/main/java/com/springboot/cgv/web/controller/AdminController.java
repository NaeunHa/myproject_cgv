package com.springboot.cgv.web.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.cgv.domain.movie.Movie;
import com.springboot.cgv.web.dto.movie.AddMovieReqDto;
import com.springboot.cgv.web.dto.movie.updateMovieDto;
import com.springboot.cgv.web.service.MovieService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/admin/")
@RequiredArgsConstructor
public class AdminController {
	
	private final MovieService movieService;
	
	@PostMapping("add-movie")
	public boolean addMovieData(AddMovieReqDto addMovieReqDto) {
		return movieService.addMovieData(addMovieReqDto);
	}
	
	@GetMapping("cgv-movie-list")
	public ModelAndView cgvMovieListPage() {
		ModelAndView mav = new ModelAndView("admin/cgv_movie_list");
		mav.addObject("movieList", movieService.getMovieList());
		return mav;
	}
	
	@GetMapping("cgv-movie-detail")
	public ModelAndView cgvMovieDetailPage(@RequestParam String movieCd) {
		ModelAndView mav = new ModelAndView("admin/cgv_movie_dtl");
		mav.addObject("movieData", movieService.getMovie(movieCd));
		return mav;
	}
	
	@PatchMapping("update-movie")
	public boolean updateMovieData(updateMovieDto updateMovieDto) {
		return false;
	}
	
}
