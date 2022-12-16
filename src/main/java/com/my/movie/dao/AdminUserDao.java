package com.my.movie.dao;

import java.util.List;

import com.my.movie.domain.AdminCountList;
import com.my.movie.domain.AdminUser;
import com.my.movie.domain.AdminUserDto;

public interface AdminUserDao {
	AdminUser selectAdminUserLogin(AdminUser user);
	AdminUser selectAdminUser(AdminUser user);
	AdminCountList selectCountList();
	List<AdminUser> selectUsers();
	List<AdminUser> selectSearchUsers(AdminUserDto adminUserDto);
	void updateAdminUser(AdminUserDto adminUserDto);
	void insertWithDrawal(int userNum);
}