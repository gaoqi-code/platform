<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="mod-boxhd"><h3 class="mod-boxhd-tit">新闻部分</h3></div>

<c:if test="${articles != null}">

<a href="/article/detail/${articles[0].id}.html" class="business-new-big" target="_blank">
    <img src="http://image.qibaba.cn/uploadFile/article/aboutQBB.jpg">
    <p>${articles[0].title}</p>
</a>

<ul class="media-report">
    <c:forEach items="${articles}" var="article" begin="1" varStatus="status" >
        <li>
            <a href="/article/detail/${article.id}.html" target="_blank">
                <div class="report-img"><img src="http://image.qibaba.cn/uploadFile/article/articleCh.jpg"></div>
                <div class="report-title">${article.title}</div>
                <i></i>
                <p class="report-txt">${article.content}</p>
                <div class="report-time">
                    <span>
                        <fmt:formatDate value="${article.updateTime != null ? article.updateTime:article.addTime}"   pattern="yyyy-MM-dd" type="date" dateStyle="long" />
                    </span>
                    <span>
                    <i class="eye-icon"></i>
                         ${article.pageView}
                    </span>
                </div>
            </a>
        </li>
    </c:forEach>

</ul>

</c:if>
