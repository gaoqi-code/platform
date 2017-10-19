<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/common/global.jsp" %>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>${member.companyName}企巴巴-企业顾问</title>
	<link rel="shortcut icon" href="../../../images/icon/qibaba.icon">
    <link rel="stylesheet" type="text/css" href="css/base.css">
    <link rel="stylesheet" href="./plugins/layui/css/layui.css"  media="all">
    <link rel="stylesheet" type="text/css" href="css/tui/adviser_tui.css">
	<link rel="stylesheet" type="text/css" href="css/swiper.min.css">
    <style>
       .module{
				color: #fff;
				height: 300px;
				background: url(../../../images/mudule-bg.jpg) no-repeat ;
				background-size:100%  100%;
			}
			/*左边*/
			.module .module-left{
				float: left;
				width: 500px;
				height: 300px;
			}
			.module .module-left .information{
				width: 500px;
				height: 200px;
				margin: 50px 0;
				border-right: 1px solid #e1e0e0;
			}
			.information .tuxiang-box{
				float: left;
				margin: 0 25px;
				width: 170px;
				height: 170px;
				border-radius: 50%;
				position: relative;
			}
			.information .tuxiang-box>img{
				width: 100%;
				height: 100%;
				border-radius: 50%;
			}
			.information .tuxiang-box p{
				margin-top: 10px;
				text-align: center;
				width: 170px;
				cursor: pointer;
			}
			.information .tuxiang-box p img{
				width: 18px;
				height: 18px;
				border-radius: 0;
				padding-right: 8px;
			}
			   /*二维码*/
			   .information .erwenma {
				   display: none;
				   width: 170px;
				   height: 170px;
				   position: absolute;
				   top: 0px;
			   }
			   .information .erwenma img {
				   width: 100%;
				   height: 100%;
			   }
			.information .xinxi{
				float: left;
				width:280px;
				height: 200px;
			}
			.information .xinxi h1{
				font-size: 22px;
				padding-bottom: 10px;
			}
			
			.information .xinxi p{
				line-height: 30px;
			}
			.information .xinxi h1 span{
				text-align: center;
				color: #2486B5;
				background: #fff;
				display: inline-block;
				width: 80px;
				height: 16px;
				line-height: 16px;
				border-radius: 25px;
				position:relative;
				top: -3px;
			}
			.information .xinxi h1 span img{
				width: 12px;
				height: 12px;
				position: relative;
				top: -1px;
			}
			.information .xinxi .p1{
				margin-top: 40px ;
				height: 50px;
			}
			.information .xinxi p a{
				color: #fff;
				display: inline-block;
				margin-left: 10px;
				text-align: center;
				width: 100px;
				height: 30px;
				line-height: 30px;
				border: 1px solid  #fff ;
				border-radius: 3px;
				position: relative;
				top: -4px;
				border-radius: 3px;
			}

	   /*新加的样式*/

	   .module .module-center {
		   float: left;
		   width: 280px;
		   height: 300px;
		   margin-left: 20px;
	   }

	   .module .module-center .score {
		   padding: 0 30px;
		   width: 240px;
		   height: 230px;
		   margin-top: 70px;
	   }

	   .module .layui-form-label {
		   float: left;
		   display: block;
		   padding: 5px 15px;
		   width: 50px;
		   font-weight: 400;
		   text-align: right;
	   }

	   .module .layui-input,
	   .layui-select,
	   .layui-textarea {
		   color: #FFF;
		   height: 30px;
		   line-height: 30px;
		   border: 1px solid #e6e6e6;
		   background: 0;
		   border-radius: 2px;
	   }

	   .module .layui-form-item .layui-input-inline {
		   float: left;
		   width: 150px;
		   margin-right: 10px;
	   }

	   .module .layui-form-item {
		   margin-bottom: 0;
		   clear: both;
	   }

	   .module .layui-textarea {
		   min-height: 120px;
		   height: auto;
		   padding: 3px 10px;
		   resize: vertical;
	   }

	   .module .layui-input-block {
		   margin-left: 80px;
		   min-height: 36px;
	   }

	   .module .service .layui-form-label {
		   float: left;
		   display: block;
		   padding: 8px 15px;
		   width: 45px;
		   font-weight: 400;
		   text-align: right;
	   }

	   .liuyan-btn {
		   width: 300px;
		   height: 40px;
		   margin-left: -118px;
	   }

	   .liuyan-btn .layui-btn {
		   display: inline-block;
		   height: 35px;
		   line-height: 35px;
		   padding: 0 40px;
		   background-color: #004b92;
		   color: #fff;
		   white-space: nowrap;
		   text-align: center;
		   font-size: 14px;
		   border: none;
		   border-radius: 2px;
		   cursor: pointer;
		   opacity: .9;
		   filter: alpha(opacity=90);
	   }
	   .module .module-right {
		   float: left;
		   width: 290px;
		   height: 300px;
	   }

	   .module .module-right .service {
		   height: 150px;
		   margin-top: 70px;
	   }

	   .module .module-right .service h1 {
		   padding-left: 10px;
		   margin-top: 10px;
		   margin-bottom: 20px;
		   line-height: 16px;
		   border-left: 2px solid red;
	   }

	   .module .module-right .service input {
		   color: #fff;
		   padding-left: 15px;
		   margin: 20px 0;
		   border: 1px solid #fff;
		   border-radius: 3px;
		   background: 0;
		   height: 35px;
		   width: 180px;
	   }

	   .module .module-right .service input:hover {
		   border: 1px solid #888;
	   }

	   .module .module-right .service button {
		   color: #333333;
		   height: 35px;
		   width: 197px;
		   border-radius: 3px;
		   background: #fff;
		   margin-bottom: 20px;
	   }

	   .list1 .swiper-container {
		   width: 100%;
		   height: 100%;
	   }

	   .list1 .swiper-slide {
		   text-align: center;
		   font-size: 18px;
		   background: #fff;
		   /* Center slide text vertically */
		   display: -webkit-box;
		   display: -ms-flexbox;
		   display: -webkit-flex;
		   display: flex;
		   -webkit-box-pack: center;
		   -ms-flex-pack: center;
		   -webkit-justify-content: center;
		   justify-content: center;
		   -webkit-box-align: center;
		   -ms-flex-align: center;
		   -webkit-align-items: center;
		   align-items: center;
	   }
	   /*完*/
			.title{
				margin: 30px 0;
				text-align: center;
				height: 70px;
			}
			.title h1{
				font-size: 20px;
				margin: 20px 0;
			}
			.title p{
				padding-top: 8px;
				margin: 0 auto;
				width: 300px;
			}
			.title p:nth-of-type(1){
				border-top: 1px dashed red;
			}
			.title p:nth-of-type(2){
				border-top: 1px solid red;
			}
			/*列表*/
			.list3{
				padding: 0  50px;
				min-height: 280px;
				max-height: 900px;
				margin-bottom: 50px;
				margin-top: 50px;
				overflow: hidden;
			}
			.list3 ul{
				height: 280px;
				max-height: 900px;
				margin-bottom: 20px;
			}
			.list3 ul li{
				text-align: center;
				float: left;
				width: 225px;
				height: 280px;
				margin: 10px 20px;
				border: 1px solid #CCCCCC;
			}
			.list3 ul li:hover{
				box-shadow: rgb(153,153,153) 3px 3px 15px;
			}
			.list3 ul li .img-box{
				margin: 0 auto;
				margin-top: 25px;
			    margin-bottom: 34px;
				width: 100px;
				height:100px;
				border-radius: 50%;
			}
			.list3 ul li .img-box img{
				width: 100%;
				height: 100%;
				border-radius: 50%;
			}
			.list3 ul li .title{
				margin: 10px 0;
				text-align: center;
				height: 20px;
			}
			.list3 ul li p{
				margin: 10px 0;
			}
			.list3 ul li p:nth-of-type(2){
				color: #888;
				font-size: 12px;
			}
			.list3 ul li p:nth-of-type(3){
				color: red;
				margin-top: 30px;
			}
			/*背景图片*/
	   .bg-tupian {
		   height: 400px;
		   background-size: 100% 100%;
	   }

	   .bg-tupian img {
		   width: 100%;
		   height: 100%;
	   }

	   .bg-tupian .inbg {
		   margin: 0 auto;
		   width: 80%;
		   height: 300px;
	   }

	   .bg-tupian .inbg .yin-top {
		   height: 50px;
	   }

	   .bg-tupian .inbg .yin-center {
		   height: 190px;
	   }
	   .bg-tupian .inbg .yin-center .img-box {
		   float: left;
		   width: 130px;
		   height: 130px;
		   border: 1px solid red;
		   border-radius: 50%;
		   position: relative;
		   margin: 30px 80px;
	   }
	   .bg-tupian .inbg .yin-center .img-box img {
		   width: 100%;
		   height: 100%;
		   border-radius: 50%;
		   position: absolute;
		   top: 15px;
		   left: 15px;
	   }
	   .bg-tupian .inbg .yin-center p {
		   margin-top: 60px;
		   color: #000;
		   float: left;
		   width: 590px;
		   height: 100px;
		   line-height: 25px;
	   }
	   .bg-tupian .inbg .yin-center p span {
		   display: block;
		   text-align: right;
	   }
	   .bg-tupian .inbg .yin-bottom {
		   height: 50px;
	   }
			/*第二个列表*/
			.list1{
				padding: 0  50px;
				height: 252px;
				margin-bottom: 50px;
				position: relative;
			}
			.list1 ul li{
				text-align: center;
				float: left;
				width: 225px;
				height: 250px;
				position: relative;
			}
			.list1 ul li .img-box{
				margin: 0 auto;
				margin-top: 25px;
				margin-bottom: 10px;
				width: 100px;
				height:100px;
				border-radius: 50%;
			}
			.list1 ul li .img-box img{
				width: 100%;
				height: 100%;
				border-radius: 50%;
				position: relative;
			}
			/*.list1 ul li .img-box img:hover{
				box-shadow: rgb(153,153,153) 5px 5px 5px;
			}*/
			.list1 ul li p{
				color: #888;
				margin: 8px 0;
			}
			.list1 ul li p:nth-of-type(1){
				color: #000;
				font-size: 14px;
			}
			.list1 ul li p a{
				color: #888;
			}
			.list1 ul li p a:hover{
				color: #000;
			}
			/*在线咨询*/
			.consulting{
				height: 530px;
			    padding-top: 1px;
				 background:url(../../../images/on-bg_02.jpg);
			}
			.consulting .online{
				height: 330px;
			}
			.consulting .online .online-left{
				float: left;
				width: 650px;
				height: 100%;
			}
			.consulting .online .online-right{
				padding-top: 40px;
				padding-left: 40px;
				float: left;
				width: 485px;
				height: 290px;
				background: #fff;
				position: relative;
			}
			.online-right .layui-input-inline{
				width: 280px;
			}
			.online-right .layui-textarea {
				width: 280px;
				max-height: 160px;
			    padding: 10px 10px;
			    resize: vertical;
			}
			.online-right .btn{
				position: absolute;
				right: 95px;
			}
			.online-right .btn .layui-btn{
			    height: 30px;
				line-height: 30px;
			    background-color: #2486b5;
			}
			/*我们的优势*/
			.list2{
				height: 222px;
				margin-bottom: 50px;
			}
			.list2 ul li{
				float: left;
			    width: 192px;
				height: 220px;
				text-align: center;
				margin: 0 20px;
				background: #f9f9f9;
				border-bottom: 2px solid red;
			}
			.list2 ul li .img-box{
				width: 50px;
				height: 60px;
				margin: 0 auto;
				margin-top: 65px;
			}
			.list2 ul li .img-box img{
				width: 100%;
				height: 100%;
			}
			.list2 ul li p{
				padding-top: 45px;
				font-size: 16px;
				font-weight: bold;
			}
    </style>
