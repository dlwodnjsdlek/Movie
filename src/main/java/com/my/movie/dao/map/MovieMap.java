package com.my.movie.dao.map;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.movie.domain.Movie;

public interface MovieMap {
	List<Movie> selectMovies();
	List<Movie> searchHashtag(@Param("hashtag") String hashtag);
	List<Movie> selectMovieTop();
	List<Movie> selectMovie();
	List<Movie> selectAdminMovies();
	Movie searchMovie(String movieName);
	void insertMovie(Movie movie);
	void updateMovie(Movie movie);
	void deleteMovie(int movieNum);
	public Movie selectById(long id);
}