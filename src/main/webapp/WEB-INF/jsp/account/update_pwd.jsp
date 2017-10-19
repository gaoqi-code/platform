<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/common/global.jsp" %>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
    <title>企巴巴</title>
    <jsp:include page="../common/css.jsp"></jsp:include>
    <link rel="stylesheet" href="../css/buysell.css">
    <link rel="stylesheet" href="../plugins/layui/css/global.css">
    <style>
        .member_menu li{width: 100%;height:35px;line-height:35px;border-bottom: 1px solid #eee;}
        .member_menu li a{margin-left:20px;}
    </style>
</head>
<body>
<jsp:include page="../common/top_c.jsp"></jsp:include>
<jsp:include page="../common/nav_c.jsp"></jsp:include>
<div id="container">
    <div class="content memver_c">
        <jsp:include page="../common/left_c.jsp"></jsp:include>

        <div class="c_right">
            <p class="layui-elem-quote noborderLeft">修改密码</p>
            <form class="layui-form" action="" id="updatePWForm">
                <div class="layui-form-item">
                    <label class="layui-form-label"><span class="redColorClass">*</span>原密码</label>
                    <div class="layui-input-inline">
                        <input type="password" name="oldPW"  lay-verify="required"  placeholder="" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux"></div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"><span class="redColorClass">*</span>新密码</label>
                    <div class="layui-input-inline">
                        <input type="password" name="newPW" lay-verify="required"  placeholder="" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux"></div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"><span class="redColorClass">*</span>确认密码</label>
                    <div class="layui-input-inline">
                        <input type="password"  name="twoPW"  placeholder="" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux"></div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="button" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                    </div>
                </div>
            </form>

            <jsp:include page="../common/advert/advert1.jsp"></jsp:include>
        </div>

        <div class="clear"></div>
    </div>
</div>
<script src="../plugins/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form()
                ,layer = layui.layer
                ,layedit = layui.layedit
                ,laydate = layui.laydate;

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        //自定义验证规则
        form.verify({
            title: function(value){
                if(value.length < 5){
                    return '标题至少得5个字符啊';
                }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });


        //监听提交
        form.on('submit(demo1)', function(data){
            var newPW= $("input[name='newPW']").val();
            var twoPW= $("input[name='twoPW']").val();
            if(newPW != twoPW) {
                layer.msg("两次密码输入不一致，请重新输入！");
                return;
            }

            $.ajax({
                type: "POST",
                url: "/member/account/updatePW.json",
                data: $("#updatePWForm").serialize(),
                dataType: "json",
                success: function(data){
                    if(data) {
                        layer.alert("修改成功！");
                    }else {
                        layer.alert("修改失败！");
                    }
                }
            });
            return false;
        });


    });
</script>
</body>
</html>
