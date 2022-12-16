package com.my.movie.service;

import java.util.List;

import com.my.movie.domain.User;
import com.my.movie.domain.UserDto;

public interface UserService {
	User loginValidate(User user);
	User getUser(String userId);
	int getWithDrawal(int userNum);
	int checkUserId(String userId);
	int checkUserNickname(String nickname);
	int checkUserPhoneNum(String phoneNum);
	int checkUserEmail(String email);
	int checkFixUserNickname(UserDto nickname);
	int checkFixUserPhoneNum(UserDto phoneNum);
	int checkFixUserEmail(UserDto email);
	List<String> getUserGenre(int userNum);
	List<Integer> getGenreNum(int userNum);
	void addUser(User user);
	void addUserGenre(int userNum, int genreNum);
	void addWithDrawal(int userNum);
	int fixUser(User userData);
	void delUserGenre(int userNum);
	String findId(UserDto userDto);
	String findPw(UserDto userDto);
	String findPw(String email, String userId);
	void fixPw(UserDto userDto);
}