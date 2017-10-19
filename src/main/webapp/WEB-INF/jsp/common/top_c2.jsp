<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<div class="content">
    <div class="logo-box">
        <a href="index.html"><img src="/images/logo_h.png"></a>
    </div>
    <div class="box_list">
        <ul>
            <li>
                <a href="/member/index.html">首页</a>丨</li>
            <li>
                <a href="/member/index.html">${currentUser.mobile}</a>丨</li>
            <li>
                <a href="">消息</a>丨</li>
            <li>
                <a href="">服务中心</a>丨</li>
            <li>
                <a href="/logout.html">退出</a>
            </li>
        </ul>
    </div>
    <!--box_list-->
    <div class="clear"></div>
</div>

<div class="xian">
    <div class="content">
        <ul id="meau">
            <li class="${index}">
                <a href="/member/index.html">首页</a>
            </li>
            <li class="${management}">
                <a href="/member/toManagement.html">推广管理</a>
            </li>
            <li class="${store}">
                <a href="/member/product/toAdd/0.html">我的店铺</a>
            </li>
            <li class="${personaldata}">
                <a href="/member/toPersonalData.html">我的资料</a>
            </li>
            <li class="${cooperation}">
                <a href="/member/toCooperation.html">企巴巴同业合作</a>
            </li>
            <div class="clear"></div>
        </ul>
    </div>
</div>