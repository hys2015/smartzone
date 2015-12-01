package com.smartzone.bbs.entity;

import com.smartzone.info.entity.User;


/**
 * Bm entity. @author MyEclipse Persistence Tools
 */

public class Bm  implements java.io.Serializable {


    // Fields    

     private Integer bmId;
     private Board board;
     private User user;


    // Constructors

    /** default constructor */
    public Bm() {
    }

    
    /** full constructor */
    public Bm(Board board, User user) {
        this.board = board;
        this.user = user;
    }

   
    // Property accessors

    public Integer getBmId() {
        return this.bmId;
    }
    
    public void setBmId(Integer bmId) {
        this.bmId = bmId;
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
   








}