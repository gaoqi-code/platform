<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <%@ include file="/common/global.jsp" %>
    <meta charset="utf-8">
    <title>企巴巴-用户注册</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="./css/base.css">
    <link rel="stylesheet" href="./plugins/layui/css/layui.css"  media="all">
    <script src="./plugins/layui/layui.js" charset="utf-8"></script>
    <style>
        .reg_css{margin-bottom:35px;}
        .login_title{font-size: 16px;border-bottom: 1px solid #c2c2c2;padding:20px 10px;margin-bottom: 50px;}
        .login_left{width: 590px;border-right: 1px solid #e5e5e5;float: left;}
        .login_left_content{width: 440px;}
        .login_right{text-align: center;}
        .login_right_company{margin:25px 0px;}
    </style>
</head>
<body>
<jsp:include page="common/top.jsp"></jsp:include>
<div id="container">

    <div class="content login_title">
        新用户注册
    </div>
    <div class="content reg_css">
        <div class="login_left">
            <div class="login_left_content">
                <form class="layui-form" action="" id="regForm">
                    <div class="layui-form-item">
                        <label class="layui-form-label">手机号：</label>
                        <div class="layui-input-block">
                            <input type="text" value="15765056585" name="mobile" lay-verify="mobile" autocomplete="off" placeholder="请输入手机号" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">验证码：</label>
                        <div class="layui-input-inline">
                            <input type="text" value="15765056585" name="username" lay-verify="required" placeholder="请输入验证码" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-form-mid layui-word-aux">图形验证码</div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">短信验证：</label>
                        <div class="layui-input-inline">
                            <input type="tel" value="15765056585" name="msgCode" lay-verify="phone" placeholder="请输入短信验证码" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">登录密码：</label>
                        <div class="layui-input-block">
                            <input type="password" value="15765056585" name="password" placeholder="请输入登录密码" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">确认密码：</label>
                        <div class="layui-input-block">
                            <input type="password" value="15765056585" name="password2" placeholder="请重复上面密码" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit="" lay-filter="demo1" id="tj">立即提交</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div class="login_right">
            <div style="height: 40px;"></div>
            <img src="./images/logo_h.png">
            <div class="login_right_company"><span>我是一个企业顾问，我想为用户提供更多的服务</span></div>
            <button class="layui-btn layui-btn-big">商家入驻</button>
        </div>
        <div class="clear"></div>

    </div>

</div>

<jsp:include page="common/bottom.jsp"></jsp:include>

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
//            layer.alert(JSON.stringify(data.field), {
//                title: '最终的提交信息'
//            })
            var para= JSON.stringify(data.field);
            console.log($("#regForm").serialize());
            $.ajax({
                type: "POST",
                url: "/register/registerMember.json",
                data: $("#regForm").serialize(),
                dataType: "json",
                success: function(data){
                    if(data.flag) {
                        layer.msg("恭喜注册成功！");
                        setTimeout(function () {
                            location.href = "/tologin.html";
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