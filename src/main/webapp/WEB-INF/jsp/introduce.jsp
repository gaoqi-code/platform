<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>企巴巴</title>
    <jsp:include page="common/css.jsp"></jsp:include>
</head>
<body>
<jsp:include page="common/top.jsp"></jsp:include>
公司介绍
</body>
</html>
