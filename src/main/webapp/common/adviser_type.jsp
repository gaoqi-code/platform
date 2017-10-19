<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<select  lay-filter="oneLevel" lay-verify="required"  name="adviserType">
	<option value="">请选择</option>
	<option value="260-" <c:if test="${member.adviserType == '260-'}">selected=""</c:if> >法律服务</option>
	<option value="261-" <c:if test="${member.adviserType == '261-'}">selected=""</c:if> >金融服务</option>
	<option value="263-" <c:if test="${member.adviserType == '263-'}">selected=""</c:if> >品牌。营销。软件</option>
	<option value="266-" <c:if test="${member.adviserType == '266-'}">selected=""</c:if> >工商 商标 专利</option>
</select>



