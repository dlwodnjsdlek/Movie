package com.my.movie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.movie.dao.UserDao;
import com.my.movie.domain.User;
import com.my.movie.domain.UserDto;

@Service
public class UserServiceImpl implements UserService {
	@Autowired private UserDao userDao;

	@Override
	public User loginValidate(User user) {
		return userDao.selectLoginUser(user);
	}

	@Override
	public User getUser(String userId) {
		return userDao.selectUser(userId);
	}

	@Override
	public int getWithDrawal(int userNum) {
		return userDao.selectWithDrawal(userNum);
	}

	@Override
	public int checkUserId(String userId) {
		return userDao.selectUserId(userId);
	}

	@Override
	public int checkUserNickname(String nickname) {
		return userDao.selectUserNickname(nickname);
	}

	@Override
	public int checkUserPhoneNum(String phoneNum) {
		return userDao.selectUserPhoneNum(phoneNum);
	}

	@Override
	public int checkUserEmail(String email) {
		return userDao.selectUserEmail(email);
	}

	@Override
	public int checkFixUserNickname(UserDto nickname) {
		return userDao.selectFixUserNickname(nickname);
	}

	@Override
	public int checkFixUserPhoneNum(UserDto phoneNum) {
		return userDao.selectFixUserPhoneNum(phoneNum);
	}

	@Override
	public int checkFixUserEmail(UserDto email) {
		return userDao.selectFixUserEmail(email);
	}

	@Override
	public List<String> getUserGenre(int userNum) {
		return userDao.selectUserGenre(userNum);
	}

	@Override
	public List<Integer> getGenreNum(int userNum) {
		return userDao.selectGenreNum(userNum);
	}

	@Override
	public void addUser(User user) {
		userDao.insertUser(user);
	}

	@Override
	public void addUserGenre(int userNum, int genreNum) {
		userDao.insertUserGenre(userNum, genreNum);
	}

	@Override
	public void addWithDrawal(int userNum) {
		userDao.insertWithDrawal(userNum);
	}

	@Override
	public int fixUser(User userData) {
		return userDao.updateUser(userData);
	}

	@Override
	public void delUserGenre(int userNum) {
		userDao.deleteUserGenre(userNum);
	}

	@Override
	public String findId(UserDto userDto) {
		return userDao.selectId(userDto);
	}
	
	@Override
	public String findPw(UserDto userDto) {
		return userDao.selectPw(userDto);
	}
	
	@Override
	public String findPw(String email, String userId) {
		return userDao.selectPw(email, userId);
	}
	
	@Override
	public void fixPw(UserDto userDto) {
		userDao.updatePw(userDto);
	}
}