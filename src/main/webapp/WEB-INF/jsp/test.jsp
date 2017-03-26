<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/2
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/common/global.jsp" %>
    <title>Title</title>
    <jsp:include page="./common/css.jsp"></jsp:include>
    <link rel="stylesheet" href="../css/buysell.css">
    <style >
        .type_b_container{background-color: #e7e8eb;margin:20px 0px 0px 0px;padding:30px 0px;}
        .content_{border:1px solid #d9dadc;background-color: #FFF;}
        .h_step{border-bottom: 1px solid #e6e7ea;}
        .h_step li{font-size:16px;float: left;text-align:center;width: 33%;height: 44px;line-height: 44px; background: transparent url(https://res.wx.qq.com/mpres/htmledition/images/bg/bg_processor218877.png) no-repeat 0 0;
            background-position: right;}
        .on{background-color: #44b549!important;background-position:-14px 0px!important;color: #fff;}
        .type_title{padding-left:10px;font-size:20px;height:50px;line-height:50px;border-bottom: 1px solid #e6e7ea;    background-color: #fff;}
        .type_content{padding:100px 0px;width: 616px;margin-left: auto;margin-right: auto;}
        .type_c{float: left;display: inline-block;
            vertical-align: top;
            cursor: pointer;
            position: relative;
            text-align: left;
            overflow: hidden;
            width: 300px;
            border: 1px solid #e7e7eb;
            background-color: #ffffff;}
        .type_c:hover{background-color:#ff6600;color: #fff;}
        .type_select{margin: 30px 20px;font-size:16px;}
        .line{border-bottom:1px solid #e7e7eb;width: 90%;margin-left: auto;margin-right: auto;}
        .type_c p{margin-top: 5px;font-size: 14px;}
        /*.type_c ul{margin-top:10px;margin-left: 10px;margin-right: 10px;}*/
        /*.type_c li{height:28px;line-height: 28px;color: #8d8d8d}*/
        .bottomCss{margin-top: 0px;}
    </style>
</head>
<body>
<jsp:include page="./common/top_c.jsp"></jsp:include>
<div class="type_b_container">
    <div class="content content_">
        <ul class="h_step">
            <li>1 注册会员</li>
            <li class="on">2 选择类型</li>
            <li style="background-position: 0px -88px;">3 会员中心</li>
            <div class="clear"></div>
        </ul>
        <div class="type_title">请选择账号类型</div>
        <div class="type_content">
            <div class="type_c">
                <div class="type_select">个人会员<p>适用于个人</p></div>
                <%--<div class="line"></div>--%>
                <%--<ul>--%>
                    <%--<li>会员中心发布个人需求</li>--%>
                    <%--<li>管理个人需求</li>--%>
                <%--</ul>--%>
            </div>
            <div class="type_c" style="margin-left: 10px;">
                <div class="type_select">商家顾问<p>适用于企业员工</p></div>
                <%--<div class="line"></div>--%>
                <%--<ul>--%>
                    <%--<li>会员中心发布需求</li>--%>
                    <%--<li>管理需求</li>--%>
                    <%--<li>会员中心发布产品</li>--%>
                    <%--<li>管理产品</li>--%>
                <%--</ul>--%>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
<jsp:include page="./common/bottom.jsp"></jsp:include>
</body>
</html>
