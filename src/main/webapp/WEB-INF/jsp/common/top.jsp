<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>企巴巴-用户注册</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <style>
        /*.reg_css{margin-bottom:35px;}*/
        /*.login_title{font-size: 16px;border-bottom: 1px solid #c2c2c2;padding:20px 10px;margin-bottom: 50px;}*/
        /*.login_left{width: 590px;border-right: 1px solid #e5e5e5;float: left;}*/
        /*.login_left_content{width: 440px;}*/
        /*.login_right{text-align: center;}*/
        /*.login_right_company{margin:25px 0px;}*/
        .selectType{color:red;}
        .nav-li1{
			    width: 220px;
			    float: left;
			    position: relative;
			    background-color: #2486b5;
			}
			.nav-li1:hover div.list {
				display: block;
			}
			
			.list {
				display: none;
				width: 220px;
				height: 400px;
				position: relative;
				position: absolute;
				left: 0;
				z-index: 100;
				background: url(../../../images/transparent75.png) repeat;
			}
			#ull>li {
				text-align: left;
				height: 52px;
				line-height: 52px;
				padding-left: 10px;
				cursor: pointer;
			}
			
			#ull>li>span:nth-of-type(1) {
				position: relative;
				top: -1px;
			}
			
			#ull>li>span:nth-of-type(1) img {
				padding-right: 10px;
				width: 20px;
				height: 20px;
			}
			
			#ull>li>span:nth-of-type(2) {
				float: right;
				padding-right: 25px;
			}
			
			#ull>li a:hover {
				color: #000;
			}
			
			#ull>li:hover {
				color: #000;
				background: #fff;
			}
			
			#ull>li div {
				width: 680px;
				height: 398px;
				background: #fff;
				display: none;
				position: absolute;
				top: 2px;
				left: 220px;
				z-index: 5;
			}
			#ull>li div h1 {
				color: #000000;
				font-weight: 600;
				height: 40px;
				line-height: 40px;
				margin-left: 25px;
				border-bottom: 1px dashed #ccc;
			}
			
			#ull>li div ul {
				display: inline-block;
				height: 20px;
				line-height: 25px;
				padding-left: 20px;
			}
			
			#ull>li div ul li {
				height: 20px;
				line-height: 25px;
				float: left;
				padding: 0 8px;
				position: relative;
			}
			#ull>li div ul li a{
				color: #333;
			    display: block;
			    font-weight: 100;
			    text-align: left;
			    font-size: 12px;
			}
			#ull>li div ul li span{
				position: absolute;
				top:-2px;
				left:10px;
			}
			#ull>li div ul li span img{
				width: 12px;
				height: 12px;
			}
			#ull>li div a h1:hover{
				color: #8D8D8D;
			}
			#ull>li div ul li a:hover{
					color: #8D8D8D;
				}
				#ull>li:hover div {
					display: block;
				}
    </style>
</head>
<body>
<div class="top_out">
    <div class="content">
        <div class="top_logo"><a href="index.html">企巴巴</a></div>
        <div class="top_out_right">
            <c:if test="${sessionScope.currentUser.name != null}">
                <div class="top_welcome"><a href="/member/index.html"><span class="userName">${sessionScope.currentUser.name}</span>您好，欢迎来到企巴巴</a></div>
                <div class="top_welcome"><a href="logout.html">退出</a></div>
            </c:if>
            <c:if test="${sessionScope.currentUser.name == null}"><div class="top_reg"><a href="/tologin.html">登录</a><a href="/register/reg/0.html">注册</a></div></c:if>
            <%--<div class="top_tuiguang">网站导航</div>--%>
        </div>
    </div>
</div>

<div class="content top-search">
    <div class="logo-box"><a href="index.html"><img src="/images/logo_h.png"></a></div>
    <div class="search-form">

        <form action="" id="queryType" method="post" class="inlineb" target="_blank">
            <ul class="search-form-tab">
                <li class="active" id="1"><a name="searchType" searchType="1" class="selectType" href="javascript:void(0)">找服务</a><i></i></li>
                <li ><a name="searchType" searchType="2" href="javascript:void(0)">找需求</a><i></i></li>
                <li ><a name="searchType" searchType="3" href="javascript:void(0)">找顾问</a><i></i></li>
            </ul>
            <div class="tabBox">
                <div class="search-form-box">
                    <input type="text" placeholder="请输入关键字查询" id="keyword" name="keyword" value="" maxlength="20">
                    <button type="button" id="topSearch" style="height: 36px;" ><i class="size25 icon1"></i><span class="inline">搜索</span></button>
                </div>
            </div>
        </form>
    </div>
    <div style="clear: both;"></div>
