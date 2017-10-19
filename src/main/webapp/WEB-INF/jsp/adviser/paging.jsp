<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<ul>
    <c:forEach items="${members}" var="member" >
        <li>
            <div class="li-img"><img src="${member.headPortrait == null?'/images/portrait.jpg':member.headPortrait}"></div>
            <div class="adviser-list-info">
                <div class="adviser-list-content">
                    <p>
                        <span class="company">${member.name}</span>
                        <span class="company2">
                            <span>
                                <img src="/images/icon/pingtai_03.png" style="width: 11px;height: 11px;padding-right: 3px; line-height: 11px;">
                            </span>
                            <c:if test="${member.level == '1'}">普通顾问</c:if>
                            <c:if test="${member.level == '2'}">金牌顾问</c:if>
                        </span>

                        <%--<c:if test="${member.adviserType == '1-'}">金融顾问</c:if>--%>
                        <%--<c:if test="${member.adviserType == '2-'}">企业顾问</c:if>--%>
                        <%--<c:if test="${member.adviserType == '3-'}">法律顾问</c:if>--%>
                        <%--<a href="http://wpa.qq.com/msgrd?v=3&amp;uin=${member.qq}&amp;site=qq&amp;menu=yes" target="_blank"><img src="images/qq/qq.gif" /></a>--%>
                    </p>
                    <p>${member.companyName}<span style="padding: 0px 10px;color: #eee;">|</span>
                        <%--<c:if test="${member.level == 1}">普通顾问</c:if>--%>
                        <%--<c:if test="${member.level == 2}">金牌顾问</c:if>--%>
                        &nbsp;${member.workAge}年执业经验
                    </p>
                    <p style="color: #999;">个人简介：
                        <c:if test="${fn:length(member.description)>100}">
                            ${fn:substring(member.description,0,100)}...
                        </c:if>
                        <c:if test="${fn:length(member.description)<=100}">
                            ${member.description}
                        </c:if>
                    </p>
                </div>
            </div>
            <%--<div class="adviser-list-href"><a href="/adviser/detail/${member.id}.html">顾问主页</a></div>--%>
            <div class="zixun">
                <p style="margin-bottom: 10px;">
                    <span class="xing"><img src="/images/icon/xing1_10.png"></span>
                    <span class="xing"><img src="/images/icon/xing1_10.png"></span>
                    <span class="xing"><img src="/images/icon/xing1_10.png"></span>
                    <span class="xing"><img src="/images/icon/xing1_10.png"></span>
                    <span class="xing"><img src="/images/icon/xing1_10.png"></span>
                    <label>5.0</label>
                </p>
                <p style="color: #666;">
                        ${member.categoryName}
                </p>
            </div>
            <div class="adviser-list-href">

                <div class="counselor-opt">

                    <label id="adviserMobile">${member.mobile}</label>
                    <div class="btn">
                        <a href="/adviser/detail/${member.id}.html">了解更多</a>
                        <a target="_blank" href="http://wpa.qq.com/msgrd?v=1&amp;uin=${member.qq}&amp;site=www.qibaba.cn&amp;menu=yes">咨询</a>
                    </div>
                </div>
            </div>
            <div class="clear"></div>
        </li>
    </c:forEach>
    <c:if test="${empty members}">
        <li>
            <div class="adviser-list-content">
                <p>没有搜索到您所需要的顾问信息！</p>
            </div>
        </li>
    </c:if>
</ul>


   <input type="hidden" id="totalPages" value="${paging.totalPages}"/>
   <input type="hidden" id="currentPage" value="${paging.currentPage}"/>
   <input type="hidden" id="totalCount" value="${paging.totalCount}"/>
