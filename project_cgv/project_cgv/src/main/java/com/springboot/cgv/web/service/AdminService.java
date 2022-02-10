package com.springboot.cgv.web.service;

import java.util.List;

import com.springboot.cgv.domain.movie.Movie;
import com.springboot.cgv.web.dto.movie.AddMovieReqDto;
import com.springboot.cgv.web.dto.movie.updateMovieDto;

public interface AdminService {
	boolean addMovieData(AddMovieReqDto addMovieReqDto);
	List<Movie> getMovieList();
	Movie getMovie(String movieCode);
	boolean updateMovieData(updateMovieDto updateMovieDto);
}
