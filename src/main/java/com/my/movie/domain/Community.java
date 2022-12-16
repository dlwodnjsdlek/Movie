package com.my.movie.domain;

import java.time.LocalDate;

import lombok.Data;

@Data
public class Community {
	private int communityNum;
	private String communityTitle;
	private String communityContent;
	private LocalDate communityDate;
	private int userNum;
	private String contentName = "movie";
	private String inspectionContent;
}