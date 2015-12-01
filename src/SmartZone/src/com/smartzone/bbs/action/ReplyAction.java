package com.smartzone.bbs.action;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import com.smartzone.bbs.biz.PostBiz;
import com.smartzone.bbs.biz.ReplyBiz;
import com.smartzone.bbs.entity.Post;
import com.smartzone.bbs.entity.Reply;
import com.smartzone.info.entity.LoginCheckData;
import com.smartzone.info.entity.Pager;
import com.smartzone.info.entity.User;

public class ReplyAction extends BaseAction implements RequestAware {
	
	private ReplyBiz replybiz;
	private PostBiz postbiz;
	private Reply reply;
	private Post post;
	private Pager pager;
	
	private final int SIZE = 5;
	
	private Map<String,Object> request;
	
	public String create(){
		User user = (User) LoginCheckData.getInstance(session).getObj();
		if(user == null) return LOGIN;
		post = postbiz.findById(post);
		if(post == null) return ERROR;
		reply.setPost(post);
		reply.setUser(user);
		List replies = post.getReplies();
		replies.add(reply);
		post.setReplies(replies);
		post.setPostReplytime(new Timestamp(System.currentTimeMillis()));
		postbiz.Update(post);
		return SUCCESS;
	}
	
	public String replies(){
		int curPage = 1;
		if (pager != null) {
			curPage = pager.getCurPage();
		}
		List nlist = null;
		post = postbiz.findById(post);
		if(post == null) return "index";
		pager = replybiz.getPager(SIZE, post.getPostId());
		if (curPage > pager.getPageCount()) {
			curPage = pager.getPageCount();
		} else if (curPage < 0) {
			curPage = 1;
		}
		pager.setCurPage(curPage);
		nlist = replybiz.getAll(pager, post.getPostId());
		
		request.put("list", nlist);
		request.put("pager", pager);
		return SUCCESS;
	}
	
	public String delete(){
		LoginCheckData lcd = LoginCheckData.getInstance(session);
		if(lcd == null || "admin".equals(lcd.getType())){
			return ERROR;
		}
		User u = (User) lcd.getObj();
		reply = replybiz.findById(reply);
		if( u == null || u.getUsername() == null){
			return ERROR;
		}
		if(u.getUsername().equals(reply.getUser().getUsername()) || u.getIsAdmin()){
			replybiz.Delete(reply);
			post = reply.getPost();
			return SUCCESS;
		}
		return ERROR;
	}
	/**
	 * 发帖达人
	 * @return
	 */
	public String replyStar(){
		List list = replybiz.getReplyStar();
		request.put("replystar", list);
		return SUCCESS;
	}
	
	public String toUpdate(){
		if(reply == null ) return ERROR;
		LoginCheckData lcd = LoginCheckData.getInstance(session);
		if(lcd == null || "admin".equals(lcd.getType())){
			return ERROR;
		}
		User u = (User) lcd.getObj();
		reply = replybiz.findById(reply);
		if( u == null || u.getUsername() == null || !u.getUsername().equals(reply.getUser().getUsername())){
			return ERROR;
		}
		post = reply.getPost();
		request.put("reply", reply);
		return SUCCESS;
	}
	
	public String update(){
		if(reply == null ) return ERROR;
		LoginCheckData lcd = LoginCheckData.getInstance(session);
		if(lcd == null || "admin".equals(lcd.getType())){
			return ERROR;
		}
		User u = (User) lcd.getObj();
		Reply r = replybiz.findById(reply);
		if( u == null || u.getUsername() == null || !u.getUsername().equals(r.getUser().getUsername())){
			return ERROR;
		}
		r.setReplyContent(reply.getReplyContent());
		replybiz.update(r);
		post = r.getPost();
		return SUCCESS;
	}
	
	public ReplyBiz getReplybiz() {
		return replybiz;
	}

	public void setReplybiz(ReplyBiz replybiz) {
		this.replybiz = replybiz;
	}

	public Reply getReply() {
		return reply;
	}

	public void setReply(Reply reply) {
		this.reply = reply;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public PostBiz getPostbiz() {
		return postbiz;
	}

	public void setPostbiz(PostBiz postbiz) {
		this.postbiz = postbiz;
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
	
}
