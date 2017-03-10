<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/plugins/layui/css/layui.css"  media="all">
</head>
<body>
<input type="file" name="file"  class="layui-upload-file" id="test">

<form enctype="multipart/form-data" action="/fileUpload/upload.json" method="post">
    <input type="file" name="file">
    <input type="submit" value="666" >
</form>

<form name="userForm2" action="/fileUpload/upload.json" enctype="multipart/form-data" method="post">
<div id="newUpload2">
    <input type="file" name="file">
</div>
<input type="button" id="btn_add2" value="增加一行" >
<input type="submit" value="上传" >


</form>
<script src="/plugins/layui/layui.js" charset="utf-8"></script>
<script>

    layui.use('upload', function(){
        layui.upload({
            url: '/fileUpload/upload/fds.json'
            ,elem: '#test' //指定原始元素，默认直接查找class="layui-upload-file"
            ,method: 'post' //上传接口的http类型
            ,success: function(res){
                alert(res);
//                LAY_demo_upload.src = res.url;
            }
        });
    });
</script>
</body>
</html>
