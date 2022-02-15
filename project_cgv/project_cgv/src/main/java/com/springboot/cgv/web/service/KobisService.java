package com.springboot.cgv.web.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;

import com.springboot.cgv.web.dto.movie.KobisDto;

import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;
import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class KobisService {
//	private final String API_KEY = "9ffa811a351dd385d410bfa36e128894"; // origin
	private final String API_KEY = "d8cdb2b65aa9e637cbc4624272a8df5a"; // new
	private final KobisOpenAPIRestService service = new KobisOpenAPIRestService(API_KEY);
	
	public String setOpenStartDt() {
	
		// 조회 개봉 일자
		Date today = new Date();
		SimpleDateFormat year = new SimpleDateFormat("yyyy");
		String openStartDt = Integer.toString((Integer.parseInt(year.format(today)) - 1)); // 작년부터 조회할 것
		
		return openStartDt;
	}
	
	public Map<String, String> makeParamMap(String page){
		Map<String, String> paramMap = new HashMap<String, String>();
		
		paramMap.put("key", API_KEY);
		paramMap.put("curPage", page);
		paramMap.put("itemPerPage", "10");
		paramMap.put("movieNm", "");
		paramMap.put("directorNm", "");
		paramMap.put("openStartDt", setOpenStartDt());
		paramMap.put("prdtStartYear", "");
		paramMap.put("prdtEndYear", setOpenStartDt());
		paramMap.put("repNationCd", "");
		paramMap.put("movieTypeCd", "");
		
		return paramMap;
	}
	
	@SuppressWarnings("unchecked")
	public Object toDtoData(String response, String page) {
		
		JSONParser jsonParser = new JSONParser();
		JSONArray jsonArray = new JSONArray();
		
		List<KobisDto> movieList = new ArrayList<KobisDto>();
		try {		
			Object obj = jsonParser.parse(response);
			JSONObject jsonObject = (JSONObject) obj;
			JSONObject parse_result = (JSONObject) jsonObject.get("movieListResult");
			jsonArray =  (JSONArray) parse_result.get("movieList");
			System.out.println(jsonArray.size());
			
			jsonArray.forEach(n -> {
				JSONObject list = (JSONObject) n;
				JSONArray companyArray = (JSONArray) list.get("companys");
				JSONArray directorArray = (JSONArray) list.get("directors");
				
							
				if(companyArray.toString().equals("[]") && directorArray.toString().equals("[]")) {	
					KobisDto kobisReqDto = KobisDto.builder()
							.curPage(page)
							.movieCd(list.get("movieCd").toString())
							.movieNm(list.get("movieNm").toString())
							.movieNmEn(list.get("movieNmEn").toString())
							.genreAlt(list.get("genreAlt").toString())
							.openDt(list.get("openDt").toString())
							.prdtStatNm(list.get("prdtStatNm").toString())
							.repNationNm(list.get("repNationNm").toString())
							.typeNm(list.get("typeNm").toString())
							.directorNm("undefine")
							.companyNm("undefine")
							.build();
						
						movieList.add(kobisReqDto);
				}else if(directorArray.toString().equals("[]")) {	
					KobisDto kobisReqDto = KobisDto.builder()
							.curPage(page)
							.movieCd(list.get("movieCd").toString())
							.movieNm(list.get("movieNm").toString())
							.movieNmEn(list.get("movieNmEn").toString())
							.genreAlt(list.get("genreAlt").toString())
							.openDt(list.get("openDt").toString())
							.prdtStatNm(list.get("prdtStatNm").toString())
							.repNationNm(list.get("repNationNm").toString())
							.typeNm(list.get("typeNm").toString())
							.directorNm("undefine")
							.companyNm(((JSONObject)companyArray.get(0)).get("companyNm").toString())
							.build();
					
					movieList.add(kobisReqDto);
					
				}else if(companyArray.toString().equals("[]")) {	
					KobisDto kobisReqDto = KobisDto.builder()
							.curPage(page)
							.movieCd(list.get("movieCd").toString())
							.movieNm(list.get("movieNm").toString())
							.movieNmEn(list.get("movieNmEn").toString())
							.genreAlt(list.get("genreAlt").toString())
							.openDt(list.get("openDt").toString())
							.prdtStatNm(list.get("prdtStatNm").toString())
							.repNationNm(list.get("repNationNm").toString())
							.typeNm(list.get("typeNm").toString())
							.directorNm(((JSONObject) directorArray.get(0)).get("peopleNm").toString())
							.companyNm("undefine")
							.build();
					
					movieList.add(kobisReqDto);
					
				}else {
					KobisDto kobisReqDto = KobisDto.builder()
								.curPage(page)
								.movieCd(list.get("movieCd").toString())
								.movieNm(list.get("movieNm").toString())
								.movieNmEn(list.get("movieNmEn").toString())
								.genreAlt(list.get("genreAlt").toString())
								.openDt(list.get("openDt").toString())
								.prdtStatNm(list.get("prdtStatNm").toString())
								.repNationNm(list.get("repNationNm").toString())
								.typeNm(list.get("typeNm").toString())
								.directorNm(((JSONObject)directorArray.get(0)).get("peopleNm").toString())
								.companyNm(((JSONObject)companyArray.get(0)).get("companyNm").toString())
								.build();
								
					movieList.add(kobisReqDto);
				}
			});
		
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return movieList;
	}
	
	// getMovieList 메인메서드
	public Object getMovieList(String page) {
		
		String movieData = "";
		try {
			movieData = service.getMovieList(true, makeParamMap(page));
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return toDtoData(movieData, page);
	}
	
	// 내부데이터 StringBuilder로 나열하는 메서드
	public String makeStringData(JSONArray data, String keyName) {
		StringBuilder builder = new StringBuilder();
		for(int i = 0; i < data.size(); i++) {
			builder.append(((JSONObject)data.get(i)).get(keyName).toString());
			builder.append(", ");
		}
		builder.delete(builder.length()-2, builder.length());
		String dataStr = builder.toString();
		return dataStr;
	}
	
	// 데이터 가공 메서드
	public Object toDetailDtoData(String response) {
		
		JSONParser jsonParser = new JSONParser();
		
		KobisDto movieList = new KobisDto();
		
		try {
			Object obj = jsonParser.parse(response);
			JSONObject jsonObject = (JSONObject) obj;
			JSONObject parse_result = (JSONObject) jsonObject.get("movieInfoResult");
			JSONObject list = (JSONObject) parse_result.get("movieInfo");				
			
			JSONArray nations = (JSONArray) list.get("nations");
			JSONArray genres = (JSONArray) list.get("genres");
			JSONArray directors = (JSONArray) list.get("directors");
			JSONArray actors = (JSONArray) list.get("actors");
			
			movieList = KobisDto.builder()
								.movieCd(list.get("movieCd").toString())
								.movieNm(list.get("movieNm").toString())
								.movieNmEn(list.get("movieNmEn").toString())
								.showTm(list.get("showTm").toString())
								.openDt(list.get("openDt").toString())
								.prdtStatNm(list.get("prdtStatNm").toString())
								.watchGradeNm(((JSONObject)((JSONArray) list.get("audits")).get(0)).get("watchGradeNm").toString())
								.genreNm(makeStringData(genres, "genreNm"))
								.directorNm(makeStringData(directors, "peopleNm"))
								.nationNm(makeStringData(nations, "nationNm"))
								.actorsNm(makeStringData(actors, "peopleNm"))
								.build();

		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return movieList;
	}
	
	
	// getMovieDetailList 메인메서드
	public Object getMovieDetailList(String movieCd) {
		String movieDetailData = "";
		try {
			movieDetailData = service.getMovieInfo(true, movieCd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return toDetailDtoData(movieDetailData);
	}
	
}
	
	
