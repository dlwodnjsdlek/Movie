package com.my.movie.service;

public interface SympathService {
	
	Integer isContentLiked(int contentNum, String contentName, int userNum);
	
	void addContentLiked(int contentNum, String contentName, int userNum, int isLike);

	void modifyContentLiked(int contentNum, String contentName, int userNum, int value);
	
}
