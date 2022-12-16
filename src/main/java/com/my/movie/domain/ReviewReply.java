package com.my.movie.domain;

import java.time.LocalDate;

import lombok.Data;

@Data
public class ReviewReply {
	
	private int reviewReplyNum;
	
	private String reviewReplyContent;  
	
	private LocalDate reviewReplyDate;
	
	private int userNum;
	
	private int reviewNum;
	
	private String nickName;
	
	private String userId;
	
}