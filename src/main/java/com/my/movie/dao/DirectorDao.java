package com.my.movie.dao;

import com.my.movie.domain.Director;

public interface DirectorDao {
	Director findDirectorByMovieId(int movieId);
}
