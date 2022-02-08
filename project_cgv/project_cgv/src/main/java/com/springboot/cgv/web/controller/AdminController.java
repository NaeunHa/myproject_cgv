package com.springboot.cgv.web.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.springboot.cgv.web.dto.movie.AddMovieReqDto;
import com.springboot.cgv.web.service.AdminService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/admin/")
@RequiredArgsConstructor
public class AdminController {
	
	private final AdminService adminService;
	
	@PostMapping("add-movie")
	public boolean addMovieData(AddMovieReqDto addMovieReqDto) {
		return adminService.addMovieData(addMovieReqDto);
	}
	
}
