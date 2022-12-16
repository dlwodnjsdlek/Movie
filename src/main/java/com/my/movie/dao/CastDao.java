package com.my.movie.dao;

import java.util.List;

import com.my.movie.domain.Cast;
import com.my.movie.domain.Director;
import com.my.movie.domain.request.CreateCastRequest;

public interface CastDao {

	List<Cast> selectByMoveId(int movieId);

	List<Director> selectAllDirector();

	List<Cast> selectAllCast();

	void insertDirector(CreateCastRequest request);

	void insertCast(CreateCastRequest request);

	void insertMovieDirector(int movieId, int directorId);

	void insertMovieCast(int movieNum, List<Cast> casts);
	
}
