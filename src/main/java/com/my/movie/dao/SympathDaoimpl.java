package com.my.movie.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.movie.dao.map.SympathMap;

@Repository
public class SympathDaoimpl implements SympathDao {

	@Autowired
	private SympathMap sympathMap;
	
	@Override
	public Integer isContentLiked(int contentNum, String contentName, int userNum) {
		return sympathMap.isContentLiked(contentNum, contentName, userNum);
	}

	@Override
	public void addContentLiked(int contentNum, String contentName, int userNum, int isLike) {
		sympathMap.addContentLiked(contentNum, contentName, userNum, isLike);
	}

	@Override
	public void modifyContentLiked(int contentNum, String contentName, int userNum, int value) {
		sympathMap.modifyContentLiked(contentNum, contentName, userNum, value);
	}
}
	
