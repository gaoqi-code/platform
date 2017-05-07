<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="module_nav content"><span class="module_title">顾问推荐</span></div>
<div class="adviser_tj">
    <div class="content">
        <c:forEach items="${adviserRecommends}" var="adviserRecommend" >
            <div class="adviser_tj_li">
                <div>
                    <div class="adviser_right_tj"><img src="${adviserRecommend.headPortrait == null?'/images/portrait.jpg':adviserRecommend.headPortrait}"></div>
                    <div class="adviser_right_tjperson">
                        <div>
                            <p>
                                <span class="adviserName">${adviserRecommend.memberName}</span>
                                <c:if test="${adviserRecommend.level == 1}">普通顾问</c:if>
                                <c:if test="${adviserRecommend.level == 2}">金牌顾问</c:if>
                            </p>
                            <p style="margin-top: 16px;">${adviserRecommend.workAge}年执业经验</p>
                            <p style="margin-top: 12px;"><img src="../images/icon/star-on.png"><img src="../images/icon/star-on.png"><img src="../images/icon/star-on.png"><img src="../images/icon/star-on.png"><img src="../images/icon/star-on.png"></p>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="adviser_right_tj_personwork clearfix">
                        <a href="/adviser/detail/${adviserRecommend.memberId}.html" target="_blank" class="green">进入主页</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=${adviserRecommend.qq}&amp;site=qq&amp;menu=yes" class="ser">QQ留言</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>