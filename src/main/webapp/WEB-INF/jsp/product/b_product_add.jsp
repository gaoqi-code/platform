<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String basePath = request.getScheme() + "://"
            + request.getServerName();
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>我的店铺</title>
    <base href="<%=basePath%>">
    <jsp:include page="../common/css_c.jsp"></jsp:include>
    <script type="text/javascript" src="/js/jquery-1.9.1.js"></script>
    <link rel="stylesheet" type="text/css" href="/plugins/layui/css/global.css" />
    <link rel="stylesheet" type="text/css" href="/css/store.css" />
    <script type="text/javascript" src="/plugins/layui/layui.js"></script>
    <script type="text/javascript" src="../js/scrooll.js"></script>

</head>

<body>
<!--头部-->
<jsp:include page="../common/top_c2.jsp"></jsp:include>
<!--xian-->
<div class="content">
    <jsp:include page="../common/left_c_adviser.jsp"></jsp:include>

   <jsp:include page="/member/userInfo.html"></jsp:include>	


    <div id="container">
        <div class="location">
            您当前位置：
            <a href="/index.html">企巴巴</a> &gt;&gt;
            <a href="javascript:void(0);" class="defaultCursor">个人中心</a> &gt;&gt;
            <a href="javascript:void(0);" class="defaultCursor">我的店铺</a>
        </div>
    </div>
    <div class="form">
        <form class="layui-form" action="" id="productForm">
            <input type="hidden" name="id" value="${product.id}">
            <div class="layui-form-item">
                <label class="layui-form-label"><span class="redColorClass">*</span>产品名称</label>
                <div class="layui-input-inline">
                    <input type="input" name="title" value="${product.title}" lay-verify="title" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><span class="redColorClass">*</span>简介</label>
                <div class="layui-input-inline">
                    <input type="input" name="summary" value="${product.summary}" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">市场价</label>
                <div class="layui-input-inline">
                    <input type="text" name="marketPrice" lay-verify="marketPrice" value="${product.marketPrice}" autocomplete="off" placeholder="请输入市场价" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">促销价</label>
                <div class="layui-input-inline">
                    <input type="text" name="realPrice" lay-verify="realPrice" value="${product.realPrice}" autocomplete="off" placeholder="请输入促销价" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label"><span class="redColorClass">*</span>产品类型</label>
                <div class="layui-input-inline">
                    <select  lay-verify="oneLevel" lay-filter="oneLevel" id="oneLevel">
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
                <input type="hidden" id="classId" name ="classId" value="${product.classId}" >
            </div>


            <div class="layui-form-item">
                <label class="layui-form-label" style="margin-top: 80px;">产品图片</label>
                <div class="layui-input-block">
                    <div class="site-demo-upload">
                        <img id="LAY_demo_upload" src="${product.picture}" >
                        <div class="site-demo-upbar">
                            <input type="file" name="file" class="layui-upload-file" id="uploadImg">
                        </div>
                    </div>
                </div>
                <input type="hidden" name="picture" id="picture" value="${product.picture}">
            </div>




            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">产品介绍</label>
                <div class="layui-input-block">
                    <textarea class="layui-textarea layui-hide" name="content" lay-verify="content" id="LAY_demo_editor">${product.content}</textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                </div>
            </div>
        </form>
    </div>
</div>
<div class="clear"></div>

</div>
<!--content-->

<!--页脚-->
<jsp:include page="../common/bottom.jsp"></jsp:include>
<!--bottomCss-->
</body>
<script src="/plugins/layui/layui.js" charset="utf-8"></script>
<script>
    $(function () {
        layui.use(['form', 'layedit', 'laydate','upload'], function(){
            var form = layui.form()
                    ,layer = layui.layer
                    ,layedit = layui.layedit
                    ,laydate = layui.laydate;

            layedit.set({
                uploadImage: {
                    url: 'http://image.qibaba.cn/fileUpload/iframeCrossOriginUpload/master.html' //接口url
                    ,type: 'post' //默认post
                }
            });
            //创建一个编辑器
            var editIndex = layedit.build('LAY_demo_editor');

            //自定义验证规则
            form.verify({
                title: function(value){
                    if(value.length < 3){
                        return '产品名称至少得5个字符！';
                    }
                },
                oneLevel: function(value){
                    if(value.length < 1){
                        return '请选择产品类型！';
                    }
                }
                ,content: function(value){
                    layedit.sync(editIndex);
                }
            });


            //监听提交
            form.on('submit(demo1)', function(data){
                $.ajax({
                    type: "POST",
                    url: "/member/product/add.json",
                    data: $("#productForm").serialize(),
                    dataType: "json",
                    success: function (data) {
                        if (data) {
//                            location.href = "/member/product/toSuccess.html";
                            layer.confirm("您已发布成功！", {
                                btn: ['确定','关闭'] //按钮
                            }, function(index){
                                location.reload();
                            });
                        } else {
                            layer.msg("发布失败！");
                        }
                    }
                });
                return false;
            });

            layui.upload({
                url: 'http://image.qibaba.cn/fileUpload/iframeCrossOriginUpload/master.html'
                ,elem: '#uploadImg' //指定原始元素，默认直接查找class="layui-upload-file"
                ,method: 'post' //上传接口的http类型
                ,success: function(data){
                    if(data.flag) {
                        var path = data.data.src;
                        LAY_demo_upload.src = path;
                        $("#picture").val(path);
                    }else {
                        layer.alert("图片上传失败！");
                    }
                }
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
                                data.categorys.forEach(function(item,index) {
                                    content += '<option value="'+item.id+'">'+item.name+'</option>';
                                });
                                if(level == "oneLevel") {
                                    $("#twoLevel").html(content);
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
            });

        });
    })
</script>
</html>