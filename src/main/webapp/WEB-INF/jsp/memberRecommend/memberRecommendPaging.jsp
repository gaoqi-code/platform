<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<h2>实名供应商</h2>
<c:forEach items="${memberRecommends}" var="memberRecommend" >
    <div class="bd clearfix">
        <div class="pic"><img width="50" height="50" src="${memberRecommend.headPortrait}" alt="${memberRecommend.companyName}" title="${memberRecommend.companyName}"></div>
        <div class="info">
            <h3>
                <a href="/adviser/detail/${memberRecommend.memberId}.html" target="_blank" >${memberRecommend.memberName}</a>
                <a href="javascript:void(0);" target="_blank"><b class="realname_s" title="已通过实名认证"></b></a><span class="ml10 f12">${memberRecommend.areaFullName}</span>
                <p>
                    <span class="green">
                        <c:if test="${memberRecommend.adviserType == '1-'}">[金融顾问]</c:if>
                        <c:if test="${memberRecommend.adviserType == '2-'}">[企业顾问]</c:if>
                        <c:if test="${memberRecommend.adviserType == '3-'}">[法律顾问]</c:if>
                    </span>
                    <a class="gray" href="javascript:void(0);">${memberRecommend.description}</a>
                </p>
            </h3>
        </div>
    </div>
</c:forEach>