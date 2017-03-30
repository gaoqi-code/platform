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
    <jsp:include page="../common/css.jsp"></jsp:include>
    <link rel="stylesheet" href="../css/buysell.css">
    <link rel="stylesheet" href="../plugins/layui/css/global.css">
    <style>
        .memver_c{margin-bottom: 15px;}
        .member_menu li{width: 100%;height:35px;line-height:35px;border-bottom: 1px solid #eee;}
        .member_menu li a{margin-left:20px;}
        .gonggao_title{margin: 15px 5px;}
        .gonggao{border: 1px solid #EEE;}
        .gonggao li{width: 100%;height:45px;line-height:45px;border-bottom: 1px solid #eee;}
        .gonggao li a{margin-left: 15px;}
    </style>
</head>
<body>
<jsp:include page="../common/top_c.jsp"></jsp:include>
<jsp:include page="../common/nav_c.jsp"></jsp:include>
<div id="container">
    <div class="content memver_c">
        <jsp:include page="../common/left_c.jsp"></jsp:include>

        <div class="c_right">
            <p class="layui-elem-quote">完成个人资料</p>
            <form class="layui-form" action="">
                <div class="layui-form-item">
                    <label class="layui-form-label" style="margin-top: 80px;">个人头像</label>
                    <div class="layui-input-block">
                        <div class="site-demo-upload">
                            <img id="LAY_demo_upload" src="http://www.dgg.net/images/portrait.jpg">
                            <div class="site-demo-upbar">
                                <input type="file" name="file" class="layui-upload-file" id="test">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">个人名称</label>
                    <div class="layui-input-inline">
                        <input type="password" name="password" lay-verify="pass" placeholder="请输入密码" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">联系电话</label>
                    <div class="layui-input-inline">
                        <input type="password" name="password" lay-verify="pass" placeholder="请输入密码" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">QQ</label>
                    <div class="layui-input-inline">
                        <input type="password" name="password" lay-verify="pass" placeholder="请输入密码" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">常用邮箱</label>
                    <div class="layui-input-inline">
                        <input type="password" name="password" lay-verify="pass" placeholder="请输入密码" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">执业年限</label>
                    <div class="layui-input-inline">
                        <input type="password" name="password" lay-verify="pass" placeholder="请输入密码" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>
                </div>

                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">普通文本域</label>
                    <div class="layui-input-block">
                        <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                    </div>
                </div>
            </form>

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
