package com.my.movie.dao;

import java.util.List;

import com.my.movie.domain.User;
import com.my.movie.domain.UserDto;

public interface UserDao {
	User selectLoginUser(User user);
	User selectUser(String userId);
	int selectWithDrawal(int userNum);
	int selectUserId(String userId);
	int selectUserNickname(String nickname);
	int selectUserPhoneNum(String phoneNum);
	int selectUserEmail(String email);
	int selectFixUserNickname(UserDto nickname);
	int selectFixUserPhoneNum(UserDto phoneNum);
	int selectFixUserEmail(UserDto email);
	List<String> selectUserGenre(int userNum);
	List<Integer> selectGenreNum(int userNum);
	void insertUser(User user);
	void insertUserGenre(int userNum, int genreNum);
	void insertWithDrawal(int userNum);
	int updateUser(User userData);
	void deleteUserGenre(int userNum);
	String selectId(UserDto userDto);
	String selectPw(UserDto userDto);
	String selectPw(String email, String userId);
	void updatePw(UserDto userDto);
}