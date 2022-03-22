package com.springboot.cgv.web.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.springboot.cgv.config.auth.PrincipalDetails;
import com.springboot.cgv.domain.user.User;
import com.springboot.cgv.domain.user.UserRepository;
import com.springboot.cgv.web.dto.auth.PasswordReqDto;
import com.springboot.cgv.web.dto.auth.PasswordRespDto;
import com.springboot.cgv.web.dto.mypage.MyPageReqDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AccountServiceImpl implements AccountService{
	
	@Value("${file.path}")
	private String filePath;
	
	private final UserRepository userRepository;
	
	@Override
	public int checkNickname(String nickname) {
		return userRepository.checkNickName(nickname);
	}
		
	public void deleteProfileImgFile(PrincipalDetails principalDetails) {
		String imgUrl = principalDetails.getUser().getProfile_img();
		System.out.println(imgUrl);
		if(! imgUrl.equals("profile/default_profile.gif")) {
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
		
		result = userRepository.updateUserDtl(userEntity);
		if(result == 1) {
			principalDetails.getUser().setNickname(userEntity.getNickname());
			principalDetails.getUser().setProfile_img(userEntity.getProfile_img());
			return true;
		}else {
			return false;
		}
	}
	
	@Override
	public boolean checkPassword(PrincipalDetails principalDetails, String password) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder.matches(password, principalDetails.getPassword());
	}
	
	@Override
	public boolean updatePersonalInfo(PrincipalDetails principalDetails, MyPageReqDto myPageReqDto) {
		int id = principalDetails.getUser().getId();
		
		User personalEntity = myPageReqDto.personalEntitiy(id);
		int result = 0;
		
		if(personalEntity.getPassword() == null) {
			personalEntity.setPassword(principalDetails.getPassword());
		}else {
			personalEntity.setPassword(new BCryptPasswordEncoder().encode(personalEntity.getPassword()));
		}
		
		if(personalEntity.getBirthday() == null) {
			personalEntity.setBirthday(principalDetails.getUser().getBirthday());
		}
		if(personalEntity.getPhone() == null) {
			personalEntity.setPhone(principalDetails.getUser().getPhone());
		}
		if(personalEntity.getEmail() == null) {
			personalEntity.setEmail(principalDetails.getUser().getEmail());
		}
		
		result = userRepository.updatePersonal(personalEntity);
		if(result == 1) {
			principalDetails.getUser().setPassword(personalEntity.getPassword());
			principalDetails.getUser().setBirthday(personalEntity.getBirthday());
			principalDetails.getUser().setPhone(personalEntity.getPhone());
			principalDetails.getUser().setEmail(personalEntity.getEmail());
			return true;
		}else {
			return false;
		}
	}
	
	
	public boolean passwordCheck(PasswordReqDto passwordReqDto) {
		// DB에서 불러오기
		String password = userRepository.getUserPassword(passwordReqDto.getUserid());
		System.out.println("password : " + password);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder.matches((CharSequence)passwordReqDto.getNewPassword(), password); // 암호화 안 된 값, 암호화된 값
	}
	
	@Override 
	public PasswordRespDto updatePassword(PasswordReqDto passwordReqDto) {
		boolean newPasswordCheckFlag = passwordCheck(passwordReqDto);
		System.out.println("newPasswordCheckFlag : " + newPasswordCheckFlag);
		PasswordRespDto passwordRespDto = new PasswordRespDto();
		
		if(newPasswordCheckFlag == true) {
			// 새 비밀번호와 이전 비밀번호가 동일
			System.out.println("새 비밀번호와 이전 비밀번호가 동일");
			passwordRespDto.setCode(451);
			passwordRespDto.setMessage("새 비밀번호가 이전 비밀번호와 동일합니다.");
		}else {
			// 새 비밀번호로 변경
			System.out.println("새 비밀번호로 변경");
			User userEntity = passwordReqDto.toEntity();
			int result = userRepository.updatePasswordById(userEntity);
			
			if(result == 1) {
				passwordRespDto.setCode(200);
				passwordRespDto.setMessage(null);
			}
		}
		return passwordRespDto;
	}

	@Override
	public int withdrawalUser(PrincipalDetails principalDetails) {
		int id = principalDetails.getUser().getId();
		int result = userRepository.withdrawalUserById(id);
		if(result == 1) {
			return 1;
		}else {
			return 0;
		}
	}
	
}
