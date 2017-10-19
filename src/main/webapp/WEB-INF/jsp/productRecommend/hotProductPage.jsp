<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach items="${productRecommends}" var="productRecommend"  varStatus="status" >
<div class="mod-hotrecommend-card" data-csid="13216">
    <h6 class="serv"><a _stat_click_id="8_113216" href="/productRecommend/detail/${productRecommend.productId}.html" target="_blank">${productRecommend.productName}</a></h6>
    <p class="record"><span><a _stat_click_id="8_213216" href="/productRecommend/detail/${productRecommend.productId}.html" target="_blank">${productRecommend.summary}</a></span></p>
    <p class="provider">${productRecommend.memberName}&nbsp;
        <a _stat_click_id="8_413216" href="/seller/corpinfo?c_id=288394&amp;tab=1" target="_blank">
          ${productRecommend.memberCategoryName}
         </a>
        <a class="lv" href="/scenter/growth" target="_blank">执业${productRecommend.workAge}年</a></p>
    <div class="price">
        <p class="np"><i>¥</i>${productRecommend.realPrice}</p>
    </div>
    <a _stat_click_id="8_513216" href="/product/detail/${productRecommend.productId}.html" target="_blank" class="btn">查看详情</a>
</div>
</c:forEach>


<input type="hidden" id="totalPages" value="${paging.totalPages}"/>
<input type="hidden" id="currentPage" value="${paging.currentPage}"/>