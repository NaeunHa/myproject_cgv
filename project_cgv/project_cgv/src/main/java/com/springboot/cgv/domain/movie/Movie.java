package com.springboot.cgv.domain.movie;

import java.time.LocalDateTime;
import java.util.Date;

import com.springboot.cgv.domain.user.User;
import com.springboot.cgv.web.dto.movie.IndexMovieDto;
import com.springboot.cgv.web.dto.movie.MovieChartDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class Movie {
	
	private int movie_id;
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
	private String movie_poster_img;
	private String movie_trailer_mp4;
	private String movie_release_date;
	private String movie_close_date;
	private LocalDateTime movie_create_date;
	private LocalDateTime movie_update_date;
	
	public IndexMovieDto toIndexEntity() {
		return IndexMovieDto.builder()
						.movie_code(movie_code)
						.movie_title_kor(movie_title_kor)
						.movie_limited_age(movie_limited_age)
						.movie_poster_img(movie_poster_img)
						.movie_release_date(movie_release_date)
						.build();
	}
	public MovieChartDto toChartEntity() {
		return MovieChartDto.builder()
						.movie_code(movie_code)
						.movie_title_kor(movie_title_kor)
						.movie_poster_img(movie_poster_img)
						.movie_release_date(movie_release_date)
						.build();
	}
}
