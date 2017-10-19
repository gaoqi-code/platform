<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String basePath = request.getScheme() + "://"
+ request.getServerName();
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>我的店铺</title>
		<base href="<%=basePath%>">
		<jsp:include page="../common/css_c.jsp"></jsp:include>
		<script type="text/javascript" src="/js/jquery-1.9.1.js"></script>
		<link rel="stylesheet" type="text/css" href="/css/store.css" />
		<script type="text/javascript" src="/plugins/layui/layui.js"></script>
		<script type="text/javascript" src="../js/scrooll.js"></script>

	</head>

	<body>
		<!--头部-->
		<jsp:include page="../common/top_c2.jsp"></jsp:include>
		<!--xian-->
		<div class="content">
            <jsp:include page="../common/left_c_adviser.jsp"></jsp:include>
            <jsp:include page="/member/userInfo.html"></jsp:include>
			<!--user-->
			<div id="container">
				<div class="location">
					您当前位置：
					<a href="/index.html">企巴巴</a> &gt;&gt;
					<a href="javascript:void(0);" class="defaultCursor">个人中心</a> &gt;&gt;
					<a href="javascript:void(0);" class="defaultCursor">我的店铺</a>
				</div>
			</div>

				<!--container-->
				<div class="product" id="dataMsg">
				<%--	<div class="layui-form" id="dataMsg"></div>--%>
				</div>
				<div class="clear"></div>
				<div id="pager" style="width: 930px;margin-left: 8px;float: left;"></div>
			<div class="clear"></div>
			<!--members-->

		</div>
		<!--content-->

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
                        url: "/member/product/page.html",
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
        })
	</script>
</html>