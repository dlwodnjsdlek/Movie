package com.my.movie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.movie.dao.SympathDao;

@Repository
public class SympathServiceImpl implements SympathService{

	@Autowired
	private SympathDao sympathDao;
	
	@Override
	public Integer isContentLiked(int contentNum, String contentName, int userNum) {
		return sympathDao.isContentLiked(contentNum, contentName, userNum);
	}

	@Override
	public void addContentLiked(int contentNum, String contentName, int userNum, int isLike) {
		sympathDao.addContentLiked(contentNum, contentName, userNum, isLike);
	}

	@Override
	public void modifyContentLiked(int contentNum, String contentName, int userNum, int value) {
		sympathDao.modifyContentLiked(contentNum, contentName, userNum, value);
	}
}
