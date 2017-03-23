<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<ul>
    <c:forEach items="${products}" var="product" >
    <li>
        <div class="li-img"><img src="${product.picture}"></div>
        <div class="adviser-list-info">
            <div class="adviser-list-content">
                <p>产品名称-${product.title}</p>
                <p>产品类型-${product.className}</p>
                <p><span>${product.member.name}</span>贷款顾问 <img src="/images/qq/qq.gif"></p>
                <p>个人简介：${product.member.description}</p>
            </div>
        </div>
        <div class="adviser-list-href"><a href="/product/detail/${product.id}.html">查看详情</a></div>
        <div class="clear"></div>
    </li>
    </c:forEach>
    <c:if test="${empty products}">
        <li>
                <div class="adviser-list-content">
                    <p>没有搜索到您所需要的产品信息！</p>
                </div>
        </li>
    </c:if>
</ul>

   <input type="hidden" id="totalPages" value="${paging.totalPages}"/>
   <input type="hidden" id="currentPage" value="${paging.currentPage}"/>
