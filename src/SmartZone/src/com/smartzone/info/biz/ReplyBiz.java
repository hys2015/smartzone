package com.smartzone.info.biz;

import java.util.List;

import com.smartzone.info.entity.ReplyToFeed;

public interface ReplyBiz {
	public List getAll();

	public List getReplyByReno(Integer reno);

	public void delete(ReplyToFeed reply);

	public void update(ReplyToFeed r);
}
