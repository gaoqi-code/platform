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
        <th>公司名称</th>
        <th>所在地区</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${companys}" var="company" >
        <tr>
            <td>${company.companyName}</td>
            <td>${company.address}</td>
            <td><a href="javascript:void(0);"><button class="layui-btn layui-btn-small">申请加入</button></a></td>
        </tr>
    </c:forEach>

    <c:if test="${empty companys}">
        <tr>
            <th>公司名称</th>
            <th>所在地区</th>
            <th>操作</th>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center;">没有找到该企业，<a class="ta1" href="member/company_add.html">添加企业</a></td>
        </tr>
    </c:if>

    </tbody>
</table>
   <%--<input type="hidden" id="total" value="${paging.total}"/>--%>
   <input type="hidden" id="totalPages" value="${paging.totalPages}"/>
   <input type="hidden" id="currentPage" value="${paging.currentPage}"/>
   
 <script type="text/javascript">
 </script>