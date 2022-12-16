package com.my.movie.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.movie.dao.map.AdminUserMap;
import com.my.movie.domain.AdminCountList;
import com.my.movie.domain.AdminUser;
import com.my.movie.domain.AdminUserDto;

@Repository
public class AdminUserDaoImpl implements AdminUserDao {
	@Autowired private AdminUserMap adminUserMap;

	@Override
	public AdminUser selectAdminUserLogin(AdminUser adminUser) {
		return adminUserMap.selectAdminUserLogin(adminUser);
	}
	
	@Override
	public AdminUser selectAdminUser(AdminUser adminUser) {
		return adminUserMap.selectAdminUser(adminUser);
	}
	
	@Override
	public AdminCountList selectCountList() {
		return adminUserMap.selectCountList();
	}

	@Override
	public List<AdminUser> selectUsers() {
		return adminUserMap.selectUsers();
	}

	@Override
	public List<AdminUser> selectSearchUsers(AdminUserDto adminUserDto) {
		return adminUserMap.selectSearchUsers(adminUserDto);
	}
	
	@Override
	public void updateAdminUser(AdminUserDto adminUserDto) {
		adminUserMap.updateAdminUser(adminUserDto);
	}
	
	@Override
	public void insertWithDrawal(int userNum) {
		adminUserMap.insertWithDrawal(userNum);
	}
}