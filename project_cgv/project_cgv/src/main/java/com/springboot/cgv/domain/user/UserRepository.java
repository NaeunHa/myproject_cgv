package com.springboot.cgv.domain.user;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserRepository {
	public int checkPhone(String phone);
	public int checkUserId(String userid);
	public int insertUser(User user);
	public User getUserById(String userid);
	
}
