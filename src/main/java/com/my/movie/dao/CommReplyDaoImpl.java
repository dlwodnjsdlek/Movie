package com.my.movie.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.movie.dao.map.CommunityMap;
import com.my.movie.domain.CommReply;

@Repository
public class CommReplyDaoImpl implements CommReplyDao {
	@Autowired private CommunityMap communityMap;

	@Override
	public List<CommReply> selectCommReplies(CommReply commReply) {
		return communityMap.selectCommReplies(commReply);
	}
	
	@Override
	public int insertCommReply(CommReply commReply) {
		return communityMap.insertCommReply(commReply);
	}
	
	@Override
	public void deleteCommReply(CommReply commReply) {
		communityMap.deleteCommReply(commReply);
	}
	
	@Override
	public void inspectionCommReply(CommReply commReply) {
		communityMap.inspectionCommReply(commReply);
	}
}