package com.my.movie.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.my.movie.domain.Cast;
import com.my.movie.domain.Director;
import com.my.movie.domain.request.CreateCastRequest;
import com.my.movie.domain.request.GetCastRequest;
import com.my.movie.service.CastService;
import com.my.movie.service.ImageService;

@RestController
@RequestMapping("cst")
public class CastAdminRestController {

	@Autowired
	private CastService castService;

	@Autowired
	private ImageService imageService;
	
	@PostMapping("getdirector")
	public String getDirectors(GetCastRequest request) {
		List<Director> dirs = castService.selectAllDirector();

		try {
			return new ObjectMapper().writeValueAsString(dirs);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return "ERROR";
		}
	}

	@PostMapping("getactor")
	public String getActors(GetCastRequest request) {
		List<Cast> dirs = castService.selectAllCast();

		try {
			return new ObjectMapper().writeValueAsString(dirs);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return "ERROR";
		}
	}

	@PostMapping("addcast")
	public String addDirector(CreateCastRequest request) {
		try {
			String imgFileName = imageService.uploadImage(request.getImg());
			request.setTargetImageFileName(imgFileName);
			castService.insert(request);
			return "SUCCESS";
		} catch (Exception e) {
			e.printStackTrace();
			return "FAIL";
		}
	}
}
