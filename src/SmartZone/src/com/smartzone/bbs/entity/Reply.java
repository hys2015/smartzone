package com.smartzone.bbs.entity;

import com.smartzone.info.entity.User;
import java.sql.Timestamp;


/**
 * Reply entity. @author MyEclipse Persistence Tools
 */

public class Reply  implements java.io.Serializable {


    // Fields    

     private Integer replyId;
     private Post post;
     private User user;
     private String replyContent;
     private Timestamp replyCreatetime;
     private Integer idx;


    // Constructors

    /** default constructor */
    public Reply() {
    }

	/** minimal constructor */
    public Reply(String replyContent, Timestamp replyCreatetime) {
        this.replyContent = replyContent;
        this.replyCreatetime = replyCreatetime;
    }
    
    /** full constructor */
    public Reply(Post post, User user, String replyContent, Timestamp replyCreatetime, Integer idx) {
        this.post = post;
        this.user = user;
        this.replyContent = replyContent;
        this.replyCreatetime = replyCreatetime;
        this.idx = idx;
    }

   
    // Property accessors

    public Integer getReplyId() {
        return this.replyId;
    }
    
    public void setReplyId(Integer replyId) {
        this.replyId = replyId;
    }

    public Post getPost() {
        return this.post;
    }
    
    public void setPost(Post post) {
        this.post = post;
    }

    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }

    public String getReplyContent() {
        return this.replyContent;
    }
    
    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent;
    }

    public Timestamp getReplyCreatetime() {
        return this.replyCreatetime;
    }
    
    public void setReplyCreatetime(Timestamp replyCreatetime) {
        this.replyCreatetime = replyCreatetime;
    }

	public Integer getIdx() {
		return idx;
	}

	public void setIdx(Integer idx) {
		this.idx = idx;
	}
   








}