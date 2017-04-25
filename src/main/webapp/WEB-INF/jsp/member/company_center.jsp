<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="/plugins/layui/css/layui.css">
<script src="/plugins/layui/layui.js" charset="utf-8"></script>
            <div class="member_info">
                <div class="p_icon"><img src="${member.headPortrait}" /></div>
                <div class="member_info_font">
                    <p><span class="x_m">${member.name}</span>
                        <span>
                        <c:if test="${member.level == 1}">普通顾问</c:if>
                        <c:if test="${member.level == 2}">金牌顾问</c:if>
                        </span></p>
                    <p class="memberTitle">${member.companyName}</p>
                    <p class="member_jieshao" style="line-height: 28px;">${member.description}</p>
                    <a href="/adviser/detail/${member.id}.html"><button class="layui-btn" lay-submit="" lay-filter="demo1">查看店铺</button></a>
                </div>
                <div class="clear"></div>
            </div>
            <p class="layui-elem-quote noborderLeft">商机推荐</p>
            <div class="layui-form" id="dataMsg">
                <%--<table class="layui-table" lay-skin="line">--%>
                    <%--<colgroup>--%>
                        <%--<col width="260">--%>
                        <%--<col width="110">--%>
                        <%--<col width="120">--%>
                        <%--<col width="200">--%>
                        <%--<col>--%>
                    <%--</colgroup>--%>
                    <%--<tr>--%>
                        <%--<th>需求名称</th>--%>
                        <%--<th>联系人</th>--%>
                        <%--<th>联系电话</th>--%>
                        <%--<th>所在地区</th>--%>
                        <%--<th>发布时间</th>--%>
                    <%--</tr>--%>
                    <%--<c:forEach items="${counselors}" var="member">--%>
                        <%--<tr>--%>
                            <%--<td>周先生申请100万元贷款</td>--%>
                            <%--<td>${member.name}</td>--%>
                            <%--<td>1560018****</td>--%>
                            <%--<td>北京-北京市-东城区</td>--%>
                            <%--<td><fmt:formatDate value="${member.addTime}"   pattern="yyyy-MM-dd" type="date" dateStyle="long" /></td>--%>
                            <%--&lt;%&ndash;<td>${member.description}</td>&ndash;%&gt;--%>
                        <%--</tr>--%>
                    <%--</c:forEach>--%>
                <%--</table>--%>
            </div>
            <div id="pager"></div>
<script type="text/javascript">

    layui.use(['laypage', 'layer'], function(){
        var laypage = layui.laypage
            ,layer = layui.layer;
        //以下将以jquery.ajax为例，演示一个异步分页
        var pageSize = 5;
        function paging(curr){
            $.ajax({
                type: "POST",
                url: "/member/need/memberNeedPage.html",
                data: {
                    currentPage :curr || 1,
                    pageSize : pageSize
                },
                success: function(data){
                    $("#dataMsg").html(data);
                    var totalPages = $("#totalPages").val();
                    //显示分页
                    laypage({
                        cont: 'pager', //容器。值支持id名、原生dom对象，jquery对象。【如该容器为】：<div id="page1"></div>
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
    });
</script>