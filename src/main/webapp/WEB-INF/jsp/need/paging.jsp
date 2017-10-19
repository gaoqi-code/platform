<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<table class="layui-table" lay-skin="line">
    <colgroup>
        <col width="300">
        <col width="150">
        <col width="120">
        <col width="200">
        <col></colgroup>
    <col width="150">
    <thead>
    <tr>
        <th>需求标题</th>
        <th>类目</th>
        <th>状态</th>
        <th>更新时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
            <c:forEach items="${needs}" var="need" >
                <tr>
                    <td>${need.title}</td>
                    <td>${need.className}</td>
                    <td class="status">
                    <c:if test="${need.status == 3}">
                        审核中
                    </c:if>
                    <c:if test="${need.status == 4}">
                        审核成功
                    </c:if>
                    <c:if test="${need.status == 5}">
                        审核失败
                    </c:if>
                    <c:if test="${need.status == 6}">
                        下架
                    </c:if>
                    <c:if test="${need.status == 7}">
                        关闭
                    </c:if>
                    </td>
                    <td> <fmt:formatDate value="${need.updateTime != null ? need.updateTime:need.addTime}"   pattern="yyyy-MM-dd hh:mm:ss" type="date" dateStyle="long" /></td>
                    <td>
                        <a href="javascript:void(0);" class="status" needId="${need.id}" name="operation" op="update">修改</a>&nbsp;
                        <c:if test="${need.status != 6}">    <a href="javascript:void(0);" needId="${need.id}" name="operation" op="soldOut">下架</a> </c:if>&nbsp;
                        <a href="javascript:void(0);" class="status2" needId="${need.id}" name="operation" op="delete">删除</a>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty needs}">
                <tr>
                    <td colspan="5" style="text-align: center;">您还没有创建需求！</td>
                </tr>
            </c:if>
    </tbody>
</table>


   <input type="hidden" id="totalPages" value="${paging.totalPages}"/>
   <input type="hidden" id="currentPage" value="${paging.currentPage}"/>
   
 <script type="text/javascript">
     $(function () {
         $("a[name='operation']").click(function() {
             var thisObj = $(this);
             var operation = thisObj.attr("op");
             var needId = thisObj.attr("needId");
             if(operation == "update") {
                 location.href = "/member/need/toAdd/"+needId+".html";
                 return;
             }
             var hint = "";
             var status;
             if(operation == "soldOut") {
                 hint = "您确定要下架吗？";
                 status = 6;
             }
             if(operation == "delete") {
                 hint = "您确定要删除吗？";
                 status = 2;
             }

             layer.confirm(hint, {
                 btn: ['确定','取消'] //按钮
             }, function(index){
                 $.ajax({
                     type: "POST",
                     url: "/member/need/operation.json",
                     data: {id:needId,status:status},
                     dataType: "json",
                     success: function(data){
                         layer.close(index);
                         if(data) {
                             if(status == 6) {
                                 thisObj.parents("tr").children().eq(2).html("下架");
                                 thisObj.hide();
                             }
                             if(status == 2) {
                                 thisObj.parents("tr").remove();
                             }
                         }else {
                             layer.msg("操作失败！");
                         }
                     }
                 });
             }, function(index){
//                 layer.close(index);
             });
         });
     });

 </script>