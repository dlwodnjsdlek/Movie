package com.my.movie.dao.map;

public interface SympathMap {
	
	Integer getLikeCount(int contentNum, String contentName);

	Integer getDisLikeCount(int contentNum, String contentName);
	
	Integer isContentLiked(int contentNum, String contentName, int userNum);

	void addContentLiked(int contentNum, String contentName, int userNum, int isLike);

	void modifyContentLiked(int contentNum, String contentName, int userNum, int value);
	
}
