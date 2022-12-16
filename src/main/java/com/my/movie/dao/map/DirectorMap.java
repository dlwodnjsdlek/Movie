package com.my.movie.dao.map;

import com.my.movie.domain.Director;

public interface DirectorMap {	
	
	Director findDirectorByMovieId(int movieId);
	
}
