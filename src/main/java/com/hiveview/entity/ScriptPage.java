package com.hiveview.entity;

import java.util.ArrayList;
import java.util.List;

public class ScriptPage {
	private List rows = new ArrayList();
	private Integer total = -1;
	private String msg;

	public List getRows() {
		return rows;
	}

	public void setRows(List rows) {
		this.rows = rows;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
}
