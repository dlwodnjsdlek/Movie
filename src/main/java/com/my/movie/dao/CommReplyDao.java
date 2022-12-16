package com.my.movie.dao;

import java.util.List;

import com.my.movie.domain.CommReply;

public interface CommReplyDao {
	List<CommReply> selectCommReplies(CommReply commReply);
	int insertCommReply(CommReply commReply);
	void deleteCommReply(CommReply commReply);
	void inspectionCommReply(CommReply commReply);
}