</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>

		<div id="container">
			<div class="position2">
       		 您当前位置：<a href="/index.html">企巴巴</a> &gt;&gt;
        				<a href="/adviser/toSearch.html">企业顾问</a>&gt;&gt;我的店铺
  		  </div>
			<div class="module">
				<div class="content">
					<div class="module-left">
						<div class="information">
							<div class="tuxiang-box">
								<img src="${member.headPortrait == null?'/images/portrait.jpg':member.headPortrait}"/>
								<p><span><img src="images/erweima_03.png"/></span>请扫二维码</p>
								<div class="erwenma">
									<img src="images/erwenma.jpg"/>
								</div>
							</div>
							<div class="xinxi">
								<h1>${member.name}
								<span class="c-post" style="font-size: 12px;">
									<img src="../../../images/icon/pingtai_03.png"/>
			                        ${member.categoryName}
			                    </span>
								</h1>
								<p>
								 <c:choose>
		                          <c:when test="${member.level==1}">
		                              普通顾问
		                          </c:when>
		                          <c:when test="${member.level==2}">
		                              高级顾问
		                          </c:when>
		                          <c:otherwise>
		                              顾问
		                          </c:otherwise>
		                      </c:choose>
								</p>
								<p>服务区域：<span>${member.areaFullName}-${member.address}</span></p>
								<p>职业经验：<span>${member.workAge}年</span></p>
								<p class="p1"><span style="font-size: 22px;">${member.mobile}</span> <a href="http://wpa.qq.com/msgrd?v=3&amp;uin=${member.qq}&amp;site=qq&amp;menu=yes" target="_blank"><img src="images/phone.png" style="width: 13px; height: 13px;padding-right: 8px;"/>咨询他</a></p>
							</div>
						</div>
					</div>
					<div class="module-center">
						<div class="score">
							<div class="layui-form-item">
								<label class="layui-form-label">电话</label>
								<div class="layui-input-inline">
									<input type="input" lay-verify="required" name="name" value="" placeholder="输入你的电话" autocomplete="off" class="layui-input">
								</div>
								<div class="layui-form-mid layui-word-aux"></div>
							</div>
							<!--公司名称-->
							<div class="layui-form-item">
								<label class="layui-form-label">公司名称</label>
								<div class="layui-input-inline">
									<input type="input" lay-verify="required" name="name" value="" placeholder="输入你的电话" autocomplete="off" class="layui-input">
								</div>
								<div class="layui-form-mid layui-word-aux"></div>
							</div>
							<!--你的邮箱-->
							<div class="layui-form-item">
								<label class="layui-form-label">联系邮箱</label>
								<div class="layui-input-inline">
									<input type="input" lay-verify="required" name="name" value="" placeholder="输入你的电话" autocomplete="off" class="layui-input">
								</div>
								<div class="layui-form-mid layui-word-aux"></div>
							</div>
						</div>
					</div>
					<div class="module-right">
						<div class="service">
							<!--<h1>免费咨询电话</h1>
							<p>一对一专属服务，解决您所有疑问</p>
							<p><input type="text" placeholder="输入您的电话"/></p>
							<p><button>提交</button></p>
							<p><span style="color: red;">10</span>分钟内专业顾问响应您</p>-->
							<div class="layui-form-item layui-form-text">
								<label class="layui-form-label">留言</label>
								<div class="layui-input-block">
									<textarea placeholder="请输入内容" lay-verify="required" name="description" class="layui-textarea"></textarea>
								</div>
							</div>
						</div>
						<div class="liuyan-btn">
							<div class="layui-form-item">
								<div class="layui-input-block">
									<button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="content">
				<div class="title">
					<h1>我的服务</h1>
					<p></p>
					<p></p>
				</div>
			<div class="list3">
				<ul>
					<!--<li>
						<div class="img-box">
							<img src="images/taocan1.jpg"/>
						</div>
						<p>公司注册（创业版）</p>
						<p>原价：<span style=" text-decoration:line-through;">￥5000</span>&nbsp;立省：<span>￥2100</span></p>
						<p>套餐价：<span>￥2899</span></p>
					</li>-->
                        <c:forEach items="${products}" var="product">
                            <li>
								<div class="img-box">
									<img src="${product.picture}"/>
								</div>
                                <h4 class="title"><a _stat_click_id="9_13134" href="product/detail/${product.id}.html" target="_blank">${product.title}</a></h4>
                                <p class="intro">${product.summary}</p>
                                <%--<div class="record">--%>
                                    <%--<span class="deal">销量&nbsp;690</span>--%>
                                    <%--<span class="consult">咨询量&nbsp;118</span>--%>
                                <%--</div>--%>
                                <div class="price-box">
                                        <%--<p class="mod-red-redeem">可抵64.9元</p>--%>
                                    <p class="price" style="color: red; font-size: 14px;">
                                        <c:if test="${product.marketPrice==null}">
                                            面议
                                        </c:if>
                                        <c:if test="${product.marketPrice!=null}">
                                            ${product.marketPrice}
                                        </c:if>
                                    </p>
                                </div>
                                <a href="product/detail/${product.id}.html" _stat_click_id="9_13134" target="_blank" class="ui-button ui-button-sm ui-button-suc">查看详情</a>
                            </li>
                        </c:forEach>
					<!--<li>
						<div class="img-box">
							<img src="images/tancan2.jpg"/>
						</div>
						<p>公司注册（创业版）</p>
						<p>原价：<span style=" text-decoration:line-through;">￥5000</span>&nbsp;立省：<span>￥2100</span></p>
						<p>套餐价：<span>￥2899</span></p>
					</li>-->
				</ul>
			</div>
				<div class="title">
					<h1>成功案例</h1>
					<p></p>
					<p></p>
				</div>
				<div class="list1">
					<div class="swiper-container">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<ul>
									<li>
										<div class="img-box">
											<img src="images/gouwen_03.png" />
										</div>
										<p>李女士</p>
										<p>成交金额：￥3000</p>
										<p>成交时间：2017/07/01</p>
									</li>
									<li>
										<div class="img-box">
											<img src="images/gouwen_03.png" />
										</div>
										<p>李女士</p>
										<p>成交金额：￥3000</p>
										<p>成交时间：2017/07/01</p>
									</li>
									<li>
										<div class="img-box">
											<img src="images/gouwen_03.png" />
										</div>
										<p>李女士</p>
										<p>成交金额：￥3000</p>
										<p>成交时间：2017/07/01</p>
									</li>
									<li>
										<div class="img-box">
											<img src="images/gouwen_03.png" />
										</div>
										<p>李女士</p>
										<p>成交金额：￥3000</p>
										<p>成交时间：2017/07/01</p>
									</li>
								</ul>
							</div>
							<div class="swiper-slide">
								<ul>
									<li>
										<div class="img-box">
											<img src="images/gouwen_03.png" />
										</div>
										<p>李女士</p>
										<p>成交金额：￥3000</p>
										<p>成交时间：2017/07/01</p>
									</li>
									<li>
										<div class="img-box">
											<img src="images/gouwen_03.png" />
										</div>
										<p>李女士</p>
										<p>成交金额：￥3000</p>
										<p>成交时间：2017/07/01</p>
									</li>
									<li>
										<div class="img-box">
											<img src="images/gouwen_03.png" />
										</div>
										<p>李女士</p>
										<p>成交金额：￥3000</p>
										<p>成交时间：2017/07/01</p>
									</li>
									<li>
										<div class="img-box">
											<img src="images/gouwen_03.png" />
										</div>
										<p>李女士</p>
										<p>成交金额：￥3000</p>
										<p>成交时间：2017/07/01</p>
									</li>
								</ul>
							</div>
						</div>
						<!-- Add Pagination -->
						<!--<div class="swiper-pagination"></div>-->
						<!-- Add Arrows -->
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
					</div>
				</div>
			<div class="content">
				<div class="bg-tupian">
						<div class="title">
							<h1>顾问简介</h1>
							<p></p>
							<p></p>
						</div>
						<div class="inbg">
							<!--<div class="yin-top">
                            </div>-->
							<div class="yin-center">
								<div class="img-box">
									<img src="images/xiaoli_04.jpg" style="width: 100px; height: 100px;" />
								</div>
								<div>
									<p>
										企巴巴给了我们很大的帮助，帮我们注册了商标，也为我们理顺股权结构提供了专业的法律服务，更值得感谢的是还为我们进行了推广。企巴巴公司你们真得很棒，希望你们发展的更好！
										<span>——李雪雪 "企巴巴" 高级顾问</span>
									</p>
								</div>

							</div>
							<div class="yin-bottom">
							</div>
						</div>
				</div>
			</div>
			<div class="content">
					<div class="title">
						<h1>我们的优势</h1>
						<p></p>
						<p></p>
					</div>
					<div class="list2">
						<ul>
							<li>
								<div class="img-box">
									<img src="images/list1.png"/>
								</div>
								<p>安全保障</p>
							</li>
							<li>
								<div class="img-box">
									<img src="images/list2.jpg"/>
								</div>
								<p>海量资源</p>
							</li>
							<li>
								<div class="img-box">
									<img src="images/list3.jpg"/>
								</div>
								<p>快速交易</p>
							</li>
							<li>
								<div class="img-box">
									<img src="images/list4.jpg"/>
								</div>
								<p>增值服务</p>
							</li>
							<li>
								<div class="img-box">
									<img src="images/list5.png" style="width: 55px;"/>
								</div>
								<p>交易透明</p>
							</li>
						</ul>
					</div>
			</div>
		</div>
			<div class="clear"></div>


