package com.my.movie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.movie.dao.CommReplyDao;
import com.my.movie.domain.CommReply;

@Service
public class CommReplyServiceImpl implements CommReplyService {
	@Autowired private CommReplyDao commReplyDao;

	@Override
	public List<CommReply> getCommReplies(CommReply commReply) {
		return commReplyDao.selectCommReplies(commReply);
	}
	
	@Override
	public void addCommReply(CommReply commReply) {
		commReplyDao.insertCommReply(commReply);
	}
	
	@Override
	public void delCommReply(CommReply commReply) {
		commReplyDao.deleteCommReply(commReply);
	}
	
	@Override
	public void inspectionCommReply(CommReply commReply) {
		commReplyDao.inspectionCommReply(commReply);
	}
}