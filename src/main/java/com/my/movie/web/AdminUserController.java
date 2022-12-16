package com.my.movie.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.movie.domain.AdminCountList;
import com.my.movie.domain.AdminUser;
import com.my.movie.domain.AdminUserDto;
import com.my.movie.service.AdminUserService;

@RestController
@RequestMapping("admin/user")
public class AdminUserController {
	@Autowired
	private AdminUserService adminUserService;

	@GetMapping("login")
	public ModelAndView login(ModelAndView mv) {
		mv.setViewName("admin/user/login");
		return mv;
	}

	@PostMapping("login")
	public AdminUser login(@RequestBody AdminUser adminLogin, Model model, HttpSession session) {
		AdminUser user = adminUserService.loginValidate(adminLogin);

		if (user != null) {
			session.setAttribute("userId", user.getUserId());
		}
		return user;
	}

	@GetMapping("logout")
	public ModelAndView logout(ModelAndView mv, HttpSession session) {
		session.invalidate();
		mv.setViewName("redirect:/admin");
		return mv;
	}
	
	@GetMapping("getCountList")
	public AdminCountList getCountList() {
		return adminUserService.getCountList();
	}

	@GetMapping()
	public ModelAndView users(ModelAndView mv) {
		mv.setViewName("admin/user/listUser");
		return mv;
	}

	@GetMapping("list")
	public List<AdminUser> getUsers() {
		return adminUserService.getUsers();
	}

	@PostMapping("search")
	@ResponseBody
	public List<AdminUser> getSearchUsers(@RequestBody AdminUserDto userDto) {
		return adminUserService.getSearchUsers(userDto);
	}

	@PatchMapping("fix")
	public void fixUser(@RequestBody AdminUserDto adminUserDto) {
		adminUserService.fixAdminUser(adminUserDto);
	}

	@PostMapping("addWithDrawal")
	public void addWithDrawal(@RequestBody AdminUserDto userNum) {
		adminUserService.addWithDrawal(userNum.getUserNum());
	}
}