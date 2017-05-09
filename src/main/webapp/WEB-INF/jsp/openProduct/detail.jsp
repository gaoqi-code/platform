<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/common/global.jsp" %>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>企巴巴-一站式商业服务平台</title>
    <link rel="stylesheet" type="text/css" href="css/base.css">
    <link rel="stylesheet" href="./plugins/layui/css/layui.css"  media="all">
    <link rel="stylesheet" type="text/css" href="css/adviser_tui.css">
    <script type="text/javascript" src="js/jquery-1.9.1.js"></script>
    <style>
        .product_in{margin-bottom: 15px;}
        .pro_img{float: left;}
        .pro_img img{width:430px;}
        .pro_intro{float: left;margin-left:15px;width:725px;}
        .pro_title{height: 30px;line-height: 30px; font: 700 16px Arial,"microsoft yahei";
            color: #666;padding-top: 10px;line-height: 28px;margin-bottom:15px;}
        .pro_title2{color: #e4393c;margin-bottom: 15px;}
        .price_content{margin-bottom: 15px;}
        .pro_price{background-color: #f2f2f2;padding: 10px;}
        .pro_price p{height: 35px;line-height: 35px;}
        .now_price{color: red;font-size: 22px;}
        .pro_type{height: 35px;line-height: 35px;margin-bottom: 15px;}
        .pro_type span{border: 1px solid #ddd;padding:5px;}
        .product_left{width: 255px;margin-right:15px;float: left;}
        .product_right{float: left;width: 910px;}
        .layui-colla-content img{max-width: 880px;}
    </style>
</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>

<div id="container">
    <div class="position2">
        您当前位置：<a href="/index.html">企巴巴</a> &gt;&gt;
        <a href="/product/toSearch.html">产品</a>&gt;&gt;产品详情
    </div>
    <div class="content contentTop">
        <div class="product_in">
            <div class="pro_img"><img src="${product.picture}"></div>
            <div class="pro_intro">
                <div class="pro_title">${product.title}</div>
                <div class="pro_title2">简单介绍商标注册 5000元 一次注册 中间不收取任何费用</div>
                <div class="price_content">
                    <div class="pro_price">
                        <p>市场价：<s>${product.marketPrice}元</s></p>
                        <p>活动价：<span class="now_price">${product.realPrice}元</span></p>
                    </div>
                </div>
                <div class="pro_type">服务类型：<span>${product.className}</span></div>
                <div class="pro_type">在线咨询：<a href="http://wpa.qq.com/msgrd?v=3&amp;uin=2153543428&amp;site=qq&amp;menu=yes"><img
                        src="images/qq/qq.gif" /></a></div>
            </div>
            <div class="clear"></div>
        </div>

        <div class="product_left">

            <jsp:include page="/adviserRecommend/recommend.html">
                <jsp:param value="201" name="plate"/>
                <jsp:param value="1" name="currentPage"/>
                <jsp:param value="3" name="pageSize"/>
            </jsp:include>

        </div>
        <div class="product_right">
            <div class="layui-collapse" lay-accordion="">
                <div class="layui-colla-item">
                    <h2 class="layui-colla-title">产品简介</h2>
                    <div class="layui-colla-content layui-show">
                        <%--<p>在前端技术快速变革的今天，layui 仍然坚持语义化的组织模式，甚至于模块理念都是采用类AMD组织形式，并非是有意与时代背道而驰。layui 认为以jQuery为核心的开发方式还没有到完全消亡的时候，而早期市面上基于jQuery的UI都普通做得差强人意，所以需要有一个新的UI去重新为这一领域注入活力，并采用一些更科学的架构方式。--%>
                            <%--<br>--%>
                            <%--因此准确地说，layui 更多是面向那些追求开发简单的前端工程师们，以及所有层次的服务端程序员。</p>--%>
                        ${product.content}
                    </div>
                </div>
                <%--<div class="layui-colla-item">--%>
                    <%--<h2 class="layui-colla-title">产品服务</h2>--%>
                    <%--<div class="layui-colla-content  layui-show">--%>
                        <%--<p>有不少其他答案说是因为JS太差。我下面的答案已经说了，这不是根本性的原因。但除此之外，我还要纠正一些对JS具体问题的误解。JS当初是被作为脚本语言设计的，所以某些问题并不是JS设计得差或者是JS设计者的失误。比如var的作用域问题，并不是“错误”，而是当时绝大部分脚本语言都是这样的，如perl/php/sh等。模块的问题也是，脚本语言几乎都没有模块/命名空间功能。弱类型、for-in之类的问题也是，只不过现在用那些老的脚本语言的人比较少，所以很多人都误以为是JS才有的坑。另外有人说JS是半残语言，满足不了开发需求，1999年就该死。半残这个嘛，就夸张了。JS虽然有很多问题，但是设计总体还是优秀的。——来自知乎@贺师俊</p>--%>
                    <%--</div>--%>
                <%--</div>--%>
            </div>

        </div>
        <div class="clear"></div>
    </div>
</div>
<jsp:include page="../common/bottom.jsp"></jsp:include>
</body>
</html>