</div>

<div class="nav">
    <div class="content">
        <ul>
            <li class="nav-li1">
                <a href="javascript:void(0);"><i class="size25" style="background-position: -25px 0px;"></i>服务分类</a>
                <div class="nav-l2-container" >
 <!--                   <div class="nav-l2c">
                        <div class="nav-t2">金融服务</div>
                        <div class="nav-c2">
                            <span><a href="/product/detail/22.html">车辆抵押贷款</a></span>
                            <span><a href="/product/detail/23.html">抵押贷款</a></span>
                            <span><a href="/product/detail/20.html">企业贷款</a></span>
                            <span><a href="/product/detail/25.html">小额贷款</a></span>
                            <div class="clear nav-c2-fenge"></div>
                        </div>
                    </div>
                    <div class="nav-l2c">
                        <div class="nav-t2">法律顾问</div>
                        <div class="nav-c2">
                            <span><a href="/product/detail/12.html">企业纠纷代理</a></span>
                            <span><a href="/product/detail/14.html">工资赔偿</a></span>
                            <span><a href="/product/detail/13.html">企业工资代理</a></span>
                            <div class="clear nav-c2-fenge"></div>
                        </div>
                    </div>
                    <div class="nav-l2c">
                        <div class="nav-t2">企业办证</div>
                        <div class="nav-c2">
                            <span><a href="/product/detail/26.html">商标注册</a></span><span><a href="/product/detail/24.html">国内普通商标注册</a></span><span><a href="/product/detail/16.html">公司股权变更</a></span><span><a href="/product/detail/17.html">个人独资企业注册
</a></span>
                            <div class="clear nav-c2-fenge" style="border-bottom: 0px;"></div>
                        </div>
                    </div>-->
                    <div class="content">
									<div class="list" style="display: block;">
										<ul id="ull">
											<li>
												<span><img src="../../../images/gongshang.png"/></span> 工商 商标 专利
												<span><img src="../../../images/side_arrow.png"/></span>
												<div>
													<a href="/adviser/toSearch.html"><h1>公司注册</h1></a>
													<ul>
														<li class="active">
															<span><img src="../../../images/hot.png" alt=""></span>
															<a href="http://www.qibaba.cn/product/productIntroduce/1-52-55.html
">工商注册</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/1-52-56.html
">香港公司注册</a>
														</li>
														<li>
															<span><img src="../../../images/hot.png" alt=""></span>
															<a href="http://www.qibaba.cn/product/productIntroduce/1-52-123.html
