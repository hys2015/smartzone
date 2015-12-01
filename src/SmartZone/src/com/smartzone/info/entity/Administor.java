package com.smartzone.info.entity;



/**
 * Administor entity. @author MyEclipse Persistence Tools
 */

public class Administor implements java.io.Serializable {


    // Fields    

     private String adminName;
     private Community community;
     private String adminPwd;


    // Constructors

    /** default constructor */
    public Administor() {
    }

	/** minimal constructor */
    public Administor(String adminPwd) {
        this.adminPwd = adminPwd;
    }
    
    /** full constructor */
    public Administor(Community community, String adminPwd) {
        this.community = community;
        this.adminPwd = adminPwd;
    }

   
    // Property accessors

    public String getAdminName() {
        return this.adminName;
    }
    
    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public Community getCommunity() {
        return this.community;
    }
    
    public void setCommunity(Community community) {
        this.community = community;
    }

    public String getAdminPwd() {
        return this.adminPwd;
    }
    
    public void setAdminPwd(String adminPwd) {
        this.adminPwd = adminPwd;
    }
   








}