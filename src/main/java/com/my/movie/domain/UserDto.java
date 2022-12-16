package com.my.movie.domain;

import lombok.Data;

@Data
public class UserDto {
	private String userId;
	private String pw;
	private String nickname;
	private String phoneNum;
	private String email;
}