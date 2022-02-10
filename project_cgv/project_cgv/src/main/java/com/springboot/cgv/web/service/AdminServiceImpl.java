package com.springboot.cgv.web.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.springboot.cgv.domain.movie.Movie;
import com.springboot.cgv.domain.movie.MovieRepository;
import com.springboot.cgv.web.dto.movie.AddMovieReqDto;
import com.springboot.cgv.web.dto.movie.updateMovieDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AdminServiceImpl implements AdminService{
	
	@Value("${file.path}")
	private String filePath;
	
	private final MovieRepository movieRepository;
	
//	public void deletePosterImgFile() {
//		String imgUrl = principalDetails.getUser().getProfile_img();
//		System.out.println(imgUrl);
//		if(! imgUrl.equals("profile/default_profile.gif")) {
//			File file = new File(filePath + imgUrl);
//			if(file.exists()) {
//				file.delete();
//			}
//		}
//	}
	
	public String makeFile(AddMovieReqDto addMovieReqDto, boolean isImage) {
		
		String filePathStr = "movie_poster/";
		MultipartFile fileObj = addMovieReqDto.getMovie_poster_img();
		
		if(isImage == false) {
			filePathStr = "movie_trailer/";
			fileObj = addMovieReqDto.getMovie_trailer_mp4(); 
		}
		
		String fileExtension = fileObj.getOriginalFilename().substring(fileObj.getOriginalFilename().lastIndexOf("."));
		String movieFileName = addMovieReqDto.getMovie_code() + "_" + addMovieReqDto.getMovie_release_date().subSequence(4, 8) + fileExtension;
		Path movieFilePath = Paths.get(filePath, filePathStr + addMovieReqDto.getMovie_code() + "/" + movieFileName);
		File file = new File(filePath + filePathStr + addMovieReqDto.getMovie_code());
		if(!file.exists()) {
			file.mkdirs();
		}
		try {
			Files.write(movieFilePath, fileObj.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return filePathStr + addMovieReqDto.getMovie_code() + "/" + movieFileName;
	}
	
	@Override
	public boolean addMovieData(AddMovieReqDto addMovieReqDto) {
		Movie movieEntity = addMovieReqDto.toEntity();
		int result = 0;
		String imgName = makeFile(addMovieReqDto, true);
		movieEntity.setMovie_poster_img(imgName);
		
		if(addMovieReqDto.getMovie_trailer_mp4() == null ) {
			String videoName = makeFile(addMovieReqDto, false);
			movieEntity.setMovie_trailer_mp4(videoName);			
		}
		
		result = movieRepository.insertMovieData(movieEntity);
		if(result == 1) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public List<Movie> getMovieList() {
		List<Movie> movieList = movieRepository.getMovieAll();
		return movieList;
	}
	
	@Override
	public Movie getMovie(String movieCode) {
		Movie movieData = movieRepository.getMovieByCode(movieCode);
		return movieData;
	}
	
	@Override
	public boolean updateMovieData(updateMovieDto updateMovieDto) {
		
		return false;
	}

}