<!--<div id="container">
    <div class="position2">
        您当前位置：<a href="/index.html">企巴巴</a> &gt;&gt;
        <a href="/adviser/toSearch.html">企业顾问</a>&gt;&gt;我的店铺
    </div>
    <div class="counselor-head-update content">
        <div class="content head-update-box">
            <div class="head-left-content">
            <div class="head-update-left" >
                <div class="head-update-img">
                    <img src="${member.headPortrait == null?'/images/portrait.jpg':member.headPortrait}">
                </div>
                <div class="head-update-ewm">
                    <i></i>
                    <%--<p>扫一扫 手机访问</p>--%>
                    <div class="ewm">
                        <div id="codeAdviser"></div>
                        <i></i>
                    </div>
                </div>
            </div>
            <div class="head-update-middle">
                <div class="til">
                    <span class="c-name">${member.name}</span>
                    <span class="c-post">
                        ${member.categoryName}
                    </span>
                </div>
                <div class="sub-til">
                    <span>
                      <c:choose>
                          <c:when test="${member.level==1}">
                              普通顾问
                          </c:when>
                          <c:when test="${member.level==2}">
                              高级顾问
                          </c:when>
                          <c:otherwise>
                              顾问
                          </c:otherwise>
                      </c:choose>
                    </span>
                </div>
                <div class="sub-til">
                    <span>所在地区：${member.areaFullName}-${member.address}</span>
                </div>
                <div class="sub-til">
                    <span>职业经验：${member.workAge}年</span>
                </div>
                <%--<div class="sub-til">--%>
                    <%--<span>在线咨询：<a href="http://wpa.qq.com/msgrd?v=3&amp;uin=${member.qq}&amp;site=qq&amp;menu=yes" target="_blank" ><img src="images/qq/qq.gif" /></a></span>--%>
                <%--</div>--%>
                <div class="sub-til">
                    <span style="font-size: 22px;">${member.mobile}</span>
                </div>

            </div>

            </div>

            <div class="head-update-right">
                <%--<p class="tel-num"><i></i>13540250791</p>--%>
                <%--<a href="javascript:void(0)" class="btn-free" onclick="freephone('http://o6yahvsqr.bkt.clouddn.com/detail/20160812184829965595.jpg','117','李婷婷')">免费电话</a>--%>
                <a href="javascript:openlive800()" class="btn-online">在线咨询</a>
            </div>

        </div>
        <div class="clear"></div>
        <jsp:include page="../openNeed/adviser_need_form.jsp">
            <jsp:param value="103" name="dataSource"/>
        </jsp:include>

    </div>
