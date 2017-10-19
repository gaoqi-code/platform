<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/common/global.jsp" %>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>企巴巴-产品详情</title>
	<link rel="shortcut icon" href="../../../images/icon/qibaba.icon">
    <link rel="stylesheet" type="text/css" href="css/base.css">
    <link rel="stylesheet" href="./plugins/layui/css/layui.css"  media="all">
    <link rel="stylesheet" type="text/css" href="css/adviser_tui.css">
    <script type="text/javascript" src="js/jquery-1.9.1.js"></script>
    <style>
        /*.product_in{margin-bottom: 15px;}
        .pro_img{float: left;}
        .pro_img img{width:300px;}
        .pro_intro{float: left;margin-left:50px;width:725px;}
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
        .product_right{float: left;width:1180px;}
        .layui-colla-content img{max-width: 1148px;}*/
					.product{
				width: 1180px;
				height: 450px;
				background: url(../../../images/service-detail-banner-bg.png);
				background-size: 100% 100% ;
			}
			.product-left{
				float: left;
				padding: 20px 30px;
				width: 500px;
				height: 410px;
				border: 1px solid #DEDEDE;
				border-left: 0;
			}
			.product-left h1{
				margin-bottom: 50px;
				font-size: 24px;
			}
			.product-left .jiage{
				width: 500px;
				height: 80px;
				/*background: #f9f8f8;*/
				background: url(../../../images/sprite-f51ed544ac.sku.detail.png) no-repeat;
			}
			.product-left .jiage p{
				margin-left: 20px;
				height: 40px;
				line-height: 40px;
			}
			.product-left .jiage p>span{
				color: #ef6512;
				padding-left: 20px;
			}
			.product-left .jiage p a{
				color: #ef6512;
			}
			.product-left .jiage p a:hover{
				color: red;
			}
			.product-left .diqu{
				line-height: 100px;
				height: 50px;
			}
			.product-left .diqu p{
				width: 250px;
				float: left;
			}
			.product-left .diqu p span{
				padding: 8px 20px;
				border: 1px solid #1cbcb4;
			}
			.product-left .diqu select{
				margin-left: 10px;
				padding-left: 8px;
				min-width: 80px;
				height: 34px;
			}
			.product-left .btn button{
				color: #FFF;
				padding: 14px 30px;
				border-radius: 3px;
				background: #1cbcb4;
			}
			.product-left .btn button:active{
				opacity: .9;
			}
			.product-left .p1{
			    height: 100px;
    			line-height: 100px;
			}
			.product-right1{
				float: left;
				width: 325px;
				height: 450px;
				border: 1px solid #DEDEDE;
				border-left: 0;
			}
			.product-right1 .kuaifawu{
				padding: 20px 0;
				height: 150px;
				margin: 0 30px ;
				border-bottom: 1px dashed #ccc;
			}
			.product-right1 .kuaifawu .img-box{
				width: 100px;
				height: 100px;
			}
			.product-right1 .kuaifawu .img1{
				width: 100px;
				float: left;
				height: 160px;
			}	
			.product-right1 .kuaifawu .img-box img{
				width: 100%;
				height: 100%;
			}
			.product-right1 .kuaifawu h2,.product-right1 .kuaifawu p{
				width: 140px;
				float: left;
				margin: 10px 0 5px 20px;
				font-size: 18px;
			}
			.product-right1 .kuaifawu p{
				font-size: 12px;
			}
			.product-right1 .kuaifawu p button{
				color: #1cbcb4;
				padding: 8px 14px;
				background: 0;
				border: 1px solid #1cbcb4;
				border-radius: 5px;
			}
			.product-right1 .kuaifawu p button:hover{
				color: #fff;
				background: #1cbcb4;
			}
			.product-right1 .list-u{
				height: 75px;
				margin: 0 30px;
			}
			.product-right1 .list-u ul li{
				margin-top: 10px;
				font-size: 14px;
				line-height: 25px;
				height: 50px;
				text-align: center;
				width: 86px;
				float: left;
				border-right: 1px solid #ccc;
			}
			.product-right1 .list-u ul li p:nth-of-type(2){
				color: #ef6512;
			}
			.product-right1 .list-u ul li:nth-of-type(3){
				border-right: 0px ;
			}
			.product-right1 .tab{
				/*padding: 0 30px;*/
			}
			.product-right1 .tab ul {
				height: 40px;
				border-top: 1px solid #CCCCCC;
			}
			.product-right1 .tab ul li{
				float: left;
				width: 107px;
				height: 40px;
				border-right: 1px solid #CCCCCC;
				border-bottom: 1px solid #CCCCCC;
				line-height: 40px;		
				text-align: center;	
				background: #f1f1f1;
				position: relative;
			}
			.product-right1 .tab ul li:nth-of-type(3){
				width: 109px;
				border-right: 0;
			}
			.product-right1 .tab ul li div{
				display: none;
				line-height: 24px;
				padding: 20px 30px;
				width: 264px;
				height: 20px;
				text-align: left;
				text-indent: 1em;
				position: absolute;
			}
			.product-right1 .tab ul li:nth-of-type(1) div{
				top: 45px;	
			}
			.product-right1 .tab ul li:nth-of-type(2) div{
				top: 45px;
				left: -108px;	
			}
			.product-center{
				float: left;
				width: 290px;
				height: 450px;
				border: 1px solid #ccc;
				border-right: 0;
			}
			.product-img{
				width: 100%;
				height: 250px;
				margin-top: 30px;
			}
			.product-img img{
				width: 100%;
				height: 100%;
			}
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
            <!--<div class="pro_img"><img src="${product.picture}"></div>
            <div class="pro_intro">
                <div class="pro_title">${product.title}</div>
                <div class="pro_title2">${product.summary}</div>
                <div class="price_content">
                    <div class="pro_price" style="background-color:#75cdf1;width: 800px">
                     <%--   <p>市场价：<s>${product.marketPrice}元</s></p>--%>
                        <p style="background-color:#75cdf1">服务价钱：<span class="now_price"> <c:if test="${product.realPrice==0}">面议</c:if> <c:if test="${product.realPrice==null}">面议</c:if> <c:if test="${product.realPrice!=0&&product.realPrice!=null}">${product.realPrice}元</c:if> </span></p>
                    </div>
                </div>
                <div class="pro_type">服务类型：<span>${product.className}</span></div>
               <%-- <div class="pro_type">在线咨询：<a href="http://wpa.qq.com/msgrd?v=3&amp;uin=2153543428&amp;site=qq&amp;menu=yes"><img
                        src="images/qq/qq.gif" /></a></div>--%>
                <div> <button style="width: 80px;height: 40px;background-color: #ec5b56"> <a target="_blank" href="/adviser/detail/${product.memberId}.html" rel="nofollow" class="mr0">立即注册商标</a></button>
                    <button style="width: 80px;height: 40px;margin-left: 100px;background-color:#2486b5" ><a href="http://sighttp.qq.com/msgrd?v=1&uin=${product.member.qq}&site=在线咨询&menu=yes" target="blank" >立即询价</a></button>
                </div>
            </div>
            <div class="clear"></div>-->
            <div class="product">
            	<div class="product-center">
				<div class="product-img">
				<img src="${product.picture}"/>
			</div>
			</div>
				<div class="product-left">
				<h1>${product.title}</h1>
				<div class="jiage">
					<p>价格<span>￥<span style="font-size: 16px;"> <c:if test="${product.realPrice==0}">面议</c:if> <c:if test="${product.realPrice==null}">面议</c:if> <c:if test="${product.realPrice!=0&&product.realPrice!=null}">${product.realPrice}元</c:if></span></span></p>
					<p>访问店铺<span><img src="images/hongbao.png"/></span><span style="padding-left: 10px;">点击进入店铺</span><a href="/adviser/detail/${product.member.id}.html" style="padding-left: 10px;">点击 >></a></p>
				</div>
				<div class="diqu"></div>
				<div class="btn">
					<a href="http://sighttp.qq.com/msgrd?v=1&uin=${product.member.qq}&site=在线咨询&menu=yes"><button>立即咨询</button></a>
				</div>
				<p class="p1">服务保障<span style="padding-left: 20px;"><img src="images/bao.png" style="width: 18px;height: 18px;position: relative;top: -2px;"/></span> <span>承诺按时按质保证完成</span></p>
			</div>
			<div class="product-right1">
				<div class="kuaifawu">
					<div class="img1">
						<div class="img-box"><img src="images/pinpai.png"/></div>
					</div>
					<h2>${product.member.name}<span style="background: #f9bc01;color: #fff;font-size: 12px; padding: 0 2px;">lv5</span></h2>
					<p>销量 <span>6129</span></p>
					<p>咨询量 <span>10111</span></p>
					<p><a href="http://sighttp.qq.com/msgrd?v=1&uin=${product.member.qq}&site=在线咨询&menu=yes"><button>QQ咨询</button></a></p>
				</div>
				<div class="list-u">
					<ul>
						<li>
							<p>完成质量</p>
							<p>4.7分</p>
						</li>
						<li>
							<p>完成质量</p>
							<p>4.7分</p>					
						</li>
						<li>
							<p>完成质量</p>
							<p>4.7分</p>							
						</li>
					</ul>
				</div>
				<div class="tab">
					<ul>
						<li style="border-bottom: 0; background: #fff;">产品简介
						<div style="display: block;">
								${product.summary}
						</div>
						</li>
						<li>业务介绍
						<div>
								${product.summary}
						</div>
						</li>
						<li></li>
					</ul>
				</div>
			</div>
			</div>
        </div>


        <div class="product_right">
            <div class="layui-collapse" lay-accordion="">
                <div class="layui-colla-item">
                    <h2 class="layui-colla-title">产品简介</h2>
                    <div class="layui-colla-content layui-show" >
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
	<script type="text/javascript">
		$('.tab li').click(function(){
			$(this).css('background','#fff');
			$(this).siblings().css('background','#f1f1f1').css('border-bottom','1px solid #ccc');
			$(this).find('div').show();
			$(this).css('border-bottom','0')
			$(this).siblings().find('div').hide();
		});
	</script>
<jsp:include page="../common/bottom.jsp"></jsp:include>
</body>
</html>