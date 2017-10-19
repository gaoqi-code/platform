<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/common/global.jsp" %>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>企巴巴-一站式商业服务平台</title>
    <link rel="stylesheet" type="text/css" href="css/base.css">
    <link rel="stylesheet" href="./plugins/layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="./css/info_class.css"  media="all">
    <script type="text/javascript" src="js/jquery-1.9.1.js"></script>
    <style>
        .hs-card--name, .hs-card--prv, .hs-card .provider, .hs-card .serv a, .mod-hotrecommend-card--name, .mod-hotrecommend-card--prv, .mod-hotrecommend-card .provider, .mod-hotrecommend-card .serv, .mod-hotrecommend-card .serv a, .sv-card--name .name, .sv-card--type {
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
            max-width: 100%;
            word-wrap: normal;
        }
        .banner {
            border: 1px solid #e2e2e2;
            background: #fff;
            padding-top: 33px;
            margin-bottom: 24px;
        }
        .banner--title {
            font-size: 28px;
            text-align: center;
            line-height: 1;
            margin-bottom: 38px;
        }
        .banner--list {
            padding: 0 68px;
        }
        .banner--list:after, .banner--list:before, .layout:after, .layout:before {
            content: '';
            display: table;
            font: 0/0 a;
        }
        .banner--list:after, .layout:after {
            clear: both;
        }
        .banner--item {
            width: 513px;
            box-sizing: border-box;
            padding-right: 52px;
            margin-bottom: 28px;
            float: left;
            list-style-type: square;
            list-style-position: inside;
        }
        .banner--item .title {
            display: inline-block;
            font-size: 16px;
            margin-bottom: 6px;
        }
        .banner--item .pcontent {
            font-size: 14px;
            color: #878787;
        }
        .city {
            border: 1px solid #e2e2e2;
            background: #fff;
            padding: 10px 30px 16px;
            font-size: 14px;
            line-height: 1;
            margin-bottom: 24px;
        }
        .mod-icon {
            display: inline-block;
            vertical-align: text-bottom;
            margin-right: 12px;
        }
        .mod-icon-pin {
            background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAPCAYAAADtc08vAAAABGdBT…slLpaUH3fZXoEQWcCpKJ+XlC/3cSO2jjl/7+I3rm4F/QFFbHOh3PHCjwAAAABJRU5ErkJggg==);
            background-repeat: no-repeat;
            width: 16px;
            height: 15px;
        }
        .city .mod-icon-pin {
            margin: 0 4px;
            vertical-align: initial;
        }
        .ui-address {
            display: inline-block;
            vertical-align: top;
            padding: 6px 8px;
            cursor: pointer;
            position: relative;
            border: 1px solid #e2e2e2;
            -webkit-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }
        .city .ui-address {
            border: none;
            vertical-align: inherit;
            padding: 0;
            line-height: 1;
        }
        .ui-address:before {
            position: absolute;
            content: '';
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            background: #fff;
            z-index: 2;
        }
        .ui-checkbox-wrap {
            margin: 0;
            position: relative;
            z-index: 3;
        }
        .city .ui-checkbox-wrap {
            line-height: 1;
            height: inherit;
        }
        .ui-checkbox-text {
            margin: 0 0 0 5px;
            font-size: 14px;
            vertical-align: text-bottom;
        }
        .ui-checkbox-wrap label {
            cursor: pointer;
        }
        .city .ui-checkbox-text {
            color: #1cbcb4;
            margin: 0 4px 0 0;
            vertical-align: inherit;
        }
        .ui-address-layer {
            position: absolute;
            width: 318px;
            background: #fff;
            border: 1px solid #e2e2e2;
            padding: 12px 0;
            left: -1px;
            top: 32px;
            cursor: default;
            box-shadow: 0 2px 10px rgba(0,0,0,.1);
            display: none;
        }
        .city .ui-address-layer {
            padding: 0;
            top: 18px;
        }
        .mod-tab-panel {
            white-space: nowrap;
            border: 1px solid #e2e2e2;
            background: #f6f6f6;
        }

        .ui-address-layer .mod-tab-panel {
            border-top: none;
            border-left: none;
            border-right: none;
            padding-left: 20px;
        }
        .city .ui-address-layer .mod-tab-panel {
            padding-top: 12px;
        }
        .sv-card {
            display: inline-block;
            vertical-align: top;
            width: 450px;
            height: 265px;
            box-sizing: border-box;
            border: 1px solid #e2e2e2;
            background: #fff;
            line-height: 1;
            margin-bottom: 22px;
            position: relative;
        }
        .sv-card--top {
            background: #f9f9f9;
            padding: 17px 14px 14px;
            position: relative;
            font-size: 0;
        }
        .sv-card--bottom {
            font-size: 14px;
            padding: 27px 14px;
            border-top: 1px solid #e2e2e2;
        }
        .sv-card--type {
            display: block;
            margin-bottom: 12px;
            color: #323232;
        }
        .sv-card a.sv-card--type:hover {
            color: #1cbcb4;
        }
        .sv-card--icon {
            float: left;
            width: 60px;
            height: 60px;
            margin-right: 14px;
        }
        .sv-card--name {
            font-size: 20px;
            color: #323232;
            line-height: 1.5;
            max-height: 60px;
            overflow: hidden;
        }
        .sv-card--name .name {
            max-width: 10em;
            display: inline-block;
            vertical-align: bottom;
        }
        .lv {
            font-size: 12px;
            background: #f9bc01;
            line-height: 13px;
            display: inline-block;
            padding: 0 3px;
            margin-left: 4px;
            border-radius: 2px;
            color: #fff!important;
        }
        .mod-icon-grantee {
            display: inline-block;
            width: 18px;
            height: 20px;
            background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAAUCAYAAACAl21KAAAB2ElEQ…EiTuGO1QctwFIhxdnCgUVUe9iWcBEdeI0U2nDT6iWX4C+u+YiuGSz0KwAAAABJRU5ErkJggg==);
            background-repeat: no-repeat;
        }
        .sv-card .mod-icon-grantee {
            vertical-align: top;
            margin: 5px 0 0 8px;
        }
        .sv-card--review {
            font-size: 14px;
            color: #878787;
            margin-top: 8px;
        }
        .sv-card--review-item {
            display: inline-block;
            margin-right: 3px;
        }
        .sv-card--review span {
            display: inline-block;
        }
        .sv-card .arrow {
            position: absolute;
            bottom: 0;
            left: 35px;
            height: 0;
            width: 0;
            border-radius: 3px;
            border-bottom: 10px solid #e2e2e2;
            border-left: 10px dashed transparent;
            border-right: 10px dashed transparent;
        }
        .sv-card .arrow:after {
            position: absolute;
            content: '';
            width: 0;
            height: 0;
            border-radius: 3px;
        }
        .sv-card .arrow:after {
            left: -10px;
            top: 1px;
            border-bottom: 10px solid #fff;
            border-left: 10px dashed transparent;
            border-right: 10px dashed transparent;
        }
        .sv-card--price {
            position: absolute;
            bottom: 27px;
        }
        .sv-card--red {
            color: #ef6512;
            font-size: 22px;
            display: inline-block;
            vertical-align: bottom;
            max-width: 9.6em;
            overflow: hidden;
        }
        .sv-card--btn-wrap {
            position: absolute;
            right: 14px;
            bottom: 28px;
        }
        .ui-button {
            display: inline-block;
            line-height: 42px;
            font-size: 16px;
            text-align: center;
            color: #323232;
            border-radius: 5px;
            min-width: 108px;
            padding: 0 20px;
            -webkit-transition: background-color .15s,color .15s;
            transition: background-color .15s,color .15s;
            outline: none;
            cursor: pointer;
            background-color: #fff;
            border: 1px solid #e2e2e2;
        }

        .ui-button-sm {
            min-width: 66px;
            line-height: 30px;
            padding: 0 8px;
            font-size: 12px;
        }
        .sv-card--btn-wrap .ui-button {
            margin-left: 10px;
        }
        .ui-button-primary {
            color: #1cbcb4;
            border-color: #1cbcb4;
        }
        .ui-button-primary:hover {
            background-color: #e2f5f4;
        }
        .sv-card--btn-wrap .ui-button {
            margin-left: 10px;
        }

        /*** 推荐部分样式 ***/
        .mod-hotrecommend-card {
            float: left;
            width: 288px;
            height: 190px;
            box-sizing: border-box;
            margin-left: 15px;
            margin-bottom: 15px;
            font-size: 14px;
            color: #878787;
            background-color: #fff;
            border: 1px solid #e2e2e2;
            padding: 20px;
            position: relative;
        }
        .hs-card, .mod-hotrecommend-card {
            display: inline-block;
            width: 280px;
            height: 188px;
            font-size: 14px;
            border: 1px solid #e2e2e2;
            background: #fff;
            position: relative;
            box-sizing: border-box;
            padding: 25px 20px 0;
            line-height: 1;
        }
        .mod-hotrecommend-card .serv {
            font-size: 16px;
            color: #383c3b;
            margin-bottom: 4px;
        }
        .hs-card--sale, .hs-card .record, .mod-hotrecommend-card--sale, .mod-hotrecommend-card .record {
            margin-bottom: 14px;
        }
        .mod-hotrecommend-card .np {
            color: #e75452;
            font-size: 22px;
            line-height: 1;
            margin-top: 8px;
        }
        .hs-card--name, .hs-card .serv a, .mod-hotrecommend-card--name, .mod-hotrecommend-card .serv a {
            display: block;
            color: #323232;
            font-size: 16px;
            margin-bottom: 12px;
        }
        .hs-card--sale a, .hs-card--sale span, .hs-card .record a, .hs-card .record span, .mod-hotrecommend-card--sale a, .mod-hotrecommend-card--sale span, .mod-hotrecommend-card .record a, .mod-hotrecommend-card .record span {
            display: inline-block;
            color: #878787;
            margin-right: 14px;
        }
        .hs-card--sprice, .hs-card .np, .mod-hotrecommend-card--sprice, .mod-hotrecommend-card .np {
            display: block;
            font-size: 28px;
            color: #ef6512;
            max-width: 148px;
            overflow: hidden;
            font-size: 22px;
        }
        .hs-card--price, .hs-card .price, .mod-hotrecommend-card--price, .mod-hotrecommend-card .price {
            position: absolute;
            left: 20px;
            bottom: 25px;
        }
        .mod-hotrecommend-card .btn {
            position: absolute;
            right: 20px;
            bottom: 20px;
            text-align: center;
            width: 80px;
            line-height: 30px;
            padding: 0;
            border-radius: 4px;
            font-size: 14px;
            color: #e75452;
            border: 1px solid #e75452;
        }
        .hs-card .btn, .mod-hotrecommend-card .btn {
            color: #1cbcb4;
            border-color: #1cbcb4;
        }
        .hs-card .btn:hover, .mod-hotrecommend-card .btn:hover {
            color: #1cbcb4;
            background-color: #e2f5f4;
        }
        .content{width:1178px;}

        /*右侧列表推荐样式*/
        .adviser_right_tj{width:90px;height:90px;border-radius: 50%;border: 7px solid rgba(255,255,255,.2);overflow: hidden;float: left;}
        .adviser_right_tj img{width:90px;}
        .adviser_right_tjperson{float:left;height: 90px;line-height: 90px;}
        .adviser_right_tjperson p{height:30px;line-height: 30px;}
        .adviser_right_tj_personwork{text-align:center;border-bottom: 1px solid #eee;padding-bottom:10px;}
        .adviser_right_tj_personwork a{    display: inline-block;
            width: 91px;
            height: 27px;
            line-height: 27px;
            text-align: center;
            font-size: 12px;
            color: #fff;
            padding-left: 0;}
        .green{background: #609833;}
        .ser{background: #fa4f4f;}
        .adviser_tj{width: 251px;float: left;border: 1px solid #eee;border-bottom:none;margin-top: 5px;}
        .adviser_tj_title{height: 35px;line-height: 35px;text-align: center;font-size: 18px;}
        .adviserName{font-size: 14px;padding-right: 3px;}


    </style>
</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>

<div id="container">
    <div class="position2">
        您当前位置：<a href="/index.html">企巴巴</a> &gt;&gt;找产品
    </div>


    <div class="content">



        <div class="main">
            <div class="banner jmod_cate_banner" id="categoryContent">
            </div>


            <input type="hidden" id="categoryCode" value="${categoryCode}">
            <input type="hidden" id="parentCode" value="${categoryCode}">
            <div class="search-select">

                <ul>
                <c:forEach items="${cateList}" var="c" >
                    <c:if test="${c.level == 2}">
                    <li>
                        <h3><a  name="categorySearch"  code="${c.code}" href="javascript:void(0);">${c.name}:</a></h3>
                        <div class="selectSpan">
                            <c:forEach items="${cateList}" var="ca" >
                                <c:if test="${ca.level == 3}">
                                    <c:if test="${fn:indexOf(ca.code, c.code)==0}">
                                        <span><a href="javascript:void(0);" name="categorySearch" code="${ca.code}">${ca.name}</a></span>
                                    </c:if>
                                </c:if>
                            </c:forEach>
                        </div>
                        <div class="clear"></div>
                    </li>
                    </c:if>
                </c:forEach>
                </ul>
            </div>

            <ul class="sv-list jmod_service_list" style="float:left;min-height: 300px;width:925px;margin-top: 5px;" id="productIntroduce">


                <%--<li class="sv-card">--%>
                    <%--<div class="sv-card--top clearfix">--%>
                        <%--<a _stat_click_id="7_115611" href="/cmdty/detail?csId=15611" target="_blank"><img src="http://p.qlogo.cn/zc_icon/0/3574fe23b350f6b4c15de8d9c44afeea/0" class="sv-card--icon"></a>--%>
                        <%--<!-- 重度服务商 -->--%>

                        <%--<p class="sv-card--name"><a class="name" _stat_click_id="7_215611" href="/cmdty/detail?csId=15611" target="_blank">精益求精集团</a><a href="/scenter/growth" target="_blank" class="lv">Lv1</a><span class="mod-icon-grantee"></span></p>--%>
                        <%--<ul class="sv-card--review">--%>
                            <%--<li class="sv-card--review-item">--%>
                                <%--<span class="title">质量</span>--%>
                                <%--<span class="point">暂无</span>--%>
                            <%--</li>--%>
                            <%--<li class="sv-card--review-item">--%>
                                <%--<span class="title">速度</span>--%>
                                <%--<span class="point">暂无</span>--%>
                            <%--</li>--%>
                            <%--<li class="sv-card--review-item">--%>
                                <%--<span class="title">态度</span>--%>
                                <%--<span class="point">暂无</span>--%>
                            <%--</li>--%>
                        <%--</ul>--%>

                        <%--<span class="arrow"></span>--%>
                    <%--</div>--%>
                    <%--<div class="sv-card--bottom">--%>
                        <%--<a href="/cmdty/detail?csId=15611" class="sv-card--type" target="_blank" title="有限责任公司注册（公司注册基础服务+核名+注册指导建议+工商年报+提供深圳地址挂靠）">有限责任公司注册（公司注册基础服务+核名+注册指导建议+工商年报+提供深圳地址挂靠）</a>--%>
                        <%--<div class="sv-card--sale">--%>

                            <%--<a _stat_click_id="7_415611" href="/cmdty/detail?csId=15611" target="_blank">咨询 5</a>--%>
                            <%--<a _stat_click_id="7_515611" href="/cmdty/detail?csId=15611" target="_blank">销量 50</a>--%>

                        <%--</div>--%>
                        <%--<div class="sv-card--price">--%>


                            <%--<div class="sv-card--special"><span class="sv-card--red">¥1900.00</span></div>--%>


                        <%--</div>--%>
                        <%--<div class="sv-card--btn-wrap">--%>
                            <%--<a class="ui-button ui-button-sm ui-button-primary jmod-consult-stat jmod-wpa-qq" _wpa_qq="1594790668" _stat_click_id="7_6316389" data-cid="316389" data-csid="15611" target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=1594790668&amp;site=qq&amp;menu=yes">QQ咨询</a>--%>

                            <%--<a href="/cmdty/detail?csId=15611" target="_blank" class="ui-button ui-button-sm ui-button-primary" _stat_click_id="7_7316389">查看详情</a>--%>

                        <%--</div>--%>
                    <%--</div>--%>
                <%--</li>--%>
            </ul>
            <div class="adviser_right">
                <%--plate 顾问推荐板块 101首页，201列表，1通用--%>
                <jsp:include page="/adviserRecommend/recommend.html">
                    <jsp:param value="201" name="plate"/>
                    <jsp:param value="1" name="currentPage"/>
                    <jsp:param value="3" name="pageSize"/>
                </jsp:include>
            </div>
            <div class="clear"></div>
            <div id="pager"></div>
        </div>




        <div class="mod-boxhd"><h3 class="mod-boxhd-tit">热销服务</h3></div>
        <div class="mod-hotrecommend-list clearfix" id="hotProduct">



        </div>
    </div>
</div>

<jsp:include page="../common/bottom.jsp"></jsp:include>


<script>
    $(function () {
        layui.use(['laypage', 'layer'], function(){
            var laypage = layui.laypage
                    ,layer = layui.layer;
            //以下将以jquery.ajax为例，演示一个异步分页
            var pageSize = 8;
            function paging(curr){
                $.ajax({
                    type: "POST",
                    url: "/product/productIntroduce.html",
                    data: {
                        classCode:$("#categoryCode").val(),
                        currentPage :curr || 1,
                        pageSize : pageSize
                    },
                    success: function(data){
                        $("#productIntroduce").html(data);
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
            hotProduct();
            getCategoryContent();
            function selectStyle(thisObj) {
                var pLi = thisObj.parent().parent().parent();
                pLi.parent().find("a").removeClass("allSelect");
//                pLi.siblings().find(".alla").addClass("allSelect");
                thisObj.addClass("allSelect");
            }
            $("a[name='categorySearch']").click(function () {
                var thisObj = $(this);
                selectStyle(thisObj);
                var isAll = true;
                var text = "";
                $(".allSelect").each(function (i,val) {
                    text = $(val).text();
                    if(text != "全部") {
                        isAll = false;
                        return false;
                    }
                });
                var code;
                if(isAll) {
                    code = $("#parentCode").val();
                }else{
                    code = thisObj.attr("code");
                }
                $("#categoryCode").val(code);
                paging();
                hotProduct();
                getCategoryContent();
            });
            function getCategoryContent() {
                $.ajax({
                    type: "POST",
                    url: "/category/getCategory.json",
                    data: {
                        classCode:$("#categoryCode").val()
                    },
                    success: function(data){
                        var content = "";
                        if(data && data.content) {
                            content = data.content;
                        }
                        $("#categoryContent").html(content);
                    }
                });
            }

            function hotProduct() {
                $.ajax({
                    type: "POST",
                    url: "/productRecommend/hotProduct.html",
                    data: {
                        classCode:$("#categoryCode").val(),
                        currentPage :1,
                        pageSize : 4
                    },
                    success: function(data){
                        $("#hotProduct").html(data);
                    }
                });
            }

        });
    });
</script>
</body>
</html>