<div class="content"><img src="/images/adviser/xie.jpg" style="margin-left: 484px;"></div>
    <div class="content">
        <div class="personImg">
            <img src="/images/adviser/personImg.jpg">
        </div>
        <div class="personIntro">
            <span>${member.description}</span>
        </div>
    </div>


    <div class="content contentTop">
        <div class="layui-collapse" lay-accordion="">
            <div class="layui-colla-item">
                <h2 class="layui-colla-title">提供的服务</h2>
                <div class="layui-colla-content  layui-show">



                    <div class="provider-index-wrap jmod-tabcontent-wrap0">
                        <div class="provider-index-box service-list-box">
                            <div class="layout">
                                <%--<div class="mod-head mod-head-small jmod-hot-sku-header">--%>
                                <%--<h3 class="mod-title">热销服务</h3>--%>
                                <%--<a href="/seller/corpinfo?c_id=10021&amp;tab=2" _stat_click_id="9_100" class="more">更多服务</a>--%>
                                <%--</div>--%>
                                <div class="service-list">
                                    <ul class="jmod-hot-skus">
                                        <c:forEach items="${products}" var="product">
                                            <li class="item">

                                                <h4 class="title"><a _stat_click_id="9_13134" href="product/detail/${product.id}.html" target="_blank">${product.title}</a></h4>
                                                <p class="intro">${product.summary}</p>
                                                <%--<div class="record">--%>
                                                    <%--<span class="deal">销量&nbsp;690</span>--%>
                                                    <%--<span class="consult">咨询量&nbsp;118</span>--%>
                                                <%--</div>--%>
                                                <div class="price-box">
                                                        <%--<p class="mod-red-redeem">可抵64.9元</p>--%>
                                                    <p class="price">
                                                        <c:if test="${product.marketPrice==null}">
                                                            面议
                                                        </c:if>
                                                        <c:if test="${product.marketPrice!=null}">
                                                            ¥${product.marketPrice}
                                                        </c:if>
                                                    </p>
                                                </div>
                                                <a href="product/detail/${product.id}.html" _stat_click_id="9_13134" target="_blank" class="ui-button ui-button-sm ui-button-suc">查看详情</a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>



                </div>
            </div>
        </div>
        <div class="clear"></div>
    </div>

    <div class="border-line content"></div>
    <div class="content" style="background-color:#80b9d4; height: 450px;">
        <div class="zxzx">
            <img src="/images/adviser/zxzx.jpg">
        </div>
        <div class="zxzx_need">
            <form class="layui-form order-form" id="form2" action="" style="border: none;">
                <input type="hidden" value="102" name="dataSource">
                <div class="layui-form-item temp-layui-form-item">
                    <label class="layui-form-label temp-layui-form-label">姓&nbsp;&nbsp;&nbsp;&nbsp;名:</label>
                    <div class="layui-input-block tempWidth">
                        <input type="text" name="userName" lay-verify="userName" autocomplete="off" placeholder="" class="layui-input tempInput">
                    </div>
                </div>
                <div class="layui-form-item temp-layui-form-item">
                    <label class="layui-form-label temp-layui-form-label">Q&nbsp;&nbsp;&nbsp;&nbsp;Q:</label>
                    <div class="layui-input-block tempWidth">
                        <input type="text" name="qq" lay-verify="qq" autocomplete="off" placeholder="" class="layui-input tempInput">
                    </div>
                </div>
                <div class="layui-form-item temp-layui-form-item">
                    <label class="layui-form-label temp-layui-form-label">手机号码:</label>
                    <div class="layui-input-block tempWidth">
                        <input type="text" name="mobile" lay-verify="phone" autocomplete="off" class="layui-input tempInput">
                    </div>
                </div>
                <div class="layui-form-item temp-layui-form-item">
                    <label class="layui-form-label temp-layui-form-label">电子邮件:</label>
                    <div class="layui-input-block tempWidth">
                        <input type="text" name="mail" lay-verify="mail" autocomplete="off" placeholder="" class="layui-input tempInput">
                    </div>
                </div>
                <div class="layui-form-item temp-layui-form-item">
                    <label class="layui-form-label temp-layui-form-label">留言主题:</label>
                    <div class="layui-input-block tempWidth">
                        <input type="text" name="needTitle" lay-verify="needTitle" autocomplete="off" placeholder="" class="layui-input tempInput">
                    </div>
                </div>
                <div class="layui-form-item layui-form-text temp-layui-form-item" style="border-bottom: 1px solid #ddd;">
                    <label class="layui-form-label temp-layui-form-label">留言内容:</label>
                    <div class="layui-input-block tempWidth">
                        <textarea name="needDesc" lay-verify="n_needContent" class="layui-textarea tempInput"></textarea>
                    </div>
                    <button lay-submit="" style="float: right;    font-size: 16px;padding: 7px;margin-right: 10px;    background: transparent;    color: #FFF;" lay-filter="demo2">提交</button>
                </div>
            </form>
        </div>
    </div>

    <div class="border-line content"></div>-->

        <!--<jsp:include page="/adviserRecommend/recommendWithDetail.html">
            <jsp:param value="201" name="plate"/>
            <jsp:param value="1" name="currentPage"/>
            <jsp:param value="3" name="pageSize"/>
        </jsp:include>-->

