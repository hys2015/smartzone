package com.smartzone.info.entity;

public class Pager {
	int curPage;
	int pageSize;
	int pageCount;
	int itemCount;
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageCount() {
		return (itemCount+pageSize-1)/pageSize;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getItemCount() {
		return itemCount;
	}
	public void setItemCount(int itemCount) {
		this.itemCount = itemCount;
	}
}
