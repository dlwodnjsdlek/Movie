package com.my.movie.service;

import java.util.List;

import com.my.movie.domain.AdminCountList;
import com.my.movie.domain.AdminUser;
import com.my.movie.domain.AdminUserDto;

public interface AdminUserService {
	AdminUser loginValidate(AdminUser adminUser);
	AdminUser getAdmin(AdminUser adminUser);
	AdminCountList getCountList();
	List<AdminUser> getUsers(); 
	List<AdminUser> getSearchUsers(AdminUserDto adminUserDto);
	void fixAdminUser(AdminUserDto adminUserDto);
	void addWithDrawal(int userNum);
}