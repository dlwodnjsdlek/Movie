package com.my.movie.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.movie.dao.map.GenreMap;
import com.my.movie.domain.Genre;
import com.my.movie.domain.GenreDto;
import com.my.movie.domain.Movie;
import com.my.movie.domain.User;

@Repository
public class GenreDaoImpl implements GenreDao {
	@Autowired private GenreMap genreMap;

	@Override
	public List<String> searchGenre(int movieNum) {
		return genreMap.getMovieGenre(movieNum);
	}

	public List<Movie> searchMovieByGenre(String genreName) {
		return genreMap.searchMovieByGenre(genreName);
	}

	@Override
	public List<Genre> selectAll() {
		return genreMap.selectAll();
	}

	@Override
	public List<GenreDto> selectGenre() {
		return genreMap.selectGenre();
	}

	@Override
	public List<String> selectCheckGenre() {
		return genreMap.selectCheckGenre();
	}

	@Override
	public int insertGenre(String genreName) {
		Genre genre = new Genre();
		genre.setGenreName(genreName);
		genreMap.insertGenre(genre);
		
		return genre.getGenreNum();
	}

	@Override
	public void addUserGenre(User user, List<String> genres) {
		for (String genre : genres) {
			int genreNum = genreMap.getGenreId(genre);
			genreMap.insertUserGenre(user.getUserNum(), genreNum);
		}
	}

	@Override
	public void addMovieGenre(int movieNum, List<Integer> genres) {
		for (int genre : genres) {
			genreMap.insertMovieGenre(movieNum, genre);
		}
	}

	@Override
	public Integer selectedGenreByName(String genreName) {
		return genreMap.getGenreId(genreName);
	}
}
