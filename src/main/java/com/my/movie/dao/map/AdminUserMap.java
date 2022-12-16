package com.my.movie.dao.map;

import java.util.List;

import com.my.movie.domain.AdminCountList;
import com.my.movie.domain.AdminUser;
import com.my.movie.domain.AdminUserDto;

public interface AdminUserMap {
	AdminUser selectAdminUserLogin(AdminUser adminUser);
	AdminUser selectAdminUser(AdminUser adminUser);
	AdminCountList selectCountList();
	List<AdminUser> selectUsers();
	List<AdminUser> selectSearchUsers(AdminUserDto adminUserDto);
	void updateAdminUser(AdminUserDto adminUserDto);
	void insertWithDrawal(int userNum);
}