package com.springboot.cgv.domain.movie;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper	
public interface MovieRepository {
	public int insertMovieData(Movie movie);
	public List<Movie> getMovieAll();
	public Movie getMovieByCode(String movieCode);
}
