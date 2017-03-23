<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<table class="layui-table" lay-skin="line">
    <colgroup>
        <col width="150">
        <col width="150">
        <col width="150">
        <col width="200">
        <col></colgroup>
    <col width="150">
    <thead>
    <tr>
        <th>产品标题</th>
        <th>类目</th>
        <th>状态</th>
        <th>更新时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
            <c:forEach items="${products}" var="product" >
                <tr>
                    <td>${product.title}</td>
                    <td>${product.className}</td>
                    <td >
                        <c:if test="${product.status == 3}">
                            审核中
                        </c:if>
                        <c:if test="${product.status == 4}">
                            审核成功
                        </c:if>
                        <c:if test="${product.status == 5}">
                           审核失败
                        </c:if>
                        <c:if test="${product.status == 6}">
                            下架
                        </c:if>
                    </td>
                    <td> <fmt:formatDate value="${product.updateTime != null ? product.updateTime:product.addTime}"   pattern="yyyy-MM-dd" type="date" dateStyle="long" /></td>
                    <td>
                        <a href="javascript:void(0);" productId="${product.id}" name="operation" op="update">修改</a>&nbsp;
                        <c:if test="${product.status != 6}">    <a href="javascript:void(0);" productId="${product.id}" name="operation" op="soldOut">下架</a></c:if>&nbsp;
                        <a href="javascript:void(0);" productId="${product.id}" name="operation" op="delete">删除</a>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty products}">
                <tr>
                    <td colspan="4" style="text-align: center;">您还没有创建产品！</td>
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
             var productId = thisObj.attr("productId");
             if(operation == "update") {
                 location.href = "/member/product/toAdd/"+productId+".html";
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
                     url: "/member/product/operation.json",
                     data: {id:productId,status:status},
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