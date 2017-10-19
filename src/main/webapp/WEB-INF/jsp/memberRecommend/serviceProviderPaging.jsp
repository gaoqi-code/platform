<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="mod-boxhd"><h3 class="mod-boxhd-tit">热门服务商</h3></div>
<div class="mod-boxbd clearfix">

<c:forEach items="${memberRecommends}" var="memberRecommend"  varStatus="status" >



    <div class="card <c:if test="${status.index % 4 == 0}">ml0</c:if>">
        <div class="top">
            <a href="/adviser/detail/${memberRecommend.memberId}.html" target="_blank" _stat_click_id="7_10"><img src="http://p.qlogo.cn/zc_icon/0/eda4fbadd80dca63454ffd581cabe18a/0" class="logo"></a>
            <h5 title="${memberRecommend.companyName}">
                <a href="/adviser/detail/${memberRecommend.memberId}.html" target="_blank" _stat_click_id="7_10">${memberRecommend.companyName}</a>
            </h5>
            <p>
                         ${memberRecommend.categoryName}
                <em>
                        ${memberRecommend.memberName}
                </em>
            </p>
            <span class="cate-tag"></span>
        </div>
        <div class="btm">
            <p class="des">${memberRecommend.summary}</p>
            <a target="_blank" href="/adviser/detail/${memberRecommend.memberId}.html" class="btn" _stat_click_id="7_10">进入店铺</a>
        </div>
    </div>


</c:forEach>


</div>

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