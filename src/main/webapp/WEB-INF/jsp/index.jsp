<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <%@ include file="/common/global.jsp" %>
    <base href="<%=basePath%>">
    <title>企巴巴</title>
    <link rel="shortcut icon" href="../../images/icon/qibaba.icon">
    <meta name="keywords" content="企巴巴, 金融,顾问,法律">
    <meta name="description" content="企巴巴.企业巴巴IB2E（Internet Business to Enterprise）模式是以互联网管理模式为向导，通过PC电脑、移动端等新媒体为载体，针对对企业经营战略咨询、企业管理咨询、电商模式开发及运营、企业认证辅导等，建立企业信息化大数据，在以互联网的思维改善、改变传统工厂运作">
    <jsp:include page="common/css.jsp"></jsp:include>
    <style>
        /*developers：sunshenglin；*/
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
        .slideBox{ width:100%;position:relative;height: 400px;}
        .slideBox:after{content: '';display: block;clear: both;}
        .slideBox .hd{ overflow:hidden; position:absolute; right:5px; bottom:15px; z-index:1; }
        .slideBox .hd ul{ overflow:hidden; zoom:1; float:left;  }
        .slideBox .hd ul li{ float:left; margin-right:2px; padding:3px 6px;line-height:14px; text-align:center; background:#fff; cursor:pointer; }
        .slideBox .hd ul li.on{ background:#f00; color:#fff; }
        .slideBox .bd{ position:relative; height:100%; z-index:0;   }
        .slideBox .bd li{ zoom:1; vertical-align:middle; }
        .slideBox .bd img{ width:100%;display:block; height: 400px }

        /* 下面是前/后按钮代码，如果不需要删除即可 */
        .slideBox .prev,
        .slideBox .next{ position:absolute; left:3%; top:50%; margin-top:-25px; display:block; width:32px; height:40px; background:url(../images/slider-arrow.png) -110px 5px no-repeat; filter:alpha(opacity=50);opacity:0.5;   }
        .slideBox .next{ left:auto; right:3%; background-position:8px 5px; }
        .slideBox .prev:hover,
        .slideBox .next:hover{ filter:alpha(opacity=100);opacity:1;  }
        .slideBox .prevStop{ display:none;  }
        .slideBox .nextStop{ display:none;  }

        /*** promo部分 ***/
        .promo .layout {
            box-sizing: border-box;
        }
        .promo-card {
            position: relative;
            margin-right:1px;
            float: left;
        }
        .promo-card img{
            height: 118px;
        }
        .promo .news {
            width: 242px;
            height: 86px;
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
            background-color: #4cacf8;
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
            width: 375px;
            margin-top: 10px;
        }
        .box h2{padding: 10px;}
        .box .bd {
            padding-top: 10px;
            border-top: 1px solid #ddd;
        }
        .box .pic {
            float: left;
            width: 60px;
            margin: 10px;
            height: 80px;
        }
        .box .info {
            word-wrap: break-word;
            word-break: break-all;
            line-height: 1.5;
        }
        .info a{font-size: 12px;}

        /*** tab切换部分（人脉、服务、产品） ***/
        .offerlist{width: 780px;float: left;margin-right: 25px;background-color: #FFF;}
        .offerlist dl {
            padding: 18px 0;
            border-bottom: 1px solid #ddd;
        }
        .offerlist dt {
            font-size: 14px;
            float: left;
            width: 15%;
        }
        .offerlist dt img {
            vertical-align: middle;
        }
        .face-box {
            background: #fff;
            border: 1px solid #ddd;
            padding: 4px;
            width: 80px;
            height: 80px;
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
            width: 65%;margin-top: 10px;margin-right: 5%;
        }
        /*产品类型样式*/
        .green {
            /*color: red;*/
            margin-right: 5px;
            height: 35px;
            line-height: 35px;
            display: block;
        }
        .chanpin2{
            color: yellow;
        }
        .chanpin3{
            color: red;
        }
        .chanpin4{
            color: blue;
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
        #needDataMsgPerson{margin-left: 10px;}
        #needDataMsgAdvier{margin-left: 10px;}
        .offerlistclss{margin-top:10px;margin-left: 10px;}
        .offerlistclss span{padding:3px 5px; cursor: pointer; margin-top: 10px; margin-right:5px;background-color: #004b92;color:#FFF;}
        .liuyan{   
        	position: absolute;
            padding-top: 20px;
            right: 0;
            top: 5px;
            width: 280px;
            height: 340px;
            margin-top: 20px;
            box-sizing: border-box;
            background: url(../../images/tuming.jpg);
            opacity: .9;
            z-index: 3;
            color: #fff;
            }
            .liuyan h1{
            	text-align: center;
				font-size: 16px;
				height: 50px;
				line-height: 50px;
			}
			
			.liuyan .layui-form-item {
			    margin-bottom: 25px;
			    margin-left: 5px;
			}
			.liuyan .layui-form-label {
			    padding: 9px 15px;
			    width: 50px;
			}
			.liuyan .layui-form-item .layui-input-inline {
			    float: left;
			    width: 165px;
			    margin-right: 10px;
			}
			.liuyan .layui-input-block {
		    margin-left: 0px; 
		    min-height: 36px;
			}
			.liuyan .layui-btn{
				opacity: 1;
				margin-left: 18px;
				background: #2486B5;
				width: 238px;
			}
			.liuyan .layui-btn:hover{
				background: #0078AD;
			}
        /*文本框样式调整*/
        .layui-input-block{width:225px;margin-left:auto;margin-right: auto;}
        .layui-form-item .layui-input-inline{width:225px;margin-left:10px;}

        /*新闻部分*/
        .media-new-list {
            padding-bottom: 30px;
            overflow: hidden;
            background-color: #FFF;
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
            width: 98%;
            height: 98%;
        }
        .business-new-big>p {
            position: absolute;
            left: 0;
            right: 0;
            bottom: 0;
            line-height: 36px;
            font-size: 16px;
            color: #fff;
            width: 94%;
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

        /*我要当老板*/
        .when-boss-list {
            overflow: hidden;
            margin: 0 -10px;
            padding: 0 0 10px;
        }
        .when-boss-list>li {
            display: block;
            float: left;
            width: 378px;
            margin: 0 10px;
            border: 1px #eee solid;
            border-top: 2px #2992f6 solid;
            overflow: hidden;
            background-color: #FFF;
        }
        .boss-title {
            line-height: 73px;
            text-align: center;
            font-size: 24px;
            color: #999;
        }
        .boss-main {
            position: relative;
        }
        .boss-main-txt {
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            padding: 30px 30px;
        }
        .boss-main-txt>p {
            color: #004b92;
            font-weight: bold;
            font-size: 20px;
        }
        .boss-main-txt>p>span {
            display: block;
            font-size: 14px;
            color: #666;
            font-weight: normal;
            margin-left: 3px;
            margin: 5px 0 0;
        }
        .boss-main-txt>label {
            color: #fa4f4f;
            display: block;
            margin: 10px 0 15px;
            font-size: 16px;
            font-weight: bold;
        }
        .boss-main-txt>a {
            display: block;
            width: 78px;
            line-height: 24px;
            border: 1px #fa4f4f solid;
            border-radius: 2px;
            text-align: center;
            color: #fa4f4f;
        }
        .boss-sub {
            padding: 35px 0 40px;
            margin: 0 -1px;
            overflow: hidden;
        }
        .boss-sub>a {
            display: block;
            float: left;
            width: 149px;
            padding: 0 10px 0 30px;
            border-left: 1px #eaeaea solid;
            color: #999;
            height: 45px;
        }
        .boss-sub>a label {
            color: #333;
            cursor: pointer;
            font-weight: bold;
        }
        .boss-sub>a p {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .index-title{background-color:#1299f2;color: #FFF;    display: inline-block;
            padding: 5px;
            margin-bottom: 10px;}

        /*时间轴*/
        .time-line {
            position: relative;
            min-width: 1180px;
            background: url(/images/index/time_line.jpg) top center;
            padding: 15px 0 20px;
        }
        .time-line-main {
            position: relative;
            z-index: 1;
            width: 1180px;
            text-align: center;
            margin: 0 auto;
        }
        .time-line-main>h3 {
            font-size: 30px;
            color: #fff;
            line-height: 45px;
        }
        .city-list {
            position: relative;
            display: inline-block;
            border-top: 1px #fff solid;
            border-bottom: 1px #fff solid;
            line-height: 32px;
            color: #fff;
            margin-top: 10px;
        }
        .city-list>label {
            margin: 0 23px;
        }
        .city-list>span {
            position: absolute;
            left: 50%;
            margin-left: -3px;
            padding: 0 2px;
            display: block;
            background: #3e9aef;
        }
        .city-list>span.top {
            top: -3px;
        }
        .city-list>span>i {
            width: 2px;
            height: 5px;
            display: block;
            background: #fff;
        }
        .city-list>span {
            position: absolute;
            left: 50%;
            margin-left: -3px;
            padding: 0 2px;
            display: block;
            background: #3e9aef;
        }
        .city-list>span.bottom {
            bottom: -3px;
        }
        .time-line-warp {
            width: 1180px;
            margin: 0 auto;
            /*overflow: hidden;*/
            position: relative;
            z-index: 1;
        }
        .time-list-main {
            height: 356px;
            width: 1224px;
            overflow: hidden;
        }
        .time-list-main li {
            display: block;
            float: left;
            width: 140px;
            padding: 285px 64px 0 0;
            text-align: left;
            color: #fff;
            font-size: 16px;
            text-align: center;
            position: relative;
        }
        /*新加的样式*/
        .time-list-main li div{
        	display: none;
        	width: 250px;
        	height: 200px;
        	border: 8px solid #F1F2F4;
        	border-radius: 5px;
        	position: absolute;
        	top: 60px;
    		right: -1px;
        }
        .time-list-main li .div111{
        	top: 60px;
    		right: -101px;
        }
        .time-list-main li .div111 span{
        	top: 42px;
    		left: 16px;
        }
         .time-list-main li div img{
         	width: 100%;
         	height:83%;
         }
         .time-list-main li div p{
         	line-height: 30px;
         	color: #fff;
         	background: #000;
         	height: 35px;
         	position: relative;
         }
         .time-list-main li:hover{
         	font-weight: bold;
         }
         .time-list-main li div span{
         	width: 0;
         	height: 0;
        	border-top: 8px solid #F1F2F4;
        	border-left: 8px solid transparent;
        	border-right: 8px solid transparent;
        	border-bottom: 8px solid transparent;
        	position: absolute;
    	    top: 42px;
    		left: 115px;
         }
        .time-p-n.prev {
            display: none;
            left: 0;
            background-position: 0 0;
        }
        .time-p-n {
            position: absolute;
            bottom: 34px;
            display: block;
            width: 35px;
            height: 35px;
            background-image: url(../images-v2/index/time_p_n.png);
        }
        .time-p-n.next {
            right: 0;
            background-position: -35px -35px;
        }
        .time-axis {
            position: absolute;
            left: 0;
            right: 0;
            bottom: 55px;
            min-width: 1180px;
            height: 30px;
            background: url(/images/index/time_line1.png) repeat center;
        }
        .time-txt {
            position: absolute;
            padding: 10px;
            bottom: 105px;
            width: 230px;
            background: url(/images/index/transparent40.png) repeat;
            color: #fff;
            line-height: 25px;
            border-radius: 5px;
        }
        .bottomCss{margin-top: 0px!important;}
        .gray{    padding: 0px 25px 0px 0px;}
        .index_icon_contain{background-color: #FFF;    width: 375px;float: left;}
        .index_icon{height:120px;border-bottom:1px solid #ddd;}
        .index_icon_div{text-align: center;width: 62px;float: left;margin: 25px 0px 10px 45px;}
        .index_icon_div img{margin-bottom: 5px;}
        .index_icon_font{text-align: center;width: 62px;float: left;margin: 25px 0px 10px 45px;}
        .index_icon_font span{display: block;}
    </style>
    <script type="text/javascript" src="js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="http://lib.h-ui.net/jquery.SuperSlide/2.1.1/jquery.SuperSlide.min.js"></script>

</head>
<body style="background-color:#f7f7f7;">
<input type="hidden" value="index" id="nav">
<jsp:include page="common/top.jsp"></jsp:include>
<div id="slideBox" class="slideBox">
    <div class="content" style="position: relative;">
        <div class="liuyan">
            <!--<form id="userNeedForm" class="layui-form order-form" action="">
                <input type="hidden" value="101" name="dataSource">
                <div class="layui-form-item">

                    <div class="layui-input-inline">
                        <select name="categoryCode">
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
            </form>      	-->
            <h1>企服申请</h1>
            <div class="layui-form-item">
				<label class="layui-form-label">企服用途</label>
				<div class="layui-input-inline">
					<div class="layui-unselect layui-form-select">
						<div class="layui-select-title"><input type="text" placeholder="不限" value="" readonly="" class="layui-input layui-unselect"><i class="layui-edge"></i></div>
						<dl class="layui-anim layui-anim-upbit">
							<dd lay-value="" class=""></dd>
						</dl>
					</div>
				</div>
						
			</div>
            <div class="layui-form-item">
				<label class="layui-form-label">企服用途</label>
				<div class="layui-input-inline">
					<div class="layui-unselect layui-form-select">
						<div class="layui-select-title"><input type="text" placeholder="不限" value="" readonly="" class="layui-input layui-unselect"><i class="layui-edge"></i></div>
						<dl class="layui-anim layui-anim-upbit">
							<dd lay-value="" class=""></dd>
						</dl>
					</div>
				</div>
						
			</div>
            <div class="layui-form-item">
						<label class="layui-form-label">需求名称</label>
						<div class="layui-input-inline">
							<input type="input" lay-verify="required" name="name" value="" placeholder="请输入号码" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                    </div>
                </div>
         </div>
    </div>
    <div class="hd">
        <ul><li>1</li><li>2</li><li>3</li></ul>
    </div>
    <div class="bd" id="flexslider">
        <ul>
            <li><a href="javascript:void(0);" target="_blank"><img src="../images/banner/1.jpg" /></a></li>
            <li><a href="javascript:void(0);" target="_blank"><img src="../images/banner/2.jpg" /></a></li>
            <li><a href="javascript:void(0);" target="_blank"><img src="../images/banner/3.jpg" /></a></li>
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
    jQuery(".slideBox").slide({mainCell:".bd ul",effect:"fold",autoPlay:true});
</script>


<%-- promo部分 --%>
<div class="promo">
    <div class="layout clearfix content">
        <a href="/product/detail/22.html" target="_blank" class="promo-card" _stat_click_id="5_10"><img src="/images/index/p1.jpg"></a>
        <a href="/product/detail/22.html" target="_blank" class="promo-card" _stat_click_id="5_10"><img src="/images/index/p2.jpg"></a>
        <a href="/product/detail/22.html" target="_blank" class="promo-card" _stat_click_id="5_10"><img src="/images/index/p3.jpg"></a>
        <a href="/product/detail/22.html" target="_blank" class="promo-card" _stat_click_id="5_10"><img src="/images/index/p4.jpg"></a>
        <div class="news">
            <h6>企服最新动态</h6>
            <p><a href="/article/detail/1.html" target="_blank">2017创业趋势360°拆解</a></p>
            <p><a href="/article/detail/1.html" target="_blank">关于企巴巴</a></p>
            <p><a href="/article/detail/1.html" target="_blank">初创企业的知识产权保护</a></p>
        </div>
    </div>
</div>


<div class="content" style="margin-top: 20px;">
    <%--<div class="notice">--%>
        <%--<p class="noticeGG">最新公告:</p>--%>
        <%--<p class="noticeGG_content"><a href="/article/detail/1.html">[3.03]企巴巴需求量过10万条</a> <span class="redClass">new</span></p>--%>
        <%--<p class="noticeGG_content"><a href="/article/detail/1.html">[3.03]企巴巴需求量过10万条</a> <span class="redClass">new</span></p>--%>
        <%--<div class="clear"></div>--%>
    <%--</div>--%>
    <%--<div class="main_business">--%>
        <%--<div class="cc">--%>
            <%--<div class="cc_img">--%>
                <%--<img src="images/icon/logo1.png" />--%>
            <%--</div>--%>
            <%--<div class="cc_content">--%>
                <%--<p class="cc_content_title">贷款服务</p>--%>
                <%--<p>额度高，放款快，门槛低，利率低</p>--%>
            <%--</div>--%>
            <%--<div class="clear"></div>--%>
        <%--</div>--%>
        <%--<div class="cc">--%>
            <%--<div class="cc_img">--%>
                <%--<img src="images/icon/logo2.png" />--%>
            <%--</div>--%>
            <%--<div class="cc_content">--%>
                <%--<p class="cc_content_title">工商服务</p>--%>
                <%--<p>价格透明，最快3天拿证</p>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="cc">--%>
            <%--<div class="cc_img">--%>
                <%--<img src="images/icon/logo3.png" />--%>
            <%--</div>--%>
            <%--<div class="cc_content">--%>
                <%--<p class="cc_content_title">法律服务</p>--%>
                <%--<p>专家团队，一对一服务</p>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="clear"></div>--%>
    <%--</div>--%>


        <div class="index_need clearfix">
            <%--<div class="mod-boxhd"><h3 class="mod-boxhd-tit">最新需求</h3></div>--%>
            <input type="hidden" id="areaVal" />
            <div class="layui-tab offerlist" style="margin-top: 0px;">
                <ul class="layui-tab-title">
                    <li class="layui-this">企服商家</li><%--个人需求--%>
                    <li>企服需求</li><%--商户需求--%>
                </ul>
                <div class="layui-tab-content" style="padding-left: 0px;">
                    <div class="layui-tab-item layui-show">
                        <div class="offerlist">
                            <div class="offerlistclss offerlistclssAdviser"><span code="1-">金融服务</span><span code="2-">企业服务</span><span code="3-">法律服务</span></div>

                            <div id="needDataMsgAdvier"></div>

                        </div>
                    </div>
                    <div class="layui-tab-item">
                        <div class="offerlist" >
                                <div class="offerlistclss offerlistclssPerson"><span code="1-">金融服务</span><span code="2-">企业服务</span><span code="3-">法律服务</span></div>


                                <div id="needDataMsgPerson"></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="index_icon_contain">
                <div class="index_icon">
                    <div class="index_icon_div">
                        <img src="/images/index/i1.jpg">
                        <span>实名认证</span>
                    </div>
                    <div class="index_icon_div">
                        <img src="/images/index/i2.jpg">
                        <span>不收费承诺</span>
                    </div>
                    <div class="index_icon_div">
                        <img src="/images/index/i3.jpg">
                        <span>免费服务</span>
                    </div>
                </div>
                <div>
                    <div class="index_icon_font">
                        <span class="size22">15万</span>
                        <span class="size14">服务机构</span>
                    </div>
                    <div class="index_icon_font">
                        <span class="size22">33万</span>
                        <span class="size14">贷款顾问</span>
                    </div>
                    <div class="index_icon_font">
                        <span class="size22">287万</span>
                        <span class="size14">客户信赖</span>
                    </div>
                </div>
            </div>
            <%--右侧部分--%>
            <div class="box" id="recommendAdviser">

            </div>
        </div>

    <%--<div class="hot-provider jmod-hot-provider">--%>
        <%--<div class="layout clearfix" id="serviceProvider">--%>

        <%--</div>--%>
    <%--</div>--%>
        <div class="clear"></div>




        <div class="when-boss">
            <p class="index-title size18">企服助您一臂之力</p>
            <ul class="when-boss-list">
                <li>
                    <div class="boss-title" style="color:#1399f2;">注册公司</div>
                    <div class="boss-main">
                        <img src="http://7xrgpz.com2.z0.glb.clouddn.com/serviceImg/20170313143142_boss1.jpg">
                        <div class="boss-main-txt">
                            <p>有限公司注册<span>足不出户开公司，轻松当老板</span></p>
                            <label>3280.0起</label>
                            <a target="_blank" href="/product/detail/12.html">查看详情</a>
                        </div>
                    </div>
                    <div class="boss-sub">
                        <a target="_blank" href="/product/detail/12.html">
                            <label>公司核名</label>
                            <p>3秒免费告知结果</p>
                        </a>
                        <a target="_blank" href="/product/detail/12.html">
                            <label>注册地址</label>
                            <p>低价，快捷注册</p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="boss-title" style="color:#785012;">做账报税</div>
                    <div class="boss-main">
                        <img src="http://7xrgpz.com2.z0.glb.clouddn.com/serviceImg/20170313143812_boss2.jpg">
                        <div class="boss-main-txt">
                            <p>会计定制<span>企业专属，定制不凡</span></p>

                            <label>￥1500.0起</label>

                            <a target="_blank" href="/product/detail/12.html">查看详情</a>
                        </div>
                    </div>
                    <div class="boss-sub">
                        <a target="_blank" href="/product/detail/12.html">
                            <label>小规模纳税人代理记账</label>
                            <p>大团队，你永远不缺人</p>

                        </a>
                        <a target="_blank" href="/product/detail/12.html">
                            <label>一般纳税人代理记账</label>
                            <p>专业才能做到省钱</p>

                        </a>
                    </div>
                </li>
                <li>
                    <div class="boss-title" style="color:#e19c23;">合法经营</div>
                    <div class="boss-main">
                        <img src="http://7xrgpz.com2.z0.glb.clouddn.com/serviceImg/20170420133711_20170316162039_融资贷款.jpg">
                        <div class="boss-main-txt">
                            <p>ICP许可证办理<span>网络经营，在线订购、在线支付、收取信息费等</span></p>
                            <label>￥20000.0起</label>
                            <a target="_blank" href="/product/detail/12.html">查看详情</a>
                        </div>
                    </div>
                    <div class="boss-sub">
                        <a target="_blank" href="/product/detail/12.html">
                            <label>网信认证</label>
                            <p>真实安全，用户更放心</p>

                        </a>
                        <a target="_blank" href="/product/detail/12.html">
                            <label>IDC许可办理</label>
                            <p>让您合法开展业务</p>
                        </a>
                    </div>
                </li>
            </ul>
        </div>
    <%--新闻部分--%>
    <div class="media-new-list" style="display: block;" id="recommendArticle">
    </div>
</div>

<div class="time-line">
    <div class="time-line-main">
        <h3>企巴巴  ·  一站式商业服务平台</h3>
        <div class="city-list">
            <label>北京</label>
            <label>深圳</label>
            <label>广州</label>
            <label>武汉</label>
            <label>成都</label>
            <label>重庆</label>
            <span class="top"><i></i></span>
            <span class="bottom"><i></i></span>
        </div>
        <div class="time-line-warp">
            <div class="time-list-main">
                <div class="tempWrap" style=" position:relative; width:1224px"><ul style="width: 2652px; left: -816px; position: relative;  padding: 0px; margin: 0px;">
                    <li data-src="/images-v2/img/time12.jpg" data-content="两省政府代表团视察顶呱呱" class="" style="float: left; width: 140px;"><a href="http://www.dgg.net/article/8759.html"></a>
                        <i></i><p>2017.4</p></li>                    <li data-src="/images-v2/img/time11.jpg" data-content="小顶家装开业" class="" style="float: left; width: 140px;"><i></i><p>2017.３</p></li>
                    <li data-src="/images-v2/img/time5.jpg" data-content="成立重庆分公司，巩固西南市场" class="" style="float: left; width: 140px;"><i></i><p>2016.12</p></li>
                    <li data-src="/images-v2/img/time7.jpg" data-content="广州分公司成立，进一步拓宽并抢占沿海市场" class="" style="float: left; width: 140px;"><i></i><p>2016.9</p></li>
                    <li data-src="/images-v2/img/time4.jpg" data-content="成立深圳分公司，立足闽南沿海市场" style="float: left; width: 140px;"><i></i><p>2017.5</p>
                    	<div class="div111"><img src="../../images/201705.png"/>
                    		<p>企巴巴线上一条龙网站成功上线
                    		<span></span>
                    		</p>
                    	</div>
                    </li>
                    <li data-src="" data-content="集团员工总数超2000人" class="" style="float: left; width: 140px;"><i></i><p>2017.3</p>
                    	<div><img src="../../images/201703.png"/>
                    		<p>与北京中讯担保强强合作
                    		<span></span>
                    		</p>
                    	</div>
                    </li>
                    <li data-src="/images-v2/img/time3.jpg" data-content="成立成都分公司，打开西南市场" style="float: left; width: 140px;" class=""><i></i><p>2016.12</p>
                    	<div><img src="../../images/201612.png"/>
                    		<p>商业大数据数据库成功建立
                    		<span></span>
                    		</p>
                    	</div>
                    </li>
                    <li data-src="/images-v2/img/time6.jpg" data-content="挂牌上市，集团上海股权交易中心" style="float: left; width: 140px;" class=""><i></i><p>2016.3</p>
                    	<div><img src="../../images/201603.png"/>
                    		<p>在深圳，上海，武汉设立办事处
                    		<span></span>
                    		</p>
                    	</div>
                    </li>
                    <li data-src="/images-v2/img/time2.jpg" data-content="被评为省级文明单位" style="float: left; width: 140px;" class=""><i></i><p>2016.2</p>
                    	<div><img src="../../images/201602.png"/>
                    		<p style="line-height: 15px;">企巴巴企业管理软件与武汉市，荆州市政府签署合作协议，进军二三线城市
                    		<span></span>
                    		</p>
                    	</div>
                    </li>
                    <li data-src="/images-v2/img/time10.jpg" data-content="受邀参加第129届国际商标协会INTA年会并成为国际商标协会的会员" style="float: left; width: 140px;" class=""><i></i><p>2015.9</p>
                    	<div style="display: block;"><img src="../../images/201509.png"/>
                    		<p>企巴巴企业管理有限公司在北京成立
                    		<span></span>
                    		</p>
                    	</div>
                    </li>
                    <li data-src="/images-v2/img/time8.jpg" data-content="集工商、会计、融资等业态，率先立足一站式商业服务领域" style="float: left; width: 140px;"><i></i><p>2009.8</p></li>
                    <li data-src="/images-v2/img/time1.jpg" data-content="被评为高新技术企业" style="float: left; width: 140px;"><i></i><p>2003.9</p></li>
                    <li data-src="/images-v2/img/time0.jpg" data-content="小顶网成立，注册资金1000万元" style="float: left; width: 140px;"><i></i><p>1996.6</p></li>
                </ul></div>
            </div>
            <a href="javascript:void(0)" class="time-p-n prev" style="display: inline;"></a>
            <a href="javascript:void(0)" class="time-p-n next"></a>
        </div>
    </div>
    <div class="time-axis"></div>
    <%--<div class="time-txt" style="display: block; left: 296.5px;">--%>
        <%--<i></i>--%>
        <%--<div class="time-img"><img src="/images-v2/img/time4.jpg"></div>--%>
        <%--<p>成立深圳分公司，立足闽南沿海市场</p>--%>
    <%--</div>--%>
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
//  $('#flexslider').flexslider({
//      /*directionNav: true,
//       pauseOnAction: false*/
//      slideshowSpeed: 3000, //  定时器,时间间隔
//      pauseOnHover: true // 鼠标悬停停止播放
//  });
//  鼠标移入显示
	$('.time-list-main li').mouseover(function(){
		$(this).find('div').show();
		$(this).siblings().find('div').hide();
	})
//	鼠标离开隐藏
//	$('.time-line-main').mouseleave(function(){
//		$('.time-list-main li').find('div').hide();
//	})
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
//        serviceProvider();
        recommendArticle();
    });

    function recommendAdviser(){
        $.ajax({
            type: "POST",
            url: "/adviserRecommend/list.html",
            data: {
                currentPage:1,
                pageSize : 6,
                type:"adviser",

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
