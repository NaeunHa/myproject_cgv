package com.springboot.cgv.web.dto.auth;
import lombok.Data;

@Data
public class SignUpRespDto <T>{ // Response Dto (응답)
	private int code;
	private T msg;
}
