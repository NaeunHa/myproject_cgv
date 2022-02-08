package com.springboot.cgv.web.dto.movie;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class KobisDto {
	private String curPage; // 현재페이지 (페이징처리에 필요함)
	private String movieCd; // 영화코드 (영화상세검색에서 필요함)
	private String movieNm; // 영화명(국문)
	private String movieNmEn; // 영화명(영문)
	private String openDt; // 개봉일
	private String typeNm; // 영화유형
	private String prdtStatNm; // 제작상태
	private String repNationNm; // 대표 제작 국가
	private String genreAlt; // 영화 장르(전체)
	private String directorNm; // 영화감독
	private String companyNm; // 제작사
	
	private String showTm; // 상영시간
	private String nationNm; // 제작국가
	private String genreNm; // 장르명
	private String actorsNm; // 배우명
	private String watchGradeNm; // 시청연령
}
