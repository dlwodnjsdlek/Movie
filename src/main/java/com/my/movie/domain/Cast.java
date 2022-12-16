package com.my.movie.domain;

import lombok.Data;

@Data
public class Cast {

	private int castNum;

	private String castName;

	private String castImgFileName;
	
	private int position;

}