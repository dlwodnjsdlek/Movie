package com.my.movie.domain.request;

import lombok.Data;

@Data
public class LikeContentRequest {
	
	private int contentNum;
	
	private String contentName;
	
	private int userNum;
	
	private int value;
}
