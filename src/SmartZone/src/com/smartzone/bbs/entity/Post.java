package com.smartzone.bbs.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.smartzone.info.entity.User;


/**
 * Post entity. @author MyEclipse Persistence Tools
 */

public class Post  implements java.io.Serializable {


    // Fields    

     private Integer postId;
     private Board board;
     private User user;
     private String postTitle;
     private Timestamp postCreatetime;
     private Timestamp postUpdatetime;
     private Timestamp postReplytime;
     private Integer postReadtimes;
     private String postContent;
     private Integer postReplytimes;
     private List replies;

    // Constructors

    /** default constructor */
    public Post() {
    }

	/** minimal constructor */
    public Post(String postTitle, Timestamp postCreatetime, Timestamp postUpdatetime, Timestamp postReplytime, Integer postReadtimes, Integer postReplytimes) {
        this.postTitle = postTitle;
        this.postCreatetime = postCreatetime;
        this.postUpdatetime = postUpdatetime;
        this.postReplytime = postReplytime;
        this.postReadtimes = postReadtimes;
        this.postReplytimes = postReplytimes;
    }
    
    /** full constructor */
    public Post(Board board, User user, String postTitle, Timestamp postCreatetime, Timestamp postUpdatetime, Timestamp postReplytime, Integer postReadtimes, String postContent, Integer postReplytimes, List replies) {
        this.board = board;
        this.user = user;
        this.postTitle = postTitle;
        this.postCreatetime = postCreatetime;
        this.postUpdatetime = postUpdatetime;
        this.postReplytime = postReplytime;
        this.postReadtimes = postReadtimes;
        this.postContent = postContent;
        this.postReplytimes = postReplytimes;
        this.replies = replies;
    }

   
    // Property accessors

    public Integer getPostId() {
        return this.postId;
    }
    
    public void setPostId(Integer postId) {
        this.postId = postId;
    }

    public Board getBoard() {
        return this.board;
    }
    
    public void setBoard(Board board) {
        this.board = board;
    }

    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }

    public String getPostTitle() {
        return this.postTitle;
    }
    
    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public Timestamp getPostCreatetime() {
        return this.postCreatetime;
    }
    
    public void setPostCreatetime(Timestamp postCreatetime) {
        this.postCreatetime = postCreatetime;
    }

    public Timestamp getPostUpdatetime() {
        return this.postUpdatetime;
    }
    
    public void setPostUpdatetime(Timestamp postUpdatetime) {
        this.postUpdatetime = postUpdatetime;
    }

    public Timestamp getPostReplytime() {
        return this.postReplytime;
    }
    
    public void setPostReplytime(Timestamp postReplytime) {
        this.postReplytime = postReplytime;
    }

    public Integer getPostReadtimes() {
        return this.postReadtimes;
    }
    
    public void setPostReadtimes(Integer postReadtimes) {
        this.postReadtimes = postReadtimes;
    }

    public String getPostContent() {
        return this.postContent;
    }
    
    public void setPostContent(String postContent) {
        this.postContent = postContent;
    }

    public Integer getPostReplytimes() {
        return this.postReplytimes;
    }
    
    public void setPostReplytimes(Integer postReplytimes) {
        this.postReplytimes = postReplytimes;
    }

	public void setReplies(List replies) {
		this.replies = replies;
	}

	public List getReplies() {
		return replies;
	}
   








}