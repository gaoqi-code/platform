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
        .reg_css{margin-bottom:35px;}
        .login_title{font-size: 16px;border-bottom: 1px solid #c2c2c2;padding:20px 10px;margin-bottom: 50px;}
        .login_left{width: 590px;border-right: 1px solid #e5e5e5;float: left;}
        .login_left_content{width: 440px;}
        .login_right{text-align: center;}
        .forget_m{float: right;}
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
            <div class="login_left_content">
                <form class="layui-form" action="" id="loginForm">
                    <div class="layui-form-item">
                        <label class="layui-form-label">手机号：</label>
                        <div class="layui-input-block">
                            <input type="text" lay-verify="phone"  value="15765056585" name="mobile"  autocomplete="off" placeholder="请输入手机号" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">登录密码：</label>
                        <div class="layui-input-block">
                            <input type="password" lay-verify="required"  value="15765056585" name="password" placeholder="请输入登录密码" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="forget_m"><a href="/retrieveAccount/passFind.html">忘记密码？</a></div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit="" lay-filter="demo1">登录</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div class="login_right">
            <div style="height: 40px;"></div>
            <img src="./images/logo_h.png">
            <div class="login_right_company"><span>还不是企巴巴平台的会员，赶快去注册！</span></div>
            <a href="reg.html"><button class="layui-btn layui-btn-big">免费注册</button></a>
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
                            location.href = "/member/index.html";
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