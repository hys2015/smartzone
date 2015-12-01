package com.smartzone.info.entity;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;


/**
 * Feedback entity. @author MyEclipse Persistence Tools
 */

public class Feedback  implements java.io.Serializable {


    // Fields    

     private Integer fno;
     private String ftitle;
     private String fauthor;
     private Timestamp ftime;
     private String fcontent;
     private List replies;
     private Integer communityno;


    // Constructors

    /** default constructor */
    public Feedback() {
    }

	/** minimal constructor */
    public Feedback(Timestamp ftime) {
        this.ftime = ftime;
    }
    
    /** full constructor */
    public Feedback(String ftitle, String fauthor, Timestamp ftime, String fcontent,List replies,Integer communityno) {
        this.ftitle = ftitle;
        this.fauthor = fauthor;
        this.ftime = ftime;
        this.fcontent = fcontent;
        this.replies = replies;
        this.communityno = communityno;
    }

   
    // Property accessors

    public Integer getFno() {
        return this.fno;
    }
    
    public void setFno(Integer fno) {
        this.fno = fno;
    }

    public String getFtitle() {
        return this.ftitle;
    }
    
    public void setFtitle(String ftitle) {
        this.ftitle = ftitle;
    }

    public String getFauthor() {
        return this.fauthor;
    }
    
    public void setFauthor(String fauthor) {
        this.fauthor = fauthor;
    }

    public Timestamp getFtime() {
        return this.ftime;
    }
    
    public void setFtime(Timestamp ftime) {
        this.ftime = ftime;
    }

    public String getFcontent() {
        return this.fcontent;
    }
    
    public void setFcontent(String fcontent) {
        this.fcontent = fcontent;
    }

    public List getReplies() {
        return this.replies;
    }
    
    public void setReplies(List replies) {
        this.replies = replies;
    }

	public Integer getCommunityno() {
		return communityno;
	}

	public void setCommunityno(Integer communityno) {
		this.communityno = communityno;
	}
   








}