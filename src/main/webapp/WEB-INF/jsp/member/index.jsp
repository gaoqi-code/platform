<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<html>
<head>
    <%@ include file="/common/global.jsp" %>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
    <title>会员中心-首页</title>
    <jsp:include page="../common/css.jsp"></jsp:include>
    <link rel="stylesheet" href="./css/buysell.css">
    <link rel="stylesheet" href="../plugins/layui/css/global.css">
    <style>
        .member_menu li{width: 100%;height:35px;line-height:35px;border-bottom: 1px solid #eee;}
        .member_menu li a{margin-left:20px;}
        .member_info{background-color: #FFF;padding:10px 5px 20px 5px;}
        .p_icon{width: 210px;float: left;}
        .p_icon img{width:200px;padding: 5px;}
        .member_info_font{float: left;margin-left: 3px;width: 735px;}
        .member_info_font p{line-height: 35px;}
        .x_m{font-size: 24px;padding-right: 5px;}
        .memberTitle{font-size: 20px;}
    </style>
</head>
<body>
<input type="hidden" id="qbbPath" value="<%=qbbPath%>">
<jsp:include page="../common/top_c.jsp"></jsp:include>
<jsp:include page="../common/nav_c.jsp"></jsp:include>
<div id="container">
    <div class="content memver_c">
        <jsp:include page="../common/left_c.jsp"></jsp:include>

        <div class="c_right">

            <c:if test="${member.type==0}">
                <jsp:include page="person_center.jsp"></jsp:include>
            </c:if>

            <c:if test="${member.type==1}">
                <jsp:include page="company_center.jsp"></jsp:include>
            </c:if>
        </div>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>
