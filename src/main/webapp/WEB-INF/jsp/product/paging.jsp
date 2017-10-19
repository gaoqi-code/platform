<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<ul>
    <li>产品图片</li>
    <li>产品标题</li>
    <li>类目</li>
    <li>状态</li>
    <li>更新时间</li>
    <li>操作</li>
</ul>

            <c:forEach items="${products}" var="product" >
                <ul>
                    <li><img src="${product.picture}" style="width:100px;"> </li>
                    <li><a href="product/detail/${product.id}.html" target="_blank">${product.title}</a></li>
                    <li>${product.className}</li>
                    <li >
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
                        <c:if test="${product.status == 7}">
                            关闭
                        </c:if>
                    </li>
                    <li> <fmt:formatDate value="${product.updateTime != null ? product.updateTime:product.addTime}"   pattern="yyyy-MM-dd hh:mm:ss" type="date" dateStyle="long" /></li>
                    <li>
                        <a href="javascript:void(0);" productId="${product.id}" name="operation" op="update">修改</a>&nbsp;
                        <c:if test="${product.status != 6}">    <a href="javascript:void(0);" productId="${product.id}" name="operation" op="soldOut">下架</a></c:if>&nbsp;
                        <a href="javascript:void(0);" productId="${product.id}" name="operation" op="delete">删除</a>
                    </li>
                </ul>
            </c:forEach>
            <c:if test="${empty products}">
                <ul>
                    <li colspan="6" style="text-align: center;">您还没有创建产品！</li>
                </ul>
            </c:if>



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