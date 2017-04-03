<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>企巴巴-用户注册</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <style>
        /*.reg_css{margin-bottom:35px;}*/
        /*.login_title{font-size: 16px;border-bottom: 1px solid #c2c2c2;padding:20px 10px;margin-bottom: 50px;}*/
        /*.login_left{width: 590px;border-right: 1px solid #e5e5e5;float: left;}*/
        /*.login_left_content{width: 440px;}*/
        /*.login_right{text-align: center;}*/
        /*.login_right_company{margin:25px 0px;}*/
        .selectType{color:red;}
    </style>
</head>
<body>
<div class="top_out">
    <div class="content">
        <div class="top_logo"><a href="index.html">企巴巴</a></div>
        <div class="top_out_right">
            <c:if test="${sessionScope.currentUser.name != null}">
                <div class="top_welcome"><a href="/member/index.html"><span class="userName">${sessionScope.currentUser.name}</span>您好，欢迎来到企巴巴</a></div>
                <div class="top_welcome"><a href="logout.html">退出</a></div>
            </c:if>
            <c:if test="${sessionScope.currentUser.name == null}"><div class="top_reg"><a href="/tologin.html">登录</a><a href="reg.html">注册</a></div></c:if>
            <div class="top_tuiguang">网站导航</div>
        </div>
    </div>
</div>

<div class="content top-search">
    <div class="logo-box"><img src="./images/logo_h.png"></div>
    <div class="search-form">

        <form action="" id="queryType" method="post" class="inlineb" target="_blank">
            <ul class="search-form-tab">
                <li class="active" id="1"><a name="searchType" searchType="1" class="selectType" href="javascript:void(0)">找服务</a><i></i></li>
                <li ><a name="searchType" searchType="2" href="javascript:void(0)">找需求</a><i></i></li>
                <li ><a name="searchType" searchType="3" href="javascript:void(0)">找顾问</a><i></i></li>
            </ul>
            <div class="tabBox">
                <div class="search-form-box">
                    <input type="text" placeholder="请输入关键字查询" id="keyword" name="keyword" value="" maxlength="20">
                    <button type="button" id="topSearch" ><i class="size25 icon1"></i><span class="inline">搜索</span></button>
                </div>
            </div>
        </form>
    </div>
    <div style="clear: both;"></div>
</div>

<div class="nav">
    <div class="content">
        <ul>
            <li class="nav-li1">
                <a href="javascript:void(0);"><i class="size25" style="background-position: -25px 0px;"></i>服务分类</a>
                <div class="nav-l2-container">
                    <div class="nav-l2c">
                        <div class="nav-t2">金融服务</div>
                        <div class="nav-c2">
                            <span>快速贷款</span><span>小额贷款</span><span>小额贷款</span><span>小额贷款</span><span>小额贷款</span><span>小额贷款</span><span>小额贷款</span><span>小额贷款</span>
                            <div class="clear nav-c2-fenge"></div>
                        </div>
                    </div>
                    <div class="nav-l2c">
                        <div class="nav-t2">法律顾问</div>
                        <div class="nav-c2">
                            <span>房屋贷款</span><span>汽车贷款</span><span>快速贷款</span><span>小额贷款</span><span>找贷款</span>
                            <div class="clear nav-c2-fenge"></div>
                        </div>
                    </div>
                    <div class="nav-l2c">
                        <div class="nav-t2">企业办证</div>
                        <div class="nav-c2">
                            <span>房屋贷款</span><span>汽车贷款</span><span>快速贷款</span><span>小额贷款</span>
                            <div class="clear nav-c2-fenge" style="border-bottom: 0px;"></div>
                        </div>
                    </div>
                </div>
            </li>
            <li class="nav-li ${cIndexNav}">
                <a href="/index.html">首页</a>
            </li>
            <li class="nav-li ${cNeedNav}">
                <a href="/need/toSearch.html">找需求</a>
            </li>
            <li class="nav-li ${cAdviserNav}">
                <a href="/adviser/toSearch.html">找顾问</a>
            </li>
            <li class="nav-li ${cProductNav}">
                <a href="/product/toSearch.html">找服务</a>
            </li>
            <%--<li class="nav-li">--%>
                <%--<a href="introduce.html">关于企巴巴</a>--%>
            <%--</li>--%>
            <%--<li class="nav-li">--%>
                <%--<a href="javascript:void(0);">商家入驻</a>--%>
            <%--</li>--%>
            <li class="clear"></li>
        </ul>
    </div>
</div>
<script>
    $(function () {

        $(".nav-li1").mouseover(function () {
            $(".nav-l2-container").css("display","block");
        });
        $(".nav-l2-container").mouseout(function () {
            if($("#nav").val()!="index"){
                $(".nav-l2-container").css("display","none");
            }
        });

        $("a[name='searchType']").click(function () {
            $("a[name='searchType']").removeClass("selectType");
             $(this).addClass("selectType");
        });
        $("#topSearch").click(function () {
            var searchType = $(".selectType").attr("searchType");
            var keyword = $("#keyword").val();
            var url;
            if(searchType == 1) {
                url = "/product/toSearch.html?keyword="+keyword;
            }
            if(searchType == 2) {
                url = "/need/toSearch.html?keyword="+keyword;
            }
            if(searchType == 3) {
                url = "/adviser/toSearch.html?keyword="+keyword;
            }
            location.href = url;
        });

    });
</script>
</body>
</html>