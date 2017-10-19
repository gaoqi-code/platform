<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
    .qfgw_enter{    border: 1px solid #2486b5;
        padding: 5px 15px;
        margin: 10px 0px;
        display: inline-block;
        border-radius: 5px;}
</style>
<h2 class="size22">企服顾问</h2>
<c:forEach items="${memberRecommends}" var="memberRecommend" >
    <div class="bd clearfix">
        <div class="pic"><img width="50" height="50" src="${memberRecommend.headPortrait}" alt="${memberRecommend.companyName}" title="${memberRecommend.companyName}"></div>
        <div class="info">
            <h3>
                <a href="/adviser/detail/${memberRecommend.memberId}.html" class="size18">${memberRecommend.memberName}</a>&nbsp;&nbsp;&nbsp;
                <span class="qColor">
                    [${memberRecommend.categoryName}]
                </span>
                <div>
                <span>
                      <c:choose>
                          <c:when test="${memberRecommend.level==1}">
                              普通顾问
                          </c:when>
                          <c:when test="${memberRecommend.level==2}">
                              高级顾问
                          </c:when>
                          <c:otherwise>
                              顾问
                          </c:otherwise>
                      </c:choose>
                    </span>
                    <a href="javascript:void(0);"></a>
                    <span class="ml10 f12">
                            ${memberRecommend.areaFullName}
                    </span>
                </div>
                <p>
                    <a class="gray beyond2" title="${memberRecommend.description}" href="javascript:void(0);">${memberRecommend.description}</a>
                </p>
                <a class="qfgw_enter" href="/adviser/detail/${memberRecommend.memberId}.html">进入咨询</a>
            </h3>
        </div>
    </div>
</c:forEach>