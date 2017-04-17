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
        .c_right{margin-left:10px;width: 958px;float: left;}
    </style>
</head>
<body>
<jsp:include page="../common/top_c.jsp"></jsp:include>
<jsp:include page="../common/nav_c.jsp"></jsp:include>
<div id="container">
    <div class="content memver_c">
        <jsp:include page="../common/left_c.jsp"></jsp:include>

        <div class="c_right">
            <p class="layui-elem-quote noborderLeft">添加新的企业</p>
            <form class="layui-form" action="" id="createCompany">
                <div class="layui-form-item">
                    <label class="layui-form-label"><span class="redColorClass">*</span>公司名称</label>
                    <div class="layui-input-inline">
                        <input type="input" lay-verify="required"  name="companyName" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux"></div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"><span class="redColorClass">*</span>简介</label>
                    <div class="layui-input-inline">
                        <input type="input" lay-verify="required"  name="summary" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux"></div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">联系电话</label>
                    <div class="layui-input-inline">
                        <input type="input" name="phone" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux"></div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"><span class="redColorClass">*</span>所在地区</label>
                    <div class="layui-input-inline">
                        <select  lay-verify="oneLevel" lay-filter="oneLevel" id="oneLevel">
                            <option value="">请选择</option>
                            <option value="1">北京</option>
                            <option value="2">天津</option>
                            <option value="3">湖北省</option>
                            <option value="3">黑龙江省</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"><span class="redColorClass">*</span>详细地址</label>
                    <div class="layui-input-inline">
                        <input type="input" lay-verify="required"  name="address" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux"></div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label" style="margin-top: 80px;">公司logo</label>
                    <div class="layui-input-block">
                        <div class="site-demo-upload">
                            <img id="LAY_demo_upload" src="" >
                            <div class="site-demo-upbar">
                                <input type="file" name="file" class="layui-upload-file" id="uploadImg">
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="logo" id="logo" value="" >
                </div>

                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">公司介绍</label>
                    <div class="layui-input-block">
                        <textarea placeholder="请输入内容" lay-verify="required"  name="introduce" class="layui-textarea"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="demo1">确定</button>
                    </div>
                </div>
            </form>

        </div>
        <div class="clear"></div>
    </div>
</div>
<script src="../plugins/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'layedit','upload'], function(){
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
            $.ajax({
                type: "POST",
                url: "/member/company/memberIsJoinCompany.json",
                dataType: "json",
                success: function(data){
                    if(data == 0) {
                        createCompany();
                    }
                    if(data == 1) {
                        layer.confirm("您已申请别的公司是否要继续创建此公司？", {
                            btn: ['确定','取消'] //按钮
                        }, function(index){
                            createCompany();
                        }, function(index){
                        });
                    }
                    if(data == 2) {
                        layer.confirm("您已经加入别的公司是否还要创建此公司？", {
                            btn: ['确定','取消'] //按钮
                        }, function(index){
                            createCompany();
                        }, function(index){
                        });
                    }
                }
            });
            return false;
        });

        
        function createCompany() {
            $.ajax({
                type: "POST",
                url: "/member/company/add.json",
                data: $("#createCompany").serialize(),
                dataType: "json",
                async:false,
                success: function(data){
                    console.log(data);
                    if(data) {
                        location.href = "/member/company/toSuccess.html";
                    }else {
                        layer.msg("创建失败！");
                    }
                }
            });
        }

        layui.upload({
            url: '/fileUpload/upload.json'
            ,elem: '#uploadImg' //指定原始元素，默认直接查找class="layui-upload-file"
            ,method: 'post' //上传接口的http类型
            ,success: function(data){
                if(data.flag) {
                    var path = data.data.src;
                    LAY_demo_upload.src = path;
                    $("#logo").val(path);
                }else {
                    layer.alert("图片上传失败！");
                }
            }
        });


    });
</script>
</body>
</html>
