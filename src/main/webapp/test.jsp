<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/plugins/layui/css/layui.css"  media="all">
</head>
<body>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>设定上传文件的格式</legend>
</fieldset>

<input type="file" name="file" class="layui-upload-file">
<input type="file" name="file1" lay-type="file" class="layui-upload-file">
<input type="file" name="file1" lay-type="audio" class="layui-upload-file">
<input type="file" name="file2" lay-type="video" class="layui-upload-file">
<blockquote class="layui-elem-quote" style="margin-top: 20px;">支持拖动文件上传</blockquote>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
    <legend>演示上传</legend>
</fieldset>

<div class="site-demo-upload">
    <div class="site-demo-upbar">
        <input type="file" name="file" class="layui-upload-file" id="test">
    </div>
</div>



<input type="file" name="file">


<script src="/plugins/layui/layui.js" charset="utf-8"></script>
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
//                LAY_demo_upload.src = res.url;
            }
        });
    });
</script>

</body>
</html>
