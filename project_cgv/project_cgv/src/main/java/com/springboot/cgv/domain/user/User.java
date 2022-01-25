package com.springboot.cgv.domain.user;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class User {
	
	private int id;
	private String userid;
	private String username;
	private String password;
	private String birthday;
	private String phone;
	private String email;
	private String role;
	private String provider;
	private Date create_date;
	private Date update_date;

	private String nickname;
	private String profile_img;
	private Date dtl_create_date;
	private Date dtl_update_date;
	
	private String membership_level;
	private int point;
	private Date point_create_date;
	private Date point_update_date;
}
