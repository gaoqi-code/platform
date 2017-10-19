<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<ul >


        <li>需求名称</li>
        <li>类型</li>
        <li>联系人</li>
        <li>联系电话</li>
        <li>地区</li>
        <li>发布日期</li>
</ul>



    <c:forEach items="${needs}" var="need"  >

        <ul>
            <li>${fn:substring(need.title,0,8)}</li>
            <li> <c:if test="${need.className !=null }">
                ${fn:substring(need.className,0,4)}
            </c:if><c:if test="${need.className ==null }">xxxx</c:if>


            </li>
            <li>${need.member.name}</li>
            <li   <c:if test="${need.memberViewNeedId != null}"> style="color: red;" </c:if>>
                <c:if test="${need.chargeType == 9}">
                    <c:if test="${need.memberViewNeedId != null}">
                        ${need.needMobile}[已查看]
                    </c:if>
                    <c:if test="${need.memberViewNeedId == null}">
                        ${fn:substring(need.needMobile,0,7)}****
                    </c:if>
                </c:if>
                <c:if test="${need.chargeType == 8}">
                      ${need.needMobile}
                </c:if>
            </li>
            <li> <c:if test="${need.areaFullName !=null }">

                ${fn:substring(need.areaFullName,0,9)}
    </c:if><c:if test="${need.areaFullName ==null }">xxxxxxx</c:if></li>
            <li><fmt:formatDate value="${need.updateTime != null ? need.updateTime:need.addTime}"   pattern="yyyy-MM-dd" type="date" dateStyle="long" /></li>
        </ul>

    </c:forEach>
    <c:if test="${empty needs}">
        <ul>
            <li colspan="5" style="text-align: center;">没有搜索到您的需求！</li>
        </ul>
    </c:if>



   <input type="hidden" id="totalPages" value="${paging.totalPages}"/>
   <input type="hidden" id="currentPage" value="${paging.currentPage}"/>
<script type="text/javascript">
    $("a[name='lookNeed']").click(function () {
        var needId = $(this).attr("needId");
        $.ajax({
            type: "POST",
            url:"/need/getMemberNeedHits/"+needId+".json",
            success: function(data){
                var flag = data.flag;
                if(flag == 0){
                    location.href = "/need/detail/"+needId+".html";
                }
                if(flag == 1){
                    layer.confirm("此需求需付费查看，您需要先登录验证您的身份！", {
                        btn: ['去登录','取消'] //按钮
                    }, function(index){
                        location.href = "/tologin.html";
                    });
                }
                if(flag == 2){
                    var count = data.count;
                    if(count && count >0) {
                        layer.confirm("您的剩余查看付费需求次数为"+count+"次，您是否需要消耗一次去查看？", {
                            btn: ['确定','取消'] //按钮
                        }, function(index){
                            location.href = "/need/useViewCount/"+needId+".html";
                        });
                    }else{
                        layer.alert("此需求需付费查看，您现在已无查看次数，请去充值！");
                    }
                }
            }
        });
    });
    
</script> 