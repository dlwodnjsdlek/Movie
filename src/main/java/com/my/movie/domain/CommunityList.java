package com.my.movie.domain;

import java.time.LocalDate;

import lombok.Data;

@Data
public class CommunityList {
	private int communityNum;
	private String communityTitle;
	private String communityContent;
	private LocalDate communityDate;
	private String nickname;
}