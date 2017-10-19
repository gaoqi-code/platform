<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<table class="layui-table" lay-skin="line">
    <colgroup>
        <col width="150">
        <col width="100">
        <col width="80">
        <col width="120">
        <col width="200">
        <col width="100">
    </colgroup>
    <thead>
    <tr>
        <td>需求名称</td>
        <td>类型</td>
        <td>联系人</td><td>联系电话</td>
        <td>地区</td>
        <td>发布日期</td>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${needs}" var="need" >
        <tr>
            <td><a name="lookNeed" href="javascript:void(0);" needId="${need.id}" >${fn:substring(need.title,0,7)}</a></td>
            <td> ${fn:substring(need.className,0,4)}</td>
            <td> ${fn:substring(need.member.name,0,4)}</td>
            <td   <c:if test="${need.memberViewNeedId != null}"> style="color: red;" </c:if>>
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
            </td>

            <td>${fn:substring(need.areaFullName,0,9)}</td>
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