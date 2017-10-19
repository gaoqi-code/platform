<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <script src="./js/jquery-1.9.1.js" charset="utf-8"></script>
</head>
<body>
<div class="nav">
    <div class="content">
        <ul>
            <li class="nav-li1">
                <a href="javascript:void(0);">全部服务分类</a>
                <div class="nav-l2-container">
                    <div class="nav-l2c">
                        <div class="nav-t2">金融服务</div>
                        <div class="nav-c2">
                            <span>房屋贷款</span><span>汽车贷款</span><span>快速贷款</span><span>小额贷款</span><span>小额贷款</span><span>小额贷款</span><span>小额贷款</span><span>小额贷款</span><span>小额贷款</span><span>小额贷款</span>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <div class="nav-l2c">
                        <div class="nav-t2">法律顾问</div>
                        <div class="nav-c2">
                            <span>房屋贷款</span><span>汽车贷款</span><span>快速贷款</span><span>小额贷款</span><span>找贷款</span>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <div class="nav-l2c">
                        <div class="nav-t2">企业办证</div>
                        <div class="nav-c2">
                            <span>房屋贷款</span><span>汽车贷款</span><span>快速贷款</span><span>小额贷款</span>
                            <div class="clear"></div>
                        </div>
                    </div>
                </div>
            </li>
            <li class="nav-li">
                <a href="need/list.html;">找需求</a>
            </li>
            <li class="nav-li">
                <a href="adviser/list.html">找顾问</a>
            </li>
            <li class="nav-li">
                <a href="product/list.html">找服务</a>
            </li>
            <li class="nav-li">
                <a href="introduce.html">关于企巴巴</a>
            </li>
            <li class="nav-li">
                <a href="javascript:void(0);">商家入驻</a>
            </li>
            <li class="clear"></li>
        </ul>
    </div>
</div>
<script>
    $(function () {

        $(".nav-li1").mouseover(function () {
            $(".nav-l2-container").css("display","block");
        });
        $(".nav-l2-container").mouseout(function () {
            $(".nav-l2-container").css("display","none");
        });
    });
</script>
</body>
</html>