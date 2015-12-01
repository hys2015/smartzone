package com.smartzone.info.entity;

import java.sql.Timestamp;


/**
 * Notice entity. @author MyEclipse Persistence Tools
 */

public class Notice  implements java.io.Serializable {

	public static final int NORMAL_PRIORITY = 5;
	public static final int TOP_PRIORITY = 10;
	public static final int AVALIABLE = 1;
	public static final int UN_AVALIABLE = 0;

    // Fields    

     private Integer tid;
     private Series series;
     private String title;
     private String author;
     private String content;
     private Integer valiable;
     private Integer priority;
     private Integer communityno;
     private Timestamp createtime;
     private Timestamp modifiedtime;
     private Integer readcount;
     private Integer idx;


    // Constructors

    /** default constructor */
    public Notice() {
    }

	/** minimal constructor */
    public Notice(String title, String author, String content, Integer valiable, Integer priority, Timestamp createtime, Timestamp modifiedtime, Integer readcount) {
        this.title = title;
        this.author = author;
        this.content = content;
        this.valiable = valiable;
        this.priority = priority;
        this.createtime = createtime;
        this.modifiedtime = modifiedtime;
        this.readcount = readcount;
    }
    
    /** full constructor */
    public Notice(Series series, String title, String author, String content, Integer valiable, Integer priority, Integer communityno, Timestamp createtime, Timestamp modifiedtime, Integer readcount) {
        this.series = series;
        this.title = title;
        this.author = author;
        this.content = content;
        this.valiable = valiable;
        this.priority = priority;
        this.communityno = communityno;
        this.createtime = createtime;
        this.modifiedtime = modifiedtime;
        this.readcount = readcount;
    }

   
    // Property accessors

    public Integer getTid() {
        return this.tid;
    }
    
    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public Series getSeries() {
        return this.series;
    }
    
    public void setSeries(Series series) {
        this.series = series;
    }

    public String getTitle() {
        return this.title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return this.author;
    }
    
    public void setAuthor(String author) {
        this.author = author;
    }

    public String getContent() {
        return this.content;
    }
    
    public void setContent(String content) {
        this.content = content;
    }

    public Integer getValiable() {
        return this.valiable;
    }
    
    public void setValiable(Integer valiable) {
        this.valiable = valiable;
    }

    public Integer getPriority() {
        return this.priority;
    }
    
    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    public Integer getCommunityno() {
        return this.communityno;
    }
    
    public void setCommunityno(Integer communityno) {
        this.communityno = communityno;
    }

    public Timestamp getCreatetime() {
        return this.createtime;
    }
    
    public void setCreatetime(Timestamp createtime) {
        this.createtime = createtime;
    }

    public Timestamp getModifiedtime() {
        return this.modifiedtime;
    }
    
    public void setModifiedtime(Timestamp modifiedtime) {
        this.modifiedtime = modifiedtime;
    }

    public Integer getReadcount() {
        return this.readcount;
    }
    
    public void setReadcount(Integer readcount) {
        this.readcount = readcount;
    }

	public Integer getIdx() {
		return idx;
	}

	public void setIdx(Integer idx) {
		this.idx = idx;
	}
   








}