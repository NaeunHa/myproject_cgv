package com.springboot.cgv.web.dto.movie;

import org.springframework.web.multipart.MultipartFile;

import com.springboot.cgv.domain.movie.Movie;

import lombok.Data;

@Data
public class updateMovieDto {
	
	private String movie_code;
	private String movie_title_kor;
	private String movie_title_eng;
	private String movie_genre;
	private String movie_nation;
	private String movie_limited_age;
	private String movie_description;
	private String movie_actors;
	private String movie_director;
	private String movie_runtime;
	private String movie_release_date;
	private String movie_close_date;
	
	private MultipartFile movie_poster_img;
	private MultipartFile movie_trailer_mp4;

	public Movie toEntitiy(){
		return Movie.builder()
					.movie_code(movie_code)
					.movie_title_kor(movie_title_kor)
					.movie_title_eng(movie_title_eng)
					.movie_genre(movie_genre)
					.movie_nation(movie_nation)
					.movie_limited_age(movie_limited_age)
					.movie_description(movie_description)
					.movie_actors(movie_actors)
					.movie_runtime(movie_runtime)
					.movie_release_date(movie_release_date)
					.movie_close_date(movie_close_date)
					.build();
	}
}
