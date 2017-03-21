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
        .memver_c{margin-top: 15px;margin-bottom: 15px;}
        .c_left{width: 210px;float:left;}
        .member_menu{border: 1px solid #EEE;}
        .member_menu li{width: 100%;height:35px;line-height:35px;border-bottom: 1px solid #eee;}
        .member_menu li a{margin-left:20px;}
        .gonggao_title{margin: 15px 5px;}
        .gonggao{border: 1px solid #EEE;}
        .gonggao li{width: 100%;height:45px;line-height:45px;border-bottom: 1px solid #eee;}
        .gonggao li a{margin-left: 15px;}
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
            <p class="layui-elem-quote">完成个人资料</p>
            <form class="layui-form" action="" id="memberInfo">
                <div class="layui-form-item">
                    <label class="layui-form-label" style="margin-top: 80px;">个人头像</label>
                    <div class="layui-input-block">
                        <div class="site-demo-upload">
                            <img id="LAY_demo_upload" src="${member.headPortrait}" >
                            <div class="site-demo-upbar">
                                <input type="file" name="file" class="layui-upload-file" id="uploadHeadPortrait">
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="headPortrait" id="headPortrait" value="${member.headPortrait}">
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">个人名称</label>
                    <div class="layui-input-inline">
                        <input type="input" name="name" value="${member.name}"  placeholder="" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux"></div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">联系电话</label>
                    <div class="layui-input-inline">
                        <input type="input" name="mobile" value="${member.mobile}"  placeholder="" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux"></div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">QQ</label>
                    <div class="layui-input-inline">
                        <input type="input" name="qq"  value="${member.qq}"  placeholder="" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux"></div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">常用邮箱</label>
                    <div class="layui-input-inline">
                        <input type="input" name="email"  value="${member.email}"  placeholder="" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux"></div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">地址</label>
                    <div class="layui-input-inline">
                        <input type="input" name="address"  value="${member.address}"  placeholder="" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux"></div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">执业时间</label>
                    <div class="layui-input-inline">
                        <input type="input" id="workTime" name="workTime"  value="<fmt:formatDate value="${member.workTime}" pattern="yyyy-MM-dd" type="date" dateStyle="long" />" readonly="readonly" class="layui-input" onclick="layui.laydate({elem: this})">
                    </div>
                    <div class="layui-form-mid layui-word-aux"></div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">所属企业</label>
                    <div class="layui-input-inline">
                        <input type="input" name="input"  value="${member.companyName}"  readonly disabled autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux"><a href="member/company/list.html" class="ta1">修改所属企业</a></div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">个人介绍</label>
                    <div class="layui-input-block">
                        <textarea placeholder="请输入内容" name="description" class="layui-textarea">${member.description}</textarea>
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
    layui.use(['form', 'layedit', 'laydate','upload'], function(){
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
//            layer.alert(JSON.stringify(data.field), {
//                title: '最终的提交信息'
//            })
            $.ajax({
                type: "POST",
                url: "/member/updateInfo.json",
                data: $("#memberInfo").serialize(),
                dataType: "json",
                success: function(data){
                    if(data.flag) {
                        layer.alert("保存成功！");
                    }else {
                        layer.alert("保存失败！");
                    }
                }
            });
            return false;
        });

        layui.upload({
            url: '/fileUpload/upload.json'
            ,elem: '#uploadHeadPortrait' //指定原始元素，默认直接查找class="layui-upload-file"
            ,method: 'post' //上传接口的http类型
            ,success: function(data){
                console.log(data);
                if(data.flag) {
                    var path = "<%=basePath%>"+data.data.src;
                    LAY_demo_upload.src = path;
                    $("#headPortrait").val(path);
                }else {
                    layer.alert("头像上传失败！");
                }
            }
        });

    });


</script>


</body>
</html>
