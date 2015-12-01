package com.smartzone.bbs.biz.imp;

import java.util.List;

import com.smartzone.bbs.biz.BoardBiz;
import com.smartzone.bbs.dao.BoardDAO;
import com.smartzone.bbs.entity.Board;

public class BoardBizImp implements BoardBiz {
	private BoardDAO boarddao;
	public BoardDAO getBoarddao() {
		return boarddao;
	}

	public void setBoarddao(BoardDAO Boarddao) {
		this.boarddao = Boarddao;
	}

	@Override
	public void Add(Board Board) {
		boarddao.save(Board);
	}

	@Override
	public void Delete(Board Board) {
		boarddao.delete(Board);
	}

	@Override
	public Board findById(Board Board) {
		Board = boarddao.findById(Board.getBoardId());
		return Board;
	}

	@Override
	public List<Board> findAll() {
		List<Board> list = boarddao.findAll();
		return list;
	}

}
