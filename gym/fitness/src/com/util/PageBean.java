package com.util;

public class PageBean {
	public Integer pageNo=1; //当前页码
	public Integer pageSize=8; //每页显示条数
	public Integer totalCount; //总记录数
	public Integer totalPage; //总页数
	public Integer prePage;  //上一页页码
	public Integer nextPage; //下一页页码

	public PageBean() {
	}
	public PageBean(Integer pageNo, Integer pageSize) {
		super();
		this.pageNo = pageNo;
		this.pageSize = pageSize;
	}
	//得到当前页码对象的方法
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	//得到显示条数对象的方法
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	//得到总记录数对象的方法
	public Integer getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}
	//得到上一页页码对象的方法，如果页码小于1则为1，其它的则是当前页码减1
	public Integer getPrePage() {
		if(pageNo<=1){
			prePage=1;
		}else{
			prePage=pageNo-1;
		}
		return prePage;
	}
	//设置一个上一页对象的方法
	public void setPrePage(Integer prePage) {
		this.prePage = prePage;
	}
	//得到下一页对象的方法
	public Integer getNextPage() {
		if(pageNo>=getTotalPage()){
			nextPage=totalPage;
		}else{
			nextPage=pageNo+1;
		}
		return nextPage;
	}
	public void setNextPage(Integer nextPage) {
		this.nextPage = nextPage;
	}
	//得到一个总页码对象
	public Integer getTotalPage() {
		totalPage=(getTotalCount()+pageSize-1)/pageSize;
		return totalPage;
	}
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	
}
