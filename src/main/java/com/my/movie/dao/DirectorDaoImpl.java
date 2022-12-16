package com.my.movie.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.movie.dao.map.DirectorMap;
import com.my.movie.domain.Director;

@Repository
public class DirectorDaoImpl implements DirectorDao {

	@Autowired
	private DirectorMap directorMap;

	@Override
	public Director findDirectorByMovieId(int movieId) {
		return directorMap.findDirectorByMovieId(movieId);
	}
}
