package com.my.movie.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.movie.dao.map.CastMap;
import com.my.movie.domain.Cast;
import com.my.movie.domain.Director;
import com.my.movie.domain.request.CreateCastRequest;

@Repository
public class CastDaoImpl implements CastDao {

	@Autowired
	private CastMap castMap;

	@Override
	public List<Cast> selectByMoveId(int movieId) {
		return castMap.selectByMovieId(movieId);
	}

	@Override
	public List<Director> selectAllDirector() {
		return castMap.selectAllDirector();
	}

	@Override
	public List<Cast> selectAllCast() {
		return castMap.selectAllCast();
	}

	@Override
	public void insertDirector(CreateCastRequest request) {
		castMap.insertDirector(request);
	}

	@Override
	public void insertCast(CreateCastRequest request) {
		castMap.insertCast(request);
	}

	@Override
	public void insertMovieDirector(int movieId, int directorId) {
		castMap.insertMovieDirector(movieId, directorId);
	}

	@Override
	public void insertMovieCast(int movieNum, List<Cast> casts) {
		for(Cast cast : casts) {
			castMap.insertMovieCast(movieNum, cast.getCastNum(), cast.getPosition());
		}
	}
}
