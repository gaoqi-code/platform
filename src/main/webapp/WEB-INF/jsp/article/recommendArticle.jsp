<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="mod-boxhd"><h3 class="mod-boxhd-tit">新闻部分</h3></div>

<c:if test="${articles != null}">

<a href="/article/detail/${articles[0].id}.html" class="business-new-big" target="_blank">
    <img src="http://7xrgpz.com2.z0.glb.clouddn.com/serviceImg/20170314104337_132.jpg">
    <p>${articles[0].title}</p>
</a>

<ul class="media-report">
    <c:forEach items="${articles}" var="article" begin="1" varStatus="status" >
        <li>
            <a href="/article/detail/${article.id}.html" target="_blank">
                <div class="report-img"><img src="http://7xrgpz.com2.z0.glb.clouddn.com/serviceImg/20170314102808_20170302134312_20170302120200197.png"></div>
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

        <%--<li>--%>
            <%--<a href="http://www.xiaodingwang.com/newsWiki/766.htm" target="_blank">--%>
                <%--<div class="report-img"><img src="http://7xrgpz.com2.z0.glb.clouddn.com/serviceImg/20170314102808_20170302134312_20170302120200197.png"></div>--%>
                <%--<div class="report-title">武侯区委领导会见顶呱呱集团董事长黄建明先生</div>--%>
                <%--<i></i>--%>
                <%--<p class="report-txt">成都市武侯区区委副书记、区长林丽约见了成都顶呱呱集团董事长黄建明先生，双方就企业在武侯区投资发展事宜进行了深度的沟通和交流。</p>--%>
                <%--<div class="report-time">--%>
                    <%--<span>2017-3-20</span>--%>
                    <%--<span>--%>
										<%--<i class="eye-icon"></i>--%>
                                         <%--765--%>
									<%--</span>--%>
                <%--</div>--%>
            <%--</a>--%>
        <%--</li>--%>

</ul>

</c:if>
