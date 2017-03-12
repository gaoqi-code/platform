<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>layui</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="./css/base.css">
	<link rel="stylesheet" href="/css/layer.css">
	<link rel="stylesheet" href="./css/layui.css"  media="all">
	<%--<script src="/js/jquery-1.9.1.js" charset="utf-8"></script>--%>
	<style>
		.login_title{font-size: 16px;border-bottom: 1px solid #c2c2c2;padding:20px 10px;margin-bottom: 50px;}
		.login_left{width: 590px;border-right: 1px solid #e5e5e5;float: left;}
		.login_left_content{width: 480px;}
		.login_right{text-align: center;}
	</style>
</head>
<body>
<div class="top_out">
	<div class="content">
		<div>企巴巴</div>
		<div></div>
	</div>
</div>

<div class="content top-search">
	<div class="logo-box">
		<%--<img src="http://www.dgg.net/images/global-v1/dgg_logo1.png">--%>
	</div>
	<div class="search-form">

		<form action="" id="queryType" method="post" class="inlineb" target="_blank">
			<ul class="search-form-tab">
				<li class="active" id="1"><a href="javascript:void(0)">找服务</a><i></i>
				</li>
				<li id="4"><a href="javascript:void(0)">找顾问</a><i></i>
				</li>
				<li id="2"><a href="javascript:void(0)">查公司</a><i></i></li>
				<li id="3"><a href="javascript:void(0)">查商标</a><i></i>
				</li>
			</ul>
			<div class="tabBox">
				<div class="search-form-box">
					<input type="text" placeholder="请输入关键字查询" id="keyword" name="keyword" value="" maxlength="20">
					<button type="submit"><i class="size25 icon1"></i><span class="inline">搜索</span></button>
				</div>
			</div>
		</form>
	</div>
	<div style="clear: both;"></div>
</div>

<div class="nav-container">
	<div class="content">频道区域</div>
</div>


<div id="container">

	<div class="content login_title">
		新用户注册
	</div>
	<div class="content login_css">
		<div class="login_left">
			<div class="login_left_content">
			<form class="layui-form" action="">
				<div class="layui-form-item">
					<label class="layui-form-label">手机号：</label>
					<div class="layui-input-block">
						<input type="text" name="title" lay-verify="mobile" autocomplete="off" placeholder="请输入手机号" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">验证码：</label>
					<div class="layui-input-inline">
						<input type="text" name="username" lay-verify="required" placeholder="请输入验证码" autocomplete="off" class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux">图形验证码</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">短信验证：</label>
					<div class="layui-input-inline">
						<input type="tel" name="phone" lay-verify="phone" placeholder="请输入短信验证码" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">登录密码：</label>
					<div class="layui-input-block">
						<input type="password" name="password" placeholder="请输入登录密码" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">确认密码：</label>
					<div class="layui-input-block">
						<input type="password" name="password" placeholder="请重复上面密码" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</form>
			</div>
		</div>

		<div class="login_right">
			<%--<img src="http://www.dgg.net/images/global-v1/dgg_logo1.png">--%>
			<div><span>我是一个企业顾问，我想为用户提供更多的服务</span></div>
			<button class="layui-btn layui-btn-big">大型按钮</button>
		</div>

	</div>

</div>
<link rel="contents" href="bottom.jsp">
<iframe src="bottom.jsp" name="" ></iframe>
<script src="/plugins/layui/layui.js" charset="utf-8"></script>

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
        form.on('submit(demo1)', function(data){
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });


    });
</script>

</body>
</html>