package com.my.movie.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.movie.dao.map.MovieMap;
import com.my.movie.domain.Movie;

@Repository
public class MovieDaoImpl implements MovieDao{
	@Autowired private MovieMap movieMap;
	
	@Override
	public List<Movie> selectMovies() {
		return movieMap.selectMovies();
	}
	
	@Override
	public List<Movie> searchHashtag(@Param("hashtag") String hashtag) {
		return movieMap.searchHashtag(hashtag);
	}
	
	@Override
	public List<Movie> selectMovieTop() {
		return movieMap.selectMovieTop();
	}

	@Override
	public List<Movie> selectAdminMovies() {
		return movieMap.selectAdminMovies();
	}
	
	@Override
	public Movie searchMovie(String movieName) {
		return movieMap.searchMovie(movieName);
	}
	
	@Override
	public void insertMovie(Movie movie) {
		movieMap.insertMovie(movie);
	}
	
	@Override
	public void updateMovie(Movie movie) {
		movieMap.updateMovie(movie);
	}
	
	@Override
	public void deleteMovie(int movieNum) {
		movieMap.deleteMovie(movieNum);
	}
	
	@Override
	public Movie selectById(long id) {
		return movieMap.selectById(id);
	}
}
