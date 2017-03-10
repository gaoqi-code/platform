package com.hiveview.entity;


@SuppressWarnings("rawtypes")
public class AjaxPage extends Pagin {

	/**
	 * 页码
	 */
	private int page = 1;
	/**
	 * 每页记录条数
	 */
	private int rows = 10;
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
	
	private int pageSize;
	
	public int getPage() {
		return page;
	}
	

	public void setPage(int page) {
		this.page = page;
	}

	public void setSkipNo(int skipNo) {
		this.skipNo = skipNo;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.pageSize=rows;
		this.rows = rows;
		skipNo = (this.page - 1) * rows;
	}

	public int getRecCount() {
		return recCount;
	}

	public int getPageSize() {
		return pageSize;
	}


	public void setRecCount(int recCount) {
		this.recCount = recCount;
		if (this.recCount % rows == 0)
			pageCount = this.recCount / rows;
		else
			pageCount = this.recCount / rows + 1;
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
