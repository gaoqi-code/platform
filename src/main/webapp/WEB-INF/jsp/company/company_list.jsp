<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/common/global.jsp" %>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
    <title>企巴巴</title>
    <jsp:include page="../common/css_c.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="/css/store.css" />
    <link rel="stylesheet" href="../plugins/layui/css/global.css">
    <link rel="stylesheet" href="../">
</head>
<body>
<jsp:include page="../common/top_c2.jsp"></jsp:include>
<div>
    <div class="content memver_c">
        <jsp:include page="../common/left_c_adviser.jsp"></jsp:include>

        <div class="c_right" style="width: 930px;padding-top: 15px;">
            <p class="layui-elem-quote noborderLeft">关联企业</p>
            <c:if test="${member.companyId != null}">
                <blockquote class="layui-elem-quote layui-quote-nm">
                    已关联到企业：${member.companyName}
                    【<span class="redColorClass">
                    <c:if test="${member.checkStatus == 3}">正在审核中</c:if>
                    <c:if test="${member.checkStatus == 4}">已经审核通过</c:if>
                    <c:if test="${member.checkStatus == 5}">审核未通过</c:if>
                    </span>】
                    <br />关联时间： <fmt:formatDate value="${member.relateCompanyDate}"   pattern="yyyy-MM-dd" type="date" dateStyle="long" />
                </blockquote>
            </c:if>
            <div class="layui-form-item">
                <label class="layui-form-label" style="width: auto;top: 4px;">企业名称</label>
                <div class="layui-input-block" style="margin-left:0px;">
                    <input id ="companyName" style="width: 150px;display: inline;position: relative;top: 2px;" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入企业名称" class="layui-input">
                    <button class="layui-btn" id="seek">搜索</button>
                </div>
            </div>

            <div class="layui-form" id="dataMsg">



            </div>

            <div id="productPager"></div>
        </div>
        <div class="clear"></div>
    </div>
</div>

<script>
    $(function () {
        layui.use(['laypage', 'layer'], function(){
            var laypage = layui.laypage
                    ,layer = layui.layer;
        //以下将以jquery.ajax为例，演示一个异步分页
        var pageSize = 5;
        function paging(curr){
                $.ajax({
                    type: "POST",
                    url: "/member/company/page.html",
                    data: {
                        companyName :$("#companyName").val(),
                        currentPage :curr || 1,
                        pageSize : pageSize
                    },
                    success: function(data){
                        $("#dataMsg").html(data);
                        var totalPages = $("#totalPages").val();
                        //显示分页
                        laypage({
                            cont: 'productPager', //容器。值支持id名、原生dom对象，jquery对象。【如该容器为】：<div id="page1"></div>
                            pages: totalPages, //通过后台拿到的总页数
                            curr: curr || 1, //当前页
                            groups: 5 ,//连续显示分页数
                            jump: function(obj, first){ //触发分页后的回调
                                if(!first){ //点击跳页触发函数自身，并传递当前页：obj.curr
                                    paging(obj.curr);
                                }
                            }
                        });
                    }
                });
            };
        //运行
        paging();
            $("#seek").click(function () {
                paging();
            });
        });
    })

</script>
</body>
</html>
