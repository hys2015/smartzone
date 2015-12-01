package com.smartzone.bbs.biz.imp;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.smartzone.bbs.biz.PostBiz;
import com.smartzone.bbs.dao.PostDAO;
import com.smartzone.bbs.entity.Post;
import com.smartzone.bbs.entity.Reply;
import com.smartzone.info.entity.Pager;

public class PostBizImp implements PostBiz {
	private PostDAO postdao;
	
	private int defalutPageSize;
	public int getDefalutPageSize() {
		return defalutPageSize;
	}

	public void setDefalutPageSize(int defalutPageSize) {
		this.defalutPageSize = defalutPageSize;
	}

	public PostDAO getPostdao() {
		return postdao;
	}

	public void setPostdao(PostDAO postdao) {
		this.postdao = postdao;
	}

	@Override
	public Post findById(Post post) {
		post = postdao.findById(post.getPostId());
		if(post == null){
			return null;
		}
		post.setPostReadtimes(post.getPostReadtimes()+1);
		Update(post);
		return post;
	}

	@Override
	public int Add(Post post) {
		/*Date date = new Date();       
		Timestamp nousedate = new Timestamp(date.getTime());
		��ȡtimestamp�ĵ�ǰϵͳʱ��
		*/
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		post.setPostCreatetime(ts);
		List list = post.getReplies();
		if( list == null ){
			list = new ArrayList();
		}
		Reply r = new Reply(post.getPostContent(), ts);
		r.setUser(post.getUser());
		if(!list.isEmpty()){
			list.clear();
		}
		list.add(r);
		post.setReplies(list);
		post.setPostReadtimes(0);
		post.setPostReplytimes(1);
		return postdao.save(post);
	}

	@Override
	public void Delete(Post post) {
		postdao.delete(post);
	}

	@Override
	public Pager getPager(int pagesize ,int boardid) {
		int count = postdao.getCountOnProperty("board.boardId", String.valueOf(boardid));
		Pager pager = new Pager();
		pager.setItemCount(count);
		pager.setPageSize(pagesize);
		return pager;
	}

	
	
	@Override
	public void Update(Post post) {
		post.setPostUpdatetime(new Timestamp(System.currentTimeMillis()));
		postdao.save(post);
	}

	@Override
	public List getAll(Pager pager, int boardid) {
		return postdao.getPageredPostOnProperty(pager.getCurPage(), pager.getPageSize(), "board.boardId", String.valueOf(boardid));
	}

	@Override
	public List getHotPost(int bid) {
		return postdao.getHotPost(bid);
	}

	@Override
	public List findLast10(Integer communityno) {
		int num = 5;
		return postdao.findLastPost("board.community.communityno",communityno,num);
	}

}
