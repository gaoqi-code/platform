<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${!empty products}">
<ul>
    <%--<c:forEach items="${products}" var="product" >--%>
    <%--<li>--%>
        <%--<div class="li-img"><img src="${product.picture}"></div>--%>
        <%--<div class="adviser-list-info">--%>
            <%--<div class="adviser-list-content">--%>
                <%--<p>产品名称-${product.title}</p>--%>
                <%--<p>产品类型-${product.className}</p>--%>
                <%--<p><span>${product.member.name}</span>贷款顾问 <img src="/images/qq/qq.gif"></p>--%>
                <%--<p>个人简介：${fn:substring(product.member.description,0,80)}..</p>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="adviser-list-href"><a href="/product/detail/${product.id}.html">查看详情</a></div>--%>
        <%--<div class="clear"></div>--%>
    <%--</li>--%>
    <%--</c:forEach>--%>
        <script>
            function loadCName(){
                var companys = ${companyInfos};
                for (var c in companys){
                    $(".company_name_span_"+companys[c].id).html(companys[c].companyName);
                    $(".company_name_span_"+companys[c].id).prop("title",companys[c].companyName);
                }
            }
//            window.onload = loadCName;
        </script>

    <div class="m-itemlist">
        <div class="grid">
            <div class="items g-clearfix" id="J_itemlistCont">
                <c:forEach items="${products}" var="product" >
                    <div class="item">
                        <div class="pic-box J_MouseEneterLeave J_PicBox pic-box-hover" style="z-index: 1;">
                            <div class="pic-box-inner">
                                <div class="pic">
                                    <a class="pic-link J_U2IStat J_ItemPicA" href="/product/detail/${product.id}.html" target="_blank">
                                        <img class="J_ItemPic img lazy" src="${product.picture}" alt="${product.title}" title="${product.title}" style="opacity: 100; display: inline;" onerror="this.src='http://static.99114.com/static/images/alb_h156.gif'">
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="row row-1 g-clearfix">
                            <div class="price g_price g_price-highlight">
                                <strong>
                                    <c:choose>
                                    <c:when test="${product.realPrice == null ||product.realPrice <= 0}">面议</c:when>
                                    <c:otherwise>${product.realPrice}</c:otherwise>
                                    </c:choose>
                                </strong>
                            </div>
                        </div>
                        <div class="row row-2">
                            <a class="J_U2IStat" href="/product/detail/${product.id}.html" target="_blank">
                                    ${product.title}【${product.className}】
                            </a>
                            <a href="javascript:void(0);"><span class="coupons" title="优惠券"></span></a>
                        </div>
                        <div class="row row-3 g-clearfix">
                            <div class="shop">
                                <a class="shopname J_ShopInfo company_name_span_${product.companyId}" href="/product/detail/${product.id}.html" target="_blank" title="">
        				<span class="company_name_span_${product.companyId}">
      						&nbsp;
        	   			</span>
                                </a>
                            </div>
                        </div>
                        <li class="icon icon_first">
                            <a target="_blank" href="/adviser/detail/${product.member.id}.html" rel="nofollow" class="mr0">
                                顾问：${product.member.name}
                                    <%--<img src="http://static.99114.com/static/portal/images/common/aplay.png">--%>
                            </a>
                        </li>
                        <%--<li class="icon">--%>
                            <%--<a class="new_a_ml" target="_blank" href="http://zhuanti.99114.com/ktzxjy/index.html">--%>
                            <%--<img src="http://static.99114.com/static/portal/images/common/aplay.png">--%>
                            <%--</a>--%>
                        <%--</li>--%>
                        <li class="icon">
                            <a href="javascript:void(0);" title="">
                                <span class="icon-zpbz"></span>
                            </a>
                        </li>
                    </div>
                    <script type="application/javascript">loadCName();</script>
                </c:forEach>

            </div>
        </div>
    </div>
</ul>
</c:if>
    <c:if test="${empty products}">
                <div class="adviser-list-content">
                    <p id="noSearchVale">没有搜索到您所需要的产品信息！</p>
                </div>
    </c:if>


   <input type="hidden" id="totalPages" value="${paging.totalPages}"/>
   <input type="hidden" id="currentPage" value="${paging.currentPage}"/>