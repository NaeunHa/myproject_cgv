package com.springboot.cgv.domain.user;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
	
	private int id;
	private String userid;
	private String username;
	private String password;
	private String birthday;
	private String phone;
	private String email;
	private String role;
	private Date create_date;
	private Date update_date;

}
