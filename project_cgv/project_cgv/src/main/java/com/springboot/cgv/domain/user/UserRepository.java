package com.springboot.cgv.domain.user;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserRepository {
	public int checkUserId(String userid);
	public int signup(User user);
	public User getUser(String username);
	
}
