package com.hiveview.util;

import com.google.common.collect.Maps;

import java.util.Map;

public class Msg {
	Msg(){
		
	}
	
	public static final String GET_SYSUSER_ERROE = "获取系统用户列表失败!";
	
	public static Map<String, String> sessionIdMap = null;
	
	
	public synchronized static Map<String, String> getInstance(){
		if(sessionIdMap==null){
			sessionIdMap = Maps.newHashMap();
		}	
		return sessionIdMap;
	}
}
