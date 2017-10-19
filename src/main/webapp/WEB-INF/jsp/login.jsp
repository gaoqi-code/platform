<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <%@ include file="/common/global.jsp" %>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title>企巴巴</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="./css/base.css">
    <link rel="stylesheet" href="./plugins/layui/css/layui.css"  media="all">
    <style>
        .reg_css{    margin-bottom: 35px;            background-color: #f3f3f3;            padding: 60px 0px;}
        .login_title{font-size: 16px;border-bottom: 1px solid #c2c2c2;padding:20px 0px;margin-bottom: 10px;}
        .login_left{width: 585px;border-right: 1px solid #e5e5e5;float: left;margin-left: 35px;}
        .login_left img{height: 388px;}
        .login_left_content{width: 360px; }
        .login_right{text-align: center; width: 367px;
            border: 1px solid #dfdfdf;
            margin-left: 93px;
            padding: 60px 30px;
            background-color: #FFF;
            float: left;}
        .forget_m{float: right;}
        .forget_m a{color: #2486b5;}
        .forget_m span{color: #959595;}
        .layui-input-block{margin-left: 0px;}
        .login_right_company{margin:25px 0px;}
    </style>
</head>
<body>

<jsp:include page="common/top.jsp"></jsp:include>
<div id="container">

    <div class="content login_title">
        用户登录
    </div>
    <div class="content reg_css">
        <div class="login_left">
<img src="/images/gg/denglv_bg.jpg">
        </div>

        <div class="login_right">
            <%--<div style="height: 40px;"></div>--%>
            <%--<img src="./images/logo_h.png">--%>
            <%--<div class="login_right_company"><span>还不是企巴巴平台的会员，赶快去注册！</span></div>--%>
            <%--<a href="/register/reg/0.html"><button class="layui-btn layui-btn-big">免费注册</button></a>--%>

            <div class="login_left_content">
                <form class="layui-form" action="" id="loginForm">
                    <div style="    font-size: 20px;margin-bottom: 39px;    text-align: left;">登录</div>
                    <input type="hidden" name="fromUrl" value="${fromUrl}">
                    <div class="layui-form-item">
                        <%--<label class="layui-form-label">手机号：</label>--%>
                        <div class="layui-input-block">
                            <input type="text" lay-verify="phone"  value="" name="mobile"  autocomplete="off" placeholder="手机号/用户名" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <%--<label class="layui-form-label">登录密码：</label>--%>
                        <div class="layui-input-block">
                            <input type="password" lay-verify="required"  value="" name="password" placeholder="登录密码" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="forget_m"><a href="/retrieveAccount/passFind.html">忘记密码？</a></div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit="" lay-filter="demo1" style="margin-top: 11px;width: 100%;">登录</button>
                        </div>
                    </div>
                    <div class="forget_m"><span>还不是企巴巴会员？</span><a href="/register/reg/0.html">免费注册</a></div>
                </form>
            </div>

        </div>
        <div class="clear"></div>

    </div>

</div>



<jsp:include page="common/bottom.jsp"></jsp:include>
<script src="./plugins/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form'], function(){
        var form = layui.form()
                ,layer = layui.layer;

        //自定义验证规则

        //监听提交
        form.on('submit(demo1)', function(data){
//            layer.alert(JSON.stringify(data.field), {
//                title: '最终的提交信息'
//            });
//            alert("呵呵");
//            location.href="member/index.html";
            $.ajax({
                type: "POST",
                url: "/login.json",
                data: $("#loginForm").serialize(),
                dataType: "json",
                success: function(data){
                    if(data.flag) {
                        setTimeout(function () {
                            var href = "/member/index.html";
                            if(data.fromUrl) {
                                href = data.fromUrl;
                            }
                            location.href = href;
                        }, 1000);
                    }else {
                        layer.msg(data.msg);
                    }
                }
            });
            return false;
        });


    });
</script>
</body>
</html>
