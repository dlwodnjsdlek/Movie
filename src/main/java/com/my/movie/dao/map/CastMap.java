package com.my.movie.dao.map;

import java.util.List;

import com.my.movie.domain.Cast;
import com.my.movie.domain.Director;
import com.my.movie.domain.request.CreateCastRequest;

public interface CastMap {

	List<Cast> selectByMovieId(int movieId);

	List<Director> selectAllDirector();

	List<Cast> selectAllCast();
	
	void insertDirector(CreateCastRequest req);
	
	void insertCast(CreateCastRequest req);

	void insertMovieDirector(int movieId, int directorId);

	void insertMovieCast(int movieId, int castId, int position);
}
