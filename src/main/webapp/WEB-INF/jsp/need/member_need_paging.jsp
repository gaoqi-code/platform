<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



    <ul>
        <li>需求名称</li>
        <li>类型</li>
        <li>联系人</li>
        <li>联系电话</li>
        <li>所在地区</li>
        <li>发布时间</li>
        <li>操作</li>
    </ul>

    <tbody>

    <c:forEach items="${needs}" var="need" >
        <ul>
            <li  class="hidden_text" title="${need.title}">${need.title}</li>
            <li>${need.className}</li>
            <li>${need.member.name}</li>
            <li>${fn:substring(need.needMobile,0,7)}****</li>
            <li>${need.areaFullName}</li>
            <li><fmt:formatDate value="${need.updateTime != null ? need.updateTime:need.addTime}"   pattern="yyyy-MM-dd" type="date" dateStyle="long" /></li>
            <li><a name="lookNeed" href="javascript:void(0);" needId="${need.id}" >查看</a></li>
        </ul>

    </c:forEach>
    <c:if test="${empty needs}">
        <ul>
            <li></li>
            <li></li>
            <li></li>
            <li  style="text-align: center;">没有搜索到您的需求！</li>
            <li></li>
            <li></li>

        </ul>
    </c:if>
    </tbody>


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
//                    location.href = "/need/detail/"+needId+".html";
                    window.open("/need/detail/"+needId+".html");
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
//                            location.href = "/need/useViewCount/"+needId+".html";
                            window.open("/need/useViewCount/"+needId+".html");
                        });
                    }else{
                        layer.alert("此需求需付费查看，您现在已无查看次数，请去充值！");
                    }
                }
            }
        });
    });
    
</script> 