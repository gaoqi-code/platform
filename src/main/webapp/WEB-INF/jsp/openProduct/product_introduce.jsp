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
            width: 390px;
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
    </style>
</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>

<div id="container">
    <div class="position2">
        您当前位置：<a href="/index.htm">企巴巴</a> &gt;
        <a href="/tmbrandsearch/index.htm">找产品</a>
    </div>


    <div class="content">



        <div class="main">
            <div class="banner jmod_cate_banner">
                <h3 class="banner--title">有限责任公司注册</h3>
                <ul class="banner--list">

                    <li class="banner--item">
                        <p class="title">什么是有限责任公司注册？</p>
                        <p class="pcontent">有限责任公司是指《中华人民共和国公司登记管理条例》规定登记注册，由五十个以下的股东出资设立，公司以全部资产对其债务承担责任的经济组织。</p>
                    </li>


                    <li class="banner--item">
                        <p class="title">什么是五证合一？</p>
                        <p class="pcontent">2016年10月1日起，国务院要求正式实施“五证合一、一照一码”，在更大范围、更深层次实现信息共享和业务协同，其中新增两证为社会保险登记证和统计登记证。</p>
                    </li>

                </ul>
            </div>


            <div class="search-select">
                <ul>
                    <li>
                        <h3>公司注册：</h3>
                        <div class="selectSpan" id="categorySearch">
                            <span><a class="allSelect" href="javascript:void(0);">全部</a></span><span><a href="javascript:void(0);" code="3-">有限责任公司注册</a></span><span><a href="javascript:void(0);" code="1-">金融服务</a></span><span><a href="javascript:void(0);" code="5-">法律顾问</a></span>
                            <input type="hidden" id="categoryVal" value="3-">
                        </div>
                        <div class="clear"></div>
                    </li>
                    <li style="border: 0px;">
                        <h3>公司变更：</h3>
                        <div class="selectSpan" id="areaSearch">
                            <span><a class="allSelect" href="javascript:void(0);">全部</a></span><span><a href="javascript:void(0);" code="4-">公司股权变更</a></span><span><a href="javascript:void(0);" code="1-">公司经营范围变更</a></span><span><a href="javascript:void(0);" code="8-">公司名称变更</a></span>
                            <input type="hidden" id="areaVal">
                        </div>
                        <div class="clear"></div>
                    </li>
                    <li style="border: 0px;">
                        <h3>注册相关服务：</h3>
                        <div class="selectSpan" id="areaSearch">
                            <span><a class="allSelect" href="javascript:void(0);">全部</a></span><span><a href="javascript:void(0);" code="4-">国税地税报到</a></span><span><a href="javascript:void(0);" code="1-">办公地址</a></span>
                            <input type="hidden" id="areaVal">
                        </div>
                        <div class="clear"></div>
                    </li>
                </ul>
            </div>


            <div class="city jmod_area_container hidden" style="display: block;">
                <h3>
                    在<span class="mod-icon mod-icon-pin"></span><div class="ui-address ui-address-close">
                    <div class="ui-checkbox-wrap jmod_select_address">
                        <label for="add16" class="ui-checkbox-text jmod_cur_select_area">安徽芜湖</label>
                    </div>
                    <div class="ui-address-layer jmod_select_area mod-addr-layer">
                        <div class="mod-tab-panel jmod_select_province_city">
                            <div class="tab-item cur" _province_id="100171">
                                <span class="item-in" _province_id="100171">安徽</span>
                            </div>
                            <div class="tab-item">
                                <span class="item-in" _city_id="100173">芜湖</span>
                            </div>
                        </div>
                        <div class="mod-tab-content">
                            <div class="tab-content clearfix jmod_select_province">
                                <div class="address-item" _province_id="999999"><span>全国</span></div>


                                <div class="address-item" _province_id="100000"><span>北京</span></div>


                                <div class="address-item" _province_id="100020"><span>天津</span></div>


                                <div class="address-item" _province_id="100040"><span>河北</span></div>


                                <div class="address-item" _province_id="100053"><span>山西</span></div>


                                <div class="address-item" _province_id="100066"><span>内蒙古</span></div>


                                <div class="address-item" _province_id="100080"><span>辽宁</span></div>


                                <div class="address-item" _province_id="100096"><span>吉林</span></div>


                                <div class="address-item" _province_id="100107"><span>黑龙江</span></div>


                                <div class="address-item" _province_id="100122"><span>上海</span></div>


                                <div class="address-item" _province_id="100143"><span>江苏</span></div>


                                <div class="address-item" _province_id="100158"><span>浙江</span></div>


                                <div class="address-item checked" _province_id="100171"><span>安徽</span></div>


                                <div class="address-item" _province_id="100190"><span>福建</span></div>


                                <div class="address-item" _province_id="100201"><span>江西</span></div>


                                <div class="address-item" _province_id="100214"><span>山东</span></div>


                                <div class="address-item" _province_id="100233"><span>河南</span></div>


                                <div class="address-item" _province_id="100253"><span>湖北</span></div>


                                <div class="address-item" _province_id="100272"><span>湖南</span></div>


                                <div class="address-item" _province_id="100288"><span>广东</span></div>


                                <div class="address-item" _province_id="100311"><span>广西</span></div>


                                <div class="address-item" _province_id="100327"><span>海南</span></div>


                                <div class="address-item" _province_id="100350"><span>重庆</span></div>


                                <div class="address-item" _province_id="100392"><span>四川</span></div>


                                <div class="address-item" _province_id="100415"><span>贵州</span></div>


                                <div class="address-item" _province_id="100426"><span>云南</span></div>


                                <div class="address-item" _province_id="100444"><span>西藏</span></div>


                                <div class="address-item" _province_id="100453"><span>陕西</span></div>


                                <div class="address-item" _province_id="100465"><span>甘肃</span></div>


                                <div class="address-item" _province_id="100481"><span>青海</span></div>


                                <div class="address-item" _province_id="100491"><span>宁夏</span></div>


                                <div class="address-item" _province_id="100498"><span>新疆</span></div>


                                <div class="address-item" _province_id="100518"><span>台湾</span></div>


                                <div class="address-item" _province_id="100543"><span>香港</span></div>


                                <div class="address-item" _province_id="100545"><span>澳门</span></div>


                            </div>
                        </div>
                        <div class="mod-tab-content">
                            <div class="tab-content clearfix jmod_select_city" style="display: none;"><div class="address-item" _city_id="100171"><span>全部</span></div><div class="address-item" _city_id="100172"><span>合肥</span></div><div class="address-item checked" _city_id="100173"><span>芜湖</span></div><div class="address-item" _city_id="100174"><span>蚌埠</span></div><div class="address-item" _city_id="100175"><span>淮南</span></div><div class="address-item" _city_id="100176"><span>马鞍山</span></div><div class="address-item" _city_id="100177"><span>淮北</span></div><div class="address-item" _city_id="100178"><span>铜陵</span></div><div class="address-item" _city_id="100179"><span>安庆</span></div><div class="address-item" _city_id="100180"><span>黄山</span></div><div class="address-item" _city_id="100181"><span>滁州</span></div><div class="address-item" _city_id="100182"><span>阜阳</span></div><div class="address-item" _city_id="100183"><span>宿州</span></div><div class="address-item" _city_id="100184"><span>巢湖</span></div><div class="address-item" _city_id="100185"><span>六安</span></div><div class="address-item" _city_id="100186"><span>亳州</span></div><div class="address-item" _city_id="100187"><span>池州</span></div><div class="address-item" _city_id="100188"><span>宣城</span></div><div class="address-item" _city_id="100189"><span>其他</span></div></div>
                        </div>
                    </div>
                </div>
                    <span class="jmod_found">为您找到<span class="city--count jmod_corp_count">8家</span>
                        服务商，带有
                        <span class="mod-icon-grantee"></span>标识为腾讯担保交易
                        <span class="mod-icon-qmark-circle" data-title="款项支付给平台，在您验收无误后结算给服务商"></span>&nbsp;的服务商
                    </span>
                    <span class="jmod_not_found" style="display: none;">暂未找到服务商，我们正在引入中，敬请期待。</span>
                </h3>
            </div>
            <ul class="sv-list jmod_service_list" style="min-height: 300px;">
                <li class="sv-card">
                    <div class="sv-card--top clearfix">
                        <a _stat_click_id="7_114379" href="/cmdty/detail?csId=14379" target="_blank"><img src="http://p.qlogo.cn/zc_icon/0/a6cdb362d42233bad7894c5c860d9e88/0" class="sv-card--icon"></a>
                        <!-- 重度服务商 -->

                        <p class="sv-card--name"><a class="name" _stat_click_id="7_214379" href="/cmdty/detail?csId=14379" target="_blank">长顺企业</a><a href="/scenter/growth" target="_blank" class="lv">Lv1</a><span class="mod-icon-grantee"></span></p>
                        <ul class="sv-card--review">
                            <li class="sv-card--review-item">
                                <span class="title">张三</span>
                                <%--<span class="point">金牌顾问</span>--%>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">金牌顾问</span>
                                <%--<span class="point">暂无</span>--%>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">执业5年</span>
                                <%--<span class="point">暂无</span>--%>
                            </li>
                        </ul>

                        <span class="arrow"></span>
                    </div>
                    <div class="sv-card--bottom">
                        <a href="/cmdty/detail?csId=14379" class="sv-card--type" target="_blank" title="有限责任公司注册（公司注册基础服务+核名+注册指导建议+工商年报+提供深圳地址）">有限责任公司注册（公司注册基础服务+核名+注册指导建议+工商年报+提供深圳地址）</a>
                        <div class="sv-card--sale">

                            <a _stat_click_id="7_414379" href="/cmdty/detail?csId=14379" target="_blank">咨询 845</a>
                            <a _stat_click_id="7_514379" href="/cmdty/detail?csId=14379" target="_blank">销量 1132</a>

                        </div>
                        <div class="sv-card--price">


                            <div class="sv-card--special"><span class="sv-card--red">¥1800.00</span></div>


                        </div>
                        <div class="sv-card--btn-wrap">
                            <a class="ui-button ui-button-sm ui-button-primary jmod-consult-stat jmod-wpa-qq" _wpa_qq="319591724" _stat_click_id="7_6305427" data-cid="305427" data-csid="14379" target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=319591724&amp;site=qq&amp;menu=yes">QQ咨询</a>

                            <a href="/cmdty/detail?csId=14379" target="_blank" class="ui-button ui-button-sm ui-button-primary" _stat_click_id="7_7305427">查看详情</a>

                        </div>
                    </div>
                </li>

                <li class="sv-card">
                    <div class="sv-card--top clearfix">
                        <a _stat_click_id="7_115611" href="/cmdty/detail?csId=15611" target="_blank"><img src="http://p.qlogo.cn/zc_icon/0/3574fe23b350f6b4c15de8d9c44afeea/0" class="sv-card--icon"></a>
                        <!-- 重度服务商 -->

                        <p class="sv-card--name"><a class="name" _stat_click_id="7_215611" href="/cmdty/detail?csId=15611" target="_blank">精益求精集团</a><a href="/scenter/growth" target="_blank" class="lv">Lv1</a><span class="mod-icon-grantee"></span></p>
                        <ul class="sv-card--review">
                            <li class="sv-card--review-item">
                                <span class="title">质量</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">速度</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">态度</span>
                                <span class="point">暂无</span>
                            </li>
                        </ul>

                        <span class="arrow"></span>
                    </div>
                    <div class="sv-card--bottom">
                        <a href="/cmdty/detail?csId=15611" class="sv-card--type" target="_blank" title="有限责任公司注册（公司注册基础服务+核名+注册指导建议+工商年报+提供深圳地址挂靠）">有限责任公司注册（公司注册基础服务+核名+注册指导建议+工商年报+提供深圳地址挂靠）</a>
                        <div class="sv-card--sale">

                            <a _stat_click_id="7_415611" href="/cmdty/detail?csId=15611" target="_blank">咨询 5</a>
                            <a _stat_click_id="7_515611" href="/cmdty/detail?csId=15611" target="_blank">销量 50</a>

                        </div>
                        <div class="sv-card--price">


                            <div class="sv-card--special"><span class="sv-card--red">¥1900.00</span></div>


                        </div>
                        <div class="sv-card--btn-wrap">
                            <a class="ui-button ui-button-sm ui-button-primary jmod-consult-stat jmod-wpa-qq" _wpa_qq="1594790668" _stat_click_id="7_6316389" data-cid="316389" data-csid="15611" target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=1594790668&amp;site=qq&amp;menu=yes">QQ咨询</a>

                            <a href="/cmdty/detail?csId=15611" target="_blank" class="ui-button ui-button-sm ui-button-primary" _stat_click_id="7_7316389">查看详情</a>

                        </div>
                    </div>
                </li>

                <li class="sv-card">
                    <div class="sv-card--top clearfix">
                        <a _stat_click_id="7_113510" href="/cmdty/detail?csId=13510" target="_blank"><img src="http://p.qlogo.cn/zc_icon/0/cea5fc96a89eeb81576946ad5fee4470/0" class="sv-card--icon"></a>
                        <!-- 重度服务商 -->

                        <p class="sv-card--name"><a class="name" _stat_click_id="7_213510" href="/cmdty/detail?csId=13510" target="_blank">神州顺利办</a><a href="/scenter/growth" target="_blank" class="lv">Lv8</a><span class="mod-icon-grantee"></span></p>
                        <ul class="sv-card--review">
                            <li class="sv-card--review-item">
                                <span class="title">质量</span>
                                <span class="point">4.6</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">速度</span>
                                <span class="point">4.6</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">态度</span>
                                <span class="point">4.7</span>
                            </li>
                        </ul>

                        <span class="arrow"></span>
                    </div>
                    <div class="sv-card--bottom">
                        <a href="/cmdty/detail?csId=13510" class="sv-card--type" target="_blank" title="有限责任公司注册 U创套餐（东莞注册地址+银行开户+一年代理记账）全国可办理">有限责任公司注册 U创套餐（东莞注册地址+银行开户+一年代理记账）全国可办理</a>
                        <div class="sv-card--sale">

                            <a _stat_click_id="7_413510" href="/cmdty/detail?csId=13510" target="_blank">咨询 411</a>
                            <a _stat_click_id="7_513510" href="/cmdty/detail?csId=13510" target="_blank">销量 59</a>

                        </div>
                        <div class="sv-card--price">


                            <div class="sv-card--special"><span class="sv-card--red">¥2888.00</span></div>


                        </div>
                        <div class="sv-card--btn-wrap">
                            <a class="ui-button ui-button-sm ui-button-primary jmod-consult-stat jmod-wpa-qq" _wpa_qq="4006865658" _stat_click_id="7_6286679" data-cid="286679" data-csid="13510" href="javascript:void(0);">QQ咨询</a>

                            <a href="/cmdty/detail?csId=13510" target="_blank" class="ui-button ui-button-sm ui-button-primary" _stat_click_id="7_7286679">查看详情</a>

                        </div>
                    </div>
                </li>

                <li class="sv-card">
                    <div class="sv-card--top clearfix">
                        <a _stat_click_id="7_114818" href="/cmdty/detail?csId=14818" target="_blank"><img src="http://p.qlogo.cn/zc_icon/0/a6cdb362d42233bad7894c5c860d9e88/0" class="sv-card--icon"></a>
                        <!-- 重度服务商 -->

                        <p class="sv-card--name"><a class="name" _stat_click_id="7_214818" href="/cmdty/detail?csId=14818" target="_blank">长顺企业</a><a href="/scenter/growth" target="_blank" class="lv">Lv1</a><span class="mod-icon-grantee"></span></p>
                        <ul class="sv-card--review">
                            <li class="sv-card--review-item">
                                <span class="title">质量</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">速度</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">态度</span>
                                <span class="point">暂无</span>
                            </li>
                        </ul>

                        <span class="arrow"></span>
                    </div>
                    <div class="sv-card--bottom">
                        <a href="/cmdty/detail?csId=14818" class="sv-card--type" target="_blank" title="有限责任公司注册（提供地址哦——地址不收费含提供公司地址+核名+公司注册建议指导）">有限责任公司注册（提供地址哦——地址不收费含提供公司地址+核名+公司注册建议指导）</a>
                        <div class="sv-card--sale">

                            <a _stat_click_id="7_414818" href="/cmdty/detail?csId=14818" target="_blank">咨询 230</a>
                            <a _stat_click_id="7_514818" href="/cmdty/detail?csId=14818" target="_blank">销量 3026</a>

                        </div>
                        <div class="sv-card--price">


                            <div class="sv-card--special"><span class="sv-card--red">¥2000.00</span></div>


                        </div>
                        <div class="sv-card--btn-wrap">
                            <a class="ui-button ui-button-sm ui-button-primary jmod-consult-stat jmod-wpa-qq" _wpa_qq="319591724" _stat_click_id="7_6305427" data-cid="305427" data-csid="14818" target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=319591724&amp;site=qq&amp;menu=yes">QQ咨询</a>

                            <a href="/cmdty/detail?csId=14818" target="_blank" class="ui-button ui-button-sm ui-button-primary" _stat_click_id="7_7305427">查看详情</a>

                        </div>
                    </div>
                </li>

                <li class="sv-card">
                    <div class="sv-card--top clearfix">
                        <a _stat_click_id="7_115305" href="/cmdty/detail?csId=15305" target="_blank"><img src="http://p.qlogo.cn/zc_icon/0/2fe4d52210e6b36351c705407d8987f9/0" class="sv-card--icon"></a>
                        <!-- 重度服务商 -->

                        <p class="sv-card--name"><a class="name" _stat_click_id="7_215305" href="/cmdty/detail?csId=15305" target="_blank">助册易</a><a href="/scenter/growth" target="_blank" class="lv">Lv1</a><span class="mod-icon-grantee"></span></p>
                        <ul class="sv-card--review">
                            <li class="sv-card--review-item">
                                <span class="title">质量</span>
                                <span class="point">5.0</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">速度</span>
                                <span class="point">5.0</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">态度</span>
                                <span class="point">5.0</span>
                            </li>
                        </ul>

                        <span class="arrow"></span>
                    </div>
                    <div class="sv-card--bottom">
                        <a href="/cmdty/detail?csId=15305" class="sv-card--type" target="_blank" title="有限责任公司注册（香港公司注册对公账户）">有限责任公司注册（香港公司注册对公账户）</a>
                        <div class="sv-card--sale">

                            <a _stat_click_id="7_415305" href="/cmdty/detail?csId=15305" target="_blank">咨询 19</a>
                            <a _stat_click_id="7_515305" href="/cmdty/detail?csId=15305" target="_blank">销量 10</a>

                        </div>
                        <div class="sv-card--price">


                            <div class="sv-card--special"><span class="sv-card--red">¥3800.00</span></div>


                        </div>
                        <div class="sv-card--btn-wrap">
                            <a class="ui-button ui-button-sm ui-button-primary jmod-consult-stat jmod-wpa-qq" _wpa_qq="4008700852" _stat_click_id="7_6304882" data-cid="304882" data-csid="15305" href="javascript:void(0);">QQ咨询</a>

                            <a href="/cmdty/detail?csId=15305" target="_blank" class="ui-button ui-button-sm ui-button-primary" _stat_click_id="7_7304882">查看详情</a>

                        </div>
                    </div>
                </li>

                <li class="sv-card">
                    <div class="sv-card--top clearfix">
                        <a _stat_click_id="7_114739" href="/cmdty/detail?csId=14739" target="_blank"><img src="http://p.qlogo.cn/zc_icon/0/cac6c59f1aea225ce1d9964829389815/0" class="sv-card--icon"></a>
                        <!-- 重度服务商 -->

                        <p class="sv-card--name"><a class="name" _stat_click_id="7_214739" href="/cmdty/detail?csId=14739" target="_blank">小秘书</a><a href="/scenter/growth" target="_blank" class="lv">Lv1</a><span class="mod-icon-grantee"></span></p>
                        <ul class="sv-card--review">
                            <li class="sv-card--review-item">
                                <span class="title">质量</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">速度</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">态度</span>
                                <span class="point">暂无</span>
                            </li>
                        </ul>

                        <span class="arrow"></span>
                    </div>
                    <div class="sv-card--bottom">
                        <a href="/cmdty/detail?csId=14739" class="sv-card--type" target="_blank" title="有限责任公司注册（注册香港公司）">有限责任公司注册（注册香港公司）</a>
                        <div class="sv-card--sale">

                            <a _stat_click_id="7_414739" href="/cmdty/detail?csId=14739" target="_blank">咨询 20</a>
                            <a _stat_click_id="7_514739" href="/cmdty/detail?csId=14739" target="_blank">销量 3</a>

                        </div>
                        <div class="sv-card--price">


                            <del class="sv-card--orig-price">¥5000.00</del>
                            <div class="sv-card--special"><span class="sv-card--red">¥2500.00</span></div>


                        </div>
                        <div class="sv-card--btn-wrap">
                            <a class="ui-button ui-button-sm ui-button-primary jmod-consult-stat jmod-wpa-qq" _wpa_qq="2355219125" _stat_click_id="7_6304785" data-cid="304785" data-csid="14739" target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=2355219125&amp;site=qq&amp;menu=yes">QQ咨询</a>

                            <a href="/cmdty/detail?csId=14739" target="_blank" class="ui-button ui-button-sm ui-button-primary" _stat_click_id="7_7304785">查看详情</a>

                        </div>
                    </div>
                </li>

                <li class="sv-card">
                    <div class="sv-card--top clearfix">
                        <a _stat_click_id="7_114378" href="/cmdty/detail?csId=14378" target="_blank"><img src="http://p.qlogo.cn/zc_icon/0/a6cdb362d42233bad7894c5c860d9e88/0" class="sv-card--icon"></a>
                        <!-- 重度服务商 -->

                        <p class="sv-card--name"><a class="name" _stat_click_id="7_214378" href="/cmdty/detail?csId=14378" target="_blank">长顺企业</a><a href="/scenter/growth" target="_blank" class="lv">Lv1</a><span class="mod-icon-grantee"></span></p>
                        <ul class="sv-card--review">
                            <li class="sv-card--review-item">
                                <span class="title">质量</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">速度</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">态度</span>
                                <span class="point">暂无</span>
                            </li>
                        </ul>

                        <span class="arrow"></span>
                    </div>
                    <div class="sv-card--bottom">
                        <a href="/cmdty/detail?csId=14378" class="sv-card--type" target="_blank" title="有限责任公司注册 五证合一创业套餐（内资公司注册、国地税报到、3个月代理记账、社保开户、社保代理）">有限责任公司注册 五证合一创业套餐（内资公司注册、国地税报到、3个月代理记账、社保开户、社保代理）</a>
                        <div class="sv-card--sale">

                            <a _stat_click_id="7_414378" href="/cmdty/detail?csId=14378" target="_blank">咨询 69</a>
                            <a _stat_click_id="7_514378" href="/cmdty/detail?csId=14378" target="_blank">销量 2</a>

                        </div>
                        <div class="sv-card--price">


                            <div class="sv-card--special"><span class="sv-card--red">¥3500.00</span></div>


                        </div>
                        <div class="sv-card--btn-wrap">
                            <a class="ui-button ui-button-sm ui-button-primary jmod-consult-stat jmod-wpa-qq" _wpa_qq="319591724" _stat_click_id="7_6305427" data-cid="305427" data-csid="14378" target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=319591724&amp;site=qq&amp;menu=yes">QQ咨询</a>

                            <a href="/cmdty/detail?csId=14378" target="_blank" class="ui-button ui-button-sm ui-button-primary" _stat_click_id="7_7305427">查看详情</a>

                        </div>
                    </div>
                </li>

                <li class="sv-card">
                    <div class="sv-card--top clearfix">
                        <a _stat_click_id="7_114294" href="/cmdty/detail?csId=14294" target="_blank"><img src="http://p.qlogo.cn/zc_icon/0/2fe4d52210e6b36351c705407d8987f9/0" class="sv-card--icon"></a>
                        <!-- 重度服务商 -->

                        <p class="sv-card--name"><a class="name" _stat_click_id="7_214294" href="/cmdty/detail?csId=14294" target="_blank">助册易</a><a href="/scenter/growth" target="_blank" class="lv">Lv1</a><span class="mod-icon-grantee"></span></p>
                        <ul class="sv-card--review">
                            <li class="sv-card--review-item">
                                <span class="title">质量</span>
                                <span class="point">5.0</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">速度</span>
                                <span class="point">5.0</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">态度</span>
                                <span class="point">5.0</span>
                            </li>
                        </ul>

                        <span class="arrow"></span>
                    </div>
                    <div class="sv-card--bottom">
                        <a href="/cmdty/detail?csId=14294" class="sv-card--type" target="_blank" title="有限责任公司注册（注册香港公司）">有限责任公司注册（注册香港公司）</a>
                        <div class="sv-card--sale">

                            <a _stat_click_id="7_414294" href="/cmdty/detail?csId=14294" target="_blank">咨询 286</a>
                            <a _stat_click_id="7_514294" href="/cmdty/detail?csId=14294" target="_blank">销量 28</a>

                        </div>
                        <div class="sv-card--price">


                            <div class="sv-card--special"><span class="sv-card--red">¥4780.00</span></div>


                        </div>
                        <div class="sv-card--btn-wrap">
                            <a class="ui-button ui-button-sm ui-button-primary jmod-consult-stat jmod-wpa-qq" _wpa_qq="4008700852" _stat_click_id="7_6304882" data-cid="304882" data-csid="14294" href="javascript:void(0);">QQ咨询</a>

                            <a href="/cmdty/detail?csId=14294" target="_blank" class="ui-button ui-button-sm ui-button-primary" _stat_click_id="7_7304882">查看详情</a>

                        </div>
                    </div>
                </li>

                <li class="sv-card">
                    <div class="sv-card--top clearfix">
                        <a _stat_click_id="7_114805" href="/cmdty/detail?csId=14805" target="_blank"><img src="http://p.qlogo.cn/zc_icon/0/a6cdb362d42233bad7894c5c860d9e88/0" class="sv-card--icon"></a>
                        <!-- 重度服务商 -->

                        <p class="sv-card--name"><a class="name" _stat_click_id="7_214805" href="/cmdty/detail?csId=14805" target="_blank">长顺企业</a><a href="/scenter/growth" target="_blank" class="lv">Lv1</a><span class="mod-icon-grantee"></span></p>
                        <ul class="sv-card--review">
                            <li class="sv-card--review-item">
                                <span class="title">质量</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">速度</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">态度</span>
                                <span class="point">暂无</span>
                            </li>
                        </ul>

                        <span class="arrow"></span>
                    </div>
                    <div class="sv-card--bottom">
                        <a href="/cmdty/detail?csId=14805" class="sv-card--type" target="_blank" title="有限责任公司注册（基础版+刻章）">有限责任公司注册（基础版+刻章）</a>
                        <div class="sv-card--sale">

                            <a _stat_click_id="7_414805" href="/cmdty/detail?csId=14805" target="_blank">咨询 15</a>
                            <a _stat_click_id="7_514805" href="/cmdty/detail?csId=14805" target="_blank">销量 1</a>

                        </div>
                        <div class="sv-card--price">


                            <div class="sv-card--special"><span class="sv-card--red">¥998.00</span></div>


                        </div>
                        <div class="sv-card--btn-wrap">
                            <a class="ui-button ui-button-sm ui-button-primary jmod-consult-stat jmod-wpa-qq" _wpa_qq="319591724" _stat_click_id="7_6305427" data-cid="305427" data-csid="14805" target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=319591724&amp;site=qq&amp;menu=yes">QQ咨询</a>

                            <a href="/cmdty/detail?csId=14805" target="_blank" class="ui-button ui-button-sm ui-button-primary" _stat_click_id="7_7305427">查看详情</a>

                        </div>
                    </div>
                </li>

                <li class="sv-card">
                    <div class="sv-card--top clearfix">
                        <a _stat_click_id="7_115031" href="/cmdty/detail?csId=15031" target="_blank"><img src="http://p.qlogo.cn/zc_icon/0/a6cdb362d42233bad7894c5c860d9e88/0" class="sv-card--icon"></a>
                        <!-- 重度服务商 -->

                        <p class="sv-card--name"><a class="name" _stat_click_id="7_215031" href="/cmdty/detail?csId=15031" target="_blank">长顺企业</a><a href="/scenter/growth" target="_blank" class="lv">Lv1</a><span class="mod-icon-grantee"></span></p>
                        <ul class="sv-card--review">
                            <li class="sv-card--review-item">
                                <span class="title">质量</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">速度</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">态度</span>
                                <span class="point">暂无</span>
                            </li>
                        </ul>

                        <span class="arrow"></span>
                    </div>
                    <div class="sv-card--bottom">
                        <a href="/cmdty/detail?csId=15031" class="sv-card--type" target="_blank" title="有限责任公司注册（深圳广州地址挂靠+刻章）">有限责任公司注册（深圳广州地址挂靠+刻章）</a>
                        <div class="sv-card--sale">

                            <a _stat_click_id="7_415031" href="/cmdty/detail?csId=15031" target="_blank">咨询 21</a>
                            <a _stat_click_id="7_515031" href="/cmdty/detail?csId=15031" target="_blank">销量 1</a>

                        </div>
                        <div class="sv-card--price">


                            <div class="sv-card--special"><span class="sv-card--red">¥2500.00</span></div>


                        </div>
                        <div class="sv-card--btn-wrap">
                            <a class="ui-button ui-button-sm ui-button-primary jmod-consult-stat jmod-wpa-qq" _wpa_qq="319591724" _stat_click_id="7_6305427" data-cid="305427" data-csid="15031" target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=319591724&amp;site=qq&amp;menu=yes">QQ咨询</a>

                            <a href="/cmdty/detail?csId=15031" target="_blank" class="ui-button ui-button-sm ui-button-primary" _stat_click_id="7_7305427">查看详情</a>

                        </div>
                    </div>
                </li>

                <li class="sv-card">
                    <div class="sv-card--top clearfix">
                        <a _stat_click_id="7_114801" href="/cmdty/detail?csId=14801" target="_blank"><img src="http://p.qlogo.cn/zc_icon/0/a6cdb362d42233bad7894c5c860d9e88/0" class="sv-card--icon"></a>
                        <!-- 重度服务商 -->

                        <p class="sv-card--name"><a class="name" _stat_click_id="7_214801" href="/cmdty/detail?csId=14801" target="_blank">长顺企业</a><a href="/scenter/growth" target="_blank" class="lv">Lv1</a><span class="mod-icon-grantee"></span></p>
                        <ul class="sv-card--review">
                            <li class="sv-card--review-item">
                                <span class="title">质量</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">速度</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">态度</span>
                                <span class="point">暂无</span>
                            </li>
                        </ul>

                        <span class="arrow"></span>
                    </div>
                    <div class="sv-card--bottom">
                        <a href="/cmdty/detail?csId=14801" class="sv-card--type" target="_blank" title="有限责任公司注册（注册公司基础版+小规模纳税人记账报税12个月/24个月）">有限责任公司注册（注册公司基础版+小规模纳税人记账报税12个月/24个月）</a>
                        <div class="sv-card--sale">

                            <a _stat_click_id="7_414801" href="/cmdty/detail?csId=14801" target="_blank">咨询 1</a>
                            <a _stat_click_id="7_514801" href="/cmdty/detail?csId=14801" target="_blank">销量 1</a>

                        </div>
                        <div class="sv-card--price">


                            <div class="sv-card--special"><span class="sv-card--red">¥4980.00</span></div>


                        </div>
                        <div class="sv-card--btn-wrap">
                            <a class="ui-button ui-button-sm ui-button-primary jmod-consult-stat jmod-wpa-qq" _wpa_qq="319591724" _stat_click_id="7_6305427" data-cid="305427" data-csid="14801" target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=319591724&amp;site=qq&amp;menu=yes">QQ咨询</a>

                            <a href="/cmdty/detail?csId=14801" target="_blank" class="ui-button ui-button-sm ui-button-primary" _stat_click_id="7_7305427">查看详情</a>

                        </div>
                    </div>
                </li>

                <li class="sv-card">
                    <div class="sv-card--top clearfix">
                        <a _stat_click_id="7_114804" href="/cmdty/detail?csId=14804" target="_blank"><img src="http://p.qlogo.cn/zc_icon/0/a6cdb362d42233bad7894c5c860d9e88/0" class="sv-card--icon"></a>
                        <!-- 重度服务商 -->

                        <p class="sv-card--name"><a class="name" _stat_click_id="7_214804" href="/cmdty/detail?csId=14804" target="_blank">长顺企业</a><a href="/scenter/growth" target="_blank" class="lv">Lv1</a><span class="mod-icon-grantee"></span></p>
                        <ul class="sv-card--review">
                            <li class="sv-card--review-item">
                                <span class="title">质量</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">速度</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">态度</span>
                                <span class="point">暂无</span>
                            </li>
                        </ul>

                        <span class="arrow"></span>
                    </div>
                    <div class="sv-card--bottom">
                        <a href="/cmdty/detail?csId=14804" class="sv-card--type" target="_blank" title="有限责任公司注册（企业注册、一般纳税人公司资质申请）">有限责任公司注册（企业注册、一般纳税人公司资质申请）</a>
                        <div class="sv-card--sale">

                            <a _stat_click_id="7_414804" href="/cmdty/detail?csId=14804" target="_blank">咨询 50</a>
                            <a _stat_click_id="7_514804" href="/cmdty/detail?csId=14804" target="_blank">销量 11</a>

                        </div>
                        <div class="sv-card--price">


                            <div class="sv-card--special"><span class="sv-card--red">¥2800.00</span></div>


                        </div>
                        <div class="sv-card--btn-wrap">
                            <a class="ui-button ui-button-sm ui-button-primary jmod-consult-stat jmod-wpa-qq" _wpa_qq="319591724" _stat_click_id="7_6305427" data-cid="305427" data-csid="14804" target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=319591724&amp;site=qq&amp;menu=yes">QQ咨询</a>

                            <a href="/cmdty/detail?csId=14804" target="_blank" class="ui-button ui-button-sm ui-button-primary" _stat_click_id="7_7305427">查看详情</a>

                        </div>
                    </div>
                </li>

                <li class="sv-card">
                    <div class="sv-card--top clearfix">
                        <a _stat_click_id="7_115336" href="/cmdty/detail?csId=15336" target="_blank"><img src="http://p.qlogo.cn/zc_icon/0/3574fe23b350f6b4c15de8d9c44afeea/0" class="sv-card--icon"></a>
                        <!-- 重度服务商 -->

                        <p class="sv-card--name"><a class="name" _stat_click_id="7_215336" href="/cmdty/detail?csId=15336" target="_blank">精益求精集团</a><a href="/scenter/growth" target="_blank" class="lv">Lv1</a><span class="mod-icon-grantee"></span></p>
                        <ul class="sv-card--review">
                            <li class="sv-card--review-item">
                                <span class="title">质量</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">速度</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">态度</span>
                                <span class="point">暂无</span>
                            </li>
                        </ul>

                        <span class="arrow"></span>
                    </div>
                    <div class="sv-card--bottom">
                        <a href="/cmdty/detail?csId=15336" class="sv-card--type" target="_blank" title="有限责任公司注册（公司注册基础服务+1月代理记账服务）">有限责任公司注册（公司注册基础服务+1月代理记账服务）</a>
                        <div class="sv-card--sale">

                            <a _stat_click_id="7_415336" href="/cmdty/detail?csId=15336" target="_blank">咨询 7</a>
                            <a _stat_click_id="7_515336" href="/cmdty/detail?csId=15336" target="_blank">销量 暂无</a>

                        </div>
                        <div class="sv-card--price">


                            <div class="sv-card--special"><span class="sv-card--red">¥10.00</span></div>


                        </div>
                        <div class="sv-card--btn-wrap">
                            <a class="ui-button ui-button-sm ui-button-primary jmod-consult-stat jmod-wpa-qq" _wpa_qq="1594790668" _stat_click_id="7_6316389" data-cid="316389" data-csid="15336" target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=1594790668&amp;site=qq&amp;menu=yes">QQ咨询</a>

                            <a href="/cmdty/detail?csId=15336" target="_blank" class="ui-button ui-button-sm ui-button-primary" _stat_click_id="7_7316389">查看详情</a>

                        </div>
                    </div>
                </li>

                <li class="sv-card">
                    <div class="sv-card--top clearfix">
                        <a _stat_click_id="7_114799" href="/cmdty/detail?csId=14799" target="_blank"><img src="http://p.qlogo.cn/zc_icon/0/a6cdb362d42233bad7894c5c860d9e88/0" class="sv-card--icon"></a>
                        <!-- 重度服务商 -->

                        <p class="sv-card--name"><a class="name" _stat_click_id="7_214799" href="/cmdty/detail?csId=14799" target="_blank">长顺企业</a><a href="/scenter/growth" target="_blank" class="lv">Lv1</a><span class="mod-icon-grantee"></span></p>
                        <ul class="sv-card--review">
                            <li class="sv-card--review-item">
                                <span class="title">质量</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">速度</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">态度</span>
                                <span class="point">暂无</span>
                            </li>
                        </ul>

                        <span class="arrow"></span>
                    </div>
                    <div class="sv-card--bottom">
                        <a href="/cmdty/detail?csId=14799" class="sv-card--type" target="_blank" title="有限责任公司注册（含章+地址提供注册哦）">有限责任公司注册（含章+地址提供注册哦）</a>
                        <div class="sv-card--sale">

                            <a _stat_click_id="7_414799" href="/cmdty/detail?csId=14799" target="_blank">咨询 14</a>
                            <a _stat_click_id="7_514799" href="/cmdty/detail?csId=14799" target="_blank">销量 暂无</a>

                        </div>
                        <div class="sv-card--price">


                            <div class="sv-card--special"><span class="sv-card--red">¥2600.00</span></div>


                        </div>
                        <div class="sv-card--btn-wrap">
                            <a class="ui-button ui-button-sm ui-button-primary jmod-consult-stat jmod-wpa-qq" _wpa_qq="319591724" _stat_click_id="7_6305427" data-cid="305427" data-csid="14799" target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=319591724&amp;site=qq&amp;menu=yes">QQ咨询</a>

                            <a href="/cmdty/detail?csId=14799" target="_blank" class="ui-button ui-button-sm ui-button-primary" _stat_click_id="7_7305427">查看详情</a>

                        </div>
                    </div>
                </li>

                <li class="sv-card" >
                    <div class="sv-card--top clearfix">
                        <a _stat_click_id="7_115013" href="/cmdty/detail?csId=15013" target="_blank"><img src="http://p.qlogo.cn/zc_icon/0/a6cdb362d42233bad7894c5c860d9e88/0" class="sv-card--icon"></a>
                        <!-- 重度服务商 -->

                        <p class="sv-card--name"><a class="name" _stat_click_id="7_215013" href="/cmdty/detail?csId=15013" target="_blank">长顺企业</a><a href="/scenter/growth" target="_blank" class="lv">Lv1</a><span class="mod-icon-grantee"></span></p>
                        <ul class="sv-card--review">
                            <li class="sv-card--review-item">
                                <span class="title">质量</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">速度</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">态度</span>
                                <span class="point">暂无</span>
                            </li>
                        </ul>

                        <span class="arrow"></span>
                    </div>
                    <div class="sv-card--bottom">
                        <a href="/cmdty/detail?csId=15013" class="sv-card--type" target="_blank" title="有限责任公司注册（含刻章+税务全程指导+一年记账报税服务）">有限责任公司注册（含刻章+税务全程指导+一年记账报税服务）</a>
                        <div class="sv-card--sale">

                            <a _stat_click_id="7_415013" href="/cmdty/detail?csId=15013" target="_blank">咨询 8</a>
                            <a _stat_click_id="7_515013" href="/cmdty/detail?csId=15013" target="_blank">销量 暂无</a>

                        </div>
                        <div class="sv-card--price">


                            <div class="sv-card--special"><span class="sv-card--red">¥5999.00</span></div>


                        </div>
                        <div class="sv-card--btn-wrap">
                            <a class="ui-button ui-button-sm ui-button-primary jmod-consult-stat jmod-wpa-qq" _wpa_qq="319591724" _stat_click_id="7_6305427" data-cid="305427" data-csid="15013" target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=319591724&amp;site=qq&amp;menu=yes">QQ咨询</a>

                            <a href="/cmdty/detail?csId=15013" target="_blank" class="ui-button ui-button-sm ui-button-primary" _stat_click_id="7_7305427">查看详情</a>

                        </div>
                    </div>
                </li>

                <li class="sv-card">
                    <div class="sv-card--top clearfix">
                        <a _stat_click_id="7_114803" href="/cmdty/detail?csId=14803" target="_blank"><img src="http://p.qlogo.cn/zc_icon/0/a6cdb362d42233bad7894c5c860d9e88/0" class="sv-card--icon"></a>
                        <!-- 重度服务商 -->

                        <p class="sv-card--name"><a class="name" _stat_click_id="7_214803" href="/cmdty/detail?csId=14803" target="_blank">长顺企业</a><a href="/scenter/growth" target="_blank" class="lv">Lv1</a><span class="mod-icon-grantee"></span></p>
                        <ul class="sv-card--review">
                            <li class="sv-card--review-item">
                                <span class="title">质量</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">速度</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">态度</span>
                                <span class="point">暂无</span>
                            </li>
                        </ul>

                        <span class="arrow"></span>
                    </div>
                    <div class="sv-card--bottom">
                        <a href="/cmdty/detail?csId=14803" class="sv-card--type" target="_blank" title="有限责任公司注册(银行开户）">有限责任公司注册(银行开户）</a>
                        <div class="sv-card--sale">

                            <a _stat_click_id="7_414803" href="/cmdty/detail?csId=14803" target="_blank">咨询 7</a>
                            <a _stat_click_id="7_514803" href="/cmdty/detail?csId=14803" target="_blank">销量 暂无</a>

                        </div>
                        <div class="sv-card--price">


                            <div class="sv-card--special"><span class="sv-card--red">¥2800.00</span></div>


                        </div>
                        <div class="sv-card--btn-wrap">
                            <a class="ui-button ui-button-sm ui-button-primary jmod-consult-stat jmod-wpa-qq" _wpa_qq="319591724" _stat_click_id="7_6305427" data-cid="305427" data-csid="14803" target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=319591724&amp;site=qq&amp;menu=yes">QQ咨询</a>

                            <a href="/cmdty/detail?csId=14803" target="_blank" class="ui-button ui-button-sm ui-button-primary" _stat_click_id="7_7305427">查看详情</a>

                        </div>
                    </div>
                </li>

                <li class="sv-card" >
                    <div class="sv-card--top clearfix">
                        <a _stat_click_id="7_114802" href="/cmdty/detail?csId=14802" target="_blank"><img src="http://p.qlogo.cn/zc_icon/0/a6cdb362d42233bad7894c5c860d9e88/0" class="sv-card--icon"></a>
                        <!-- 重度服务商 -->

                        <p class="sv-card--name"><a class="name" _stat_click_id="7_214802" href="/cmdty/detail?csId=14802" target="_blank">长顺企业</a><a href="/scenter/growth" target="_blank" class="lv">Lv1</a><span class="mod-icon-grantee"></span></p>
                        <ul class="sv-card--review">
                            <li class="sv-card--review-item">
                                <span class="title">质量</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">速度</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">态度</span>
                                <span class="point">暂无</span>
                            </li>
                        </ul>

                        <span class="arrow"></span>
                    </div>
                    <div class="sv-card--bottom">
                        <a href="/cmdty/detail?csId=14802" class="sv-card--type" target="_blank" title="有限责任公司注册创业基础套餐（注册公司执照+刻章公财私+地址挂靠）">有限责任公司注册创业基础套餐（注册公司执照+刻章公财私+地址挂靠）</a>
                        <div class="sv-card--sale">

                            <a _stat_click_id="7_414802" href="/cmdty/detail?csId=14802" target="_blank">咨询 7</a>
                            <a _stat_click_id="7_514802" href="/cmdty/detail?csId=14802" target="_blank">销量 暂无</a>

                        </div>
                        <div class="sv-card--price">


                            <div class="sv-card--special"><span class="sv-card--red">¥2580.00</span></div>


                        </div>
                        <div class="sv-card--btn-wrap">
                            <a class="ui-button ui-button-sm ui-button-primary jmod-consult-stat jmod-wpa-qq" _wpa_qq="319591724" _stat_click_id="7_6305427" data-cid="305427" data-csid="14802" target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=319591724&amp;site=qq&amp;menu=yes">QQ咨询</a>

                            <a href="/cmdty/detail?csId=14802" target="_blank" class="ui-button ui-button-sm ui-button-primary" _stat_click_id="7_7305427">查看详情</a>

                        </div>
                    </div>
                </li>

                <li class="sv-card">
                    <div class="sv-card--top clearfix">
                        <a _stat_click_id="7_114921" href="/cmdty/detail?csId=14921" target="_blank"><img src="http://p.qlogo.cn/zc_icon/0/a6cdb362d42233bad7894c5c860d9e88/0" class="sv-card--icon"></a>
                        <!-- 重度服务商 -->

                        <p class="sv-card--name"><a class="name" _stat_click_id="7_214921" href="/cmdty/detail?csId=14921" target="_blank">长顺企业</a><a href="/scenter/growth" target="_blank" class="lv">Lv1</a><span class="mod-icon-grantee"></span></p>
                        <ul class="sv-card--review">
                            <li class="sv-card--review-item">
                                <span class="title">质量</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">速度</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">态度</span>
                                <span class="point">暂无</span>
                            </li>
                        </ul>

                        <span class="arrow"></span>
                    </div>
                    <div class="sv-card--bottom">
                        <a href="/cmdty/detail?csId=14921" class="sv-card--type" target="_blank" title="有限责任公司注册（深圳广州注册地址+公司执照办理）">有限责任公司注册（深圳广州注册地址+公司执照办理）</a>
                        <div class="sv-card--sale">

                            <a _stat_click_id="7_414921" href="/cmdty/detail?csId=14921" target="_blank">咨询 2</a>
                            <a _stat_click_id="7_514921" href="/cmdty/detail?csId=14921" target="_blank">销量 暂无</a>

                        </div>
                        <div class="sv-card--price">


                            <div class="sv-card--special"><span class="sv-card--red">¥2000.00</span></div>


                        </div>
                        <div class="sv-card--btn-wrap">
                            <a class="ui-button ui-button-sm ui-button-primary jmod-consult-stat jmod-wpa-qq" _wpa_qq="319591724" _stat_click_id="7_6305427" data-cid="305427" data-csid="14921" target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=319591724&amp;site=qq&amp;menu=yes">QQ咨询</a>

                            <a href="/cmdty/detail?csId=14921" target="_blank" class="ui-button ui-button-sm ui-button-primary" _stat_click_id="7_7305427">查看详情</a>

                        </div>
                    </div>
                </li>

                <li class="sv-card" >
                    <div class="sv-card--top clearfix">
                        <a _stat_click_id="7_114004" href="/cmdty/detail?csId=14004" target="_blank"><img src="http://p.qlogo.cn/zc_icon/0/3964614621f908ead448ad6920403e4b/0" class="sv-card--icon"></a>
                        <!-- 重度服务商 -->

                        <p class="sv-card--name"><a class="name" _stat_click_id="7_214004" href="/cmdty/detail?csId=14004" target="_blank">合肥鼎鼎会计</a><a href="/scenter/growth" target="_blank" class="lv">Lv1</a><span class="mod-icon-grantee"></span></p>
                        <ul class="sv-card--review">
                            <li class="sv-card--review-item">
                                <span class="title">质量</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">速度</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">态度</span>
                                <span class="point">暂无</span>
                            </li>
                        </ul>

                        <span class="arrow"></span>
                    </div>
                    <div class="sv-card--bottom">
                        <a href="/cmdty/detail?csId=14004" class="sv-card--type" target="_blank" title="有限责任公司注册套餐（安徽内资公司工商注册+税务登记+3个月代理记账）">有限责任公司注册套餐（安徽内资公司工商注册+税务登记+3个月代理记账）</a>
                        <div class="sv-card--sale">

                            <a _stat_click_id="7_414004" href="/cmdty/detail?csId=14004" target="_blank">咨询 55</a>
                            <a _stat_click_id="7_514004" href="/cmdty/detail?csId=14004" target="_blank">销量 17</a>

                        </div>
                        <div class="sv-card--price">


                            <div class="sv-card--special"><span class="sv-card--red">¥888.00</span></div>


                        </div>
                        <div class="sv-card--btn-wrap">
                            <a class="ui-button ui-button-sm ui-button-primary jmod-consult-stat jmod-wpa-qq" _wpa_qq="1697519258" _stat_click_id="7_6289887" data-cid="289887" data-csid="14004" target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=1697519258&amp;site=qq&amp;menu=yes">QQ咨询</a>

                            <a href="/cmdty/detail?csId=14004" target="_blank" class="ui-button ui-button-sm ui-button-primary" _stat_click_id="7_7289887">查看详情</a>

                        </div>
                    </div>
                </li>

                <li class="sv-card">
                    <div class="sv-card--top clearfix">
                        <a _stat_click_id="7_114395" href="/cmdty/detail?csId=14395" target="_blank"><img src="http://p.qlogo.cn/zc_icon/0/2fe4d52210e6b36351c705407d8987f9/0" class="sv-card--icon"></a>
                        <!-- 重度服务商 -->

                        <p class="sv-card--name"><a class="name" _stat_click_id="7_214395" href="/cmdty/detail?csId=14395" target="_blank">助册易</a><a href="/scenter/growth" target="_blank" class="lv">Lv1</a><span class="mod-icon-grantee"></span></p>
                        <ul class="sv-card--review">
                            <li class="sv-card--review-item">
                                <span class="title">质量</span>
                                <span class="point">5.0</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">速度</span>
                                <span class="point">5.0</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">态度</span>
                                <span class="point">5.0</span>
                            </li>
                        </ul>

                        <span class="arrow"></span>
                    </div>
                    <div class="sv-card--bottom">
                        <a href="/cmdty/detail?csId=14395" class="sv-card--type" target="_blank" title="有限责任公司注册（深圳公司注册）">有限责任公司注册（深圳公司注册）</a>
                        <div class="sv-card--sale">

                            <a _stat_click_id="7_414395" href="/cmdty/detail?csId=14395" target="_blank">咨询 348</a>
                            <a _stat_click_id="7_514395" href="/cmdty/detail?csId=14395" target="_blank">销量 11</a>

                        </div>
                        <div class="sv-card--price">


                            <div class="sv-card--special"><span class="sv-card--red">¥1800.00</span></div>


                        </div>
                        <div class="sv-card--btn-wrap">
                            <a class="ui-button ui-button-sm ui-button-primary jmod-consult-stat jmod-wpa-qq" _wpa_qq="4008700852" _stat_click_id="7_6304882" data-cid="304882" data-csid="14395" href="javascript:void(0);">QQ咨询</a>

                            <a href="/cmdty/detail?csId=14395" target="_blank" class="ui-button ui-button-sm ui-button-primary" _stat_click_id="7_7304882">查看详情</a>

                        </div>
                    </div>
                </li>

                <li class="sv-card" >
                    <div class="sv-card--top clearfix">
                        <a _stat_click_id="7_115613" href="/cmdty/detail?csId=15613" target="_blank"><img src="http://p.qlogo.cn/zc_icon/0/3574fe23b350f6b4c15de8d9c44afeea/0" class="sv-card--icon"></a>
                        <!-- 重度服务商 -->

                        <p class="sv-card--name"><a class="name" _stat_click_id="7_215613" href="/cmdty/detail?csId=15613" target="_blank">精益求精集团</a><a href="/scenter/growth" target="_blank" class="lv">Lv1</a><span class="mod-icon-grantee"></span></p>
                        <ul class="sv-card--review">
                            <li class="sv-card--review-item">
                                <span class="title">质量</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">速度</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">态度</span>
                                <span class="point">暂无</span>
                            </li>
                        </ul>

                        <span class="arrow"></span>
                    </div>
                    <div class="sv-card--bottom">
                        <a href="/cmdty/detail?csId=15613" class="sv-card--type" target="_blank" title="有限责任公司注册套餐（公司注册基础版+3个月/6个月记账报税+国地税税务报道+财税年度规划指导）">有限责任公司注册套餐（公司注册基础版+3个月/6个月记账报税+国地税税务报道+财税年度规划指导）</a>
                        <div class="sv-card--sale">

                            <a _stat_click_id="7_415613" href="/cmdty/detail?csId=15613" target="_blank">咨询 暂无</a>
                            <a _stat_click_id="7_515613" href="/cmdty/detail?csId=15613" target="_blank">销量 暂无</a>

                        </div>
                        <div class="sv-card--price">


                            <div class="sv-card--special"><span class="sv-card--red">¥2500.00<small>起</small></span></div>


                        </div>
                        <div class="sv-card--btn-wrap">
                            <a class="ui-button ui-button-sm ui-button-primary jmod-consult-stat jmod-wpa-qq" _wpa_qq="1594790668" _stat_click_id="7_6316389" data-cid="316389" data-csid="15613" target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=1594790668&amp;site=qq&amp;menu=yes">QQ咨询</a>

                            <a href="/cmdty/detail?csId=15613" target="_blank" class="ui-button ui-button-sm ui-button-primary" _stat_click_id="7_7316389">查看详情</a>

                        </div>
                    </div>
                </li>

                <li class="sv-card">
                    <div class="sv-card--top clearfix">
                        <a _stat_click_id="7_115015" href="/cmdty/detail?csId=15015" target="_blank"><img src="http://p.qlogo.cn/zc_icon/0/a6cdb362d42233bad7894c5c860d9e88/0" class="sv-card--icon"></a>
                        <!-- 重度服务商 -->

                        <p class="sv-card--name"><a class="name" _stat_click_id="7_215015" href="/cmdty/detail?csId=15015" target="_blank">长顺企业</a><a href="/scenter/growth" target="_blank" class="lv">Lv1</a><span class="mod-icon-grantee"></span></p>
                        <ul class="sv-card--review">
                            <li class="sv-card--review-item">
                                <span class="title">质量</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">速度</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">态度</span>
                                <span class="point">暂无</span>
                            </li>
                        </ul>

                        <span class="arrow"></span>
                    </div>
                    <div class="sv-card--bottom">
                        <a href="/cmdty/detail?csId=15015" class="sv-card--type" target="_blank" title="有限责任公司注册 套餐（营业执照+3章+国地税申报税务指导+年检 +可提供深圳广州地址）">有限责任公司注册 套餐（营业执照+3章+国地税申报税务指导+年检 +可提供深圳广州地址）</a>
                        <div class="sv-card--sale">

                            <a _stat_click_id="7_415015" href="/cmdty/detail?csId=15015" target="_blank">咨询 2</a>
                            <a _stat_click_id="7_515015" href="/cmdty/detail?csId=15015" target="_blank">销量 暂无</a>

                        </div>
                        <div class="sv-card--price">


                            <div class="sv-card--special"><span class="sv-card--red">¥4800.00</span></div>


                        </div>
                        <div class="sv-card--btn-wrap">
                            <a class="ui-button ui-button-sm ui-button-primary jmod-consult-stat jmod-wpa-qq" _wpa_qq="319591724" _stat_click_id="7_6305427" data-cid="305427" data-csid="15015" target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=319591724&amp;site=qq&amp;menu=yes">QQ咨询</a>

                            <a href="/cmdty/detail?csId=15015" target="_blank" class="ui-button ui-button-sm ui-button-primary" _stat_click_id="7_7305427">查看详情</a>

                        </div>
                    </div>
                </li>

                <li class="sv-card" >
                    <div class="sv-card--top clearfix">
                        <a _stat_click_id="7_115618" href="/cmdty/detail?csId=15618" target="_blank"><img src="http://p.qlogo.cn/zc_icon/0/3574fe23b350f6b4c15de8d9c44afeea/0" class="sv-card--icon"></a>
                        <!-- 重度服务商 -->

                        <p class="sv-card--name"><a class="name" _stat_click_id="7_215618" href="/cmdty/detail?csId=15618" target="_blank">精益求精集团</a><a href="/scenter/growth" target="_blank" class="lv">Lv1</a><span class="mod-icon-grantee"></span></p>
                        <ul class="sv-card--review">
                            <li class="sv-card--review-item">
                                <span class="title">质量</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">速度</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">态度</span>
                                <span class="point">暂无</span>
                            </li>
                        </ul>

                        <span class="arrow"></span>
                    </div>
                    <div class="sv-card--bottom">
                        <a href="/cmdty/detail?csId=15618" class="sv-card--type" target="_blank" title="有限责任公司注册（多证合一公司注册+新公司申请一般纳税人资质+提供深圳地址挂靠注册）">有限责任公司注册（多证合一公司注册+新公司申请一般纳税人资质+提供深圳地址挂靠注册）</a>
                        <div class="sv-card--sale">

                            <a _stat_click_id="7_415618" href="/cmdty/detail?csId=15618" target="_blank">咨询 暂无</a>
                            <a _stat_click_id="7_515618" href="/cmdty/detail?csId=15618" target="_blank">销量 暂无</a>

                        </div>
                        <div class="sv-card--price">


                            <div class="sv-card--special"><span class="sv-card--red">¥12000.00</span></div>


                        </div>
                        <div class="sv-card--btn-wrap">
                            <a class="ui-button ui-button-sm ui-button-primary jmod-consult-stat jmod-wpa-qq" _wpa_qq="1594790668" _stat_click_id="7_6316389" data-cid="316389" data-csid="15618" target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=1594790668&amp;site=qq&amp;menu=yes">QQ咨询</a>

                            <a href="/cmdty/detail?csId=15618" target="_blank" class="ui-button ui-button-sm ui-button-primary" _stat_click_id="7_7316389">查看详情</a>

                        </div>
                    </div>
                </li>

                <li class="sv-card">
                    <div class="sv-card--top clearfix">
                        <a _stat_click_id="7_115016" href="/cmdty/detail?csId=15016" target="_blank"><img src="http://p.qlogo.cn/zc_icon/0/a6cdb362d42233bad7894c5c860d9e88/0" class="sv-card--icon"></a>
                        <!-- 重度服务商 -->

                        <p class="sv-card--name"><a class="name" _stat_click_id="7_215016" href="/cmdty/detail?csId=15016" target="_blank">长顺企业</a><a href="/scenter/growth" target="_blank" class="lv">Lv1</a><span class="mod-icon-grantee"></span></p>
                        <ul class="sv-card--review">
                            <li class="sv-card--review-item">
                                <span class="title">质量</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">速度</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">态度</span>
                                <span class="point">暂无</span>
                            </li>
                        </ul>

                        <span class="arrow"></span>
                    </div>
                    <div class="sv-card--bottom">
                        <a href="/cmdty/detail?csId=15016" class="sv-card--type" target="_blank" title="有限责任公司注册 套餐（含深圳注册地址+一般纳税人1年代账）全国可办理">有限责任公司注册 套餐（含深圳注册地址+一般纳税人1年代账）全国可办理</a>
                        <div class="sv-card--sale">

                            <a _stat_click_id="7_415016" href="/cmdty/detail?csId=15016" target="_blank">咨询 1</a>
                            <a _stat_click_id="7_515016" href="/cmdty/detail?csId=15016" target="_blank">销量 暂无</a>

                        </div>
                        <div class="sv-card--price">


                            <div class="sv-card--special"><span class="sv-card--red">¥6500.00</span></div>


                        </div>
                        <div class="sv-card--btn-wrap">
                            <a class="ui-button ui-button-sm ui-button-primary jmod-consult-stat jmod-wpa-qq" _wpa_qq="319591724" _stat_click_id="7_6305427" data-cid="305427" data-csid="15016" target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=319591724&amp;site=qq&amp;menu=yes">QQ咨询</a>

                            <a href="/cmdty/detail?csId=15016" target="_blank" class="ui-button ui-button-sm ui-button-primary" _stat_click_id="7_7305427">查看详情</a>

                        </div>
                    </div>
                </li>

                <li class="sv-card" >
                    <div class="sv-card--top clearfix">
                        <a _stat_click_id="7_114662" href="/cmdty/detail?csId=14662" target="_blank"><img src="http://p.qlogo.cn/zc_icon/0/a6cdb362d42233bad7894c5c860d9e88/0" class="sv-card--icon"></a>
                        <!-- 重度服务商 -->

                        <p class="sv-card--name"><a class="name" _stat_click_id="7_214662" href="/cmdty/detail?csId=14662" target="_blank">长顺企业</a><a href="/scenter/growth" target="_blank" class="lv">Lv1</a><span class="mod-icon-grantee"></span></p>
                        <ul class="sv-card--review">
                            <li class="sv-card--review-item">
                                <span class="title">质量</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">速度</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">态度</span>
                                <span class="point">暂无</span>
                            </li>
                        </ul>

                        <span class="arrow"></span>
                    </div>
                    <div class="sv-card--bottom">
                        <a href="/cmdty/detail?csId=14662" class="sv-card--type" target="_blank" title="有限责任公司注册套餐（公司注册基础版+3个月记账报税）">有限责任公司注册套餐（公司注册基础版+3个月记账报税）</a>
                        <div class="sv-card--sale">

                            <a _stat_click_id="7_414662" href="/cmdty/detail?csId=14662" target="_blank">咨询 暂无</a>
                            <a _stat_click_id="7_514662" href="/cmdty/detail?csId=14662" target="_blank">销量 暂无</a>

                        </div>
                        <div class="sv-card--price">


                            <div class="sv-card--special"><span class="sv-card--red">¥3000.00</span></div>


                        </div>
                        <div class="sv-card--btn-wrap">
                            <a class="ui-button ui-button-sm ui-button-primary jmod-consult-stat jmod-wpa-qq" _wpa_qq="319591724" _stat_click_id="7_6305427" data-cid="305427" data-csid="14662" target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=319591724&amp;site=qq&amp;menu=yes">QQ咨询</a>

                            <a href="/cmdty/detail?csId=14662" target="_blank" class="ui-button ui-button-sm ui-button-primary" _stat_click_id="7_7305427">查看详情</a>

                        </div>
                    </div>
                </li>

                <li class="sv-card">
                    <div class="sv-card--top clearfix">
                        <a _stat_click_id="7_115614" href="/cmdty/detail?csId=15614" target="_blank"><img src="http://p.qlogo.cn/zc_icon/0/3574fe23b350f6b4c15de8d9c44afeea/0" class="sv-card--icon"></a>
                        <!-- 重度服务商 -->

                        <p class="sv-card--name"><a class="name" _stat_click_id="7_215614" href="/cmdty/detail?csId=15614" target="_blank">精益求精集团</a><a href="/scenter/growth" target="_blank" class="lv">Lv1</a><span class="mod-icon-grantee"></span></p>
                        <ul class="sv-card--review">
                            <li class="sv-card--review-item">
                                <span class="title">质量</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">速度</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">态度</span>
                                <span class="point">暂无</span>
                            </li>
                        </ul>

                        <span class="arrow"></span>
                    </div>
                    <div class="sv-card--bottom">
                        <a href="/cmdty/detail?csId=15614" class="sv-card--type" target="_blank" title="有限责任公司注册（创业公司注册指导+刻章公财私三章备案）">有限责任公司注册（创业公司注册指导+刻章公财私三章备案）</a>
                        <div class="sv-card--sale">

                            <a _stat_click_id="7_415614" href="/cmdty/detail?csId=15614" target="_blank">咨询 暂无</a>
                            <a _stat_click_id="7_515614" href="/cmdty/detail?csId=15614" target="_blank">销量 暂无</a>

                        </div>
                        <div class="sv-card--price">


                            <div class="sv-card--special"><span class="sv-card--red">¥2800.00</span></div>


                        </div>
                        <div class="sv-card--btn-wrap">
                            <a class="ui-button ui-button-sm ui-button-primary jmod-consult-stat jmod-wpa-qq" _wpa_qq="1594790668" _stat_click_id="7_6316389" data-cid="316389" data-csid="15614" target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=1594790668&amp;site=qq&amp;menu=yes">QQ咨询</a>

                            <a href="/cmdty/detail?csId=15614" target="_blank" class="ui-button ui-button-sm ui-button-primary" _stat_click_id="7_7316389">查看详情</a>

                        </div>
                    </div>
                </li>

                <li class="sv-card" >
                    <div class="sv-card--top clearfix">
                        <a _stat_click_id="7_114661" href="/cmdty/detail?csId=14661" target="_blank"><img src="http://p.qlogo.cn/zc_icon/0/a6cdb362d42233bad7894c5c860d9e88/0" class="sv-card--icon"></a>
                        <!-- 重度服务商 -->

                        <p class="sv-card--name"><a class="name" _stat_click_id="7_214661" href="/cmdty/detail?csId=14661" target="_blank">长顺企业</a><a href="/scenter/growth" target="_blank" class="lv">Lv1</a><span class="mod-icon-grantee"></span></p>
                        <ul class="sv-card--review">
                            <li class="sv-card--review-item">
                                <span class="title">质量</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">速度</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">态度</span>
                                <span class="point">暂无</span>
                            </li>
                        </ul>

                        <span class="arrow"></span>
                    </div>
                    <div class="sv-card--bottom">
                        <a href="/cmdty/detail?csId=14661" class="sv-card--type" target="_blank" title="有限责任公司注册套餐（公司注册基础版+国地税登记报到）">有限责任公司注册套餐（公司注册基础版+国地税登记报到）</a>
                        <div class="sv-card--sale">

                            <a _stat_click_id="7_414661" href="/cmdty/detail?csId=14661" target="_blank">咨询 3</a>
                            <a _stat_click_id="7_514661" href="/cmdty/detail?csId=14661" target="_blank">销量 暂无</a>

                        </div>
                        <div class="sv-card--price">


                            <div class="sv-card--special"><span class="sv-card--red">¥2500.00</span></div>


                        </div>
                        <div class="sv-card--btn-wrap">
                            <a class="ui-button ui-button-sm ui-button-primary jmod-consult-stat jmod-wpa-qq" _wpa_qq="319591724" _stat_click_id="7_6305427" data-cid="305427" data-csid="14661" target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=319591724&amp;site=qq&amp;menu=yes">QQ咨询</a>

                            <a href="/cmdty/detail?csId=14661" target="_blank" class="ui-button ui-button-sm ui-button-primary" _stat_click_id="7_7305427">查看详情</a>

                        </div>
                    </div>
                </li>

                <li class="sv-card">
                    <div class="sv-card--top clearfix">
                        <a _stat_click_id="7_115617" href="/cmdty/detail?csId=15617" target="_blank"><img src="http://p.qlogo.cn/zc_icon/0/3574fe23b350f6b4c15de8d9c44afeea/0" class="sv-card--icon"></a>
                        <!-- 重度服务商 -->

                        <p class="sv-card--name"><a class="name" _stat_click_id="7_215617" href="/cmdty/detail?csId=15617" target="_blank">精益求精集团</a><a href="/scenter/growth" target="_blank" class="lv">Lv1</a><span class="mod-icon-grantee"></span></p>
                        <ul class="sv-card--review">
                            <li class="sv-card--review-item">
                                <span class="title">质量</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">速度</span>
                                <span class="point">暂无</span>
                            </li>
                            <li class="sv-card--review-item">
                                <span class="title">态度</span>
                                <span class="point">暂无</span>
                            </li>
                        </ul>

                        <span class="arrow"></span>
                    </div>
                    <div class="sv-card--bottom">
                        <a href="/cmdty/detail?csId=15617" class="sv-card--type" target="_blank" title="有限责任公司注册（提供深圳前海自贸区公司注册）">有限责任公司注册（提供深圳前海自贸区公司注册）</a>
                        <div class="sv-card--sale">

                            <a _stat_click_id="7_415617" href="/cmdty/detail?csId=15617" target="_blank">咨询 暂无</a>
                            <a _stat_click_id="7_515617" href="/cmdty/detail?csId=15617" target="_blank">销量 暂无</a>

                        </div>
                        <div class="sv-card--price">


                            <div class="sv-card--special"><span class="sv-card--red">¥2800.00</span></div>


                        </div>
                        <div class="sv-card--btn-wrap">
                            <a class="ui-button ui-button-sm ui-button-primary jmod-consult-stat jmod-wpa-qq" _wpa_qq="1594790668" _stat_click_id="7_6316389" data-cid="316389" data-csid="15617" target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=1594790668&amp;site=qq&amp;menu=yes">QQ咨询</a>

                            <a href="/cmdty/detail?csId=15617" target="_blank" class="ui-button ui-button-sm ui-button-primary" _stat_click_id="7_7316389">查看详情</a>

                        </div>
                    </div>
                </li>

                <li class="sv-card" >
                    <div class="sv-card--top clearfix">
                        <a _stat_click_id="7_111333" href="/seller/corpinfo?c_id=285810&amp;tab=1" target="_blank"><img src="http://p.qlogo.cn/zc_icon/0/e20357a4b9a816f6e4319901368dcd65/0" class="sv-card--icon"></a>
                        <!-- 重度服务商 -->

                        <p class="sv-card--name"><a _stat_click_id="7_311333" href="/seller/corpinfo?c_id=285810&amp;tab=1" target="_blank">梧桐创客</a><a href="/scenter/growth" target="_blank" class="lv">Lv1</a></p>

                        <span class="arrow"></span>
                    </div>
                    <div class="sv-card--bottom">
                        <div href="/cmdty/detail?csId=11333" class="sv-card--type" target="_blank" title="有限责任公司注册">有限责任公司注册</div>
                        <div class="sv-card--sale">

                            <span>咨询 536</span>

                        </div>
                        <div class="sv-card--price">


                            <div class="sv-card--special"><span class="sv-card--red">¥600.00</span></div>


                        </div>
                        <div class="sv-card--btn-wrap">
                            <a class="ui-button ui-button-sm ui-button-primary jmod-consult-stat jmod-wpa-qq" _wpa_qq="261475209" _stat_click_id="7_6285810" data-cid="285810" data-csid="11333" target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=261475209&amp;site=qq&amp;menu=yes">QQ咨询</a>

                        </div>
                    </div>
                </li>

                <li class="sv-card">
                    <div class="sv-card--top clearfix">
                        <a _stat_click_id="7_111012" href="/seller/corpinfo?c_id=286163&amp;tab=1" target="_blank"><img src="http://p.qlogo.cn/zc_icon/0/832e1bdeba813ae455492b8b05090d45/0" class="sv-card--icon"></a>
                        <!-- 重度服务商 -->

                        <p class="sv-card--name"><a _stat_click_id="7_311012" href="/seller/corpinfo?c_id=286163&amp;tab=1" target="_blank">鼎榕</a><a href="/scenter/growth" target="_blank" class="lv">Lv1</a></p>

                        <span class="arrow"></span>
                    </div>
                    <div class="sv-card--bottom">
                        <div href="/cmdty/detail?csId=11012" class="sv-card--type" target="_blank" title="有限责任公司注册">有限责任公司注册</div>
                        <div class="sv-card--sale">

                            <span>咨询 155</span>

                        </div>
                        <div class="sv-card--price">


                            <div class="sv-card--special"><span class="sv-card--red">¥1500.00</span></div>


                        </div>
                        <div class="sv-card--btn-wrap">
                            <a class="ui-button ui-button-sm ui-button-primary jmod-consult-stat jmod-wpa-qq" _wpa_qq="3129130463" _stat_click_id="7_6286163" data-cid="286163" data-csid="11012" target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=3129130463&amp;site=qq&amp;menu=yes">QQ咨询</a>

                        </div>
                    </div>
                </li>
            </ul>
        </div>







        <div class="mod-boxhd"><h3 class="mod-boxhd-tit">热销服务</h3></div>
        <div class="mod-hotrecommend-list clearfix">


            <div class="mod-hotrecommend-card" data-csid="13216">
                <h6 class="serv"><a _stat_click_id="8_113216" href="/cmdty/detail?csId=13216" target="_blank">国内普通商标注册</a></h6>
                <p class="record"><span><a _stat_click_id="8_213216" href="/cmdty/detail?csId=13216" target="_blank">服务的一句话介绍。。</a></span></p>
                <p class="provider">张三&nbsp;<a _stat_click_id="8_413216" href="/seller/corpinfo?c_id=288394&amp;tab=1" target="_blank">金牌顾问</a><a class="lv" href="/scenter/growth" target="_blank">执业5年</a></p>
                <div class="price">
                    <p class="np"><i>¥</i>600</p>
                </div>
                <a _stat_click_id="8_513216" href="/cmdty/detail?csId=13216" target="_blank" class="btn">查看详情</a>
            </div>

            <div class="mod-hotrecommend-card" data-csid="14465">
                <h6 class="serv"><a _stat_click_id="8_114465" href="/cmdty/detail?csId=14465" target="_blank">软件著作权加急（5天下证）</a></h6>
                <p class="record"><span><a _stat_click_id="8_214465" href="/cmdty/detail?csId=14465" target="_blank">咨询&nbsp;233</a></span><span><a _stat_click_id="8_314465" href="/cmdty/detail?csId=14465" target="_blank">销量&nbsp;265</a></span></p>
                <p class="provider">服务商&nbsp;<a _stat_click_id="8_414465" href="/seller/corpinfo?c_id=304188&amp;tab=1" target="_blank">中细软</a><a class="lv" href="/scenter/growth" target="_blank">Lv5</a></p>
                <div class="price">
                    <p class="red-redeem">可抵1000元</p>
                    <p class="np"><i>¥</i>4000</p>
                </div>
                <a _stat_click_id="8_514465" href="/cmdty/detail?csId=14465" target="_blank" class="btn">查看详情</a>
            </div>

            <div class="mod-hotrecommend-card" data-csid="13347">
                <h6 class="serv"><a _stat_click_id="8_113347" href="/cmdty/detail?csId=13347" target="_blank">有限责任公司注册（公司注册基础服务+1月代理记账服务）</a></h6>
                <p class="record"><span><a _stat_click_id="8_213347" href="/cmdty/detail?csId=13347" target="_blank">咨询&nbsp;294</a></span><span><a _stat_click_id="8_313347" href="/cmdty/detail?csId=13347" target="_blank">销量&nbsp;405</a></span></p>
                <p class="provider">服务商&nbsp;<a _stat_click_id="8_413347" href="/seller/corpinfo?c_id=288909&amp;tab=1" target="_blank">星源财税</a><a class="lv" href="/scenter/growth" target="_blank">Lv2</a></p>
                <div class="price">
                    <p class="red-redeem">可抵50元</p>
                    <p class="np"><i>¥</i>250</p>
                </div>
                <a _stat_click_id="8_513347" href="/cmdty/detail?csId=13347" target="_blank" class="btn">查看详情</a>
            </div>

            <div class="mod-hotrecommend-card" data-csid="11364">
                <h6 class="serv"><a _stat_click_id="8_111364" href="/cmdty/detail?csId=11364" target="_blank">国内普通商标注册（含官费、含发票）</a></h6>
                <p class="record"><span><a _stat_click_id="8_211364" href="/cmdty/detail?csId=11364" target="_blank">咨询&nbsp;2313</a></span><span><a _stat_click_id="8_311364" href="/cmdty/detail?csId=11364" target="_blank">销量&nbsp;2368</a></span></p>
                <p class="provider">服务商&nbsp;<a _stat_click_id="8_411364" href="/seller/corpinfo?c_id=286679&amp;tab=1" target="_blank">神州顺利办</a><a class="lv" href="/scenter/growth" target="_blank">Lv8</a></p>
                <div class="price"><p class="np"><i>¥</i>800</p></div>
                <a _stat_click_id="8_511364" href="/cmdty/detail?csId=11364" target="_blank" class="btn">查看详情</a>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../common/bottom.jsp"></jsp:include>


<script>
    $(function () {
        var keyword = "${keyword}";
        $("#keyword").val(keyword);
        var searchType = $("a[name='searchType']");
        searchType.removeClass("selectType");
        searchType.eq(0).addClass("selectType");

        layui.use(['laypage', 'layer'], function(){
            var laypage = layui.laypage
                    ,layer = layui.layer;
            //以下将以jquery.ajax为例，演示一个异步分页
            var pageSize = 5;
            function paging(curr){
                $.ajax({
                    type: "POST",
                    url: "/product/page.html",
                    data: {
                        keyword:keyword,
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
</body>
</html>