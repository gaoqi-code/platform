<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/common/global.jsp" %>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>${member.companyName}-企巴巴</title>
    <link rel="stylesheet" type="text/css" href="css/base.css">
    <link rel="stylesheet" href="./plugins/layui/css/layui.css"  media="all">
    <link rel="stylesheet" type="text/css" href="css/tui/adviser_tui.css">
    <style>
        .counselor-head-update{min-width: 1180px;height: 404px; background: url(./images/head-bg.jpg) no-repeat center center;position: relative;}
        .head-update-box{position: relative;
            padding-top: 50px;
            overflow: hidden;}
        .head-update-left{float: left;    width: 224px;
            height: 224px;
            border-radius: 50%;
            border: 0px solid rgba(255,255,255,.2);
            overflow: hidden;
            margin-left: 25px;}
        .head-update-img img{width: 100%;border: 0 none;			vertical-align: middle;			max-width: 100%;}
        .head-update-ewm{    position: relative;
            padding-top: 10px;
            text-align: center;
            color: #999;
            font-size: 12px;}
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
        .head-update-middle{float: left;
            width: 270px;
            color: white;
            margin-left: 25px;
        }
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
            font-size: 26px;
            font-weight: bold;
        }
        .head-update-middle .sub-til {
            color: white;
            font-size: 14px;
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
        .head-update-right {
            float: left;
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
            width: 199px;
            height: 44px;
            border-radius: 2px;
            color: white;
            text-align: center;
            line-height: 44px;
            font-size: 22px;
            margin-left: 35px;
            margin-top: 76px;
        }
        .head-update-middle ul li b {
            color: #999;
            font-size: 12px;
        }

        .adviser_left{width: 935px;margin-right:5px;float: left;}
        .adviser_right{width:240px; text-align: center; float: left;}
        .order-form{border:1px solid #eee;text-align: center;}
        /*文本框样式调整*/
        .layui-input-block{width:225px;margin-left:auto;margin-right: auto;}
        .layui-form-item .layui-input-inline{width:225px;margin-left:5px;}











        /*** 提供的服务 ***/
        .service-list-box {
            margin-bottom: -22px;
        }

        .provider-index-box .mod-head-small .mod-title {
            font: 20px/26px microsoft yahei;
            color: #323232;
            margin-top: 0;
        }
        .mod-head .more {
            position: absolute;
            right: 0;
            bottom: 0;
            color: #1cbcb4;
            font-size: 16px;
            line-height: normal;
        }

        .provider-index-box .service-list {
            overflow: hidden;
        }
        .provider-index-box .service-list ul {
            margin-right: -24px;
        }
        .provider-index-box .service-list .item {
            display: inline-block;
            vertical-align: top;
            overflow: hidden;
            width: 236px;
            height: 124px;
            border: 1px solid #e2e2e2;
            padding: 20px 19px;
            background-color: #fff;
            position: relative;
            font-size: 14px;
            margin: 0 10px 24px 0;
            cursor: pointer;
        }
        .provider-index-box .service-list .title {
            font-size: 20px;
            color: #323232;
            margin-bottom: 3px;
            white-space: nowrap;
            max-width: 100%;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .provider-index-box .service-list a {
            text-decoration: none;
            color: #323232;
        }
        .provider-index-box .service-list .intro {
            color: #878787;
            line-height: 20px;
        }
        .provider-index-box .service-list .record {
            color: #9e9e9e;
            line-height: 20px;
            margin-top: 5px;
        }
        .provider-index-box .service-list .consult {
            margin-left: 10px;
        }
        .provider-index-box .service-list .price-box {
            position: absolute;
            left: 20px;
            bottom: 10px;
        }
        .provider-index-box .service-list .mod-red-redeem, .provider-index-box .service-list .mod-seckill-price {
            color: #ff6547;
            font-size: 14px;
            margin-bottom: 4px;
        }
        .mod-rating-star label, .mod-red-redeem:before, .mod-seckill-price:before {
            background-image: url(../../../../sprite/sprite-7e8b7d8bbe.corp-index.base.png?max_age=31536000);
            background-position: 0 0;
        }
        .provider-index-box .service-list .mod-red-redeem:before {
            vertical-align: middle;
            margin-top: -2px;
        }
        .mod-red-redeem:before {
            content: "";
            display: inline-block;
            width: 19px;
            height: 13px;
            margin-right: 6px;
            background-repeat: no-repeat;
        }
        .case-list li p, .provider-aboutpop-v, .provider-index-box .service-list .intro, .provider-index-box .service-list .originalprice, .provider-index-box .service-list .price {
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
            max-width: 100%;
            word-wrap: normal;
        }
        .provider-index-box .service-list .price {
            font-size: 22px;
            color: #ef6512;
        }
        .provider-index-box .service-list .ui-button {
            position: absolute;
            right: 17px;
            bottom: 7px;
        }
        .ui-button-suc {
            color: #fff!important;
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
        .ui-button-suc {
            background-color: #1cbcb4;
            color: #fff;
            border-color: #1cbcb4;
        }
        .ui-button-sm {
            min-width: 66px;
            line-height: 30px;
            padding: 0 8px;
            font-size: 12px;
        }


        .head-left-content{width: 590px;border-right: 1px solid #ddd;float: left;}
        .head-left-content:after{content: '';clear: both;display: block;}
        #userNeedForm{position: absolute;top: 25px;padding-top: 15px;left: 905px;}
        .content:after{content: '';clear: both;display: block;}
        .personImg{width: 535px;height: 325px;float:left;}
        .personImg img{width: 540px;}
        .personIntro{margin-left: 80px;float: left;height: 275px;width:550px;display: table;}
        .personIntro span{display:table-cell; vertical-align:middle;padding:0px 30px 0px 0px;text-indent: 20px;         line-height: 23px;}
        .zxzx{float: left;margin-right: 50px;}
        .zxzx img{height: 450px;}
        .zxzx_need{float: left;margin-top: 50px;}

        .tempWidth{margin-left:68px!important;}
        .temp-layui-form-label{padding: 9px 0px!important;width: auto!important;color:#FFF;font-size: 16px;}
        .temp-layui-form-item{margin-bottom: 0px;border: 1px solid #ddd;            border-bottom: none;    padding-left: 10px;}
        .tempInput{    BACKGROUND-COLOR: transparent;          border: none;font-size: 16px;            color: #FFF;}
    </style>
</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>

<div id="container">
    <div class="position2">
        您当前位置：<a href="/index.html">企巴巴</a> &gt;&gt;
        <a href="/adviser/toSearch.html">企业顾问</a>&gt;&gt;我的店铺
    </div>
    <div class="counselor-head-update content">
        <div class="content head-update-box">
            <div class="head-left-content">
            <div class="head-update-left" >
                <div class="head-update-img">
                    <img src="${member.headPortrait == null?'/images/portrait.jpg':member.headPortrait}">
                </div>
                <div class="head-update-ewm">
                    <i></i>
                    <%--<p>扫一扫 手机访问</p>--%>
                    <div class="ewm">
                        <div id="codeAdviser"></div>
                        <i></i>
                    </div>
                </div>
            </div>
            <div class="head-update-middle">
                <div class="til">
                    <span class="c-name">${member.name}</span>
                    <span class="c-post">
                        <c:if test="${member.adviserType == '1-'}">金融顾问</c:if>
                        <c:if test="${member.adviserType == '2-'}">企业顾问</c:if>
                        <c:if test="${member.adviserType == '3-'}">法律顾问</c:if>
                    </span>
                </div>
                <div class="sub-til">
                    <span>
                      <c:choose>
                          <c:when test="${member.level==1}">
                              普通顾问
                          </c:when>
                          <c:when test="${member.level==2}">
                              高级顾问
                          </c:when>
                          <c:otherwise>
                              顾问
                          </c:otherwise>
                      </c:choose>
                    </span>
                </div>
                <div class="sub-til">
                    <span>所在地区：${member.areaFullName}-${member.address}</span>
                </div>
                <div class="sub-til">
                    <span>职业经验：${member.workAge}</span>
                </div>
                <%--<div class="sub-til">--%>
                    <%--<span>在线咨询：<a href="http://wpa.qq.com/msgrd?v=3&amp;uin=${member.qq}&amp;site=qq&amp;menu=yes" target="_blank" ><img src="images/qq/qq.gif" /></a></span>--%>
                <%--</div>--%>
                <div class="sub-til">
                    <span style="font-size: 22px;">${member.mobile}</span>
                </div>

            </div>

            </div>

            <div class="head-update-right">
                <%--<p class="tel-num"><i></i>13540250791</p>--%>
                <%--<a href="javascript:void(0)" class="btn-free" onclick="freephone('http://o6yahvsqr.bkt.clouddn.com/detail/20160812184829965595.jpg','117','李婷婷')">免费电话</a>--%>
                <a href="javascript:openlive800()" class="btn-online">在线咨询</a>
            </div>

        </div>
        <div class="clear"></div>
        <jsp:include page="../openNeed/adviser_need_form.jsp">
            <jsp:param value="103" name="dataSource"/>
        </jsp:include>

    </div>
<div class="content"><img src="/images/adviser/xie.jpg" style="margin-left: 484px;"></div>
    <div class="content">
        <div class="personImg">
            <img src="/images/adviser/personImg.jpg">
        </div>
        <div class="personIntro">
            <span>${member.description}</span>
        </div>
    </div>


    <div class="content contentTop">
        <div class="layui-collapse" lay-accordion="">
            <div class="layui-colla-item">
                <h2 class="layui-colla-title">提供的服务</h2>
                <div class="layui-colla-content  layui-show">



                    <div class="provider-index-wrap jmod-tabcontent-wrap0">
                        <div class="provider-index-box service-list-box">
                            <div class="layout">
                                <%--<div class="mod-head mod-head-small jmod-hot-sku-header">--%>
                                <%--<h3 class="mod-title">热销服务</h3>--%>
                                <%--<a href="/seller/corpinfo?c_id=10021&amp;tab=2" _stat_click_id="9_100" class="more">更多服务</a>--%>
                                <%--</div>--%>
                                <div class="service-list">
                                    <ul class="jmod-hot-skus">
                                        <c:forEach items="${products}" var="product">
                                            <li class="item">

                                                <h4 class="title"><a _stat_click_id="9_13134" href="product/detail/${product.id}.html" target="_blank">${product.title}</a></h4>
                                                <p class="intro">${product.summary}</p>
                                                <%--<div class="record">--%>
                                                    <%--<span class="deal">销量&nbsp;690</span>--%>
                                                    <%--<span class="consult">咨询量&nbsp;118</span>--%>
                                                <%--</div>--%>
                                                <div class="price-box">
                                                        <%--<p class="mod-red-redeem">可抵64.9元</p>--%>
                                                    <p class="price">
                                                        <c:if test="${product.marketPrice==null}">
                                                            面议
                                                        </c:if>
                                                        <c:if test="${product.marketPrice!=null}">
                                                            ¥${product.marketPrice}
                                                        </c:if>
                                                    </p>
                                                </div>
                                                <a href="product/detail/${product.id}.html" _stat_click_id="9_13134" target="_blank" class="ui-button ui-button-sm ui-button-suc">查看详情</a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>



                </div>
            </div>
        </div>
        <div class="clear"></div>
    </div>

    <div class="border-line content"></div>
    <div class="content" style="background-color:#80b9d4; height: 450px;">
        <div class="zxzx">
            <img src="/images/adviser/zxzx.jpg">
        </div>
        <div class="zxzx_need">
            <form class="layui-form order-form" id="form2" action="" style="border: none;">
                <input type="hidden" value="102" name="dataSource">
                <div class="layui-form-item temp-layui-form-item">
                    <label class="layui-form-label temp-layui-form-label">姓&nbsp;&nbsp;&nbsp;&nbsp;名:</label>
                    <div class="layui-input-block tempWidth">
                        <input type="text" name="userName" lay-verify="userName" autocomplete="off" placeholder="" class="layui-input tempInput">
                    </div>
                </div>
                <div class="layui-form-item temp-layui-form-item">
                    <label class="layui-form-label temp-layui-form-label">Q&nbsp;&nbsp;&nbsp;&nbsp;Q:</label>
                    <div class="layui-input-block tempWidth">
                        <input type="text" name="qq" lay-verify="qq" autocomplete="off" placeholder="" class="layui-input tempInput">
                    </div>
                </div>
                <div class="layui-form-item temp-layui-form-item">
                    <label class="layui-form-label temp-layui-form-label">手机号码:</label>
                    <div class="layui-input-block tempWidth">
                        <input type="text" name="mobile" lay-verify="phone" autocomplete="off" class="layui-input tempInput">
                    </div>
                </div>
                <div class="layui-form-item temp-layui-form-item">
                    <label class="layui-form-label temp-layui-form-label">电子邮件:</label>
                    <div class="layui-input-block tempWidth">
                        <input type="text" name="mail" lay-verify="mail" autocomplete="off" placeholder="" class="layui-input tempInput">
                    </div>
                </div>
                <div class="layui-form-item temp-layui-form-item">
                    <label class="layui-form-label temp-layui-form-label">留言主题:</label>
                    <div class="layui-input-block tempWidth">
                        <input type="text" name="needTitle" lay-verify="needTitle" autocomplete="off" placeholder="" class="layui-input tempInput">
                    </div>
                </div>
                <div class="layui-form-item layui-form-text temp-layui-form-item" style="border-bottom: 1px solid #ddd;">
                    <label class="layui-form-label temp-layui-form-label">留言内容:</label>
                    <div class="layui-input-block tempWidth">
                        <textarea name="needDesc" lay-verify="n_needContent" class="layui-textarea tempInput"></textarea>
                    </div>
                    <button lay-submit="" style="float: right;    font-size: 16px;padding: 7px;margin-right: 10px;    background: transparent;    color: #FFF;" lay-filter="demo2">提交</button>
                </div>
            </form>
        </div>
    </div>

    <div class="border-line content"></div>


        <jsp:include page="/adviserRecommend/recommendWithDetail.html">
            <jsp:param value="201" name="plate"/>
            <jsp:param value="1" name="currentPage"/>
            <jsp:param value="3" name="pageSize"/>
        </jsp:include>

</div>
<jsp:include page="../common/bottom.jsp"></jsp:include>
<%--<script src="./plugins/layui/layui.js" charset="utf-8"></script>--%>
<script>
    layui.use(['form'], function(){
        var form = layui.form()
                ,layer = layui.layer;

        //自定义验证规则
        form.verify({
            mobile: function(value){
                if(value.length < 5){
                    return '请输入正确的手机号';
                }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });

        //监听提交
        form.on('submit(demo2)', function(data){
            if((new Date().getTime())-cureentTime<4000){
                return false;
            }
            cureentTime = new Date().getTime();
            $.ajax({
                type: "POST",
                url: "/need/liuyan.json",
                data: $("#form2").serialize(),
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
</script>
</body>
</html>