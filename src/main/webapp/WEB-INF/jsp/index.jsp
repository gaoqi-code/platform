<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
    <base href="<%=basePath%>">
    <title>企巴巴</title>
    <jsp:include page="common/css.jsp"></jsp:include>
    <style>
        .notice{margin: 10px 0px;}
        .main_business{}
        .cc{width: 390px;float: left;height:60px;}
        .cc_img{    display: inline-block;
            margin-right: 10px;
            width: 36px;height: 46px;background-image: url(http://dgg.net/images/service-details/top-icon.png);
            background-position: -75px 0;
            vertical-align: middle;float: left;}
        .cc_content{float: left;}
        .cc_content_title{font-size: 18px;margin-bottom: 5px;}
        .titleNavLine{border-bottom: red solid 1px;}
        .tj_title{margin: 10px 0px;text-align: center;}
        .adviser_tj{float: left;margin-right: 5px;text-align: center;}
        .adviser_tj_img{width: 280px;}
    </style>
</head>
<body>
<jsp:include page="common/top.jsp"></jsp:include>
<div class="carousel" >
    <img style="width: 100%;" src="http://o6yahvsqr.bkt.clouddn.com/banner/20170317104435275659.jpg?imageView2/1/w/1920/h/450">
</div>
<div class="content">
    <div class="notice">
        <p>最新公告</p>
    </div>
    <div class="main_business">
        <div class="cc">
            <div class="cc_img">
                &nbsp;
            </div>
            <div class="cc_content">
                <p class="cc_content_title">贷款服务</p>
                <p>额度高，放款快，门槛低，利率低</p>
            </div>
            <div class="clear"></div>
        </div>
        <div class="cc">
            <div class="cc_img">
                &nbsp;
            </div>
            <div class="cc_content">
                <p class="cc_content_title">工商服务</p>
                <p>价格透明，最快3天拿证</p>
            </div>
        </div>
        <div class="cc">
            <div class="cc_img">
                &nbsp;
            </div>
            <div class="cc_content">
                <p class="cc_content_title">法律服务</p>
                <p>专家团队，一对一服务</p>
            </div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="adviser_tj_list">
        <div class="titleNavLine"><p class="titleNav">金融服务</p></div>
        <p class="tj_title">专业贷款顾问</p>
        <div class="adviser_tj">
            <img class="adviser_tj_img" src="http://o6yahvsqr.bkt.clouddn.com/detail/20161222181557838985.jpg?crop/113x113">
            <p class="a_name">张三丰</p>
            <p class="tj_introduction">在线咨询<img src="images/qq/qq.gif"></p>
        </div>
        <div class="adviser_tj">
            <img class="adviser_tj_img" src="http://o6yahvsqr.bkt.clouddn.com/detail/20161222181557838985.jpg?crop/113x113">
            <p class="a_name">张三丰</p>
            <p class="tj_introduction">在线咨询<img src="images/qq/qq.gif"></p>
        </div>
        <div class="adviser_tj">
            <img class="adviser_tj_img" src="http://o6yahvsqr.bkt.clouddn.com/detail/20161222181557838985.jpg?crop/113x113">
            <p class="a_name">张三丰</p>
            <p class="tj_introduction">在线咨询<img src="images/qq/qq.gif"></p>
        </div>
        <div class="adviser_tj">
            <img class="adviser_tj_img" src="http://o6yahvsqr.bkt.clouddn.com/detail/20161222181557838985.jpg?crop/113x113">
            <p class="a_name">张三丰</p>
            <p class="tj_introduction">在线咨询<img src="images/qq/qq.gif"></p>
        </div>
        <div class="clear"></div>
    </div>
</div>
<jsp:include page="common/bottom.jsp"></jsp:include>
</body>
</html>
