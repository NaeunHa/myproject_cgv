package com.springboot.cgv.web.service;

import com.springboot.cgv.web.dto.movie.AddMovieReqDto;

public interface AdminService {

	boolean addMovieData(AddMovieReqDto addMovieReqDto);
	
}
