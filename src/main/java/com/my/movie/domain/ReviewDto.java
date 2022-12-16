package com.my.movie.domain;

import java.util.List;

import lombok.Data;

@Data
public class ReviewDto {

	private Movie movie;

	private String summaryString;

	private String audienceString;
	
	private Director director;
	
	private List<Cast> casts;
	
	private List<Review> reviews;
	
	private boolean isReviewWriten;
}
  