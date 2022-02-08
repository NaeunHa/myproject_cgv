package com.springboot.cgv.domain.movie;

import org.apache.ibatis.annotations.Mapper;

@Mapper	
public interface MovieRepository {
	public int insertMovieData(Movie movie);
}
