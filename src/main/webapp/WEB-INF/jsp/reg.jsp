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
    <link rel="stylesheet" href="/css/base.css">
    <link rel="stylesheet" href="/plugins/layui/css/layui.css"  media="all">
    <script src="/js/SmsValidate.js" charset="utf-8"></script>
    <style>
        .reg_css{margin-bottom:35px; background-color: #f3f3f3;padding: 60px 0px;}
        .login_title{font-size: 16px;border-bottom: 1px solid #c2c2c2;padding:20px 0px;margin-bottom: 10px;}
        .login_left{width: 442px;border: 1px solid #dfdfdf;margin-left: 30px;padding: 60px 30px; background-color: #FFF; float: left;;}
        .login_left_content{width: 440px;}
        .login_right{text-align: center;margin-left: 18px;}
        .login_right_company{margin:25px 0px;}
        .yzm_but{position: absolute;  right: 3px;   top: 3px;       width: 110px;
            height: 32px;
            border: none;
            background: #f2f2f2;
            color: #333;
            padding: 0;
            line-height: 32px;
            text-align: center;
            cursor: pointer;}
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
                    <input type="hidden" id="otherInviteCode" name="otherInviteCode" value="${inviteCode}">
                    <input type="hidden" id="verifyType" name="verifyType" value="reg">
                    <div class="layui-form-item">
                        <label class="layui-form-label">手机号：</label>
                        <div class="layui-input-block">
                            <input type="text" value="" id="mobile" name="mobile" lay-verify="phone" autocomplete="off" placeholder="请输入手机号" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">验证码：</label>
                        <div class="layui-input-inline">
                            <input type="text" value="" id="yzmValue" name="imgCode" lay-verify="required" placeholder="请输入验证码" autocomplete="off" class="layui-input">
                        </div>
                        <%--<div style="width: 129px;height: 35px;float: left;" id="yzm"></div>--%>
                        <img src=""  style="width: 130px;height: 37px;float: left;" id="yzm">
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">短信验证：</label>
                        <div class="layui-input-block">
                            <input type="tel" id="verifyCode" name="msgCode" lay-verify="required" placeholder="请输入短信验证码" autocomplete="off" class="layui-input">
                            <a id="sendSms" class="yzm_but">获取验证码</a>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">登录密码：</label>
                        <div class="layui-input-block">
                            <input type="password" value="" name="password"  lay-verify="required"  placeholder="请输入登录密码" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">确认密码：</label>
                        <div class="layui-input-block">
                            <input type="password" value="" name="password2" lay-verify="required"  placeholder="请重复上面密码" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button type="button" class="layui-btn" lay-submit="" lay-filter="demo1" id="tj">立即提交</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div class="login_right">
            <%--<div style="height: 40px;"></div>--%>
            <img src="/images/registered1_bg.jpg" style="    height: 440px;">
        </div>
        <div class="clear"></div>

    </div>

</div>

<jsp:include page="common/bottom.jsp"></jsp:include>

<script>
    $(function () {
        var layer;
        layui.use(['form'], function(){
            var form = layui.form();
               layer = layui.layer;

            //自定义验证规则
            form.verify({
                pass: [/(.+){6,12}$/, '密码必须6到12位']
            });

            //监听提交
            form.on('submit(demo1)', function(data){
                var password = $("input[name='password']").val();
                var password2 = $("input[name='password2']").val();
                if(password == '' || password == null) {
                    layer.msg("密码不能为空！");
                    return;
                }
                if(password.length < 7) {
                    layer.msg("密码最少为6位！");
                    return;
                }
                if(password != password2) {
                    layer.msg("登录密码和确认密码不一致！");
                    return;
                }
                regMember();
                return false;
            });
        });
        

        function regMember() {
            $.ajax({
                type: "POST",
                url: "/register/registerMember.json",
                data: $("#regForm").serialize(),
                dataType: "json",
                success: function (data) {
                    if (data.flag) {
                        layer.msg("恭喜注册成功！");
                        setTimeout(function () {
                            location.href = "/tologin.html";
                        }, 1000);
                    } else {
                        layer.msg(data.msg);
                    }
                }
            });
        }
    });
</script>
</body>
</html>