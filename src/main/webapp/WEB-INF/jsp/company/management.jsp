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
		<link rel="stylesheet" type="text/css" href="/css/managemengt.css" />

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
		<div class="content">
			<div class="list">
				<ul>
					<li><p>推广管理</p><p>Promotion&nbsp;management</p></li>
					<li><a href="#">会员</a></li>
					<li><a href="#">白金广告</a></li>
					<li><a href="#">钻石广告</a></li>
					<li><a href="#">移动广告</a></li>
					<p class="p1">好业务，让企巴巴帮你推广</p>
				</ul>
			</div>
			<div class="user">
				<div class="user_left">
					<div class="img_box"><img src="${member.headPortrait}"></div>
					<div class="text">
						<p>账户：<span>${member.name}</span></p>
						<p></p>
						<%--<p>账户余额：<span>0 <button>[ 充值 ]</button></span></p>--%>
						<%--<p>消费总额：<span>0 元</span></p>--%>
					</div>
				</div>
				<div class="user_right">
					<h1>我的会员</h1>
					<p>你还没有开通会员，开通会员即可享受免费查看贷款需求者电话，信息排列靠前等一系列特权
						<button>立即开通</button>
					</p>
					<div>
						<img src="images/qivip1.jpg" alt="">
						<img src="images/qivip2.jpg" alt="">
						<img src="images/qivip3.jpg" alt="">
						<img src="images/qivip4.jpg" alt="">
					</div>
				</div>
			</div><!--user-->
			<div id="container">
				<div class="location">
					您当前位置：
					<a href="/index.html">企巴巴</a> &gt;&gt;
					<a href="javascript:void(0);" class="defaultCursor">个人中心</a> &gt;&gt;
					<a href="javascript:void(0);" class="defaultCursor">业务介绍</a>
				</div>
			</div><!--container-->
			<div class="members">
				<div class="privilege">
					<img src="images/privilege.jpg" alt="">
				</div>
				<div class="introduce">
					<h1><span>.</span>什么是会员？</h1>
					<p>会员，是一种可以享受四大特权的独特身份，购买会员可以享受免费查看商机，展示排名靠前等特权。目前会员是按月收费可以通过在线支付的方式开通。</p>
				</div><!--introduce-->
				<div><button>立即开通</button></div>
			</div><!--members-->
			<div class="clear"></div>
		</div>


		<!--页脚-->
		<jsp:include page="../common/bottom.jsp"></jsp:include>
		<!--bottomCss-->
	</body>
<script>
</script>

</html>