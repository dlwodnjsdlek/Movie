package com.my.movie.web;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.movie.domain.GenreDto;
import com.my.movie.service.GenreService;

@RestController
@RequestMapping("admin/genre")
public class GenreController {
	@Autowired private GenreService genreService;
	
	@GetMapping("getGenre")
	public List<GenreDto> getGenre() {
		return genreService.getGenre();
	}
	
	@GetMapping("addGenre")
	public ModelAndView addGenre(ModelAndView mv) {
		mv.setViewName("admin/genre/addGenre");
		return mv;
	}
	
	@PostMapping("addGenre")
	public List<String> addGenre(@RequestBody List<String> genreName) {
		List<String> genres = genreService.getCheckGenre();
		List<String> result = genreName.stream().filter(genres::contains).collect(Collectors.toList());
		genreName.removeAll(genres);
		if(result.isEmpty()) {
			for(String genre: genreName) {
				genreService.addGenre(genre);
			}
		}
		return result;
	}
}