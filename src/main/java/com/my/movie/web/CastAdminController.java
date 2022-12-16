package com.my.movie.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("admin/cast")
public class CastAdminController {

	@GetMapping
	public ModelAndView cast(ModelAndView mv, HttpSession session) {
		mv.setViewName("admin/cast/cast");
		return mv;
	}
}
