package com.smartzone.info.entity;

import java.util.List;
import java.util.Set;


/**
 * Series entity. @author MyEclipse Persistence Tools
 */

public class Series  implements java.io.Serializable {


    // Fields    

     private Integer seriesId;
     private String seriesName;
     private List notices ;
     private Community community;


    // Constructors

    /** default constructor */
    public Series() {
    }

	/** minimal constructor */
    public Series(String seriesName) {
        this.seriesName = seriesName;
    }
    
    /** full constructor */
    public Series(String seriesName, List notices) {
        this.seriesName = seriesName;
        this.notices = notices;
    }

   
    // Property accessors

    public Integer getSeriesId() {
        return this.seriesId;
    }
    
    public void setSeriesId(Integer seriesId) {
        this.seriesId = seriesId;
    }

    public String getSeriesName() {
        return this.seriesName;
    }
    
    public void setSeriesName(String seriesName) {
        this.seriesName = seriesName;
    }

    public List getNotices() {
        return this.notices;
    }
    
    public void setNotices(List notices) {
        this.notices = notices;
    }

	public Community getCommunity() {
		return community;
	}

	public void setCommunity(Community community) {
		this.community = community;
	}
   








}