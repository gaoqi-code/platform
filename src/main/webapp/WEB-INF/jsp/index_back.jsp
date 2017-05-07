<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <%@ include file="/common/global.jsp" %>
    <base href="<%=basePath%>">
    <title>企巴巴</title>
    <meta name="keywords" content="企巴巴, 金融,顾问,法律">
    <meta name="description" content="企巴巴.企业巴巴IB2E（Internet Business to Enterprise）模式是以互联网管理模式为向导，通过PC电脑、移动端等新媒体为载体，针对对企业经营战略咨询、企业管理咨询、电商模式开发及运营、企业认证辅导等，建立企业信息化大数据，在以互联网的思维改善、改变传统工厂运作">

    <jsp:include page="common/css.jsp"></jsp:include>
    <style>
        .notice{margin: 10px 0px;}
        .noticeGG{background-color:#ffcc99;width: 60px;padding: 5px 15px;float: left;}
        .noticeGG_content{padding: 5px 15px;float: left;}
        .redClass{padding:1px 4px;}
        .main_business{}
        .cc{width: 390px;float: left;height:75px;}
        .cc_img{display: inline-block;margin-top: 10px;margin-right:15px;width:65px;height:65px;vertical-align: middle;float: left;}
        .cc_img img{width: 72px;}
        .cc_content{float: left;margin-top: 10px;}
        .cc_content_title{font-size: 18px;margin-top:10px;margin-bottom: 5px;}

        /*幻灯片*/
        /* 本例子css */
        .slideBox{ width:100%;position:relative;}
        .slideBox .hd{ overflow:hidden; position:absolute; right:5px; bottom:5px; z-index:1; }
        .slideBox .hd ul{ overflow:hidden; zoom:1; float:left;  }
        .slideBox .hd ul li{ float:left; margin-right:2px; padding:5px 8px;line-height:14px; text-align:center; background:#fff; cursor:pointer; }
        .slideBox .hd ul li.on{ background:#f00; color:#fff; }
        .slideBox .bd{ position:relative; height:100%; z-index:0;   }
        .slideBox .bd li{ zoom:1; vertical-align:middle; }
        .slideBox .bd img{ width:100%;display:block;  }

        /* 下面是前/后按钮代码，如果不需要删除即可 */
        .slideBox .prev,
        .slideBox .next{ position:absolute; left:3%; top:50%; margin-top:-25px; display:block; width:32px; height:40px; background:url(../images/slider-arrow.png) -110px 5px no-repeat; filter:alpha(opacity=50);opacity:0.5;   }
        .slideBox .next{ left:auto; right:3%; background-position:8px 5px; }
        .slideBox .prev:hover,
        .slideBox .next:hover{ filter:alpha(opacity=100);opacity:1;  }
        .slideBox .prevStop{ display:none;  }
        .slideBox .nextStop{ display:none;  }

        /*** promo部分 ***/
        .promo {
            margin: 5px auto 0;
        }
        .promo .layout {
            padding-left: 219px;
            box-sizing: border-box;
        }
        .promo-card {
            position: relative;
            margin-right: 5px;
            width: 231px;
            height: 128px;
            float: left;
        }
        .promo-card img{
            width: 231px;
        }
        .promo .news {
            width: 240px;
            height: 96px;
            border: 1px solid #e2e2e2;
            background-color: #fff;
            float: left;
            padding: 15px 0px 15px 10px;
            line-height: 1;
        }
        .promo .news a{
            font-size: 12px;
        }
        .promo .news h6 {
            font-size: 14px;
            margin-bottom: 17px;
        }
        .promo .news h6:before {
            content: '';
            display: inline-block;
            width: 4px;
            height: 15px;
            background-color: #de373e;
            margin-right: 8px;
            vertical-align: bottom;
        }
        .promo .news p {
            margin-bottom: 12px;
        }

        /*** 右侧部分 ***/
        .box {
            border-bottom: 1px dotted #ddd;
            padding-bottom: 15px;
            margin-bottom: 10px;
            background: #fff;
            float: left;
            margin-left: 20px;
            width: 380px;
        }
        .box h2{margin-bottom: 5px;}
        .box .bd {
            margin-bottom: 10px;
        }
        .box .pic {
            float: left;
            width: 60px;
            margin-top: 2px;
        }
        .box .info {
            word-wrap: break-word;
            word-break: break-all;
            line-height: 1.5;
        }
        .info a{font-size: 12px;}

        /*** tab切换部分（人脉、服务、产品） ***/
        .offerlist{width: 780px;float: left;}
        .offerlist dl {
            padding: 20px 0;
            border-bottom: 1px solid #ddd;
        }
        .offerlist dt {
            text-align: center;
            font-size: 14px;
            float: left;
            width: 20%;
        }
        .offerlist dt img {
            vertical-align: middle;
        }
        .face-box {
            background: #fff;
            border: 1px solid #ddd;
            padding: 4px;
            width: 50px;
            margin-bottom: 5px;
        }
        .offerlist p {
            word-wrap: break-word;
            word-break: break-all;
        }
        b.realname_s {
            background-position: -20px 0;
        }
        b.email_s, b.realname_s, b.phone_s, b.friend_s {
            background: url(/images/v4/icon_member_140107.png) no-repeat;
            display: inline-block;
            width: 20px;
            height: 18px;
            vertical-align: sub;
            overflow: hidden;
        }
        .offerlist dd {
            float: left;
            width: 79%;
        }
        .green {
            color: #3b8e00;
            margin-right: 5px;
        }
        .ml10 {
            margin-left: 10px;
        }
        .offerlist .pic {
            background: url(/images/offer/sprite_offer_120803.png) no-repeat right 0;
            width: 15px;
            height: 15px;
            display: inline-block;
            vertical-align: middle;
            margin-left: 5px;
        }
        .offerlist .content {
            font-size: 12px;
            color: #585858;
            margin: 11px 0;
            line-height: 1.8;
            width: auto;
        }

        /*** 常用服务区 ***/
        .popular-serv {
            margin-bottom: 30px;
        }
        .popular-serv .card .hd {
            color: #fff;
            font-size: 20px;
            padding-top: 30px;
            height: 58px;
            padding-left: 20px;
            position: relative;
        }
        .popular-serv .card-1 {
            border-bottom-color: #de373e;
        }
        .popular-serv .card-2 {
            border-bottom-color: #4cb050;
        }
        .popular-serv .card-3 {
            border-bottom-color: #1b73ba;
        }
        .popular-serv .card-4 {
            border-bottom-color: #f37927;
            margin-right: 0;
        }
        .popular-serv .card-1 .hd {
            background-color: #de373e;
        }
        .popular-serv .card-2 .hd {
            background-color: #4cb050;
        }
        .popular-serv .card-3 .hd {
            background-color: #1b73ba;
        }
        .popular-serv .card-4 .hd {
            background-color: #f37927;
        }
        .popular-serv .card .hd:after {
            content: '';
            position: absolute;
            right: 0;
            bottom: 0;
        }
        .popular-serv .card-1 .hd:after {
            right: 15px;
            bottom: -20px;
            width: 97px;
            height: 81px;
            background-image: url(../images/sprite-index.cf.png);
            background-position: -287px -227px;
        }
        .popular-serv .card-2 .hd:after {
            bottom: -28px;
            right: 15px;
            width: 112px;
            height: 89px;
            background-image: url(../images/sprite-index.cf.png);
            background-position: -190px -134px;
        }
        .popular-serv .card-3 .hd:after {
            right: 10px;
            bottom: -20px;
            width: 93px;
            height: 90px;
            background-image: url(../images/sprite-index.cf.png);
            background-position: -190px -227px;
        }
        .popular-serv .card-4 .hd:after {
            right: 13px;
            bottom: -12px;
            width: 111px;
            height: 82px;
            background-image: url(../images/sprite-index.cf.png);
            background-position: -306px -134px;
        }
        .popular-serv .card {
            width: 288px;
            height: 396px;
            border: 1px solid #e2e2e2;
            float: left;
            margin-right: 5px;
            background-color: #fff;
        }
        .popular-serv .card .prd-main {
            padding: 16px;
            color: gray;
            font-size: 14px;
            box-sizing: border-box;
            height: 160px;
            position: relative;
        }
        .popular-serv .card .prd-main .tit:hover {
            color: #de373e;
        }
        .popular-serv .card .prd-main .tit {
            font-size: 16px;
            color: #323232;
            margin-bottom: 5px;
            max-height: 46px;
            white-space: normal;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
        }
        .tag-discount {
            font-size: 12px;
            display: inline-block;
            line-height: 1;
            padding: 3px 4px;
            background-color: #de373e;
            color: #fff;
            margin-left: 5px;
        }
        .popular-serv .card .prd-main .price {
            font-size: 16px;
            color: #de373e;
            position: absolute;
            left: 16px;
            bottom: 18px;
        }
        .popular-serv .card .prd-main .btn {
            position: absolute;
            right: 16px;
            bottom: 16px;
        }
        .hongbao .prd .btn, .hot-provider .card .btm .btn, .popular-serv .card .prd-main .btn {
            text-align: center;
            width: 70px;
            line-height: 26px;
            padding: 0;
            border-radius: 4px;
            font-size: 14px;
            color: #de373e;
            border: 1px solid #de373e;
            -webkit-transition: all .3s;
            transition: all .3s;
            display: inline-block;
        }
        .popular-serv .card .prd-list {
            overflow: hidden;
        }
        .popular-serv .card .prd.bdr {
            border-right: 1px solid #e2e2e2;
        }
        .popular-serv .card .prd {
            border-top: 1px solid #e2e2e2;
            float: left;
            width: 50%;
            box-sizing: border-box;
            padding: 20px 0 14px;
            text-align: center;
            font-size: 14px;
            line-height: 1;
        }
        .popular-serv .card .prd .serv-name {
            max-width: 8em;
            display: block;
            margin: 0 auto;
        }
        .popular-serv .card .prd .des {
            color: gray;
            max-width: 8em;
            margin: 10px auto 0;
        }
        .popular-serv .card .prd.row:first-child {
            border-top: 1px solid #e2e2e2;
        }
        .popular-serv .card .prd.row .serv-name {
            max-width: 10em;
            display: inline;
            margin: 0;
        }
        .popular-serv .card .prd.row {
            width: auto;
            float: none;
            border: none;
            padding: 27px 0 0 10px;
            text-align: left;
            margin: 0 10px;
        }

        /*** 热门服务商 ***/
        .hot-provider {
            padding-top: 30px;
        }
        .hot-provider .card.ml0{margin-left:0;}

        .hot-provider .card {
            position: relative;
            float: left;
            background-color: #fff;
            border: 1px solid #e3e3e3;
            margin-left: 16px;
            margin-bottom: 16px;
            width: 283px;
            box-sizing: border-box;
        }
        .hot-provider .card .top {
            height: 98px;
            padding: 32px 10px 0;
            border-bottom: 1px solid #e3e3e3;
            color: #323232;
            font-size: 14px;
            background-image: url(..images/sprite/sprite-index.cf.png?max_age=31536000);
            background-position: -190px 0;
        }
        .hot-provider .card .top h5 {
            font-size: 18px;
            margin-top: 7px;
            margin-bottom: 8px;
            max-width: 163px;
            max-height: 3em;
            white-space: normal;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
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
        .hot-provider .card .top p em {
            color: #de373e;
            margin: 0 5px 0 3px;
        }
        .hot-provider .card .cate-tag {
            font-size: 12px;
            line-height: 14px;
            width: 2em;
            color: #fff;
            position: absolute;
            top: 0;
            right: 10px;
            padding: 5px 7px 12px;
            background-image: url(../../../sprite/sprite-54b562872d.index.cf.png?max_age=31536000);
            background-position: -421px -134px;
        }
        .hot-provider .card .logo {
            width: 70px;
            height: 70px;
            float: left;
            margin-right: 16px;
        }
        .hot-provider .card .btm {
            height: 100px;
            padding-top: 30px;
            text-align: center;
            font-size: 14px;
        }
        .hot-provider .card .btm .btn {
            width: auto;
            padding: 2px 14px;
            margin-top: 28px;
        }
        .offerlistclss{margin-top: 5px;}
        .offerlistclss span{padding:3px 5px; cursor: pointer; margin-top: 10px; margin-right:5px;background-color: #004b92;color:#FFF;}
        .liuyan{    position: absolute;
            padding-top: 20px;
            right: 0;
            top: 5px;
            width: 246px;
            margin-top: 20px;
            box-sizing: border-box;
            background-color: #fff;
            z-index: 3;}
        /*文本框样式调整*/
        .layui-input-block{width:225px;margin-left:auto;margin-right: auto;}
        .layui-form-item .layui-input-inline{width:225px;margin-left:10px;}

        /*新闻部分*/
        .media-new-list {
            padding-bottom: 30px;
            overflow: hidden;
        }
        .business-new-big {
            position: relative;
            display: block;
            float: left;
            margin: 0 15px 0 0px;
            width: 475px;
            height: 308px;
            overflow: hidden;
        }
        .business-new-big>img {
            width: 100%;
            height: 100%;
        }
        .business-new-big>p {
            position: absolute;
            left: 0;
            right: 0;
            bottom: 0;
            line-height: 36px;
            font-size: 16px;
            color: #fff;
            padding: 0 10px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            background: url(../images/transparent60.png) repeat;
        }
        .media-report {
            margin: 0 -14px;
            float: left;
        }
        .media-report>li {
            display: block;
            float: left;
            width: 210px;
            padding: 0 15px;
            margin: 0 -1px;
            border-left: 1px #eee solid;
        }
        .media-report>li>a {
            display: block;
        }
        .report-img {
            width: 210px;
            height: 140px;
        }
        .report-img>img {
            width: 100%;
            height: 100%;
        }
        .report-title {
            font-size: 16px;
            color: #666;
            font-weight: bold;
            padding: 15px 0 0;
            line-height: 24px;
            height: 60px;
            display: -webkit-box;
            overflow: hidden;
            white-space: normal!important;
            text-overflow: ellipsis;
            word-wrap: break-word;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
        }
        .report-txt {
            font-size: 12px;
            color: #999;
            margin: 15px 0 20px;
            display: -webkit-box;
            overflow: hidden;
            white-space: normal!important;
            text-overflow: ellipsis;
            word-wrap: break-word;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            line-height: 20px;
            height: 40px;
        }
        .report-time {
            font-size: 12px;
            color: #999;
            overflow: hidden;
            line-height: 25px;
        }
        .report-time>span {
            margin-right: 15px;
        }
        .eye-icon {
            display: inline-block;
            vertical-align: middle;
            width: 15px;
            height: 15px;
            background: url(./images/eye_icon.png) no-repeat center 2px;
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="http://lib.h-ui.net/jquery.SuperSlide/2.1.1/jquery.SuperSlide.min.js"></script>

</head>
<body>
<input type="hidden" value="index" id="nav">
<jsp:include page="common/top.jsp"></jsp:include>
<div id="slideBox" class="slideBox">
    <div class="content" style="position: relative;">
        <div class="liuyan">
            <form id="userNeedForm" class="layui-form order-form" action="">
                <div class="layui-form-item">

                    <div class="layui-input-inline">
                        <select name="categoryCode">
                            <option value="0">请选需求类型</option>
                            <option value="1-" selected="">金融</option>
                            <option value="2-">贷款</option>
                            <option value="3-">企业求助</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <input type="text" name="mobile" lay-verify="phone" autocomplete="off" placeholder="请输入手机号码" class="layui-input">
                    </div>
                </div>
                <%--<div class="layui-form-item layui-form-text">--%>
                    <%--<div class="layui-input-block">--%>
                        <%--<textarea placeholder="请输入需求内容" name="needDesc" lay-verify="n_needContent" class="layui-textarea"></textarea>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" style="width: 100%;" lay-filter="demo1">立即提交</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="hd">
        <ul><li>1</li><li>2</li><li>3</li></ul>
    </div>
    <div class="bd">
        <ul>
            <li><a href="javascript:void(0);" target="_blank"><img src="http://img.dd1008.com/aifa/image/20161020/1476931727170207.png" /></a></li>
            <li><a href="javascript:void(0);" target="_blank"><img src="http://img.dd1008.com/aifa/image/20161020/1476932482181102.png" /></a></li>
            <li><a href="javascript:void(0);" target="_blank"><img src="../images/banner/1.png" /></a></li>
        </ul>
    </div>

    <!-- 下面是前/后按钮代码，如果不需要删除即可 -->
    <a class="prev" href="javascript:void(0)"></a>
    <a class="next" href="javascript:void(0)"></a>

</div>

<script id="jsID" type="text/javascript">
    $(function () {
        $(".nav-l2-container").css("display","block");
    });
    var ary = location.href.split("&");
    jQuery(".slideBox").slide( { mainCell:".bd ul", effect:ary[1],autoPlay:ary[2],trigger:ary[3],easing:ary[4],delayTime:ary[5],mouseOverStop:ary[6],pnLoop:ary[7] });
</script>


<%-- promo部分 --%>
<div class="promo">
    <div class="layout clearfix content">
        <%--<a href="/cmdty/detail?csId=13216" target="_blank" class="promo-card" _stat_click_id="5_10">&nbsp;</a>--%>
        <a href="/product/detail/22.html" target="_blank" class="promo-card" _stat_click_id="5_10"><img src="http://p.qpic.cn/zc_pic/0/7e41cb2673f1459c245d04a43e75c9e314815479845626/0"></a>
        <a href="/product/detail/23.html" target="_blank" class="promo-card" _stat_click_id="5_11"><img src="http://p.qpic.cn/zc_pic/0/0eba100cd32cca46a47cd7658e006650148154808028/0"></a>
        <a href="/product/detail/24.html" target="_blank" class="promo-card" _stat_click_id="5_12"><img src="http://p.qpic.cn/zc_pic/0/5d796bbd57da739165489a75fa6800b914815481289252/0"></a>
        <div class="news">
            <h6>平台最新动态</h6>
            <p><a href="/article/detail/1.html" target="_blank">2017创业趋势360°拆解</a></p>
            <p><a href="/article/detail/1.html" target="_blank">关于企巴巴</a></p>
            <p><a href="/article/detail/1.html" target="_blank">初创企业的知识产权保护</a></p>
        </div>
    </div>
</div>


<div class="content">
    <div class="notice">
        <p class="noticeGG">最新公告:</p>
        <p class="noticeGG_content"><a href="/article/detail/1.html">[3.03]企巴巴需求量过10万条</a> <span class="redClass">new</span></p>
        <p class="noticeGG_content"><a href="/article/detail/1.html">[3.03]企巴巴需求量过10万条</a> <span class="redClass">new</span></p>
        <div class="clear"></div>
    </div>
    <div class="main_business">
        <div class="cc">
            <div class="cc_img">
                <img src="images/icon/logo1.png" />
            </div>
            <div class="cc_content">
                <p class="cc_content_title">贷款服务</p>
                <p>额度高，放款快，门槛低，利率低</p>
            </div>
            <div class="clear"></div>
        </div>
        <div class="cc">
            <div class="cc_img">
                <img src="images/icon/logo2.png" />
            </div>
            <div class="cc_content">
                <p class="cc_content_title">工商服务</p>
                <p>价格透明，最快3天拿证</p>
            </div>
        </div>
        <div class="cc">
            <div class="cc_img">
                <img src="images/icon/logo3.png" />
            </div>
            <div class="cc_content">
                <p class="cc_content_title">法律服务</p>
                <p>专家团队，一对一服务</p>
            </div>
        </div>
        <div class="clear"></div>
    </div>

    <%-- popular-serv jmod-popular-serv --%>
    <div class="popular-serv jmod-popular-serv">
        <div class="layout">
            <div class="mod-boxhd"><h3 class="mod-boxhd-tit">常用服务</h3></div>
            <div class="clearfix">

                <div class="card card-1">
                    <div class="hd">
                        <h3>我要开公司</h3>
                    </div>
                    <div class="prd-main">
                        <a href="http://c.qq.com/ListSku/view?firstCateId=100003&amp;thirdCateId=100040" target="_blank" _stat_click_id="8_00"><p class="tit" title="有限责任公司注册">有限责任公司注册<span class="tag-discount">限时特惠</span></p></a>
                        <p class="des" title="一站式开公司服务">一站式开公司服务</p>
                        <p class="price"><a href="javascript:void(0);">¥500<small>起</small></a></p>
                        <a href="/product/productIntroduce/2-.html" target="_blank" class="btn" _stat_click_id="8_00">立即查看</a>
                    </div>
                    <div class="prd-list">
                        <div class="prd bdr">
                            <a href="javascript:void(0);" class="serv-name" title="创业问诊">创业问诊</a>
                            <p class="des" title="创业咨询服务">创业咨询服务</p>
                        </div>
                        <div class="prd">
                            <a href="javascript:void(0);" class="serv-name" title="国内普通商标注册">国内普通商标注册</a>
                            <p class="des" title="产权保护第一步">产权保护第一步</p>
                        </div>
                        <div class="prd bdr">
                            <a href="javascript:void(0);" class="serv-name" title="公司注册地址">公司注册地址</a>
                            <p class="des" title="没有地址怎么办">没有地址怎么办</p>
                        </div>
                        <div class="prd">
                            <a href="javascript:void(0);" class="serv-name" _stat_click_id="8_04" title="代理记账">代理记账</a>
                            <p class="des" title="专业会计帮你记账">专业会计帮你记账</p>
                        </div>
                    </div>



                </div>

                <div class="card card-2">
                    <div class="hd">
                        <h3>我要建团队</h3>
                    </div>


                    <div class="prd-main">
                        <a href="http://c.qq.com/ListSku/view?firstCateId=100143&amp;thirdCateId=100069" target="_blank" _stat_click_id="8_10"><p class="tit" title="批量招聘">批量招聘<span class="tag-discount">限时特惠</span></p></a>
                        <p class="des" title="捕获企业高端人才">捕获企业高端人才</p>
                        <p class="price"><a href="http://c.qq.com/ListSku/view?firstCateId=100143&amp;thirdCateId=100069" target="_blank" _stat_click_id="8_10">¥1000<small>起</small></a></p>
                        <a href="/product/productIntroduce/1-.html" target="_blank" class="btn" _stat_click_id="8_10">立即查看</a>
                    </div>




                    <div class="prd-list">



                        <div class="prd row">
                            <a href="http://c.qq.com/ListSku/view?firstCateId=100000&amp;thirdCateId=100096" target="_blank" class="serv-name" _stat_click_id="8_11" title="股权期权设计">股权期权设计</a>
                            <span class="des" title="合伙人必看">合伙人必看</span>
                        </div>









                        <div class="prd row">
                            <a href="http://c.qq.com/ListSku/view?firstCateId=100004&amp;thirdCateId=100114" target="_blank" class="serv-name" _stat_click_id="8_12" title="社保服务">社保服务</a>
                            <span class="des" title="团队基础必备">团队基础必备</span>
                        </div>









                        <div class="prd row">
                            <a href="http://c.qq.com/ListSku/view?firstCateId=100143&amp;thirdCateId=100393" target="_blank" class="serv-name" _stat_click_id="8_13" title="个人测评">个人测评</a>
                            <span class="des" title="测测你的创业力">测测你的创业力</span>
                        </div>



                    </div>



                </div>

                <div class="card card-3">
                    <div class="hd">
                        <h3>我要做产品</h3>
                    </div>


                    <div class="prd-main">
                        <a href="http://c.qq.com/ListSku/view?firstCateId=100002&amp;thirdCateId=100090" target="_blank" _stat_click_id="8_20"><p class="tit" title="软件著作权">软件著作权<span class="tag-discount">限时特惠</span></p></a>
                        <p class="des" title="软件产品基础必备">软件产品基础必备</p>
                        <p class="price"><a href="http://c.qq.com/ListSku/view?firstCateId=100002&amp;thirdCateId=100090" target="_blank" _stat_click_id="8_20">¥100<small>起</small></a></p>
                        <a href="/product/productIntroduce/3-.html" target="_blank" class="btn" _stat_click_id="8_20">立即查看</a>
                    </div>




                    <div class="prd-list">




                        <div class="prd bdr">
                            <a href="http://c.qq.com/ListSku/view?firstCateId=100383&amp;thirdCateId=100055" target="_blank" class="serv-name" _stat_click_id="8_21" title="ICP经营许可证">ICP经营许可证</a>
                            <p class="des" title="网络经营敲门砖">网络经营敲门砖</p>
                        </div>













                        <div class="prd">
                            <a href="http://c.qq.com/ListSku/view?firstCateId=100139&amp;thirdCateId=100416" target="_blank" class="serv-name" _stat_click_id="8_22" title="公众号申请">公众号申请</a>
                            <p class="des" title="公众号第一步">公众号第一步</p>
                        </div>
                        <div class="prd bdr">
                            <a href="http://c.qq.com/ListSku/view?firstCateId=100136" target="_blank" class="serv-name" _stat_click_id="8_23" title="企业网站">企业网站</a>
                            <p class="des" title="网站定制服务">网站定制服务</p>
                        </div>
                        <div class="prd">
                            <a href="http://c.qq.com/ListSku/view?firstCateId=100137&amp;thirdCateId=100350" target="_blank" class="serv-name" _stat_click_id="8_24" title="真机测试">真机测试</a>
                            <p class="des" title="腾讯真机服务">腾讯真机服务</p>
                        </div>
                    </div>



                </div>

                <div class="card card-4">
                    <div class="hd">
                        <h3>我要做推广</h3>
                    </div>


                    <div class="prd-main">
                        <a href="http://c.qq.com/ListSku/view?firstCateId=100139&amp;thirdCateId=100264" target="_blank" _stat_click_id="8_30"><p class="tit" title="电商解决方案">电商解决方案<span class="tag-discount">限时特惠</span></p></a>
                        <p class="des" title="搭建你的专属微信商城">搭建你的专属微信商城</p>
                        <p class="price"><a href="http://c.qq.com/ListSku/view?firstCateId=100139&amp;thirdCateId=100264" target="_blank" _stat_click_id="8_30">¥1<small>起</small></a></p>
                        <a href="http://c.qq.com/ListSku/view?firstCateId=100139&amp;thirdCateId=100264" target="_blank" class="btn" _stat_click_id="8_30">立即查看</a>
                    </div>
                    <div class="prd-list">
                        <div class="prd row">
                            <a href="http://c.qq.com/ListSku/view?firstCateId=100139&amp;thirdCateId=100244" target="_blank" class="serv-name" _stat_click_id="8_31" title="微官网">微官网</a>
                            <span class="des" title="微信官方网站搭建">微信官方网站搭建</span>
                        </div>
                        <div class="prd row">
                            <a href="http://c.qq.com/ListSku/view?firstCateId=100142&amp;thirdCateId=100317" target="_blank" class="serv-name" _stat_click_id="8_32" title="朋友圈广告">朋友圈广告</a>
                            <span class="des" title="时下最火推广">时下最火推广</span>
                        </div>
                        <div class="prd row">
                            <a href="http://c.qq.com/ListSku/view?firstCateId=100142&amp;thirdCateId=100314" target="_blank" class="serv-name" _stat_click_id="8_33" title="手机短信营销">手机短信营销</a>
                            <span class="des" title="营销推广必备">营销推广必备</span>
                        </div>



                    </div>



                </div>

            </div>
        </div>
    </div>



    <div class="index_need clearfix">
        <div class="mod-boxhd"><h3 class="mod-boxhd-tit">最新需求</h3></div>
<input type="text" id="areaVal" />
        <div class="layui-tab offerlist">
            <ul class="layui-tab-title">
                <li class="layui-this">个人</li>
                <li>同业</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">
                    <div class="offerlist">
                        <div class="offerlistclss offerlistclssPerson"><span code="1-">金融服务</span><span code="2-">企业服务</span><span code="3-">法律服务</span></div>
                        <div id="needDataMsgPerson"></div>
                    </div>
                </div>
                <div class="layui-tab-item">
                    <div class="offerlist">
                        <div class="offerlistclss offerlistclssAdviser"><span code="1-">金融服务</span><span code="2-">企业服务</span><span code="3-">法律服务</span></div>
                        <div id="needDataMsgAdvier"></div>
                    </div>
                </div>
            </div>
        </div>

        <%--右侧部分--%>
        <div class="box" id="recommendAdviser">

        </div>

    </div>

    <div class="hot-provider jmod-hot-provider">
        <div class="layout clearfix" id="serviceProvider">

        </div>
    </div>
<div class="clear"></div>


    <%--最闻部分--%>
    <div class="media-new-list" style="display: block;" id="recommendArticle">


    </div>
</div>
<jsp:include page="common/bottom.jsp"></jsp:include>
<script src="./plugins/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use('element', function(){
        var $ = layui.jquery
                ,element = layui.element(); //Tab的切换功能，切换事件监听等，需要依赖element模块
    });
</script>
<script>
    var cureentTime = 0;
    layui.use(['form'], function(){
        var form = layui.form()
                ,layer = layui.layer;

        //自定义验证规则
        form.verify({
            n_needContent: function(value){
                if(value.length < 5){
                    return '需求内容不要少于5个字，请尽可能的描述清楚！';
                }
            }
        });
        form.on('submit(demo1)', function(data){
            if((new Date().getTime())-cureentTime<4000){
                return false;
            }
            cureentTime = new Date().getTime();
            $.ajax({
                type: "POST",
                url: "/need/liuyan.json",
                data: $("#userNeedForm").serialize(),
                dataType: "json",
                async:false,
                success: function (data) {
                    if (data) {
                        layer.alert("您的需求已提交，我们会尽快与您联系。", {
                            title: '信息'
                        });
                        $(':input','#userNeedForm').val('');
                    } else {
                        layer.msg("发布失败！");
                    }
                }
            });
            return false;
        });

    });

    var pageSize=5;
    function paging(classCode){
        $.ajax({
            type: "POST",
            url: "/need/pageIndex.html",
            data: {
                classCode:classCode,
                memberType:0,
                currentPage:1,
                pageSize : pageSize
            },
            success: function(data){
                $("#needDataMsgPerson").html(data);
            }
        });
    };

    function paging2(classCode){
        $.ajax({
            type: "POST",
            url: "/need/pageIndex.html",
            data: {
                classCode:classCode,
                memberType:1,
                currentPage:1,
                pageSize : pageSize
            },

            success: function(data){
                $("#needDataMsgAdvier").html(data);
            }
        });
    };
    $(function () {
        $(".offerlistclssPerson span").click(function () {
            var thisObj = $(this);
            paging(thisObj.attr("code"));
        });

        $(".offerlistclssAdviser span").click(function () {
            var thisObj = $(this);
            paging2(thisObj.attr("code"));
        });

        paging();
        paging2();
        recommendAdviser();
        serviceProvider();
        recommendArticle();
    });

    function recommendAdviser(){
        $.ajax({
            type: "POST",
            url: "/adviserRecommend/list.html",
            data: {
                currentPage:1,
                pageSize : 6,
                type:"adviser"
            },
            success: function(data){
                $("#recommendAdviser").html(data);
            }
        });
    };
    function serviceProvider(){
        $.ajax({
            type: "POST",
            url: "/adviserRecommend/list.html",
            data: {
                currentPage:1,
                pageSize : 6,
                type:"serviceProvider"
            },
            success: function(data){
                $("#serviceProvider").html(data);
            }
        });
    };
    function recommendArticle(){
        $.ajax({
            type: "POST",
            url: "/article/indexPage.html",
            success: function(data){
                $("#recommendArticle").html(data);
            }
        });
    };
</script>
</body>
</html>
