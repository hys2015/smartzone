package com.smartzone.bbs.utils;

import java.util.List;

public class Page {
	private List list;
	private int allRows;
	private int totalPage;
	private int currentPage;
	private int pageSize;
	/*
	 * 初始化 返回记录开始位置
	 * @return 
	 */
	public int init(int allRows,int pageSize,int pagenum){
		this.allRows = allRows;
		this.pageSize = pageSize;
		this.currentPage = pagenum;
		this.totalPage = (allRows % pageSize == 0)? (allRows / pageSize): (allRows / pageSize) + 1;
		this.currentPage = (this.currentPage == 0)? 1: this.currentPage;
		this.currentPage = (this.currentPage>this.totalPage)?this.totalPage:this.currentPage;
		return pageSize * (this.currentPage - 1);
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	public int getAllRows() {
		return allRows;
	}
	public void setAllRows(int allRows) {
		this.allRows = allRows;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public Page(){
	}
}
