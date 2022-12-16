package com.my.movie.domain;

import java.time.LocalDate;

import lombok.Data;

@Data
public class Review {

	private int reviewNum;
	
	private String reviewContent;
	
	private LocalDate reviewDate;
	
	private float grade;
	
	private int userNum;
	
	private String userId;
	
	private String nickName;
	
	private int likeCount;
	
	private int disLikeCount;
	
	private int currentUserSympaths;
	
	private int commentCount;
	
}	