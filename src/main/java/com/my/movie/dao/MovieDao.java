package com.my.movie.dao;

import java.util.List;

import com.my.movie.domain.Movie;

public interface MovieDao {
	List<Movie> selectMovies();
	List<Movie> searchHashtag(String hashtag);
	List<Movie> selectMovieTop();
	List<Movie> selectAdminMovies();
	Movie searchMovie(String movieName);
	void insertMovie(Movie movie);
	void updateMovie(Movie movie);
	void deleteMovie(int movieNum);
	public Movie selectById(long id);
}