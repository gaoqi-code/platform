<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<table class="layui-table" lay-skin="line">
    <colgroup>
        <col>
        <col width="150">
        <col width="100">
        <col width="80">
        <col width="100">
        <col width="120">
    </colgroup>
    <thead>
    <tr>
        <td>需求名称</td>
        <td>类型</td>
        <td>联系人</td>
        <td>联系电话</td>
        <td>地区</td>
        <td>发布日期</td>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${needs}" var="need" >
        <tr>
            <td><a href="/need/detail/${need.id}.html">${need.title}</a></td>
            <td>${need.className}</td>
            <td>${need.member.name}</td>
            <td>${need.member.mobile}</td>
            <td>北京市</td>
            <td><fmt:formatDate value="${need.updateTime != null ? need.updateTime:need.addTime}"   pattern="yyyy-MM-dd" type="date" dateStyle="long" /></td>
        </tr>

    </c:forEach>
    <c:if test="${empty needs}">
        <tr>
            <td colspan="6" style="text-align: center;">没有搜索到您的需求！</td>
        </tr>
    </c:if>
    </tbody>
</table>

   <input type="hidden" id="totalPages" value="${paging.totalPages}"/>
   <input type="hidden" id="currentPage" value="${paging.currentPage}"/>
