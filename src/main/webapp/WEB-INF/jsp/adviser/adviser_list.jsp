<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>企巴巴-一站式商业服务平台</title>
    <link rel="stylesheet" type="text/css" href="css/base.css">
    <link rel="stylesheet" href="./plugins/layui/css/layui.css"  media="all">
    <script type="text/javascript" src="js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="js/jquery.kinMaxShow-1.1.min.js"></script>
    <style>
        .search-select{border:1px solid #ddd;}
        .search-select li{    padding-left: 26px;
            height: 66px;
            line-height: 66px;
            border-bottom: 1px solid #f7f6f6;}
        .search-select h3{
            width: 100px;
            height: 30px;
            line-height: 30px;
            display: block;
            float: left;
            margin-top: 15px;
        }
        .allSelect{background-color:#2486b5;color: #FFF;display:block;}
        .allSelect:hover{color: #FFF;}
        .selectSpan{
            line-height: 30px;
            height: 30px;
            float: left;
            margin-top: 15px;
        }
        .selectSpan span{float: left;display: inline-block;min-width: 60px;height: 30px;line-height:30px;text-align: center;margin-right: 10px;}
        .adviser_mainli li{border: 1px solid #ddd; border-top:none;height: 217px;}
        .li-img{    margin: 26px 56px 26px 30px;            float: left;}
        .li-img img{width: 165px;}
        .adviser-list-info{float: left;width: 645px;margin-top: 56px;}
        .adviser-list-content{padding-right: 5px;}
        .company{display: inline-block;
            vertical-align: bottom;
            font-size: 24px;
            color:#2486b7;
            font-weight: 700;}
        .adviser-list-info p{line-height: 35px;min-height: 35px;font-size: 12px;color: #666;overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;}
        .adviser-list-href{float: right;
            margin-right: 92px;}
        .adviser-list-href a{border: 2px solid #2486b7;
            width: 144px;height: 46px;
            line-height: 46px;
            text-align: center;
            display: inline-block;
            color: #2486b7;
            margin-top: 80px;}
        .adviser_right_tj{width:90px;height:90px;border-radius: 50%;border: 7px solid rgba(255,255,255,.2);overflow: hidden;float: left;}
        .adviser_right_tj img{width:90px;}
        .adviser_right_tjperson{float:left;height: 90px;line-height: 90px;}
        .adviser_right_tjperson p{height:30px;line-height: 30px;}
        .adviser_right_tj_personwork{text-align: left;border-bottom: 1px solid #eee;margin-bottom: 20px;}
        .adviser_right_tj_personwork p{height:30px;line-height: 30px;padding-left:10px;}
        .adviser_tj_title{height: 35px;line-height: 35px;}
        .head-update-img img{width: 100%;border: 0 none;vertical-align: middle;max-width: 100%;}
        .head-update-ewm>i{display: inline-block;
            width: 17px;
            height: 17px;
            background: url(../images/counselor-details/update/update-icon.png) no-repeat 0 0;}
        .head-update-ewm .ewm{position: absolute;
            width: 92px;
            height: 92px;
            top: -94px;
            left: 49px;
            display: none;}
        .head-update-middle .til{margin-bottom: 20px;}
        .head-update-middle>div {
            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden;
            font-size: 12px;
            margin-bottom: 14px;
            line-height: 1;
        }
        .recently-handled p{font-size: 12px;    padding-bottom: 5px;}
        .head-update-middle .recently-banli>p{    color: #999;
            margin-bottom: 8px;}
        .head-update-middle .til .c-name {
            font-size: 24px;
            font-weight: bold;
        }
        .head-update-middle .sub-til {
            color: white;
            font-size: 12px;
        }
        .head-update-middle ul li.li-border {
            border-left: 1px dashed rgba(255,255,255,.2);
            width: 0;
            height: 35px;
            margin: 0 30px;
        }
        .head-update-middle ul li {
            display: inline-block;
            vertical-align: middle;
            text-align: center;
        }
        .head-update-middle ul li p {
            color: white;
            font-size: 24px;
            margin-bottom: 5px;
            line-height: 1;
        }
        .head-update-right .tel-num {
            color: #3fbff0;
            font-size: 28px;
            font-weight: bold;
            padding: 5px 0;
        }
        .head-update-right a.btn-free {
            background-color: #3fbff0;
            border: 1px solid #3fbff0;
        }
        .head-update-right a.btn-online {
            border: 1px solid white;
        }
        .head-update-right a {
            display: block;
            width: 208px;
            height: 38px;
            border-radius: 2px;
            color: white;
            text-align: center;
            line-height: 38px;
            margin-bottom: 20px;
        }
        .head-update-middle ul li b {
            color: #999;
            font-size: 12px;
        }

        .adviser_left{}
        .advisertSortCon{border-top: none;height: 50px;line-height: 50px;background-color: #fafafa;margin-bottom: 30px;}
        .advisertSortCon:after{content: '';            clear: both;}
        .adviserCountCont{float: right;margin-right: 10px;}
        #adviserCount{color:red;font-size: 14px;}
        .adviser_right{width:240px; text-align: center; float: left;background: url("images/order-adviser.jpg") no-repeat;}
        .order-form{border:1px solid #eee;border-top:0px;text-align: center;margin-top: 105px;}
        /*文本框样式调整*/
        .layui-input-block{width:225px;margin-left:auto;margin-right: auto;}
        .layui-form-item .layui-input-inline{width:225px;margin-left:5px;}
    </style>
</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>

<div id="container">
    <div class="position2">
        您当前位置：<a href="/index.html">企巴巴</a> &gt;&gt;
        <a href="javascript:void(0);" class="defaultCursor">找顾问</a>
    </div>


    <div class="content">

        <div class="adviser_left">

            <div class="search-select">
                <ul>
                    <li>
                        <h3>业务类别：</h3>
                        <div class="selectSpan" id="categorySearch">
                            <span><a class="allSelect" href="javascript:void(0);">全部</a></span><span><a href="javascript:void(0);" code="3-" >工商注册</a></span><span><a href="javascript:void(0);" code="1-" >金融服务</a></span><span><a href="javascript:void(0);" code="5-" >法律顾问</a></span>
                            <input type="hidden" id="categoryVal">
                        </div>
                        <div class="clear"></div>
                    </li>
                    <li style="border: 0px;padding-bottom: 5px;">
                        <h3>服务区域：</h3>
                        <div class="selectSpan" id="areaSearch">
                            <span><a class="allSelect" href="javascript:void(0);">全部</a></span><span><a href="javascript:void(0);" code="4-" >上海</a></span><span><a href="javascript:void(0);" code="1-">北京</a></span><span><a href="javascript:void(0);" code="8-">天津</a></span>
                            <input type="hidden" id="areaVal">
                        </div>
                        <div class="clear"></div>
                    </li>
                </ul>
            </div>

            <div class="search-select advisertSortCon">
                <div class="adviserCountCont">共<span id="adviserCount">0</span>位顾问</div>
            </div>

            <div style="border-bottom: 1px solid #ddd;"></div>
            <div class="adviser_mainli" id="dataMsg">


            </div>
            <div id="pager" class="textCenter"></div>
        </div>
        <div class="adviser_right">

            <%--<jsp:include page="../openNeed/need_form.jsp"></jsp:include>--%>

            <%--<jsp:include page="/adviserRecommend/recommend.html">--%>
                <%--<jsp:param value="201" name="plate"/>--%>
                <%--<jsp:param value="1" name="currentPage"/>--%>
                <%--<jsp:param value="3" name="pageSize"/>--%>
            <%--</jsp:include>--%>
        </div>
        <div class="clear"></div>
    </div>
</div>

<jsp:include page="../common/bottom.jsp"></jsp:include>

<script src="/plugins/layui/layui.js" charset="utf-8"></script>
<script>
    $(function () {
        var keyword = "${keyword}";
        $("#keyword").val(keyword);
        var searchType = $("a[name='searchType']");
        searchType.removeClass("selectType");
        searchType.eq(2).addClass("selectType");

        layui.use(['laypage', 'layer'], function(){
            var laypage = layui.laypage;
            //以下将以jquery.ajax为例，演示一个异步分页
            var pageSize = 5;
            function paging(curr){
                $.ajax({
                    type: "POST",
                    url: "/adviser/page.html",
                    data: {
                        keyword:keyword,
                        areaCode:$("#areaVal").val(),
                        classCode:$("#categoryVal").val(),
                        productId:"",
                        currentPage :curr || 1,
                        pageSize : pageSize
                    },
                    success: function(data){
                        $("#dataMsg").html(data);
                        var totalPages = $("#totalPages").val();
                        $("#adviserCount").html($("#totalCount").val());
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
</body>
</html>