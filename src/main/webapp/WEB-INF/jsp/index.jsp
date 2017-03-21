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
        .cc{width: 390px;float: left;height:60px;}
        .cc_img{display: inline-block;margin-top: 10px;margin-right: 10px;width: 36px;height: 46px;background-image: url(http://dgg.net/images/service-details/top-icon.png);background-position: -75px 0;vertical-align: middle;float: left;}
        .cc_content{float: left;}
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
    </style>
    <script type="text/javascript" src="js/jquery-1.9.1.js"></script>
</head>
<body>
<jsp:include page="common/top.jsp"></jsp:include>
<div class="carousel" >
    <img style="width: 100%;" src="http://o6yahvsqr.bkt.clouddn.com/banner/20170317104435275659.jpg?imageView2/1/w/1920/h/450">
</div>
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
                &nbsp;
            </div>
            <div class="cc_content">
                <p class="cc_content_title">贷款服务</p>
                <p>额度高，放款快，门槛低，利率低</p>
            </div>
            <div class="clear"></div>
        </div>
        <div class="cc">
            <div class="cc_img">
                &nbsp;
            </div>
            <div class="cc_content">
                <p class="cc_content_title">工商服务</p>
                <p>价格透明，最快3天拿证</p>
            </div>
        </div>
        <div class="cc">
            <div class="cc_img">
                &nbsp;
            </div>
            <div class="cc_content">
                <p class="cc_content_title">法律服务</p>
                <p>专家团队，一对一服务</p>
            </div>
        </div>
        <div class="clear"></div>
    </div>
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
                <div style="height: 310px;border: 1px solid red;width:100px;margin-right: 4px;">图片区域</div>
            </div>
            <div class="need_content_list_data">
                <ul>
                    <li>张女士贷款15万 无抵押贷 河北 今天</li>
                    <li>张女士贷款15万 无抵押贷 河北 今天</li>
                    <li>张女士贷款15万 无抵押贷 河北 今天</li>
                    <li>张女士贷款15万 无抵押贷 河北 今天</li>
                    <li>张女士贷款15万 无抵押贷 河北 今天</li>
                    <li>张女士贷款15万 无抵押贷 河北 今天</li>
                    <li>张女士贷款15万 无抵押贷 河北 今天</li>
                    <li>张女士贷款15万 无抵押贷 河北 今天</li>
                    <li>张女士贷款15万 无抵押贷 河北 今天</li>
                    <li>张女士贷款15万 无抵押贷 河北 今天</li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
        <div class="need_content_list">
            <div class="need_content_list_img">
                <div style="height: 310px;border: 1px solid red;width:100px;margin-right: 4px;">图片区域</div>
            </div>
            <div class="need_content_list_data">
                <ul>
                    <li>张女士贷款15万 无抵押贷 河北 今天</li>
                    <li>张女士贷款15万 无抵押贷 河北 今天</li>
                    <li>张女士贷款15万 无抵押贷 河北 今天</li>
                    <li>张女士贷款15万 无抵押贷 河北 今天</li>
                    <li>张女士贷款15万 无抵押贷 河北 今天</li>
                    <li>张女士贷款15万 无抵押贷 河北 今天</li>
                    <li>张女士贷款15万 无抵押贷 河北 今天</li>
                    <li>张女士贷款15万 无抵押贷 河北 今天</li>
                    <li>张女士贷款15万 无抵押贷 河北 今天</li>
                    <li>张女士贷款15万 无抵押贷 河北 今天</li>
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
