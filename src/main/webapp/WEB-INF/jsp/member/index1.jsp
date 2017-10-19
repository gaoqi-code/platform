<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName();
%>
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
	/*新加的样式*/
</style>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1" />
		<title>首页</title>
		<title>企巴巴-一站式商业服务平台</title>
		<link rel="stylesheet" type="text/css" href="css/base.css">
		<link rel="shortcut icon" href="../images/icon/qibaba.icon">
		<link rel="stylesheet" type="text/css" href="../css/public.css" />
		<link rel="stylesheet" type="text/css" href="../css/Home page.css" />
		<link rel="stylesheet" href="./plugins/layui/css/layui.css"  media="all">

		<script type="text/javascript" src="../js/jquery-1.9.1.js"></script>
		<script type="text/javascript" src="../js/scrooll.js"></script>
	</head>
	<body>
		<!--头部-->
		<jsp:include page="../common/top_c2.jsp"></jsp:include>

		<!--content-->
		<div class="content">
			<div class="left_content">
				<div class="details">
					<div class="data">
						<div class="tuxiang">
							<form class="layui-form" action="" id="memberInfo">
								<img src="${member.headPortrait}" />
								<p>
									<%--	<input type="file" name="file"  id="uploadHeadPortrait">
                                    <button class="layui-btn" lay-submit="" lay-filter="demo1">修改头像</button>--%>

								</p>

							</form>
						</div>
						<div class="personal">
							<p>${member.name}</p>
							<p>所属公司： <span>${member.companyName}</span> <button>[关联]</button></p>
							<p>类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型： <span>
   								${member.categoryName}
						</span></p>
							<p>个人介绍： <span class="beyond2">${member.description}</span></p>
							<p><button onclick="location.href='/member/toPersonalData.html'">[修改]</button></p>
						</div>
					</div><!--data-->
					<div class="promote">
						<div class="number">
							<%--<p>今日查看次数： <span>50</span>次</p>--%>
							<p>剩余查看数量： <span>${member.needViewCount}</span>次</p>
							<%--<p>&nbsp;&nbsp;&nbsp;总查看数量： <span>50</span>次</p>--%>
							<%--<button>充值</button>--%>
						</div>
						<div class="vip">
							<ul>
								<li>推广服务：</li>
								<li>白金广告</li>
								<li>钻石广告</li>
								<li>移动广告</li>
							</ul>
						</div>
						<p class="lianjie">请点击推广链接：<br /><a href=""><%=basePath%>/register/reg/${member.inviteCode}.html</a><%--<button>点击复制</button>--%></p>
					</div><!--promote-->
					<p class="qibaba">好业务，让企巴巴给你推广</p>
				</div><!--details-->


				<div class="nav_a">
					<ul>
						<li><a href="javascript:void(0)">全部商机</a></li>
						<li><a href="">同业商机</a></li>
						<li><a href="">向我申请</a></li>
						<li><a href="">向我提问</a></li>
						<li><button id="addNeed">发布需求</button></li>
						<div class="clear"></div>
					</ul>
				</div>

				<div class="tab_left">
					<div class="layui-form" id="dataMsg">
					</div>
					<div id="pager"></div>

				</div><!--tab_left-->

			</div>

			<div class="right_content">
				<div class="img_box">
					<img src="images/fuwu.jpg"/>
				</div>
				<div class="announcement" id="notice">
					<p><span class="gong">公告</span><span class="gong">动态</span></p>
					<%--<p><span>[公告] </span>诚信才能让企业路路通</p>--%>
				</div>
				<%--<div class="img_box2">--%>
					<%--<img src="images/service.jpg"/>--%>
				<%--</div>--%>
			</div>



		</div><!--content-->

		<!--页脚-->
		<!--页脚-->
		<jsp:include page="../common/bottom.jsp"></jsp:include>
		<!--bottomCss-->
	</body>
	<script src="/plugins/layui/layui.js" charset="utf-8"></script>
<script>
$(function () {
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


	$.ajax({
		type: "get",
		url: "/article/list.json",
		success: function(data){
			var articles = data.articles;
			if(articles) {
				var content = '';
				articles.forEach(function (item, index) {
					content += '<p><span>[公告] </span><a href="/article/detail/'+item.id+'.html">'+item.title+'</a></p>';
				});
				$("#notice").append(content);
			}
		}
	});
	$("#addNeed").click(function () {
		location.href = "/member/need/toAdd/0.html";
	});
});

</script>

</html>