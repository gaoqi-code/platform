<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName();
%>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1" />
		<title>首页</title>
		<title>企巴巴-一站式商业服务平台</title>
		<jsp:include page="../common/css_c.jsp"></jsp:include>
		<link rel="stylesheet" type="text/css" href="/css/cooperation.css" />
		<style>
			.file {
				position: relative;
				display: inline-block;
				background: #D0EEFF;
				border: 1px solid #99D3F5;
				border-radius: 4px;
				padding: 4px 12px;
				overflow: hidden;
				color: #1E88C7;
				text-decoration: none;
				text-indent: 0;
				line-height: 20px;
			}
			.file input {
				position: absolute;
				font-size: 100px;
				right: 0;
				top: 0;
				opacity: 0;
			}
			.file:hover {
				background: #AADFFD;
				border-color: #78C3F3;
				color: #004974;
				text-decoration: none;
			}
		</style>
		<script type="text/javascript" src="../js/jquery-1.9.1.js"></script>
	</head>
	<body>
		<!--头部-->
		<!--content-->
		<jsp:include page="../common/top_c2.jsp"></jsp:include>
		<!--xian-->
		<div class="img1">
			<!--<img src="images/img1.jpg" alt="" />-->
		</div>
		<div class="img2">
			<!--<img src="images/img2.jpg" alt="" />-->
		</div>
		<div class="bg">
			<div class="content">
				<div class="img3">
					<div class="img_box">
						<img src="images/map.jpg" alt="">
					</div>
					<div class="form">
						<ul>
							<li>类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型：</li>
							<li>
								<select name="">
									<option value="">金融服务</option>
									<option value="">企业服务</option>
									<option value="">贷款服务</option>
								</select>
							</li>
							<li>联&nbsp;系&nbsp;人：</li>
							<li><input type="text" name="" id="" value=""></li>
							<li>联系方式：</li>
							<li><input type="text" name="" id="" value=""></li>
							<p>
								<input type="text" name="" id="" value="" placeholder="请说出你想说的话...">
								<input type="submit" name="" id="" value="提交">
							</p>

						</ul>
					</div>
					<div class="sanjiao"></div>
					<div class="clear"></div>
				</div>

			</div>
			<!--content-->
		</div>






		<!--页脚-->
		<div class="bottomCss">
			<div class="content">
				<div class="footLogo">
					<div class="bottomNav">
						<a href="index.html" title="网站首页">网站首页</a>
						<a href="company.html" title="公司概况">公司概况</a>
						<a href="product.html" title="产品介绍">产品介绍</a>
						<a href="contact.html" title="联系方式">联系方式</a>
						<a class="clear"></a>
					</div>
					<div class="app">
						<div class="erweima">
							<img style="width: 110px;" src="http://www.mdtz2133.com/images/link/kwx.jpg"><span>客服微信</span>
						</div>
						<div class="erweima">
							<img style="width: 110px;" src="http://www.mdtz2133.com/images/link/erweima.png"><span>公从号</span>
						</div>
						<div class="clear"></div>
					</div>
					<div class="kefuPhone">
						<span>客服热线（工作日：8:30-21:00）</span>
						<strong>020-61059612</strong>
						<span>在线客服咨询请点击右侧浮窗</span>
						<span>在线客服（工作日：8:30-21:00）</span>

					</div>
					<div class="clear"></div>
				</div>
				<!--footLogo-->
				<div class="footBottom">
					<p class="copyright">版权所有 © 中讯担保</p>
					<p class="copy-info">Copyright © 2015-2018 Zhong Xun Dan Bao Tou Zi Zi Xun You Xian Gong Si </p>
					<p class="copy-num">粤ICP备16125363号-1</p>
					<a id="szfw_logo" href="https://credit.szfw.org/CX20160510015126120135.html" target="_blank"></a>
				</div>
			</div>
			<!--content-->
		</div>
		<!--bottomCss-->
	</body>
	<script src="/plugins/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use(['laypage', 'layer'], function(){

        var laypage = layui.laypage
            ,layer = layui.layer;
        //以下将以jquery.ajax为例，演示一个异步分页
        var pageSize = 5;
        function paging(curr){
            $.ajax({
                type: "POST",
                url: "/member/need/memberNeedPage.html",
                data: {
                    currentPage :curr || 1,
                    pageSize : pageSize
                },
                success: function(data){
                    $("#dataMsg").html(data);
                    var totalPages = $("#totalPages").val();
                    //显示分页
                    laypage({
                        cont: 'pager', //容器。值支持id名、原生dom对象，jquery对象。【如该容器为】：<div id="page1"></div>
                        pages: totalPages, //通过后台拿到的总页数
                        curr: curr || 1, //当前页
                        groups: 5 ,//连续显示分页数
                        jump: function(obj, first){ //触发分页后的回调
                            if(!first){ //点击跳页触发函数自身，并传递当前页：obj.curr
                                paging(obj.curr);
                            }
                        }
                    });
                }
            });
        };
        //运行
        paging();
    });

</script>

</html>