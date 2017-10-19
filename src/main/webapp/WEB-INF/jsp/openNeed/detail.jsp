<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<style type="text/css">
    .tab_left {
        float: left;
        width: 900px;
        margin-right: 10px;
        position: relative;
    }
    .tab_left ul li{
        float: left;
        margin-left: 40px;
    }
    .tab_left ul:nth-of-type(1) {
        height: 42px;
        line-height: 42px;
        background: #2486b5;
    }

    .tab_left ul {
        height: 41px;
        line-height: 41px;
        border-bottom: 1px solid #dfdfdf;
    }

    .tab_left ul li:nth-of-type(1) {
        margin-left: 20px;
        width: 120px;
    }
    .tab_left ul li:nth-of-type(2) {
        padding-left: 20px;
        width: 48px;
        position: relative;
    }
    .tab_left ul li:nth-of-type(3) {
        padding-left: 20px;
        width: 48px;
    }
    .tab_left ul li:nth-of-type(4) {
        padding-left: 20px;
        width: 100px;
    }
    .tab_left ul li:nth-of-type(5) {
        padding-left: 20px;
        width: 110px;
    }

</style>
<head>
    <%@ include file="/common/global.jsp" %>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>企巴巴-一站式商业服务平台</title>
    <link rel="stylesheet" type="text/css" href="css/base.css">
    <link rel="stylesheet" href="./plugins/layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="/css/advier_detail.css"/>
    <script type="text/javascript" src="js/jquery-1.9.1.js"></script>

</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>

<div id="container">
    <div class="position2">
        您当前位置：<a href="/index.html">企巴巴</a> &gt;&gt;
        <a href="/need/toSearch.html">找需求</a> &gt;&gt;需求详情
    </div>
    <div class="content">
        <div class="user_left">
            <h1>用户小鬼申请贷款</h1>
            <ul>
                <li class="libg">基本信息</li>

                <li><span>姓名：  <c:if test="${member.name==null}">xxxx</c:if>
                    <c:if test="${member.name!=null}">
                          ${fn:substring(member.name,0,4)}</c:if></span><span>所在地区：${need.areaFullName}-${need.member.address}</span>
                    <button id="DH" onclick="dh()">查看联系方式</button><span id="moble" style="color: #21a2e7;padding-left: 290px" >联系方式:${need.member.mobile}</span></li>
                <li class="libg">贷款信息</li>
               <%-- <li>
                <c:forEach items="${need.attributes}" var="attribute" >
                    <span>${attribute.name}：<b class="b1">${attribute.value}</b></span>
                </c:forEach>
            </li>--%>
                <li><span>贷款金额：<b class="b1">20.0万</b></span><span>贷款期限：一年内</span><span class="rs">&nbsp查看次数：<b class="b2">${need.hits != null ? need.hits : 0}人</b></span></li>
                <li>
                    <span>贷款类型：金融服务</span>
                    <span>发布日期：<fmt:formatDate value="${need.updateTime != null ? need.updateTime:need.addTime}"   pattern="yyyy-MM-dd" type="date" dateStyle="long" /></span>
                    <span>截止日期：<fmt:formatDate value="${need.endTime}"   pattern="yyyy-MM-dd" type="date" dateStyle="long" /></span>
                </li>
                <li class="posi"><span>审核状态：<b class="b2">已验证</b></span></li>
                <li>需求详情：${need.content}
                </li>
            </ul>
        </div>
        <div class="user_right">
            <div class="user_right_u">
                <div><img src="http://www.qibaba.cn/${currentUser.headPortrait}"></div>
                <div class="user_right_top">${currentUser.name}</div>

                <div class="user_right_center">个人简介：<span>${fn:substring(currentUser.description,0,20)}</span></div>
                <button>查看个人中心</button>
            </div>
        </div>
    </div>

    <div class="center_bg"></div>

    <div class="content">
        <div class="tab_left">
            <h1 style="padding-bottom: 15px">需求推荐</h1>
                    <div class="layui-form" id="dataMsg" >
                    </div>
                    <div id="pager"></div>



        </div><!--tab_left-->




        <div class="tab_right"  >
            <div class="img1"><img src="/images/guwentuijian.jpg" alt=""><hr><p>顾问推荐</p><hr></div>
            <c:forEach items="${memberRecommends}" var="memberRecommend"  begin="0" end="2" step="1">
            <div class="tab_right_list">
                <div class="img2"><img width="50" height="50" src="${memberRecommend.headPortrait}" alt="${memberRecommend.companyName}" title="${memberRecommend.companyName}"></div>
                <div class="text">

                    <p><a href="/adviser/detail/${memberRecommend.memberId}.html" class="size18"> ${fn:substring(memberRecommend.memberName,0,15)}</a></p>
                    <p>   <c:choose>
                        <c:when test="${memberRecommend.level==1}">
                            普通顾问
                        </c:when>
                        <c:when test="${memberRecommend.level==2}">
                            高级顾问
                        </c:when>
                        <c:otherwise>
                            顾问
                        </c:otherwise>
                    </c:choose></p>
                    <p></p>
                    <p>七年职业经验</p>
                    <p><a class="qfgw_enter" href="/adviser/detail/${memberRecommend.memberId}.html">进入主页&nbsp<a href="http://sighttp.qq.com/msgrd?v=1&uin=${memberRecommend.qq}&site=在线咨询&menu=yes" target="blank" >qq咨询</a></p>

                </div>
            </div>
            </c:forEach>
        </div><!--tab_right-->
        </div>

