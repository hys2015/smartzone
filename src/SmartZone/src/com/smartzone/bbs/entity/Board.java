package com.smartzone.bbs.entity;

import com.smartzone.info.entity.Community;
import java.util.HashSet;
import java.util.Set;


/**
 * Board entity. @author MyEclipse Persistence Tools
 */

public class Board  implements java.io.Serializable {


    // Fields    

     private Integer boardId;
     private Community community;
     private String boardName;
     private Integer postCount;
     private Set posts = new HashSet(0);
     private Set bms = new HashSet(0);
     private String represent;

    // Constructors

    /** default constructor */
    public Board() {
    }

	/** minimal constructor */
    public Board(String boardName) {
        this.boardName = boardName;
    }
    
    /** full constructor */
    public Board(Community community, String boardName, Set posts, Set bms) {
        this.community = community;
        this.boardName = boardName;
        this.posts = posts;
        this.bms = bms;
    }

   
    // Property accessors

    public Integer getBoardId() {
        return this.boardId;
    }
    
    public void setBoardId(Integer boardId) {
        this.boardId = boardId;
    }

    public Community getCommunity() {
        return this.community;
    }
    
    public void setCommunity(Community community) {
        this.community = community;
    }

    public String getBoardName() {
        return this.boardName;
    }
    
    public void setBoardName(String boardName) {
        this.boardName = boardName;
    }

    public Set getPosts() {
        return this.posts;
    }
    
    public void setPosts(Set posts) {
        this.posts = posts;
    }

    public Set getBms() {
        return this.bms;
    }
    
    public void setBms(Set bms) {
        this.bms = bms;
    }

	public Integer getPostCount() {
		return postCount;
	}

	public void setPostCount(Integer postCount) {
		this.postCount = postCount;
	}

	public String getRepresent() {
		return represent;
	}

	public void setRepresent(String represent) {
		this.represent = represent;
	}
   








}