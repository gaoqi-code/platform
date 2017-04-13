<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <%@ include file="/common/global.jsp" %>
    <meta charset="utf-8">
    <base href="<%=basePath%>">
    <title>企巴巴-找回密码</title>
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

<jsp:include page="../common/top.jsp"></jsp:include>
<div id="container">

    <div class="content login_title">
        找回密码
    </div>
    <div class="content reg_css">


        <div class="login_left">
            <div class="login_left_content">
                <form class="layui-form" action="">
                    <input type="hidden" id="phone" value="${phone}">

                    <div class="layui-form-item">
                        <label class="layui-form-label">新密码：</label>
                        <div class="layui-input-inline">
                            <input type="password" id="pass1" lay-verify="required"  placeholder="" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">确认密码：</label>
                        <div class="layui-input-inline">
                            <input type="password" id="pass2"  lay-verify="required"  placeholder="" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button type="button" class="layui-btn" lay-submit="" lay-filter="demo1">确认</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>


        <div class="login_right">
            <div style="height: 40px;"></div>
            <img src="./images/logo_h.png">
            <div class="login_right_company"><span>我是一个企业顾问，我想为用户提供更多的服务</span></div>
        </div>
        <div class="clear"></div>

    </div>

</div>
<jsp:include page="../common/bottom.jsp"></jsp:include>

<script>
    $(function () {
        layui.use(['form'], function(){
            var form = layui.form()
                    ,layer = layui.layer;
            //自定义验证规则
            form.verify({
                pass: [/(.+){6,12}$/, '密码必须6到12位']
            });
            //监听提交
            form.on('submit(demo1)', function(data){
                var pass1 = $("#pass1").val();
                var pass2 = $("#pass2").val();
                if(pass1 != pass2) {
                    layer.msg("两次密码输入不同，请重新输入！");
                    return;
                }
                $.ajax({
                    type: "POST",
                    url: "/retrieveAccount/passFindUpdate.json",
                    data: {
                        phone:$("#phone").val(),
                        password:pass2
                    },
                    dataType: "json",
                    success: function (data) {
                        console.log(data);
                        if (data) {
                            layer.msg("恭喜修改成功！");
                            setTimeout(function () {
                                location.href = "/tologin.html";
                            }, 1000);
                        } else {
                            layer.msg("修改失败！");
                        }
                    }
                });
                return false;
            });
        });
    });
</script>
</body>
</html>