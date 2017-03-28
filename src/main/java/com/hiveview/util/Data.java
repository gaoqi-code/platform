package com.hiveview.util;


@SuppressWarnings("rawtypes")
public class Data {

	/**
	 * 操作代码 1:成功 ,0:失败
	 */
	private Integer code=1;
	
	private String msg;
	
	private Object obj;
	
	public Data(){
	}
	
	public Data(Integer code,String msg){
		this.code=code;
		this.msg=msg;
	}
	
	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getObj() {
		return obj;
	}

	public void setObj(Object obj) {
		this.obj = obj;
	}

}
