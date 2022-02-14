package com.springboot.cgv.web.service;

import java.util.List;

import com.springboot.cgv.domain.movie.Movie;
import com.springboot.cgv.web.dto.movie.AddMovieReqDto;
import com.springboot.cgv.web.dto.movie.IndexMovieDto;
import com.springboot.cgv.web.dto.movie.MovieChartDto;
import com.springboot.cgv.web.dto.movie.updateMovieDto;

public interface MovieService {
	boolean addMovieData(AddMovieReqDto addMovieReqDto);
	List<IndexMovieDto> getIndexMovieList();
	List<Movie> getMovieList();
	List<MovieChartDto> getMovieChartList();
	Movie getMovie(String movieCode);
	boolean updateMovieData(updateMovieDto updateMovieDto);
}
