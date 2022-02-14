package com.springboot.cgv.web.dto.movie;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class IndexMovieDto {
	
	private String movie_code;
	private String movie_title_kor;
	private String movie_limited_age;
	private String movie_release_date;
	private int dDay;
	private String movie_poster_img;

}
