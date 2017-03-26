package com.hiveview.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;


public class CheckLoginInterceptor implements HandlerInterceptor{
	
		private static final String LoginUrl = "/tologin.html";
		@SuppressWarnings("unchecked")
		@Override
		public boolean preHandle(HttpServletRequest request,
				HttpServletResponse response, Object handler) throws Exception {
			String requestUrl = request.getServletPath();
			if(!requestUrl.startsWith("/member"))
				return true;
			Object usesession =request.getSession().getAttribute("currentUser");
			if(usesession != null){
				//return true;  
				//判断这个帐号是否已经登录
				ServletContext application = request.getSession().getServletContext();
				String currentSessionId = request.getSession().getId();
				Map<String,String> map = (Map<String, String>) application.getAttribute("sessionIdMap");
				boolean flag = false;
				if(map!=null){
					for(String key:map.keySet()){
						if(currentSessionId.equals(map.get(key))){
							flag=true;
							break;
						}
					}
				}else{
					flag=true;
				}
				if(flag){
//					request.setAttribute("leftMeau",sysAuthService.getLeftAuth(((SysUser)usesession).getRoleId()));
					return true;
				}
			}
			response.sendRedirect(request.getContextPath() + LoginUrl);
		    return false;  
		}
		@Override
		public void postHandle(HttpServletRequest request,
				HttpServletResponse response, Object handler, ModelAndView modelAndView)
				throws Exception {
			
		}
		@Override
		public void afterCompletion(HttpServletRequest request,
				HttpServletResponse response, Object handler, Exception ex)
				throws Exception {
			// TODO Auto-generated method stub
			
		}
}