<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
    <base href="<%=basePath%>">
    <title>企巴巴</title>
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
        .titleNavLine{border-bottom: red solid 1px;}
        .tj_title{margin:18px 0px;font-size:18px;text-align: center;}
        .adviser_tj{float: left;margin-right: 5px;text-align: center;}
        .adviser_tj_img{width: 230px;}
        .a_name{margin: 10px 0px;}
        .need_content{margin-top:20px;}
        .need_content_list{float: left;width: 590px;}
        .need_content_list li{height: 30px;line-height: 30px;}
        .need_content_list_img{float: left;}
        .need_content_list_img img{width: 200px;height:300px;margin-right: 5px;}
        /* 楼层1 样式*/
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
        }
        .when-boss-list>li:hover {
            box-shadow: 0 0 20px 1px rgba(0,0,0,.1);
        }
        .i-title{line-height: 65px;font-size: 20px;color: #000;}
        .boss-title{line-height: 73px;text-align: center;font-size: 24px;color: #2992f6;}
        .d-title{line-height:60px;text-align: center;font-size: 20px;color: #2992f6;}
        .boss-main {
            position: relative;
        }
        .boss-main>img {
            width: 100%;
            height: 170px;
        }
        .boss-main-txt {
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            padding: 25px 30px;
        }
        .boss-main-txt {
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            padding: 25px 30px;
        }
        .boss-main-txt>p {
            color: #000;
            font-weight: bold;
        }
        .boss-main-txt>p>span {
            color: #999;
            font-weight: normal;
            margin-left: 3px;
        }
        .boss-main-txt>label {
            color: #fa4f4f;
            display: block;
            margin: 10px 0 15px;
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
        .d-boss-sub {
            padding:15px 0 20px;
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
        }
        .boss-sub>a p {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        /*楼层2样式*/
        .company-develop {
            background: #f6f7f9;
            min-width: 1180px;
            /* padding-bottom: 32px; */
        }
        .company-develop-main {
            width: 1183px;
            margin: 0 auto;
            overflow: hidden;
        }
        .develop-list {
            float: left;
        }
        .develop-list>li {
            position: relative;
            float: left;
            display: block;
            border-right: 1px #eee solid;
        }
        .develop-list>li a img {
            width: 100%;
            height: 100%;
        }
        .develop-list>li.list1 a {
            width: 300px;
            height: 380px;
        }
        .develop-main {
            padding: 30px 30px;
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            color: #999;
            line-height: 25px;
        }
        .develop-list>li.list1 .develop-title {
            width: 80px;
            /* color: #2892f5; */
        }
        .develop-title {
            width: 50px;
            margin-bottom: 10px;
            white-space: nowrap;
            line-height: 45px;
            font-size: 24px;
            border-bottom: 2px #2892f5 solid;
            color: #333;
            transition: all 0.3s cubic-bezier(0.215, 0.61, 0.355, 1) 0s;
        }
        .develop-main>label {
            color: #fa4f4f;
        }
        .develop-list2 {
            float: left;
            width: 420px;
            background: #fff;
        }
        .develop-list2>li {
            display: block;
            float: left;
            width: 209px;
            height: 190px;
            border-right: 1px #eee solid;
            border-bottom: 1px #eee solid;
        }
        .develop-list2>li>a {
            display: block;
            color: #999;
            padding: 25px 30px;
        }
        .develop-list2>li>a>h3 {
            color: #333;
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .develop-list2>li>a>p {
            line-height: 25px;
            /* margin-bottom: 10px; */
        }
        .develop-list2>li>a>label {
            color: #fa4f4f;
            line-height: 35px;
        }

        /*幻灯片*/
        /* 本例子css */
        .slideBox{ width:100%; overflow:hidden; position:relative; border:1px solid #ddd;  }
        .slideBox .hd{ overflow:hidden; position:absolute; right:5px; bottom:5px; z-index:1; }
        .slideBox .hd ul{ overflow:hidden; zoom:1; float:left;  }
        .slideBox .hd ul li{ float:left; margin-right:2px; padding:5px;line-height:14px; text-align:center; background:#fff; cursor:pointer; }
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



    </style>
    <script type="text/javascript" src="js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="http://lib.h-ui.net/jquery.SuperSlide/2.1.1/jquery.SuperSlide.min.js"></script>

</head>
<body>
<jsp:include page="common/top.jsp"></jsp:include>
<div id="slideBox" class="slideBox">
    <div class="hd">
        <ul><li>1</li><li>2</li><li>3</li></ul>
    </div>
    <div class="bd">
        <ul>
            <li><a href="http://www.SuperSlide2.com" target="_blank"><img src="http://o6yahvsqr.bkt.clouddn.com/banner/20170317104435275659.jpg?imageView2/1/w/1920/h/450" /></a></li>
            <li><a href="http://www.SuperSlide2.com" target="_blank"><img src="http://o6yahvsqr.bkt.clouddn.com/banner/20170316192458564206.jpg?imageView2/1/w/1920/h/450" /></a></li>
            <li><a href="http://www.SuperSlide2.com" target="_blank"><img src="http://o6yahvsqr.bkt.clouddn.com/banner/20170316192458564206.jpg?imageView2/1/w/1920/h/450" /></a></li>
        </ul>
    </div>

    <!-- 下面是前/后按钮代码，如果不需要删除即可 -->
    <a class="prev" href="javascript:void(0)"></a>
    <a class="next" href="javascript:void(0)"></a>

</div>

<script id="jsID" type="text/javascript">
    var ary = location.href.split("&");
    jQuery(".slideBox").slide( { mainCell:".bd ul", effect:ary[1],autoPlay:ary[2],trigger:ary[3],easing:ary[4],delayTime:ary[5],mouseOverStop:ary[6],pnLoop:ary[7] });
</script>

<div class="content">
    <div class="notice">
        <p class="noticeGG">最新公告:</p>
        <p class="noticeGG_content">[3.03]企巴巴需求量过10万条 <span class="redClass">new</span></p>
        <p class="noticeGG_content">[3.03]企巴巴需求量过10万条 <span class="redClass">new</span></p>
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

    <div>
        <p class="i-title">会员求助 <span>·企巴巴需求</span></p>
        <div class="layer_1">
            <ul class="when-boss-list">
                <li>
                    <div class="d-title">用户王东先生申请30000万元</div>
                    <div class="boss-sub d-boss-sub">
                        <a target="_blank" href="/icsite/nuclear_quick.htm">
                            <label>姓名：张三</label>
                            <p>所在地：北京市东城区</p>
                        </a>
                        <a target="_blank" href="/icsite/services/13.htm">
                            <label>无抵押贷款</label>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="d-title">用户王东先生申请贷款30000万元</div>
                    <div class="boss-sub d-boss-sub">
                        <a target="_blank" href="/icsite/nuclear_quick.htm">
                            <label>姓名：张三</label>
                            <p>所在地：北京市东城区</p>
                        </a>
                        <a target="_blank" href="/icsite/services/13.htm">
                            <label>无抵押贷款</label>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="d-title">用户王东先生申请有抵押贷款30000万元</div>
                    <div class="boss-sub d-boss-sub">
                        <a target="_blank" href="/icsite/nuclear_quick.htm">
                            <label>姓名：张三</label>
                            <p>所在地：北京市东城区</p>
                        </a>
                        <a target="_blank" href="/icsite/services/13.htm">
                            <label>无抵押贷款</label>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="d-title">用户王东先生申请有抵押贷款</div>
                    <div class="boss-sub d-boss-sub">
                        <a target="_blank" href="/icsite/nuclear_quick.htm">
                            <label>姓名：张三</label>
                            <p>所在地：北京市东城区</p>
                        </a>
                        <a target="_blank" href="/icsite/services/13.htm">
                            <label>无抵押贷款</label>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="d-title">用户王东先生申请有抵押贷款30000万元</div>
                    <div class="boss-sub d-boss-sub">
                        <a target="_blank" href="/icsite/nuclear_quick.htm">
                            <label>姓名：张三</label>
                            <p>所在地：北京市东城区</p>
                        </a>
                        <a target="_blank" href="/icsite/services/13.htm">
                            <label>无抵押贷款</label>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="d-title">用户王东先生申请有抵押贷款30000万元</div>
                    <div class="boss-sub d-boss-sub">
                        <a target="_blank" href="/icsite/nuclear_quick.htm">
                            <label>公司核名</label>
                            <p>3秒免费告知结果</p>
                        </a>
                        <a target="_blank" href="/icsite/services/13.htm">
                            <label>注册地址</label>
                            <p>低价，快捷注册</p>
                        </a>
                    </div>
                </li>
            </ul>
        </div>
    </div>


    <div>
        <p class="i-title">我要当老板 <span>·小顶助您快速创业</span></p>
        <div class="layer_1">
            <ul class="when-boss-list">
                <li>
                    <div class="boss-title">注册公司</div>
                    <div class="boss-main">
                        <img src="http://7xrgpz.com2.z0.glb.clouddn.com/serviceImg/20170313143142_boss1.jpg">
                        <div class="boss-main-txt">
                            <p>有限公司注册<span>足不出户开公司，轻松当老板</span></p>
                            <label>￥689.0起</label>
                            <a target="_blank" href="http://www.xiaodingwang.com/icsite/services/4.htm">查看详情</a>
                        </div>
                    </div>
                    <div class="boss-sub">
                        <a target="_blank" href="/icsite/nuclear_quick.htm">
                            <label>公司核名</label>
                            <p>3秒免费告知结果</p>
                        </a>
                        <a target="_blank" href="/icsite/services/13.htm">
                            <label>注册地址</label>
                            <p>低价，快捷注册</p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="boss-title">做账报税</div>
                    <div class="boss-main">
                        <img src="http://7xrgpz.com2.z0.glb.clouddn.com/serviceImg/20170313143812_boss2.jpg">
                        <div class="boss-main-txt">
                            <p>代理记账<span>191每月，大团队来帮你</span></p>
                            <label>￥689.0起</label>
                            <a target="_blank" href="http://www.xiaodingwang.com/icsite/services/4.htm">查看详情</a>
                        </div>
                    </div>
                    <div class="boss-sub">
                        <a target="_blank" href="/accountingcustomize/index.htm">
                            <label>会计定制</label>
                            <p>企业专属，定制不凡</p>
                        </a>
                        <a target="_blank" href="/accounting/services/377.htm">
                            <label>一般纳税人代理记账</label>
                            <p>299每月，专业省钱</p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="boss-title">办理社保</div>
                    <div class="boss-main">
                        <img src="http://7xrgpz.com2.z0.glb.clouddn.com/serviceImg/20170313143402_boss3.jpg">
                        <div class="boss-main-txt">
                            <p>社保代办<span>多一份保障，多一分安心</span></p>
                            <label>￥689.0起</label>
                            <a target="_blank" href="http://www.xiaodingwang.com/icsite/services/4.htm">查看详情</a>
                        </div>
                    </div>
                    <div class="boss-sub">
                        <a target="_blank" href="/service/173.htm">
                            <label>社保开户</label>
                            <p>社保局指定合作单位</p>
                        </a>
                        <a target="_blank" href="/hrsite/services/651.htm">
                            <label>公积金代理</label>
                            <p>快速办理，价格更低</p>
                        </a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>

<div class="company-develop">
    <div class="company-develop-main">
        <p class="i-title">助力企业发展 <span>· 小顶为您保驾护航</span></p>
        <div class="develop-box">
            <ul class="develop-list">
                <li class="list1">
                    <a target="_blank" href="/loan/services/62.htm">
                        <img src="http://7xrgpz.com2.z0.glb.clouddn.com/serviceImg/20170315150818_融资贷款300-380.jpg">
                        <div class="develop-main">
                            <h3 class="develop-title">融资贷款</h3>
                            <p>低门槛，比你想象更快更简单</p>
                            <label>月利率低至0.25%</label>
                        </div>
                    </a>
                </li>

                <li>
                    <a target="_blank" href="/lawsite/services/200.htm">
                        <img src="http://7xrgpz.com2.z0.glb.clouddn.com/serviceImg/20170315150846_230-380.jpg">
                        <div class="develop-main">
                            <h3 class="develop-title">法律咨询</h3>
                            <p>有问题，找律师，更专业更高效</p>
                            <p></p>
                        </div>
                    </a>
                </li>

                <li>
                    <a target="_blank" href="/tmservice/73.htm">
                        <img src="http://7xrgpz.com2.z0.glb.clouddn.com/serviceImg/20170313142817_company3.jpg">
                        <div class="develop-main">
                            <h3 class="develop-title">商标注册</h3>
                            <p>企业没商标，裸奔风险高</p>
                            <p></p>
                        </div>
                    </a>
                </li>

            </ul>
            <ul class="develop-list2">



                <li style="background: url(http://7xrgpz.com2.z0.glb.clouddn.com/serviceImg/20170315150558_股东变更.jpg) no-repeat right bottom;">
                    <a target="_blank" href="/service/45.htm">
                        <h3>公司股东变更</h3>
                        <p>专人对接，快速变更</p>

                        <label>￥400.0起</label>

                    </a>
                </li>


                <li style="background: url(http://7xrgpz.com2.z0.glb.clouddn.com/serviceImg/20170315150540_商标注册.jpg) no-repeat right bottom;">
                    <a target="_blank" href="http://vi.xiaodingwang.com/case/brand_pack_list.htm?parentId=1002">
                        <h3>品牌包装</h3>
                        <p>不会装扮，哪有回头率</p>

                    </a>
                </li>


                <li style="background: url(http://7xrgpz.com2.z0.glb.clouddn.com/serviceImg/20170315150523_许可证资质.jpg) no-repeat right bottom;">
                    <a target="_blank" href="/icsite/services/54.htm">
                        <h3>食品经营许可证</h3>
                        <p>不成功，不收费</p>

                    </a>
                </li>


                <li style="background: url(http://7xrgpz.com2.z0.glb.clouddn.com/serviceImg/20170315150505_会计审计.jpg) no-repeat right bottom;">
                    <a target="_blank" href="/fatsite/services/597.htm">
                        <h3>会计报表审计</h3>
                        <p>坏账审计，排除定时炸弹</p>

                    </a>
                </li>

            </ul>
        </div>
    </div>
</div>

<div class="content">

<%-- 楼层1开始 --%>

    <%-- 楼层2 --%>

    <div class="adviser_tj_list">
        <div class="titleNavLine"><p class="titleNav">金融服务</p></div>
        <p class="tj_title">专业贷款顾问</p>
        <div class="adviser_tj">
            <img class="adviser_tj_img" src="http://o6yahvsqr.bkt.clouddn.com/detail/20161222181557838985.jpg?crop/113x113">
            <p class="a_name">张三丰</p>
            <p class="tj_introduction">在线咨询<img src="images/qq/qq.gif"></p>
        </div>
        <div class="adviser_tj">
            <img class="adviser_tj_img" src="http://o6yahvsqr.bkt.clouddn.com/detail/20161222181557838985.jpg?crop/113x113">
            <p class="a_name">张三丰</p>
            <p class="tj_introduction">在线咨询<img src="images/qq/qq.gif"></p>
        </div>
        <div class="adviser_tj">
            <img class="adviser_tj_img" src="http://o6yahvsqr.bkt.clouddn.com/detail/20161222181557838985.jpg?crop/113x113">
            <p class="a_name">张三丰</p>
            <p class="tj_introduction">在线咨询<img src="images/qq/qq.gif"></p>
        </div>
        <div class="adviser_tj">
            <img class="adviser_tj_img" src="http://o6yahvsqr.bkt.clouddn.com/detail/20161222181557838985.jpg?crop/113x113">
            <p class="a_name">张三丰</p>
            <p class="tj_introduction">在线咨询<img src="images/qq/qq.gif"></p>
        </div>
        <div class="adviser_tj">
            <img class="adviser_tj_img" src="http://o6yahvsqr.bkt.clouddn.com/detail/20161222181557838985.jpg?crop/113x113">
            <p class="a_name">张三丰</p>
            <p class="tj_introduction">在线咨询<img src="images/qq/qq.gif"></p>
        </div>
        <div class="clear"></div>
    </div>
    <div class="need_content">
        <p class="tj_title">专业贷款顾问</p>
        <div class="need_content_list">
            <div class="need_content_list_img">
                <img src="images/gg/g1.png" />
            </div>
            <div class="need_content_list_data">
                <ul>
                    <li>张女士贷款15万&nbsp;&nbsp;无抵押贷&nbsp;&nbsp;河北 &nbsp;&nbsp;&nbsp;&nbsp; 今天</li>
                    <li>张女士贷款15万&nbsp;&nbsp;无抵押贷&nbsp;&nbsp;河北 &nbsp;&nbsp;&nbsp;&nbsp; 今天</li>
                    <li>张女士贷款15万&nbsp;&nbsp;无抵押贷&nbsp;&nbsp;河北 &nbsp;&nbsp;&nbsp;&nbsp; 今天</li>
                    <li>张女士贷款15万&nbsp;&nbsp;无抵押贷&nbsp;&nbsp;河北 &nbsp;&nbsp;&nbsp;&nbsp; 今天</li>
                    <li>张女士贷款15万&nbsp;&nbsp;无抵押贷&nbsp;&nbsp;河北 &nbsp;&nbsp;&nbsp;&nbsp; 今天</li>
                    <li>张女士贷款15万&nbsp;&nbsp;无抵押贷&nbsp;&nbsp;河北 &nbsp;&nbsp;&nbsp;&nbsp; 今天</li>
                    <li>张女士贷款15万&nbsp;&nbsp;无抵押贷&nbsp;&nbsp;河北 &nbsp;&nbsp;&nbsp;&nbsp; 今天</li>
                    <li>张女士贷款15万&nbsp;&nbsp;无抵押贷&nbsp;&nbsp;河北 &nbsp;&nbsp;&nbsp;&nbsp; 今天</li>
                    <li>张女士贷款15万&nbsp;&nbsp;无抵押贷&nbsp;&nbsp;河北 &nbsp;&nbsp;&nbsp;&nbsp; 今天</li>
                    <li>张女士贷款15万&nbsp;&nbsp;无抵押贷&nbsp;&nbsp;河北 &nbsp;&nbsp;&nbsp;&nbsp; 今天</li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
        <div class="need_content_list">
            <div class="need_content_list_img">
                <img src="images/gg/g2.png" />
            </div>
            <div class="need_content_list_data">
                <ul>
                    <li>张女士贷款15万&nbsp;&nbsp;无抵押贷&nbsp;&nbsp;河北 &nbsp;&nbsp;&nbsp;&nbsp; 今天</li>
                    <li>张女士贷款15万&nbsp;&nbsp;无抵押贷&nbsp;&nbsp;河北 &nbsp;&nbsp;&nbsp;&nbsp; 今天</li>
                    <li>张女士贷款15万&nbsp;&nbsp;无抵押贷&nbsp;&nbsp;河北 &nbsp;&nbsp;&nbsp;&nbsp; 今天</li>
                    <li>张女士贷款15万&nbsp;&nbsp;无抵押贷&nbsp;&nbsp;河北 &nbsp;&nbsp;&nbsp;&nbsp; 今天</li>
                    <li>张女士贷款15万&nbsp;&nbsp;无抵押贷&nbsp;&nbsp;河北 &nbsp;&nbsp;&nbsp;&nbsp; 今天</li>
                    <li>张女士贷款15万&nbsp;&nbsp;无抵押贷&nbsp;&nbsp;河北 &nbsp;&nbsp;&nbsp;&nbsp; 今天</li>
                    <li>张女士贷款15万&nbsp;&nbsp;无抵押贷&nbsp;&nbsp;河北 &nbsp;&nbsp;&nbsp;&nbsp; 今天</li>
                    <li>张女士贷款15万&nbsp;&nbsp;无抵押贷&nbsp;&nbsp;河北 &nbsp;&nbsp;&nbsp;&nbsp; 今天</li>
                    <li>张女士贷款15万&nbsp;&nbsp;无抵押贷&nbsp;&nbsp;河北 &nbsp;&nbsp;&nbsp;&nbsp; 今天</li>
                    <li>张女士贷款15万&nbsp;&nbsp;无抵押贷&nbsp;&nbsp;河北 &nbsp;&nbsp;&nbsp;&nbsp; 今天</li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<jsp:include page="common/bottom.jsp"></jsp:include>
</body>
</html>
