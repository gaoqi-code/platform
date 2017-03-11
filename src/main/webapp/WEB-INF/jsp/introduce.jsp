<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <jsp:include page="common/top.jsp"></jsp:include>
    <jsp:include page="common/nav.jsp"></jsp:include>
    <base href="<%=basePath%>">
    <title>Title</title>
</head>
<body>
666
</body>
</html>
