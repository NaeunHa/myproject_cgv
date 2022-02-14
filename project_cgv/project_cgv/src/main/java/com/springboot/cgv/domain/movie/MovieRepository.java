package com.springboot.cgv.domain.movie;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.cgv.web.dto.movie.IndexMovieDto;

@Mapper	
public interface MovieRepository {
	public int insertMovieData(Movie movie);
	public List<Movie> getMovieAll();
	public List<Movie> getIndexMovieList();
	public List<Movie> getMovieChartList();
	public Movie getMovieByCode(String movieCode);
}
