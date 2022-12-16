package com.my.movie.domain.request;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CreateCastRequest {

	private String castName;
	
	private MultipartFile img;
	
	private String targetImageFileName;
	
	private boolean isDirector;
	
	public void setIsDirector(String value) {
		isDirector = Boolean.valueOf(value);
	}
	
}
