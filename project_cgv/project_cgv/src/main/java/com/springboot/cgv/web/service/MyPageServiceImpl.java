package com.springboot.cgv.web.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.springboot.cgv.config.auth.PrincipalDetails;
import com.springboot.cgv.domain.user.User;
import com.springboot.cgv.domain.user.UserRepository;
import com.springboot.cgv.web.dto.mypage.MyPageReqDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MyPageServiceImpl implements MyPageSevice{

	@Value("${file.path}")
	private String filePath;
	
	private final UserRepository userRepository;
	
	@Override
	public int checkNickname(String nickname) {
		return userRepository.checkNickName(nickname);
	}
		
	public void deleteProfileImgFile(PrincipalDetails principalDetails) {
		String imgUrl = principalDetails.getUser().getProfile_img();
		if(!imgUrl.equals("profile/default_profile.gif")) {
			File file = new File(filePath + imgUrl);
			if(file.exists()) {
				file.delete();
			}
		}
	}
	
	@Override
	public boolean updateUserInfo(PrincipalDetails principalDetails, MyPageReqDto myPageReqDto) {
		int id = principalDetails.getUser().getId();
		String profileImg = principalDetails.getUser().getProfile_img();
		
		User userEntity = myPageReqDto.toEntity(id);
		int result = 0;
		
		if(myPageReqDto.getFile() != null) {
			String imgFileName = UUID.randomUUID().toString().replaceAll("-", "") + "_" + myPageReqDto.getFile().getOriginalFilename();
			Path imageFilePath = Paths.get(filePath, "profile/" + id + "/" + imgFileName);
			
			File file = new File(filePath + "profile" + '/' + id);
			if(!file.exists()) {
				file.mkdir();
			}
			try {
				Files.write(imageFilePath, myPageReqDto.getFile().getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			profileImg = "profile/" + id + "/" + imgFileName;
			userEntity.setProfile_img(profileImg);
			deleteProfileImgFile(principalDetails);
		}else {
			userEntity.setProfile_img(profileImg);
		}
		
		result += userRepository.updateUserDtlById(userEntity);
		if(result == 1) {
			principalDetails.getUser().setNickname(userEntity.getNickname());
			principalDetails.getUser().setProfile_img(userEntity.getProfile_img());
			return true;
		}else {
			return false;
		}
	}
}
