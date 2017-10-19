<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        .memver_c{margin-bottom: 15px;}
        .member_menu li{width: 100%;height:35px;line-height:35px;border-bottom: 1px solid #eee;}
        .member_menu li a{margin-left:20px;}
        .gonggao_title{margin: 15px 5px;}
        .gonggao{border: 1px solid #EEE;}
        .gonggao li{width: 100%;height:45px;line-height:45px;border-bottom: 1px solid #eee;}
        .gonggao li a{margin-left: 15px;}

        .list_right {
            position: relative;
            padding-left: 15px;
            float: left;
            width: 990px;
            px;
            height: 700px;
            margin-top: 15px;
            margin-left: 10px;
        }

        .list_right p {
            color: #333;
            height: 40px;
            width: 500px;
            position: relative;
        }

        .list_right p textarea {
            position: absolute;
            bottom: 6px;
            left: 165px;
            border-radius: 5px;
            border: 1px solid #fff;
            width: 80%;
            min-height: 10px;
            height: auto;
            resize: vertical;
        }

        .list_right p .img5 {
            width: 15px;
            height: 15px;
            margin-top: -2px;
        }

        .list_right p textarea:hover {
            border: 1px solid #D2D2D2;
        }

        .list_right p span:nth-of-type(1) {
            display: inline-block;
            width: 90px;
            text-align: right;
            padding-left: 75px;
        }

        .list_right p span:nth-of-type(3) {
            padding-left: 10px;
            color: #35d326;
        }

        .list_right .p_1 {
            width: 100%;
            position: relative;
        }

        .list_right .p_1 span:nth-of-type(1) {
            padding-left: 30px;
            width: 65px;
            color: #000;
            font-size: 16px;
        }

        .list_right .p_1 span:nth-of-type(2) {
            position: absolute;
            right: 2px;
            color: #35d326;
            font-size: 14px;
        }

        .list_right .huantou {
            position: absolute;
            right: 80px;
            top: 30px;
            padding: 25px;
            width: 200px;
            height: 200px;
        }

        .list_right .huantou img {
            width: 100%;
            height: 100%;
            border-radius: 50%;
        }

        .list_right .huantou button {
            position: relative;
            right: -50px;
            top: -120px;
            width: 100px;
            height: 40px;
            color: #349DCD;
            background: 0;
            font-size: 16px;
            border: 1px solid #349DCD;
        }

        .list_right .liebiao {
            width: 90%;
            margin-top: 20px;
            margin-left: 90px;
            border: 1px solid #cdccca;
            border-bottom: 0;
        }

        .list_right ul {
            height: 40px;
            line-height: 40px;
            border-bottom: 1px solid #cdccca;
        }

        .list_right ul:nth-of-type(1) {
            background: #e9e8e6;
        }

        .list_right ul li {
            color: #333333;
            text-align: center;
            float: left;
            width: 158px;
            height: 40px;
        }

        .list_right .geng {
            height: 80px;
            line-height: 80px;
        }

        .list_right .geng li {
            height: 80px;
            line-height: 80px;
            font-size: 14px;
            color: #888888;
            padding: 0px 319px;
        }

        .list_right .li1,
        .list_right .span1 {
            color: #35D326;
        }

        .list_right .span2 {
            color: #db2d44;
        }
    </style>
</head>
<body>
<jsp:include page="../common/top_c.jsp"></jsp:include>
<jsp:include page="../common/nav_c.jsp"></jsp:include>
<div id="container">
    <div class="content memver_c">
        <jsp:include page="../common/left_c.jsp"></jsp:include>

        <div class="c_right">
            <div class="list_right">
                <p class="p_1"><span>我的信息</span></p>
                <p><span>个人名称：</span><span>${member.name}</span></p>
                <p><span>性别：</span>
                    <span>
                        <c:if test="${member.sex =='male'}">男</c:if>
                        <c:if test="${member.sex =='female'}">none</c:if>
                        <c:if test="${member.sex =='none'}">未填写</c:if>
                    </span>
                </p>
                <p><span>联系电话：</span><span>${member.mobile}</span><span>(登录账号)</span></p>
                <p><span>QQ：</span><span>${member.qq}</span></p>
                <p><span>常用邮箱：</span><span>${member.email}</span></p>
                <p><span>区域：</span><span>${member.areaFullName}</span></p>
                <p><span>地址：</span><span>${member.address}</span></p>
                <p><span>个人介绍：</span> <span >${member.description}</span></p>
                <%--<p class="p_1"><span>需求列表</span></p>--%>
                <div class="huantou">
                    <img src="${member.headPortrait}" />
                    <%--<button>+ 更换图片</button>--%>
                </div>
                <%--<div class="liebiao">--%>
                    <%--<ul>--%>
                        <%--<li>需求标题</li>--%>
                        <%--<li>类目</li>--%>
                        <%--<li>状态</li>--%>
                        <%--<li>更新时间</li>--%>
                        <%--<li>操作</li>--%>
                    <%--</ul>--%>
                    <%--<ul>--%>
                        <%--<li>房贷</li>--%>
                        <%--<li>抵押贷款</li>--%>
                        <%--<li class="li1">审核成功</li>--%>
                        <%--<li>2017-05-17 05:04:37</li>--%>
                        <%--<li><span class="span1"> 修改 </span> &nbsp; <span> 下架 </span> &nbsp; <span class="span2"> 修改 </span></li>--%>
                    <%--</ul>--%>
                    <%--<ul class="geng">--%>
                        <%--<li>+ 更多</li>--%>
                    <%--</ul>--%>
                <%--</div>--%>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>

<script src="../plugins/layui/layui.js" charset="utf-8"></script>
<script>
    $(function () {
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
                ,qq: function(value){
                    if(value!=null&&value.length>0&&isNaN(value)){
                        return "请输入正确的QQ号";
                    }
                }
                ,content: function(value){
                    layedit.sync(editIndex);
                }
            });


            //监听提交
            form.on('submit(demo1)', function(data){

                var areaCode = $("#oneLevel").val()+"-";
                var twoLevel = $("#twoLevel").val();
                var threeLevel = $("#threeLevel").val();
                if(twoLevel) {
                    areaCode += twoLevel + "-";
                }
                if(threeLevel) {
                    areaCode += threeLevel + "-";
                }
                $("#areaCode").val(areaCode);
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
                url: 'http://image.qibaba.cn/fileUpload/iframeCrossOriginUpload/master.html'
                ,elem: '#uploadHeadPortrait' //指定原始元素，默认直接查找class="layui-upload-file"
                ,method: 'post' //上传接口的http类型
                ,success: function(data){
                    console.log(data);
                    if(data.flag) {
                        var path = data.data.src;
                        LAY_demo_upload.src = path;
                        $("#headPortrait").val(path);
                    }else {
                        layer.alert("头像上传失败！");
                    }
                }
            });

            form.on('select(selectArea)', function(data) {
                var oldDom = data.elem;
                var selectVal = data.value;
                var areaCode = $("#areaCode1").val();
                if (selectVal != areaCode) {
                    $("#areaCode1").val(selectVal)
                } else {
                    return;
                }
                var level = $(oldDom).attr("id");
                if (level != "threeLevel") {
                    $.ajax({
                        type: "POST",
                        url: "/area/getSonAreas.json",
                        data: {parentId: selectVal},
                        dataType: "json",
                        async: false,
                        success: function (data) {
                            if (data.flag) {
                                var content = '<option value="">请选择</option>';
                                var pleaseSelect = content;
                                data.areas.forEach(function (item, index) {
                                    content += '<option value="' + item.id + '">' + item.name + '</option>';
                                });
                                if (level == "oneLevel") {
                                    $("#twoLevel").html(content);
                                    $("#threeLevel").html(pleaseSelect);
                                } else {
                                    $("#threeLevel").html(content);
                                }
                                form.render('select');
                            } else {
                                layer.msg("区域加载失败！");
                            }
                        }
                    });
                }
            });

            $("#updateCompany").click(function () {
                layer.confirm("跳转到关联企业请先保存编辑的个人信息，否则将丢失！", {
                    btn: ['确定','取消'] //按钮
                }, function(index){
                    location.href="member/company/list.html";
                }, function(index){
                });

            });
        });
    });

</script>


</body>
</html>
