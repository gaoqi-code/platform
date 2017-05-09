<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/common/global.jsp" %>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <style>
        /*文本框样式调整*/
        .layui-input-block{width:225px;margin-left:auto;margin-right: auto;}
        .layui-form-item .layui-input-inline{width:225px;margin-left:5px;}
    </style>
</head>
<body>

<div class="liuyan">
    <form id="userNeedForm" class="layui-form order-form" action="">
        <div class="layui-form-item">

            <div class="layui-input-inline">
                <select name="categoryCode">
                    <option value="1-" selected="">金融</option>
                    <option value="2-">企业</option>
                    <option value="3-">法律</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="text" name="mobile" lay-verify="phone" autocomplete="off" placeholder="请输入手机号码" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <div class="layui-input-block">
                <textarea placeholder="请输入需求内容" name="needDesc" lay-verify="n_needContent" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" style="width: 100%;" lay-filter="demo1">立即提交</button>
            </div>
        </div>
    </form>
</div>
<script src="../plugins/layui/layui.js" charset="utf-8"></script>
<script>
    var cureentTime = 0;
    layui.use(['form'], function(){
        var form = layui.form()
                ,layer = layui.layer;

        //自定义验证规则
        form.verify({
            n_needContent: function(value){
                if(value.length < 5){
                    return '需求内容不要少于5个字，请尽可能的描述清楚！';
                }
            }
        });
        form.on('submit(demo1)', function(data){
            if((new Date().getTime())-cureentTime<4000){
                return false;
            }
            cureentTime = new Date().getTime();
            $.ajax({
                type: "POST",
                url: "/need/liuyan.json",
                data: $("#userNeedForm").serialize(),
                dataType: "json",
                async:false,
                success: function (data) {
                    if (data) {
                        layer.alert("您的需求已提交，我们会尽快与您联系。", {
                            title: '信息'
                        });
                        $(':input','#userNeedForm').val('');
                    } else {
                        layer.msg("发布失败！");
                    }
                }
            });
            return false;
        });

    });
</script>
</body>
</html>