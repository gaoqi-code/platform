<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String basePath = request.getScheme() + "://"
            + request.getServerName();
%>
<div class="user">
    <div class="user_left">
        <div class="img_box">
            <img src="${member.headPortrait}" />
            <%--<p><button>修改头像</button></p>--%>
        </div>
        <div class="text">
            <p>账户：<span>${member.name}</span></p>
            <p></p>
            <%--<p>账户余额：<span>0 <button>[ 充值 ]</button></span></p>--%>
            <%--<p>消费总额：<span>0 元</span></p>--%>
        </div>
    </div>
    <div class="user_right">
        <%--<p>显示姓名 : 【 <span>开启</span> 】<button>预览</button></p>--%>
        <p>店铺状态  :  &nbsp;&nbsp;
            <span>
						<c:if test="${member.checkStatus == 4}">
                            审核通过
                        </c:if>
						<c:if test="${member.checkStatus == 5}">
                            审核失败
                        </c:if>
						<c:if test="${member.checkStatus == 3}">
                            审核中
                        </c:if>
						<c:if test="${member.checkStatus == 0}">
                            未审核
                        </c:if>
					</span>
            <%--<button>修改</button>--%>
        </p>
        <p>店铺店址 ： <%=basePath%>/adviser/detail/${member.id}.html <button onclick="location.href='<%=basePath%>/adviser/detail/${member.id}.html'">查看</button></p>
        <p>个人介绍 ： <span class="beyond2">${member.description}</span><button  onclick="location.href='/member/toPersonalData.html'">修改简历</button></p>
    </div>
</div>
<!--user-->