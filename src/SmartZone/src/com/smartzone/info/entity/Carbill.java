package com.smartzone.info.entity;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;


/**
 * Carbill entity. @author MyEclipse Persistence Tools
 */

public class Carbill  implements java.io.Serializable {


    // Fields    

     private Integer bid;
     private CarPort carport;
     private User user;
     private Timestamp createtime;
     private Boolean ispayed;
     private Date begintime;
     private Date endtime;
     private Integer fee;
     private Community community;

    // Constructors

    /** default constructor */
    public Carbill() {
    }

   
    // Property accessors

    public Integer getBid() {
        return this.bid;
    }
    
    public void setBid(Integer bid) {
        this.bid = bid;
    }

    public Timestamp getCreatetime() {
        return this.createtime;
    }
    
    public void setCreatetime(Timestamp createtime) {
        this.createtime = createtime;
    }

    public Boolean getIspayed() {
        return this.ispayed;
    }
    
    public void setIspayed(Boolean ispayed) {
        this.ispayed = ispayed;
    }

    public Date getBegintime() {
        return this.begintime;
    }
    
    public void setBegintime(Date begintime) {
        this.begintime = begintime;
    }

    public Date getEndtime() {
        return this.endtime;
    }
    
    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }


	public CarPort getCarport() {
		return carport;
	}


	public void setCarport(CarPort carport) {
		this.carport = carport;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public Integer getFee() {
		return fee;
	}


	public void setFee(Integer fee) {
		this.fee = fee;
	}


	public Community getCommunity() {
		return community;
	}


	public void setCommunity(Community community) {
		this.community = community;
	}






}