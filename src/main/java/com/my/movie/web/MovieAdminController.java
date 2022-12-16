package com.my.movie.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.my.movie.domain.Movie;
import com.my.movie.service.GenreService;
import com.my.movie.service.MovieService;

@Controller
@RequestMapping("admin/movie")
public class MovieAdminController {

	@Autowired
	private GenreService genreService;

	@Autowired
	private MovieService movieService;

	@Value("${attachPath}")
	private String attachPath;

	@RequestMapping("listMovie")
	public String listMovie() {
		return "admin/movie/listMovie";
	}

	@RequestMapping("addMovie")
	public ModelAndView addMovie(ModelAndView mv) {
		mv.setViewName("admin/movie/addMovie");
		mv.addObject("genres", genreService.getAll());
		return mv;
	}

	@RequestMapping("fixMovie")
	public String fixMovie() {
		return "admin/movie/fixMovie";
	}

	@ResponseBody
	@PostMapping("listMovie")
	public List<Movie> getAdminMoives() {
		return movieService.getAdminMovies();
	}

	@ResponseBody
	@DeleteMapping("del/{movieNum}")
	public void delMovie(@PathVariable int movieNum) {
		movieService.delMovie(movieNum);
	}
	
	

//	@ResponseBody
//	@PostMapping("/fix")
//	public void fixMovie(@RequestBody Movie movie, HttpServletRequest request, HttpServletResponse response) {
//		movieService.fixMovie(movie);
//	}
//
//	private void saveMovieFile(String movieFileName, MultipartFile movieFile) {
//		try {
//			movieFile.transferTo(new File(movieFileName));
//		} catch(IOException e) {}
//	}
}
