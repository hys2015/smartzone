package com.smartzone.bbs.biz;

import java.util.List;

import com.smartzone.bbs.entity.Board;

public interface BoardBiz {
	public void Add(Board Board);
	
	public void Delete(Board Board);
	
	public Board findById(Board Board);
	
	public List<Board> findAll();
}
