<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach items="${needs}" var="need"    begin="0" end="3" step="1" >
<dl id="listoffer_${need.id}" class="clearfix">
    <dt>
        <a href="/adviser/detail/${need.memberId}.html" target="_blank">
            <img class="face-box" width="50" height="50" src="${need.member.headPortrait}" alt="${need.member.name}" title="${need.member.name}">
        </a>
    <p style="width: 80px;text-align: center;">
    <a href="/adviser/detail/${need.member.id}">${need.member.name}</a>
    </p>
    </dt>
    <dd>
        <h3>
            <a href="/need/detail/${need.id}.html" target="_blank">${need.title}</a>
            <span class="green">产品类型：<span class="chanpin${need.classId}">${need.className}</span></span>
            <%--<span class="ml10 f12">${need.areaFullName}</span>--%>

        </h3>
        <p class="content">

            <c:if test="${type!=1}">
                <span >联系电话：${fn:substring(need.member.mobile,0,7)}****   ${need.areaFullName}</span>


            </c:if>
            <c:if test="${type==1}">
                <span >商家介绍：${need.content}</span>
            </c:if>


            &nbsp;&nbsp;
            <%--<span>--%>
                <%--(<fmt:formatDate value="${need.updateTime != null ? need.updateTime:need.addTime}"   pattern="yyyy-MM-dd" type="date" dateStyle="long" />)--%>
            <%--</span>--%>
        </p>
    </dd><ddd style="margin-top: 30px;display: inline-block;"><a class="qfgw_enter" href="/need/detail/${need.id}.html">立即查看</a></ddd>
</dl>
</c:forEach>
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