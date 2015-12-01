package com.smartzone.bbs.biz;

import java.util.List;

import com.smartzone.bbs.entity.Post;
import com.smartzone.bbs.entity.Reply;
import com.smartzone.bbs.utils.Page;
import com.smartzone.info.entity.Pager;

public interface ReplyBiz {
	public Reply findById(Reply reply);
	
	public void Add(Reply reply);
	
	public void Delete(Reply reply);
	
	public Pager getPager(int pagesize ,int id);

	public List getAll(Pager pager, Integer postId);

	public List getReplyStar();

	public void update(Reply r);

}