</div>
<jsp:include page="../common/bottom.jsp"></jsp:include>
<%--<script src="./plugins/layui/layui.js" charset="utf-8"></script>--%>
<script>
    layui.use(['form'], function(){
        var form = layui.form()
                ,layer = layui.layer;

        //自定义验证规则
        form.verify({
            mobile: function(value){
                if(value.length < 5){
                    return '请输入正确的手机号';
                }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });

        //监听提交
        form.on('submit(demo2)', function(data){
            if((new Date().getTime())-cureentTime<4000){
                return false;
            }
            cureentTime = new Date().getTime();
            $.ajax({
                type: "POST",
                url: "/need/liuyan.json",
                data: $("#form2").serialize(),
                dataType: "json",
                async:false,
                success: function (data) {
                    if (data) {
                        layer.alert("您的需求已提交，我们会尽快与您联系。", {
                            title: '信息'
                        });
                        $(':input','#userNeedForm').val('');
                    } else {
                        layer.msg("发布失败！");
                    }
                }
            });
            return false;
        });

    });
</script>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/swiper.jquery.min.js"></script>
<script>
    var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        paginationClickable: true,
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        spaceBetween: 30
    });
    //扫描二维码
    $(".information .tuxiang-box").find("p").mouseenter(function() {
        $(".information").find(".erwenma").fadeIn(200);
    });
    $(".information .tuxiang-box").find("p").mouseleave(function() {
        $(".information").find(".erwenma").fadeOut(200);
    });
</script>
</body>
</html>