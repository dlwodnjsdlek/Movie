package com.my.movie.dao.map;

import java.util.List;

import com.my.movie.domain.Genre;
import com.my.movie.domain.GenreDto;
import com.my.movie.domain.Movie;

public interface GenreMap {
	List<String> getMovieGenre(int movieNum);
	Integer getGenreId(String genreName);
	List<Movie> searchMovieByGenre(String genreName);
	List<Genre> selectAll();
	List<GenreDto> selectGenre();
	List<String> selectCheckGenre();
	void insertGenre(Genre genreName);
	void insertUserGenre(int userId, int genre);
	void insertMovieGenre(int movieId, int genre);
}