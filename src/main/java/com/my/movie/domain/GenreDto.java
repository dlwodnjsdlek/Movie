package com.my.movie.domain;

import lombok.Data;

@Data
public class GenreDto {
	private int genreNum;
	private String genreName;
	private int targetNumMovies;
	private int numRegInterest;
}