<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach items="${memberRecommends}" var="memberRecommend"  varStatus="status" >
<li class="sv-card">
    <div class="sv-card--top clearfix">
        <a _stat_click_id="7_114379" href="/adviser/detail/${memberRecommend.memberId}.html" target="_blank"><img src="../../../images/logo_h.png" class="sv-card--icon"></a>

        <p class="sv-card--name"><a class="name" _stat_click_id="7_214379" href="/adviser/detail/${memberRecommend.memberId}.html" target="_blank">${memberRecommend.companyName}</a>
            <span class="mod-icon-grantee"></span></p>
        <ul class="sv-card--review">
            <li class="sv-card--review-item">
                <span class="title">${memberRecommend.memberName}</span>
                <%--<span class="point">金牌顾问</span>--%>
            </li>
            <li class="sv-card--review-item">
                <span class="title">
                    ${memberRecommend.categoryName}
                </span>
            </li>
            <li class="sv-card--review-item">
                <span class="title">执业${memberRecommend.workAge}年</span>
            </li>
        </ul>

        <span class="arrow"></span>
    </div>
    <div class="sv-card--bottom">
        <a href="/adviser/detail/${memberRecommend.memberId}.html" class="sv-card--type" target="_blank" title="${memberRecommend.description}">${memberRecommend.description}</a>
        <div class="sv-card--sale">
            <%--咨询和销量暂时不要--%>
            <%--<a _stat_click_id="7_414379" href="/adviser/detail/${memberRecommend.memberId}.html" target="_blank">咨询 845</a>--%>
            <%--<a _stat_click_id="7_514379" href="/adviser/detail/${memberRecommend.memberId}.html" target="_blank">销量 1132</a>--%>
        </div>
        <div class="sv-card--price">
            <div class="sv-card--special"><span class="sv-card--red"></span></div>
        </div>
        <div class="sv-card--btn-wrap">
            <a class="ui-button ui-button-sm ui-button-primary jmod-consult-stat jmod-wpa-qq" _wpa_qq="${memberRecommend.qq}" _stat_click_id="7_6305427" data-cid="305427" data-csid="14379" target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=${memberRecommend.qq}&amp;site=qq&amp;menu=yes">QQ咨询</a>
            <a href="/adviser/detail/${memberRecommend.memberId}.html" target="_blank" class="ui-button ui-button-sm ui-button-primary" _stat_click_id="7_7305427">查看详情</a>
        </div>
    </div>
</li>
</c:forEach>

<input type="hidden" id="totalPages" value="${paging.totalPages}"/>
<input type="hidden" id="currentPage" value="${paging.currentPage}"/>
<%--<div class="card ">--%>
    <%--<div class="top">--%>
        <%--<a href="/seller/corpinfo?c_id=292346" target="_blank" _stat_click_id="7_17"><img src="http://p.qlogo.cn/zc_icon/0/204383ac1335c19b01a6a28dd21e7e50/0" class="logo"></a>--%>
        <%--<h5 title="小桔微信工作室"><a href="/seller/corpinfo?c_id=292346" target="_blank" _stat_click_id="7_17">小桔微信工作室</a><a class="lv" href="/scenter/growth" target="_blank">Lv4</a></h5>--%>
        <%--<p>质量<em>5.0</em>速度<em>5.0</em>态度<em>5.0</em></p>--%>
        <%--<span class="cate-tag">微信开发</span>--%>
    <%--</div>--%>
    <%--<div class="btm">--%>
        <%--<p class="des" title="企业微信公众平台一站式服务">“企业微信公众平台一站式服务”</p>--%>
        <%--<a target="_blank" href="/seller/corpinfo?c_id=292346" class="btn" _stat_click_id="7_17">进入店铺</a>--%>
    <%--</div>--%>
<%--</div>--%>