package com.my.movie.service;

import java.util.List;

import com.my.movie.domain.CommReply;

public interface CommReplyService {
	List<CommReply> getCommReplies(CommReply commReply);
	void addCommReply(CommReply commReply);
	void delCommReply(CommReply commReply);
	void inspectionCommReply(CommReply commReply);
}