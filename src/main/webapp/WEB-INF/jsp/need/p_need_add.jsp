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
        .site-demo-upload, .site-demo-upload img{border-radius:0;}
    </style>
</head>
<body>
<jsp:include page="../common/top_c.jsp"></jsp:include>
<jsp:include page="../common/nav_c.jsp"></jsp:include>
<div id="container">
    <div class="content memver_c">
        <jsp:include page="../common/left_c.jsp"></jsp:include>

        <div class="c_right">
            <p class="layui-elem-quote noborderLeft">发布新需求</p>
            <form class="layui-form" action="" id="needForm">
                <input type="hidden" name="id" value="${need.id}">
                <div class="layui-form-item">
                    <label class="layui-form-label"><span class="redColorClass">*</span>需求名称</label>
                    <div class="layui-input-inline">
                        <input type="input" name="title" lay-verify="required"  value="${need.title}" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux"></div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"><span class="redColorClass">*</span>联系方式</label>
                    <div class="layui-input-inline">
                        <input type="input" name="needMobile" lay-verify="phone"  value="${need.needMobile == null ? need.member.mobile : need.needMobile}" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux"></div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"><span class="redColorClass">*</span>截止时间</label>
                    <div class="layui-input-inline">
                        <input type="input" name="endTime" lay-verify="required"  value="<fmt:formatDate value="${need.endTime}" pattern="yyyy-MM-dd" type="date" dateStyle="long" />" readonly="readonly" class="layui-input" onclick="layui.laydate({elem: this, min: laydate.now(0)})">
                    </div>
                    <div class="layui-form-mid layui-word-aux"></div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">需求类型</label>
                    <div class="layui-input-inline">
                        <select  lay-filter="oneLevel" lay-verify="required"  id="oneLevel">
                            <option value="">请选择</option>
                            <c:forEach items="${oneLevelCategories}" var="category">
                                <option value="${category.id}" <c:if test="${category.id == selectClass.oneLevel}">selected=""</c:if>  >${category.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="layui-input-inline">
                        <select  lay-filter="twoLevel" id="twoLevel">
                            <option value="">请选择</option>
                            <%--<option value="宁波"selected="" disabled="">宁波</option>--%>
                            <c:forEach items="${twoLevelCategories}" var="category">
                                <option value="${category.id}" <c:if test="${category.id == selectClass.twoLevel}">selected=""</c:if> >${category.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="layui-input-inline">
                        <select lay-filter="threeLevel" id="threeLevel">
                            <option value="">请选择</option>
                            <c:forEach items="${threeLevelCategories}" var="category">
                                <option value="${category.id}" <c:if test="${category.id == selectClass.threeLevel}">selected=""</c:if> >${category.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <input type="hidden" id="classId" name ="classId" value="${need.classId}" >
                </div>

                <div class="layui-form-item" id="attrbute">
                    <c:forEach items="${attributes}" var="attribute" varStatus="status">
                        <label class="layui-form-label">${attribute.name}</label>
                        <div class="layui-input-inline">
                            <input type="hidden" name="attributes[${status.index}].classId" value="${attribute.id}">
                            <input type="hidden" name="attributes[${status.index}].name" value="${attribute.name}">
                            <input type="input" lay-verify="required"  name="attributes[${status.index}].value" value="${attribute.value}" autocomplete="off" class="layui-input">
                        </div>
                    </c:forEach>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">需求简介</label>
                    <div class="layui-input-block">
                        <textarea placeholder="请输入内容" lay-verify="required"  name="content" class="layui-textarea">${need.content}</textarea>
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
            $.ajax({
                type: "POST",
                url: "/member/need/add.json",
                data: $("#needForm").serialize(),
                dataType: "json",
                async:false,
                success: function (data) {
                    if (data) {
                        location.href = "/member/need/toSuccess.html";
                    } else {
                        layer.msg("发布失败！");
                    }
                }
            });
            return false;
        });

        form.on('select', function(data){
            var oldDom = data.elem;
            var selectVal = data.value;
            var classId = $("#classId").val();
            if(selectVal != classId) {
                $("#classId").val(selectVal)
            }else{
                return;
            }
            var level = $(oldDom).attr("id");
            if(level != "threeLevel") {
                $.ajax({
                    type: "POST",
                    url: "/category/getSonCategory.json",
                    data: {parentId:selectVal},
                    dataType: "json",
                    async:false,
                    success: function (data) {
                        if (data.flag) {
                            var content = '<option value="">请选择</option>';
                            var qingxuanze = content;
                            data.categorys.forEach(function(item,index) {
                                content += '<option value="'+item.id+'">'+item.name+'</option>';
                            });
                            if(level == "oneLevel") {
                                $("#twoLevel").html(content);
                                $("#threeLevel").html(qingxuanze);
                            }else {
                                $("#threeLevel").html(content);
                            }
                            form.render('select');
                        } else {
                            layer.msg("类目加载失败！");
                        }
                    }
                });
            }
            $.ajax({
                type: "POST",
                url: "/category/getAttribute.json",
                data: {categoryId:selectVal},
                dataType: "json",
                success: function (data) {
                    var html = '';
                    if (data) {
//                            var size = data.length + 1;
//                            var  lineFeed;
                        data.forEach(function(item,index){
                            html += '<label class="layui-form-label">' + item.name + '</label>';
                            html += '<div class="layui-input-inline">';
                            html += '   <input type="hidden" name="attributes[' + index + '].classId" value="' + item.classId + '">';
                            html += '   <input type="hidden" name="attributes[' + index + '].name" value="' + item.name + '">';
                            html += '   <input type="input" lay-verify="required"  name="attributes[' + index + '].value"  autocomplete="off" class="layui-input attribute">';
                            html += '</div>';
//                                lineFeed = index + 1;
//                                if(lineFeed != size && lineFeed % 3 == 0) {
//                                    html += ' </div><div class="layui-form-item">';
//                                }
                        });
                    }
                    $("#attrbute").html(html);
                }
            });
        });
    });
</script>
</body>
</html>
