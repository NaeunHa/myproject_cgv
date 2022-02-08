package com.springboot.cgv.domain.movie;

import java.time.LocalDateTime;
import java.util.Date;

import lombok.Data;

@Data
public class Movie {
	
	private int movie_id;
	private String movie_title_kor;
	private String movie_title_eng;
	private String movie_genre;
	private String movie_limited_age;
	private String movie_description;
	private String movie_actors;
	private String movie_director;
	private String movie_runtime;
	private String movie_poster_img;
	private String movie_trailer_mp4;
	private Date movie_release_date;
	private Date movie_close_date;
	private LocalDateTime movie_create_date;
	private LocalDateTime movie_update_date;
}
