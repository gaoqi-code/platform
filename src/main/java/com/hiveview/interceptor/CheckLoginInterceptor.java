package com.hiveview.interceptor;

import com.hiveview.entity.Member;
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
		public boolean preHandle(HttpServletRequest request,HttpServletResponse response, Object handler) throws Exception {
			String requestUrl = request.getServletPath();
			if(!requestUrl.startsWith("/member"))
				return true;
			Object usesession =request.getSession().getAttribute("currentUser");
			if(usesession != null){
				Member member = (Member) usesession;
				for (String url:noInterceptor_url) {
					if(request.getServletPath().indexOf(url)>-1){
						return true;
					}
				}
				if(member.getType()==-1){
					response.sendRedirect(request.getContextPath() + "/mType.html");
					return false;
				}
				return true;
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
		public static String [] noInterceptor_url = {"toMember.html"};
}