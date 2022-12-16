package com.my.movie.domain.request;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.my.movie.domain.Movie;

import lombok.Data;
	
@Data
public class CreateMovieRequest {
	
	private String movieName;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private LocalDate movieReleasedate;
	
	private String movieCountry;
	
	private int movieRunningtime;
	
	private String movieStory;
	
	private String hashtag;
	
	private int cumulativeAudience;

	private String selectedGenres;
	
	private String selectedDirector;
	
	private String selectedCast;
	
	private MultipartFile img;
	
	public Movie toMovie() {
		Movie movie = new Movie();
		movie.setMovieName(movieName);
		movie.setMovieReleasedate(movieReleasedate);
		movie.setMovieCountry(movieCountry);
		movie.setMovieRunningtime(movieRunningtime);
		movie.setMovieStory(movieStory);
		movie.setHashtag(hashtag);
		movie.setCumulativeAudience(cumulativeAudience);
		return movie;
	}
}
