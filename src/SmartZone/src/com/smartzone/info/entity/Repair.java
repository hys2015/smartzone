package com.smartzone.info.entity;

import java.sql.Timestamp;
import java.util.Date;


/**
 * Repair entity. @author MyEclipse Persistence Tools
 */

public class Repair  implements java.io.Serializable {


    // Fields    

     private Integer rno;
     private String rtitle;
     private Date rtime;
     private String raddr;
     private String rphone;
     private String rcontent;
     private String ruser;
     private Integer rstate;
     private Integer communityno;
     private Timestamp rlastupdate;
     private String rlastupdatorId;


    // Constructors

    /** default constructor */
    public Repair() {
    }

	/** minimal constructor */
    public Repair(String rtitle, Timestamp rlastupdate) {
        this.rtitle = rtitle;
        this.rlastupdate = rlastupdate;
    }
    
    /** full constructor */
    public Repair(String rtitle, Date rtime, String raddr, String rphone, String rcontent, String ruser, Integer rstate, Integer commnunityno, Timestamp rlastupdate, String rlastupdatorId) {
        this.rtitle = rtitle;
        this.rtime = rtime;
        this.raddr = raddr;
        this.rphone = rphone;
        this.rcontent = rcontent;
        this.ruser = ruser;
        this.rstate = rstate;
        this.communityno = commnunityno;
        this.rlastupdate = rlastupdate;
        this.rlastupdatorId = rlastupdatorId;
    }

   
    // Property accessors

    public Integer getRno() {
        return this.rno;
    }
    
    public void setRno(Integer rno) {
        this.rno = rno;
    }

    public String getRtitle() {
        return this.rtitle;
    }
    
    public void setRtitle(String rtitle) {
        this.rtitle = rtitle;
    }

    public Date getRtime() {
        return this.rtime;
    }
    
    public void setRtime(Date rtime) {
        this.rtime = rtime;
    }

    public String getRaddr() {
        return this.raddr;
    }
    
    public void setRaddr(String raddr) {
        this.raddr = raddr;
    }

    public String getRphone() {
        return this.rphone;
    }
    
    public void setRphone(String rphone) {
        this.rphone = rphone;
    }

    public String getRcontent() {
        return this.rcontent;
    }
    
    public void setRcontent(String rcontent) {
        this.rcontent = rcontent;
    }

    public String getRuser() {
        return this.ruser;
    }
    
    public void setRuser(String ruser) {
        this.ruser = ruser;
    }

    public Integer getRstate() {
        return this.rstate;
    }
    
    public void setRstate(Integer rstate) {
        this.rstate = rstate;
    }

    public Integer getCommunityno() {
        return this.communityno;
    }
    
    public void setCommunityno(Integer commnunityno) {
        this.communityno = commnunityno;
    }

    public Timestamp getRlastupdate() {
        return this.rlastupdate;
    }
    
    public void setRlastupdate(Timestamp rlastupdate) {
        this.rlastupdate = rlastupdate;
    }

    public String getRlastupdatorId() {
        return this.rlastupdatorId;
    }
    
    public void setRlastupdatorId(String rlastupdatorId) {
        this.rlastupdatorId = rlastupdatorId;
    }
   








}