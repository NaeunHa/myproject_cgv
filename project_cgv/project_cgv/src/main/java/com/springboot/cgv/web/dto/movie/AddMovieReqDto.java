package com.springboot.cgv.web.dto.movie;

import org.springframework.web.multipart.MultipartFile;

import com.springboot.cgv.domain.movie.Movie;

import lombok.Data;

@Data
public class AddMovieReqDto {

	private String movie_code;
	private String movie_title_kor;
	private String movie_title_eng;
	private String movie_genre;		
	private String movie_limited_age;
	private String movie_description;
	private String movie_actors;
	private String movie_director;
	private String movie_runtime;
	private MultipartFile movie_poster_img;
	private MultipartFile movie_trailer_mp4;
	private String movie_release_date;
	private String movie_close_date;
	
	public Movie toEntity() {
		return Movie.builder()
					.movie_code(movie_code)
					.movie_title_kor(movie_title_kor)
					.movie_title_eng(movie_title_eng)
					.movie_genre(movie_genre)
					.movie_limited_age(movie_limited_age)
					.movie_description(movie_description)
					.movie_actors(movie_actors)
					.movie_director(movie_director)
					.movie_runtime(movie_runtime)
					.movie_release_date(movie_release_date)
					.movie_close_date(movie_close_date)
					.build();
	}
	
}
