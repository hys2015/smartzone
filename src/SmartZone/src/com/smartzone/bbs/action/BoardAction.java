package com.smartzone.bbs.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.smartzone.bbs.biz.BoardBiz;
import com.smartzone.bbs.entity.Board;
import com.smartzone.info.entity.Community;
import com.smartzone.info.entity.LoginCheckData;
import com.smartzone.info.entity.User;

public class BoardAction extends BaseAction {
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	private BoardBiz boardbiz;
	private Board board;
	private String nav;
	
	public String visit(){
		log.debug("visitboard"+board.getBoardId());
		board = boardbiz.findById(board);
		if(board == null) return this.ERROR;
		return this.SUCCESS;
	}
	
	public String listAll(){
		List<Board> list = boardbiz.findAll();
		HttpServletRequest request = ServletActionContext.getRequest();  
		request.setAttribute("boardlist", list);
		if(nav == null){
			return SUCCESS;
		}
		return "nav";
	}
	
	public String add(){
		Community comm = ((User)LoginCheckData.getInstance(session).getObj()).getCommunity();
		board.setCommunity(comm);
		boardbiz.Add(board);
		return SUCCESS;
	}
	
	public String manage(){
		return listAll();
	}
	
	public String update(){
		if(board == null || board.getBoardId() == null){
			return ERROR;
		}
		boardbiz.Add(board);
		return SUCCESS;
	}
	
	public String delete(){
		if(board == null){
			return ERROR;
		}
		boardbiz.Delete(board);
		return SUCCESS;
	}
	
	public BoardBiz getBoardbiz() {
		return boardbiz;
	}
	public void setBoardbiz(BoardBiz boardbiz) {
		this.boardbiz = boardbiz;
	}
	public Board getBoard() {
		return board;
	}
	public void setBoard(Board board) {
		this.board = board;
	}

	public String getNav() {
		return nav;
	}

	public void setNav(String nav) {
		this.nav = nav;
	}
}
