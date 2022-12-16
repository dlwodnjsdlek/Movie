package com.my.movie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.movie.dao.CommunityDao;
import com.my.movie.domain.Community;
import com.my.movie.domain.CommunityList;

@Service
public class CommunityServiceImpl implements CommunityService {
	@Autowired private CommunityDao communityDao;
	
	@Override
	public List<CommunityList> getCommunities() {
		return communityDao.selectCommunities();
	}
	
	@Override
	public CommunityList getCommunity(int communityNum) {
		return communityDao.selectCommunity(communityNum);
	}
	
	@Override
	public void addCommunity(Community community) {
		communityDao.insertCommunity(community);
	}
	
	@Override
	public void delCommunity(Community communityNum) {
		communityDao.deleteCommunity(communityNum);
	}
	
	@Override
	public void inspectionCommunity(Community communityNum) {
		communityDao.inspectionCommunity(communityNum);
	}
}
