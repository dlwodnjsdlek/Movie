package com.my.movie.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.my.movie.service.GenreService;

@RestController
@RequestMapping("admin/gnr")
public class GenreRestController {
	
	@Autowired
	private GenreService genreService;
		
	@PostMapping("add")
	public Integer addGenre(@RequestParam("genreName") String genreName) {
		return genreService.addGenre(genreName);
	}
}
