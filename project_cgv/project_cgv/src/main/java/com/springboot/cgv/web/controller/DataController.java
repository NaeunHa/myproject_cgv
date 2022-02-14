package com.springboot.cgv.web.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.cgv.domain.movie.Movie;
import com.springboot.cgv.web.dto.movie.IndexMovieDto;
import com.springboot.cgv.web.dto.movie.MovieChartDto;
import com.springboot.cgv.web.service.MovieService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class DataController {
	
	private final MovieService movieService;
	
	@GetMapping("/get-movie-list")
	public Object getIndexMovie() {
		List<IndexMovieDto> movieList = movieService.getIndexMovieList();
		return movieList; 
	}
	
	@GetMapping("/movies/detail-view")
	public ModelAndView moviesDeatilPage(@RequestParam String movieCd) {
		ModelAndView mav = new ModelAndView("movie/movie_dtl");
		mav.addObject("movieData", movieService.getMovie(movieCd));
		return mav;
	}
	
	@GetMapping("/get-movies")
	public Object moviesPage() {
		List<MovieChartDto> movieList = movieService.getMovieChartList();
		return movieList;
	}
}
