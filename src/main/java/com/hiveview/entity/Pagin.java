package com.hiveview.entity;

public class Pagin {

	/**
	 * 页码
	 */
	private int pageIndex = 1;
	/**
	 * 每页记录条数
	 */
	private int pageSize = 10;
	/**
	 * 记录总条数
	 */
	private int recCount = -1;
	/**
	 * 记录总页数
	 */
	private int pageCount;
	/**
	 * 跳过查询的行数
	 */
	private int skipNo;

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
		skipNo = (this.pageIndex - 1) * pageSize;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getRecCount() {
		return recCount;
	}

	public void setRecCount(int recCount) {
		this.recCount = recCount;
		if (this.recCount % pageSize == 0)
			pageCount = this.recCount / pageSize;
		else
			pageCount = this.recCount / pageSize + 1;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getSkipNo() {
		return skipNo;
	}

}
