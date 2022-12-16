package com.my.movie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.movie.dao.AdminUserDao;
import com.my.movie.domain.AdminCountList;
import com.my.movie.domain.AdminUser;
import com.my.movie.domain.AdminUserDto;

@Service
public class AdminUserServiceImpl implements AdminUserService {
	@Autowired private AdminUserDao adminUserDao;
	
	@Override
	public AdminUser loginValidate(AdminUser user){
		return adminUserDao.selectAdminUserLogin(user);
	}
	
	@Override
	public AdminUser getAdmin(AdminUser user) {
		return adminUserDao.selectAdminUser(user);
	}

	@Override
	public AdminCountList getCountList() {
		return adminUserDao.selectCountList();
	}

	@Override
	public List<AdminUser> getUsers() {
		return adminUserDao.selectUsers();
	}
	
	@Override
	public List<AdminUser> getSearchUsers(AdminUserDto adminUserDto) {
		return adminUserDao.selectSearchUsers(adminUserDto);
	}
	
	@Override
	public void fixAdminUser(AdminUserDto adminUserDto) {
		adminUserDao.updateAdminUser(adminUserDto);
	}
	
	@Override
	public void addWithDrawal(int userNum) {
		adminUserDao.insertWithDrawal(userNum);
	}
}