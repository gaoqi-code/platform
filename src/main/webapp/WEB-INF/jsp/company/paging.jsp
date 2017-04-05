<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<table class="layui-table" lay-skin="line">
    <colgroup>
        <col></colgroup>
    <col width="150">
    <col width="100">
    <thead>
    <tr>
        <th class="textLeft">公司名称</th>
        <th>所在地区</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${companys}" var="company" >
        <tr>
            <td class="textLeft">${company.companyName}</td>
            <td>${company.address}</td>
            <td><a href="javascript:void(0);"><button name="applyFor" companyId="${company.id}" class="layui-btn layui-btn-small">申请加入</button></a></td>
        </tr>
    </c:forEach>

    <c:if test="${empty companys}">
        <tr>
            <td colspan="3" style="text-align: center;">没有找到该企业，<a class="ta1" href="/member/company/toAdd.html">添加企业</a></td>
        </tr>
    </c:if>

    </tbody>
</table>
   <%--<input type="hidden" id="total" value="${paging.total}"/>--%>
   <input type="hidden" id="totalPages" value="${paging.totalPages}"/>
   <input type="hidden" id="currentPage" value="${paging.currentPage}"/>
   
 <script type="text/javascript">
     $(function () {
         $("button[name='applyFor']").click(function() {
             var companyId = $(this).attr("companyId");

                 $.ajax({
                     type: "POST",
                     url: "/member/company/memberIsJoinCompany.json",
                     data: {id:companyId},
                     dataType: "json",
                     success: function(data){
                         var msg ;
                         if(data == 0) {
                             msg = "您确定要申请加入吗？";
                         }
                         if(data == 1) {
                             msg = "您已申请别的公司是否要继续申请此公司？";
                         }
                         if(data == 2) {
                             msg = "您已经加入别的公司是否还要申请此公司？";
                         }
                         if(data == 3) {
                             layer.alert("您已申请此公司!");
                             return;
                         }
                         dialog(msg,companyId);
                     }
                 });
         });
         function dialog(msg,companyId) {
             layer.confirm(msg, {
                 btn: ['确定','取消'] //按钮
             }, function(index){
                 layer.close(index);
                 $.ajax({
                     type: "POST",
                     url: "/member/company/add.json",
                     data: {id:companyId},
                     dataType: "json",
                     success: function(data){
                         if(data) {
                             location.href = "/member/company/toSuccess.html";
                         }else {
                             layer.msg("申请失败！");
                         }
                     }
                 });
             }, function(index){
             });
         }
     });

 </script>