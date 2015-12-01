package com.smartzone.store.biz.imp;

import java.sql.Timestamp;
import java.util.List;

import com.smartzone.store.biz.CommentBiz;
import com.smartzone.store.dao.CommentDAO;
import com.smartzone.store.entity.Comment;

public class CommentBizImp implements CommentBiz {
	private CommentDAO commentDAO;

	/* (non-Javadoc)
	 * @see com.smartzone.store.biz.imp.CommentBiz#findAll()
	 */
	@Override
	public List findAll(){
		
		return commentDAO.findAll();
	}
	
	public CommentDAO getCommentDAO() {
		return commentDAO;
	}

	public void setCommentDAO(CommentDAO commentDAO) {
		this.commentDAO = commentDAO;
	}

	@Override
	public void add(Comment comment) {
		comment.setCreatetime(new Timestamp(System.currentTimeMillis()));
		commentDAO.save(comment);
	}

	@Override
	public List findByGood(Integer gid) {
		return commentDAO.findByProperty("gid", gid);
	}
}
