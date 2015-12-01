package com.smartzone.info.entity;

import java.sql.Timestamp;


/**
 * Reply entity. @author MyEclipse Persistence Tools
 */

public class ReplyToFeed  implements java.io.Serializable {


    // Fields    

     private Integer reno;
     private Feedback feedback;
     private String reauthor;
     private Timestamp retime;
     private String recontent;


    // Constructors

    /** default constructor */
    public ReplyToFeed() {
    }

	/** minimal constructor */
    public ReplyToFeed(Feedback feedback, Timestamp retime) {
        this.feedback = feedback;
        this.retime = retime;
    }
    
    /** full constructor */
    public ReplyToFeed(Feedback feedback, String reauthor, Timestamp retime, String recontent) {
        this.feedback = feedback;
        this.reauthor = reauthor;
        this.retime = retime;
        this.recontent = recontent;
    }

   
    // Property accessors

    public Integer getReno() {
        return this.reno;
    }
    
    public void setReno(Integer reno) {
        this.reno = reno;
    }

    public Feedback getFeedback() {
        return this.feedback;
    }
    
    public void setFeedback(Feedback feedback) {
        this.feedback = feedback;
    }

    public String getReauthor() {
        return this.reauthor;
    }
    
    public void setReauthor(String reauthor) {
        this.reauthor = reauthor;
    }

    public Timestamp getRetime() {
        return this.retime;
    }
    
    public void setRetime(Timestamp retime) {
        this.retime = retime;
    }

    public String getRecontent() {
        return this.recontent;
    }
    
    public void setRecontent(String recontent) {
        this.recontent = recontent;
    }
   








}