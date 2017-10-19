package com.hiveview.filter.crossOrigin;

import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by hxq on 2017/5/25.
 *
 Access-Control-Allow-Origin 为允许哪些Origin发起跨域请求. 这里设置为”*”表示允许所有，通常设置为所有并不安全，最好指定一下。
 Access-Control-Allow-Methods 为允许请求的方法.
 Access-Control-Max-Age 表明在多少秒内，不需要再发送预检验请求，可以缓存该结果
 Access-Control-Allow-Headers 表明它允许跨域请求包含content-type头，这里设置的x-requested-with ，表示ajax请求
 * 跨域过滤器
 */
public class CrossOriginFilter implements Filter {

    private FilterConfig config = null;

    @Override
    public void init(FilterConfig config) throws ServletException {
        this.config = config;
    }

    @Override
    public void destroy() {
        this.config = null;
    }

    /**
     * @comment 跨域的设置
     */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        // 表明它允许"http://xxx"发起跨域请求
        httpResponse.setHeader("Access-Control-Allow-Origin",
                config.getInitParameter("AccessControlAllowOrigin"));
        // 表明在xxx秒内，不需要再发送预检验请求，可以缓存该结果
        httpResponse.setHeader("Access-Control-Allow-Methods",
                config.getInitParameter("AccessControlAllowMethods"));
        // 表明它允许xxx的外域请求
        httpResponse.setHeader("Access-Control-Max-Age",
                config.getInitParameter("AccessControlMaxAge"));
        // 表明它允许跨域请求包含xxx头
        httpResponse.setHeader("Access-Control-Allow-Headers",
                config.getInitParameter("AccessControlAllowHeaders"));
        chain.doFilter(request, response);
    }

}