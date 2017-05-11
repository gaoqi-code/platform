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
                <li><span>姓名：小鬼</span><span>所在地区：北京市-北京</span><button>查看联系方式</button></li>
                <li class="libg">贷款信息</li>
                <li><span>贷款金额：<b class="b1">20.0万</b></span><span>贷款期限：一年内</span><span class="rs">查看次数：<b class="b2">5人</b></span></li>
                <li><span>贷款类型：金融服务</span><span>发布日期：2017-3-5</span><span>截止日期：2017-3-20</span></li>
                <li class="posi"><span>审核状态：<b class="b2">已验证</b></span></li>
                <li>需求详情：贷款需求量应基于借款人日常生产经营所需营运资金与现有流动资金的差额确定。
                    一般来讲，影响流动资金需求的关键因素为存货应收账款和应付账款。同时，还会受到借款人所属行业、
                    经营规模、发展阶段、谈判地位等重要因素的影响。
                </li>
            </ul>
        </div>
        <div class="user_right">
            <div class="user_right_u">
                <div><img src="images/user-u.jpg" alt="请设置头像"></div>
                <div class="user_right_top">小鬼</div>
                <div class="user_right_center">个人简介：<span>早起的鸟儿有虫吃</span></div>
                <button>查看个人中心</button>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../common/bottom.jsp"></jsp:include>

</body>
</html>