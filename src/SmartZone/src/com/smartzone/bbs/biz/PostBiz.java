package com.smartzone.bbs.biz;

import java.util.List;

import com.smartzone.bbs.entity.Post;
import com.smartzone.info.entity.Pager;

public interface PostBiz {
	public Post findById(Post post);
	
	public int Add(Post post);
	
	public void Delete(Post post);
	
	public void Update(Post post);
	
	public Pager getPager(int pagesize, int boardid);
	
	public List getAll(Pager pager, int boardid);

	public List getHotPost(int bid);

	public List findLast10(Integer communityno);

}
