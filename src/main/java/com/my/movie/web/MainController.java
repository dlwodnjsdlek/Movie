package com.my.movie.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.movie.service.MovieService;


@Controller
public class MainController {
	@Autowired private MovieService movieService;
	
	@Value("${attachPath}") private String attachPath;
	
	@RequestMapping("/")
	public String listMovie(Model model) {
		model.addAttribute("movieList", movieService.getMovies());
		return "main";
	}
	
	@RequestMapping("/admin")
	public String adminMain(Model model) {
		model.addAttribute("movieList", movieService.getMovies());
		return "admin/main";
	}
}
