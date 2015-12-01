package com.smartzone.bbs.biz.imp;

import java.sql.Timestamp;
import java.util.List;

import com.smartzone.bbs.biz.ReplyBiz;
import com.smartzone.bbs.dao.ReplyDAO;
import com.smartzone.bbs.entity.Post;
import com.smartzone.bbs.entity.Reply;
import com.smartzone.bbs.utils.Page;
import com.smartzone.info.entity.Pager;

public class ReplyBizImp implements ReplyBiz {
	private ReplyDAO replydao;

	public ReplyDAO getReplydao() {
		return replydao;
	}

	public void setReplydao(ReplyDAO replydao) {
		this.replydao = replydao;
	}

	@Override
	public void Add(Reply reply) {
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		reply.setReplyCreatetime(ts);
		replydao.save(reply);
	}

	@Override
	public void Delete(Reply reply) {
		replydao.delete(reply);
	}

	@Override
	public Pager getPager(int pagesize ,int id) {
		int count = replydao.getCountOnProperty("post.postId", String.valueOf(id));
		Pager pager = new Pager();
		pager.setItemCount(count);
		pager.setPageSize(pagesize);
		return pager;
	}

	@Override
	public Reply findById(Reply reply) {
		return replydao.findById(reply.getReplyId());
	}

	@Override
	public List getAll(Pager pager, Integer postId) {
		return replydao.getPageredRepliesOnProperty(pager.getCurPage(), pager.getPageSize(), "post.postId", String.valueOf(postId));
	}

	@Override
	public List getReplyStar() {
		return replydao.getReplyStar();
	}

	@Override
	public void update(Reply r) {
		Add(r);
	}

}
