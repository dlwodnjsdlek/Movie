package com.my.movie.service;

import java.util.List;

import com.my.movie.domain.Cast;
import com.my.movie.domain.Director;
import com.my.movie.domain.request.CreateCastRequest;

public interface CastService {

	List<Director> selectAllDirector();
	
	List<Cast> selectAllCast();

	void insert(CreateCastRequest request);
	
	void insertMovieDirector(int movieId, int directorId);

	void insertMovieCast(int movieNum, List<Cast> casts);
}
