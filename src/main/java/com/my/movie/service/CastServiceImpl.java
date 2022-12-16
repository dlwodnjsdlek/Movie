package com.my.movie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.movie.dao.CastDao;
import com.my.movie.domain.Cast;
import com.my.movie.domain.Director;
import com.my.movie.domain.request.CreateCastRequest;

@Repository
public class CastServiceImpl implements CastService {

	@Autowired
	private CastDao castDao;

	@Override
	public List<Director> selectAllDirector() {
		return castDao.selectAllDirector();
	}

	@Override
	public List<Cast> selectAllCast() {
		return castDao.selectAllCast();
	}

	@Override
	public void insert(CreateCastRequest request) {
		if (request.isDirector()) {
			castDao.insertDirector(request);
		} else {
			castDao.insertCast(request);
		}
	}

	@Override
	public void insertMovieDirector(int movieId, int directorId) {
		castDao.insertMovieDirector(movieId, directorId);
	}

	@Override
	public void insertMovieCast(int movieNum, List<Cast> casts) {
		castDao.insertMovieCast(movieNum, casts);
	}
}
