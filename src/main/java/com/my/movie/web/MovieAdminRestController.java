package com.my.movie.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.my.movie.domain.Cast;
import com.my.movie.domain.Movie;
import com.my.movie.domain.request.CreateMovieRequest;
import com.my.movie.service.CastService;
import com.my.movie.service.GenreService;
import com.my.movie.service.ImageService;
import com.my.movie.service.MovieService;

@RestController
@RequestMapping("admin/mv")
public class MovieAdminRestController {
	
	@Autowired
	private MovieService movieService;
	
	@Autowired
	private ImageService imageService;
	
	@Autowired
	private GenreService genreService;
	
	@Autowired
	private CastService castService;
	
	@PostMapping("addMovie")
	public String addMovie(CreateMovieRequest req) throws Exception {
		System.out.println(req);
		String posterName = imageService.uploadImage(req.getImg());
		
		Movie movie = req.toMovie();
		movie.setMovieImgfileName(posterName);
		movieService.addMovie(movie);
		
		genreService.addMovieGenre(movie.getMovieNum(), toGenre(req.getSelectedGenres()));
		castService.insertMovieDirector(movie.getMovieNum(), Integer.valueOf(req.getSelectedDirector()));
		castService.insertMovieCast(movie.getMovieNum(), toCasts(req.getSelectedCast()));
		
		return "SUCCESS";
	}

	private List<Integer> toGenre(String selectedGenres) {
		List<Integer> result = new ArrayList<>();
		
		String[] genres = selectedGenres.split(",");
		for(String genre : genres) {
			result.add(Integer.valueOf(genre));
		}
		
		return result;
	}
	
	private List<Cast> toCasts(String selectedCast) {
		List<Cast> result = new ArrayList<>();
		
		String[] casts = selectedCast.split("-");
		for(String cast : casts) {
			String[] castInfo = cast.split(",");
			
			Cast castInstance = new Cast();
			castInstance.setCastNum(Integer.valueOf(castInfo[0]));
			
			if(castInfo[1].equals("mainActor")) {
				castInstance.setPosition(1);
			} else if(castInfo[1].equals("subActor")){
				castInstance.setPosition(0);
			}
			
			result.add(castInstance);
		}
		
		return result;
	}
}
