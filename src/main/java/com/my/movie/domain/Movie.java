package com.my.movie.domain;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class Movie {
	private int movieNum;
	private String movieName;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private LocalDate movieReleasedate;
	private String hashtag;
	private String movieImgfileName;
	private int movieRunningtime;
	private String movieCountry;
	private int cumulativeAudience;
	private String movieStory;
}