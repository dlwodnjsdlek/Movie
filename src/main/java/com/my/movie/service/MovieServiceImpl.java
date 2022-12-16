package com.my.movie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.movie.dao.MovieDao;
import com.my.movie.domain.Movie;

@Service
public class MovieServiceImpl implements MovieService{
	@Autowired private MovieDao movieDao;
	
	@Override
	public List<Movie> getMovies() {
		return movieDao.selectMovies();
	}
	
	@Override
	public List<Movie> searchHashtag(String hashtag) {
		return movieDao.searchHashtag(hashtag);
	}
	
	@Override
	public List<Movie> getMovieTop() {
		return movieDao.selectMovieTop();
	}

	@Override
	public List<Movie> getAdminMovies() {
		return movieDao.selectAdminMovies();	
	}
	
	@Override
	public Movie findMovies(String movieName) {
		return movieDao.searchMovie(movieName);
	}
	
	@Override
	public void addMovie(Movie movie) {
		movieDao.insertMovie(movie);
	}

	@Override
	public void fixMovie(Movie movie) {
		movieDao.updateMovie(movie);
	}
	
	@Override
	public void delMovie(int movieNum) {
		movieDao.deleteMovie(movieNum);
	}
}