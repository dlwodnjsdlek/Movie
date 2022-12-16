package com.my.movie.service;

import java.util.List;

import com.my.movie.domain.Movie;


public interface MovieService {
	List<Movie> getMovies();
	List<Movie> searchHashtag(String hashtag);
	List<Movie> getMovieTop();
	List<Movie> getAdminMovies();
	Movie findMovies(String movieName);
	void addMovie(Movie movie);
	void fixMovie(Movie movie);
	void delMovie(int movieNum);
}