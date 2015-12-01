package com.smartzone.store.biz;

import java.util.List;

import com.smartzone.store.entity.Comment;

public interface CommentBiz {

	public List findAll();

	public void add(Comment comment);

	public List findByGood(Integer gid);

}