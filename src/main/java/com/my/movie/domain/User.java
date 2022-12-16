package com.my.movie.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
	private int userNum;
	private String userId;
	private String pw;
	private String nickname;
	private String phoneNum;
	private String email;
}