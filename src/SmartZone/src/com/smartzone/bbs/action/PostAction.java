package com.smartzone.bbs.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import com.smartzone.bbs.biz.BoardBiz;
import com.smartzone.bbs.biz.PostBiz;
import com.smartzone.bbs.entity.Board;
import com.smartzone.bbs.entity.Post;
import com.smartzone.info.entity.LoginCheckData;
import com.smartzone.info.entity.Pager;
import com.smartzone.info.entity.User;

public class PostAction extends BaseAction implements RequestAware{
	private PostBiz postbiz;
	private BoardBiz boardBiz;
	private Post post;
	private Board board;
	private Pager pager;
	
	private Map<String, Object> request;
	
	private final int SIZE = 10;
	
	public String create(){
		User user = (User) LoginCheckData.getInstance(session).getObj();
		post.setUser(user);
		if(board == null){
			return this.ERROR;
		}
		post.setBoard(board);
		int newID = postbiz.Add(post);
		post.setPostId(newID);
		return this.SUCCESS;
	}
	
	public String delete(){
		if( post == null || post.getPostId() == null) return ERROR;
		User user = (User) LoginCheckData.getInstance(session).getObj();
		if(!user.getIsAdmin() && user != post.getUser()) return this.ERROR;
		post = postbiz.findById(post);
		postbiz.Delete(post);
		session.put("message", "删除成功");
		return this.SUCCESS;
	}
	
	public String posts(){
		
		int curPage = 1;
		if (pager != null) {
			curPage = pager.getCurPage();
		}
		List nlist = null;
		board = boardBiz.findById(board);
		if (null == post) {
			pager = postbiz.getPager(SIZE, board.getBoardId());
			if (curPage > pager.getPageCount()) {
				curPage = pager.getPageCount();
			} else if (curPage < 0) {
				curPage = 1;
			}
			pager.setCurPage(curPage);
			nlist = postbiz.getAll(pager, board.getBoardId());
		}
		
		request.put("list", nlist);
		request.put("pager", pager);
		return this.SUCCESS;
	}
	
	public String visitPost(){
		post = postbiz.findById(post);
		if(post == null) return this.ERROR;
		return this.SUCCESS;
	}
	
	public String hotPost(){
		if(board == null || board.getBoardId() == null ){
			return ERROR;
		}
		int bid = board.getBoardId();
		List list = postbiz.getHotPost(bid);
		request.put("hotpost", list);
		return SUCCESS;
	}
	
	
	public PostBiz getPostbiz() {
		return postbiz;
	}

	public void setPostbiz(PostBiz postbiz) {
		this.postbiz = postbiz;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public Board getBoard() {
		return board;
	}

	public void setBoard(Board board) {
		this.board = board;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public Pager getPager() {
		return pager;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}

	public void setBoardBiz(BoardBiz boardBiz) {
		this.boardBiz = boardBiz;
	}
	
}
