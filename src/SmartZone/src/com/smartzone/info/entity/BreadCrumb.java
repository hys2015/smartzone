package com.smartzone.info.entity;

public class BreadCrumb implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2418405567601052324L;
	
	private String url;
	private String word;
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	
}
