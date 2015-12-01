package com.smartzone.info.entity;



/**
 * CarPort entity. @author MyEclipse Persistence Tools
 */

public class CarPort  implements java.io.Serializable {


    // Fields    

     private Integer carportId;
     private Integer fee;
     private User user;
     private Community community;


    // Constructors

    /** default constructor */
    public CarPort() {
    }

    

   
    // Property accessors

    public Integer getCarportId() {
        return this.carportId;
    }
    
    public void setCarportId(Integer carportId) {
        this.carportId = carportId;
    }

    public Integer getFee() {
        return this.fee;
    }
    
    public void setFee(Integer fee) {
        this.fee = fee;
    }

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Community getCommunity() {
		return community;
	}
	public void setCommunity(Community community) {
		this.community = community;
	}

}