package com.springboot.cgv.web.dto.movie;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class MovieChartDto {

	private String movie_code;
	private String movie_title_kor;
	private String movie_poster_img;
	private String movie_release_date;

}
