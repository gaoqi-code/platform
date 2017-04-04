<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="t_nav"><!--买家-->
    <ul class="t_nav_list content">
        <c:choose>
        <c:when test="${nav eq 'center'}"><li class="current_c"></c:when>
        <c:otherwise><li></c:otherwise>
        </c:choose>
            <a href="member/index.html">个人中心</a>
        </li>
        <c:choose>
            <c:when test="${nav eq 'myshop'}"><li class="current_c"></c:when>
            <c:otherwise><li></c:otherwise>
        </c:choose>
            <c:if test="${sessionScope.currentUser.type==1}">
                <%--<a href="member/myshop.html">我的店铺</a>--%>
                <a href="member/product/list.html">我的店铺</a>
            </c:if>
        </li>
        <%--<li><a href="#" class="pl60 pr60">会员信息</a></li>--%>
        <%--<li><a href="#" class="pl60 pr60">服务</a></li>--%>
    </ul>
</div>