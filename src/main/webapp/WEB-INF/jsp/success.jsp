<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
    <title>Title</title>
    <jsp:include page="./common/css.jsp"></jsp:include>
    <link rel="stylesheet" href="../css/buysell.css">
    <link rel="stylesheet" href="../css/success.css">
    <link rel="stylesheet" href="../plugins/layui/css/global.css">
    <style>
        .memver_c{margin-top: 15px;margin-bottom: 15px;}
        .c_left{width: 210px;float:left;}
        .member_menu{border: 1px solid #EEE;}
        .member_menu li{width: 100%;height:35px;line-height:35px;border-bottom: 1px solid #eee;}
        .member_menu li a{margin-left:20px;}
        .gonggao li{width: 100%;height:45px;line-height:45px;border-bottom: 1px solid #eee;}
        .gonggao li a{margin-left: 15px;}
        .c_right{margin-left:10px;width: 958px;float: left;}
    </style>
</head>
<body>
<jsp:include page="./common/top_c.jsp"></jsp:include>
<jsp:include page="./common/nav_c.jsp"></jsp:include>
<div id="container">
    <div class="content memver_c">
        <jsp:include page="./common/left_c.jsp"></jsp:include>

        <div class="c_right">
            <p class="layui-elem-quote">发布产品 -- 发布成功</p>
            <div class="c_right_content">
                <div class="s_left">
                    <div class="s_left_img"><img src="images/tips/success.png" /></div>
                </div>
                <div class="s_right">
                    <div class="s_right_content">
                        <p class="title1">产品发布成功！</p>
                        <p class="title2">等待审核，审核通过之后全网审核！</p>
                        <p class="title3">我们将在3个工作日之内审核完成，敬请留意审核结果！</p>
                        <div><a class="layui-btn" href="javascript:void(0);">继续发布产品</a>&nbsp;&nbsp;<a href="member/product/list.html" class="a_blue">管理已发布的产品</a></div>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
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

        //监听指定开关
        form.on('switch(switchTest)', function(data){
            layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
                offset: '6px'
            });
            layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
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
<script>
    layui.use('upload', function(){
        layui.upload({
            url: '' //上传接口
            ,success: function(res){ //上传成功后的回调
                console.log(res)
            }
        });

        layui.upload({
            url: '/test/upload.json'
            ,elem: '#test' //指定原始元素，默认直接查找class="layui-upload-file"
            ,method: 'get' //上传接口的http类型
            ,success: function(res){
                LAY_demo_upload.src = res.url;
            }
        });
    });
</script>
</body>
</html>
