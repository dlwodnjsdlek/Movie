package com.my.movie.dao.map;

import java.util.List;

import com.my.movie.domain.CommReply;
import com.my.movie.domain.Community;
import com.my.movie.domain.CommunityList;

public interface CommunityMap {
	List<CommunityList> selectCommunities();
	CommunityList selectCommunity(int communityNum);
	void insertCommunity(Community community);
	void deleteCommunity(Community communityNum);
	void inspectionCommunity(Community community);
	List<CommReply> selectCommReplies(CommReply commReply);
	int insertCommReply(CommReply commReply);
	void deleteCommReply(CommReply commReply);
	void inspectionCommReply(CommReply commReply);
}