</div>
</div>
</body>
<jsp:include page="../common/bottom.jsp"></jsp:include>


<script>

   $('#moble').hide();
   $("#DH").click(function(){
       $("#moble").toggle();
       $("#DH").hide();
   });

        $(function () {
        var keyword = "${keyword}";

        $("#keyword").val(keyword);
        var searchType = $("a[name='searchType']");
        searchType.removeClass("selectType");
        searchType.eq(1).addClass("selectType");

        layui.use(['laypage', 'layer'], function(){

            var laypage = layui.laypage

                ,layer = layui.layer;
            //以下将以jquery.ajax为例，演示一个异步分页
            var pageSize = 10; //每页显示条数
            function paging(curr){
                $.ajax({
                    type: "POST",
                    url: "/need/page1.html",
                    data: {
                        keyword:$("#keyword").val(),
                        areaCode:$("#areaVal").val(),
                        classCode:$("#categoryVal").val(),
                        currentPage :curr || 1,
                        pageSize : pageSize
                    },
                    success: function(data){
                        $("#dataMsg").html(data);
                        var totalPages = $("#totalPages").val();
                        //显示分页
                        laypage({
                            cont: 'pager', //容器。值支持id名、原生dom对象，jquery对象。【如该容器为】：<div id="page1"></div>
                            pages: totalPages, //通过后台拿到的总页数
                            curr: curr || 1, //当前页
                            groups: 5 ,//连续显示分页数
                            jump: function(obj, first){ //触发分页后的回调
                                if(!first){ //点击跳页触发函数自身，并传递当前页：obj.curr
                                    paging(obj.curr);
                                }
                            }
                        });
                    }
                });
            };
            //运行
            paging();
            function selectStyle(thisObj) {
                thisObj.parent().parent().find("a").removeClass("allSelect");
                thisObj.addClass("allSelect");
            }
            $("#categorySearch a").click(function () {
                var thisObj = $(this);
                selectStyle(thisObj);
                $("#categoryVal").val(thisObj.attr("code"));
                paging();
            });

            $("#areaSearch a").click(function () {
                var thisObj = $(this);
                selectStyle(thisObj);
                $("#areaVal").val(thisObj.attr("code"));
                paging();
            });


        });

    });


</script>


</html>