package com.my.movie.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.movie.dao.map.UserMap;
import com.my.movie.domain.User;
import com.my.movie.domain.UserDto;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired private UserMap userMap;

	@Override
	public User selectLoginUser(User user) {
		return userMap.selectLoginUser(user);
	}

	@Override
	public User selectUser(String userId) {
		return userMap.selectUser(userId);
	}

	@Override
	public int selectWithDrawal(int userNum) {
		return userMap.selectWithDrawal(userNum);
	}

	@Override
	public int selectUserId(String userId) {
		return userMap.selectUserId(userId);
	}

	@Override
	public int selectUserNickname(String nickname) {
		return userMap.selectUserNickname(nickname);
	}

	@Override
	public int selectUserPhoneNum(String phoneNum) {
		return userMap.selectUserPhoneNum(phoneNum);
	}

	@Override
	public int selectUserEmail(String email) {
		return userMap.selectUserEmail(email);
	}

	@Override
	public int selectFixUserNickname(UserDto nickname) {
		return userMap.selectFixUserNickname(nickname);
	}

	@Override
	public int selectFixUserPhoneNum(UserDto phoneNum) {
		return userMap.selectFixUserPhoneNum(phoneNum);
	}

	@Override
	public int selectFixUserEmail(UserDto email) {
		return userMap.selectFixUserEmail(email);
	}

	@Override
	public List<String> selectUserGenre(int userNum) {
		return userMap.selectUserGenre(userNum);
	}

	@Override
	public List<Integer> selectGenreNum(int userNum) {
		return userMap.selectGenreNum(userNum);
	}

	@Override
	public void insertUser(User user) {
		userMap.insertUser(user);
	}

	@Override
	public void insertUserGenre(int userNum, int genreNum) {
		userMap.insertUserGenre(userNum, genreNum);
	}

	@Override
	public void insertWithDrawal(int userNum) {
		userMap.insertWithDrawal(userNum);
	}

	@Override
	public int updateUser(User userData) {
		return userMap.updateUser(userData);
	}

	@Override
	public void deleteUserGenre(int userNum) {
		userMap.deleteUserGenre(userNum);
	}

	@Override
	public String selectId(UserDto userDto) {
		return userMap.selectId(userDto);
	}
	
	@Override
	public String selectPw(UserDto userDto) {
		return userMap.selectPw(userDto);
	}
	
	@Override
	public String selectPw(String email, String userId) {
		return userMap.selectPw(email, userId);
	}
	
	@Override
	public void updatePw(UserDto userDto) {
		userMap.updatePw(userDto);
	}
}