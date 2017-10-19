<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/common/global.jsp" %>
    <title>选择会员类型</title>
    <jsp:include page="../common/css.jsp"></jsp:include>
    <link rel="stylesheet" href="../css/buysell.css">
    <style >
        .type_b_container{background-color: #e7e8eb;margin:20px 0px 0px 0px;padding:30px 0px;}
        .content_{border:1px solid #d9dadc;background-color: #FFF;}
        .h_step{border-bottom: 1px solid #e6e7ea;}
        .h_step li{font-size:16px;float: left;text-align:center;width: 33%;height: 44px;line-height: 44px; background: transparent url(images/icon/bg_process.png) no-repeat 0 0;
            background-position: right;}
        .c_on{background-color: #ee4134!important;background-position:-14px 0px!important;color: #fff;}
        .type_title{padding-left:10px;font-size:20px;height:50px;line-height:50px;border-bottom: 1px solid #e6e7ea;    background-color: #fff;}
        .type_content{padding:100px 0px;width: 616px;margin-left: auto;margin-right: auto;}
        .type_c{float: left;display: inline-block;
            vertical-align: top;
            /*cursor: pointer;*/
            position: relative;
            text-align: left;
            overflow: hidden;
            width: 300px;
            border: 1px solid #e7e7eb;
            background-color: #ffffff;min-height:380px;}
        .type_c:hover{box-shadow: 0 1px 2px 0 rgba(0,0,0,0.1), 0 4px 8px 0 rgba(0,0,0,0.2);}
        .type_select{margin: 30px 20px;font-size:22px;min-height:72px;}
        .line{border-bottom:1px solid #e7e7eb;width: 90%;margin-left: auto;margin-right: auto;}
        .type_c p{margin-top: 5px;font-size: 14px;position: relative;color: #7b7b7b;}
        .bottomCss{margin-top: 0px;}
        .funcLi{margin-top: 10px;margin-left: 20px;min-height: 180px;}
        .funcLi li{line-height: 30px;}
        .tempButton{width: 85%;margin-left: auto;margin-right: auto;display: block;margin-bottom:3px;}
    </style>
</head>
<body>
<jsp:include page="../common/top_c.jsp"></jsp:include>
<div class="type_b_container">
    <div class="content content_">
        <ul class="h_step">
            <li>1 注册会员</li>
            <li class="c_on">2 选择类型</li>
            <li style="background-position: 0px -88px;">3 会员中心</li>
            <div class="clear"></div>
        </ul>
        <div class="type_title">请选择账号类型</div>
        <div class="type_content">
            <div class="type_c">
                <div class="type_select">我要寻求服务<p>海量专业顾问等待为您服务</p></div>
                <div class="line"></div>
                <ul class="funcLi">
                    <li>会员中心主要功能</li>
                    <li>1、完善个人信息</li>
                    <li>2、发布需求，如贷款、法律、工商注册等</li>
                    <li>3、管理需求</li>
                </ul>
                <a href="/member/toMember.html?type=person"><button class="layui-btn tempButton" lay-submit="" lay-filter="demo1">确定</button></a>
            </div>
            <div class="type_c" style="margin-left: 10px;">
                <div class="type_select">我要提供服务
                    <p>审核通过后可为需求方提供服务，如工商服务、法律服务、金融服务等</p>
                </div>
                <div class="line"></div>
                <ul class="funcLi">
                    <li>会员中心主要功能</li>
                    <li>1、完善个人信息</li>
                    <li>2、店铺管理</li>
                    <li>3、产品管理</li>
                    <li>4、发布需求，如贷款、法律、工商注册等</li>
                    <li>5、管理需求</li>
                </ul>
                <a href="/member/toMember.html?type=adviser"><button class="layui-btn tempButton" lay-submit="" lay-filter="demo1">确定</button></a>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
<jsp:include page="../common/bottom.jsp"></jsp:include>
</body>
</html>