">注册咨询</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/1-52-124.html
">工商变更</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/1-52-125.html
">三证合一</a>
														</li>
													</ul>
													<a href="http://www.qibaba.cn/product/productIntroduce/1-126.html"><h1>商标注册</h1></a>
													<ul>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/1-126-132.html">买年费查询</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/1-126-133.html">普通注册</a>
														</li>
														<li>
															<span><img src="../../../images/hot.png" alt=""></span>
															<a href="http://www.qibaba.cn/product/productIntroduce/1-126-134.html">担保注册</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/1-126-135.html">无忧注册</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/1-126-136.html">商标套餐</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/1-126-137.html">驳回复审</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/1-126-138.html">商标购买</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/1-126-139.html">美国注册</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/1-126-140.html">欧盟注册</a>
														</li>
													</ul>
													<a href="http://www.qibaba.cn/product/productIntroduce/1-129.html"><h1>营业执照转让</h1></a>
													<ul>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/1-129-141.html">集团公司</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/1-129-143.html">金融公司</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/1-129-144.html">保险代理</a>
														</li>
														<li>
															<a href="">基金公司</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/1-129-145.html">商业保理</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/1-129-146.html">保险经纪</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/1-129-147.html">融资租赁</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/1-129-148.html">控股公司</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/1-129-149.html">互联网公司</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/1-129-150.html">其他类型</a>
														</li>
													</ul>
													<a href="http://www.qibaba.cn/product/productIntroduce/1-131.html"><h1>许可证审批</h1></a>
														<ul>
															<li>
																<a href="http://www.qibaba.cn/product/productIntroduce/1-131-312.html">食品经营许可证</a>
															</li>
															<li>
																<a href="http://www.qibaba.cn/product/productIntroduce/1-131-313.html">进出口许可证</a>
															</li>
															<li>
																<a href="http://www.qibaba.cn/product/productIntroduce/1-131-314.html">道路运输许可证</a>
															</li>
															<li>
																<a href="http://www.qibaba.cn/product/productIntroduce/1-131-315.html">酒类经营许可证</a>
															</li>
															<li>
																<a href="http://www.qibaba.cn/product/productIntroduce/1-131-316.html">医疗器械许可证</a>
															</li>
														</ul>
												</div>
											</li>
											<li>
												<span><img src="../../../images/jinrong.png"/></span> 金融服务
												<span><img src="../../../images/side_arrow.png"/></span>
												<div>
													<a href="http://www.qibaba.cn/product/productIntroduce/2-204.html"><h1>房产借款</h1></a>
													<ul>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/2-204-209.html">房产抵押贷</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/2-204-210.html">疑难房产抵押贷</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/2-204-211.html">二手房补按揭贷款</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/2-204-212.html">企业房产贷</a>
														</li>
													</ul>
													<a href="http://www.qibaba.cn/product/productIntroduce/2-205.html"><h1>信用借款</h1></a>
													<ul>
														<li>
															<span><img src="../../../images/hot.png" alt=""></span>
															<a href="http://www.qibaba.cn/product/productIntroduce/2-205-213.html">无抵押贷</a>
														</li>
														<li>
															<span><img src="../../../images/hot.png" alt=""></span>
															<a href="http://www.qibaba.cn/product/productIntroduce/2-205-214.html">公积金贷</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/2-205-215.html">保单贷</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/2-205-216.html">月供贷</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/2-205-217.html">放大贷</a>
														</li>
													</ul>
													<a href="http://www.qibaba.cn/product/productIntroduce/2-206.html"><h1>汽车借款</h1></a>
													<ul>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/2-206-218.html">车辆抵押借款</a></li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/2-206-219.html">疑难车质押贷款</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/2-206-220.html">车辆信用贷款</a>
														</li>
													</ul>
													<a href="http://www.qibaba.cn/product/productIntroduce/2-208.html"><h1>投资众筹</h1></a>
													<ul>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/2-208-224.html">餐饮投资</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/2-208-225.html">海外房产投资</a>
														</li>
													</ul>
												</div>
											</li>
											<li>
												<span><img src="../../../images/falv.png"/></span> 法律服务
												<span><img src="../../../images/side_arrow.png"/></span>
												<div>
													<a href="http://www.qibaba.cn/product/productIntroduce/3-80.html"><h1>非诉业务</h1></a>
													<ul>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/3-80-84.html">律师见证</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/3-80-85.html">合同拟定</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/3-80-86.html">合同审核</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/3-80-87.html">新三板上市</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/3-80-88.html">私募积金</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/3-80-89.html">股权协议</a>
														</li>
													</ul>
													<a href="http://www.qibaba.cn/product/productIntroduce/3-81.html"><h1>民事案件</h1></a>
													<ul>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/3-81-100.html">离婚纠纷</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/3-81-101.html">合同纠纷</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/3-81-268.html">民间借贷</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/3-81-98.html">建筑工程纠纷</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/3-81-99.html">交通事故</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/3-81-91.html">工伤事故</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/3-81-92.html">人身损害</a>
														</li>
													</ul>
													<a href="http://www.qibaba.cn/product/productIntroduce/3-82.html"><h1>刑事案件</h1></a>
													<ul>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/3-82-102.html">刑事会见</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/3-82-103.html">刑事辩护</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/3-82-104.html">取保候审</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/3-82-105.html">刑事谅解</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/3-82-106.html">保外就医</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/3-82-269.html">缓刑</a>
														</li>
													</ul>
													<a href="http://www.qibaba.cn/product/productIntroduce/3-83.html"><h1>知识产权</h1></a>
													<ul>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/3-83-107.html">著作权纠纷</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/3-83-108.html">专利纠纷</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/3-83-109.html">商标纠纷</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/3-83-110.html">域名纠纷</a>
														</li>
													</ul>
												</div>
											</li>
											<li>
												<span><img src="../../../images/renshi.png"/></span> 人事服务
												<span><img src="../../../images/side_arrow.png"/></span>
												<div>
													<a href="http://www.qibaba.cn/product/productIntroduce/4-111.html"><h1>社保 个税 保险</h1></a>
													<ul>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/4-111-151.html">社保代缴(社保开户)</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/4-111-152.html">公积金代缴(开户)</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/4-111-153.html">个税代缴</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/4-111-155.html">商业保险</a>
														</li>
													</ul>
													<a href="http://www.qibaba.cn/product/productIntroduce/4-112.html"><h1>财税服务</h1></a>
													<ul>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/4-111-156.html">兼职会计(代理记账)</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/4-111-157.html">纳税申报</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/4-111-158.html">进出口退税</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/4-111-159.html">税收筹划/顾问</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/4-111-270.html">税务疑难处理</a>
														</li>
													</ul>
													<a href="http://www.qibaba.cn/product/productIntroduce/4-113.html"><h1>招聘 电销</h1></a>
													<ul>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/4-113-160.html">代发招聘广告</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/4-113-161.html">劳务派遣</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/4-113-162.html">电销外包</a>
														</li>
													</ul>
													<a href="http://www.qibaba.cn/product/productIntroduce/4-114.html"><h1>员工福利</h1></a>
													<ul>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/4-114-163.html">下午茶策划</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/4-114-164.html">出游策划</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/4-114-165.html">团建服务</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/4-114-166.html">体检服务</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/4-114-167.html">员工奖励礼品定制</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/4-114-168.html">生日定制蛋糕封套</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/4-114-169.html">企业员工培训纸杯</a>
														</li>
													</ul>
												</div>
											</li>
											<li>
												<span><img src="../../../images/xuanzhi.png"/></span>工装印刷
												<span><img src="../../../images/side_arrow.png"/></span>
												<div>
													<a href="http://www.qibaba.cn/product/productIntroduce/5-117.html"><h1>办公家具</h1></a>
													<ul>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/5-117-171.html">工位定制</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/5-117-172.html">电脑选配</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/5-117-173.html">空调选配</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/5-117-174.html">沙发</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/5-117-175.html">老板台 沙发 柜子</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/5-117-272.html">发光台</a>
														</li>
													</ul>
													<a href="http://www.qibaba.cn/product/productIntroduce/5-118.html"><h1>设计 定做</h1></a>
													<ul>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/5-118-176.html">名片设计</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/5-118-177.html">广告牌定做</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/5-118-178.html">发光字</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/5-118-179.html">工装定制</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/5-118-181.html">工牌定制</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/5-118-182.html">优秀员工出书</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/5-118-273.html">logo墙</a>
														</li>
													</ul>
													<a href="http://www.qibaba.cn/product/productIntroduce/5-274.html"><h1>宣传物料</h1></a>
													<ul>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/5-274-276.html">宣传单</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/5-274-277.html">画册</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/5-274-278.html">手提袋</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/5-274-279.html">易拉宝</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/5-274-280.html">折页</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/5-274-281.html">代金券</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/5-274-282.html">不干胶</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/5-274-283.html">X展架</a>
														</li>
													</ul>
													<a href="http://www.qibaba.cn/product/productIntroduce/5-275.html"><h1>办公印品</h1></a>
													<ul>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/5-275-284.html">信封</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/5-275-285.html">台历</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/5-275-286.html">纸杯</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/5-275-287.html">手提袋</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/5-275-288.html">挂历</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/5-275-289.html">火机</a>
														</li>
													</ul>
												</div>
											</li>
											<li>
												<span><img src="../../../images/pinpai.png"/></span> 品牌 营销 软件
												<span><img src="../../../images/side_arrow.png"/></span>
												<div>
													<a href="http://www.qibaba.cn/product/productIntroduce/6-54.html"><h1>品牌设计</h1></a>
													<ul>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/6-54-183.html">企业logo设计</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/6-54-184.html">企业形象VI</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/6-54-185.html">品牌推广</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/6-54-186.html">企业视频宣传</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/6-54-187.html">图文设计</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/6-54-290.html">品牌推广</a>
														</li>
													</ul>
													<a href="http://www.qibaba.cn/product/productIntroduce/6-121.html"><h1>营销</h1></a>
													<ul>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/6-121-188.html">软文</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/6-121-189.html">贴吧 论坛 QQ 博客 网站头片 视频推广</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/6-121-190.html">微信营销</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/6-121-191.html">朋友圈营销</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/6-121-192.html">微信群发 微信 微名</a>
														</li>
													</ul>
													<a href="http://www.qibaba.cn/product/productIntroduce/6-120.html"><h1>IT服务</h1></a>
													<ul>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/6-120-194.html">网络建站</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/6-120-195.html">微信开发服务</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/6-120-196.html">企业定制</a>
														</li>
													</ul>
													<a href="http://www.qibaba.cn/product/productIntroduce/6-122.html"><h1>管理软件</h1></a>
													<ul>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/6-122-197.html">手机app定制服务</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/6-122-198.html">OA办公</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/6-122-199.html">ERP系统</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/6-122-200.html">进销存系统</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/6-122-202.html">金融贸易</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/6-122-203.html">企业定制</a>
														</li>
													</ul>
												</div>
											</li>
											<li>
												<span><img src="../../../images/gaoduan.png"/></span> 企业主高端定制
												<span><img src="../../../images/side_arrow.png"/></span>
												<div>
													<a href="http://www.qibaba.cn/product/productIntroduce/292-293.html"><h1>私人服务</h1></a>
													<ul>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/292-293-294.html">私人医生</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/292-293-295.html">私人律师</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/292-293-296.html">私人安保</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/292-293-297.html">私人上市筹划</a>
														</li>
													</ul>
													<a href="http://www.qibaba.cn/product/productIntroduce/292-298.html"><h1>出游服务</h1></a>
													<ul>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/292-298-299.html">高端国内出游</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/292-298-300.html">高端国际出游</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/292-298-301.html">日本高端就医</a>
														</li>
													</ul>
													<a href="http://www.qibaba.cn/product/productIntroduce/292-302.html"><h1>在京福利</h1></a>
													<ul>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/292-302-303.html">北京工作居住证咨询</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/292-302-304.html">北京户籍政策咨询</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/292-302-305.html">京牌政策咨询</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/292-302-306.html">移民</a>
														</li>
													</ul>
													<a href="http://www.qibaba.cn/product/productIntroduce/292-307.html"><h1>人脉</h1></a>
													<ul>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/292-307-308.html">VIP高级酒会</a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/292-307-309.html">商会推荐 </a>
														</li>
														<li>
															<a href="http://www.qibaba.cn/product/productIntroduce/292-307-310.html">EMBA就读</a>
														</li>
													</ul>
												</div>
											</li>
										</ul>
									</div>
								</div>
                </div>
            </li>
            <%--<li class="nav-li ${cIndexNav}">--%>
                <%--<a href="/index.html">首页</a>--%>
            <%--</li>--%>
            <li class="nav-li ${cProductNav}">
                <a href="/product/toSearch.html">找企服</a>
            </li>
            <li class="nav-li ${cAdviserNav}">
                <a href="/adviser/toSearch.html">企服顾问</a>
            </li>
            <li class="nav-li">
                <a href="javascript:void(0);">企服申请</a>
            </li>
            <li class="nav-li ${cNeedNav}">
                <a href="/need/toSearch.html">企服需求</a>
            </li>
            <li class="nav-li">
                <a href="/about/about-qbb.html">关于企巴巴</a>
            </li>
            <%--<li class="nav-li">--%>
                <%--<a href="javascript:void(0);">商家入驻</a>--%>
            <%--</li>--%>
            <li class="clear"></li>
        </ul>
    </div>
</div>
<script>
    $(function () {

        $(".nav-li1").mouseover(function () {
            $(".nav-l2-container").css("display","block");
        })

        $(".nav-l2-container").mouseout(function () {
            if($("#nav").val()!="index"){
                $(".nav-l2-container").css("display","none");
                $(".nav-li1").mouseout(function () {
                    $(".nav-l2-container").css("display","none");
                })
            }
        });


        $("a[name='searchType']").click(function () {
            $("a[name='searchType']").removeClass("selectType");
             $(this).addClass("selectType");
        });
        $("#topSearch").click(function () {
            var searchType = $(".selectType").attr("searchType");
            var keyword = $("#keyword").val();
            var url;
            if(searchType == 1) {
                url = "/product/toSearch.html?keyword="+keyword;
            }
            if(searchType == 2) {
                url = "/need/toSearch.html?keyword="+keyword;
            }
            if(searchType == 3) {
                url = "/adviser/toSearch.html?keyword="+keyword;
            }
            location.href = url;
        });

    });
</script>
</body>
</html>