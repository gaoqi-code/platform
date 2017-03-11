<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
    <title>企巴巴</title>
    <jsp:include page="../common/css.jsp"></jsp:include>
    <link rel="stylesheet" href="../css/buysell.css">
    <link rel="stylesheet" href="../plugins/layui/css/global.css">
    <style>
        .memver_c{margin-top: 15px;margin-bottom: 15px;}
        .c_left{width: 210px;float:left;}
        .member_menu{border: 1px solid #EEE;}
        .member_menu li{width: 100%;height:35px;line-height:35px;border-bottom: 1px solid #eee;}
        .member_menu li a{margin-left:20px;}
        .gonggao_title{margin: 15px 5px;}
        .gonggao{border: 1px solid #EEE;}
        .gonggao li{width: 100%;height:45px;line-height:45px;border-bottom: 1px solid #eee;}
        .gonggao li a{margin-left: 15px;}
        .c_right{margin-left:10px;width: 958px;float: left;}
    </style>
</head>
<body>
<jsp:include page="../common/top_c.jsp"></jsp:include>
<jsp:include page="../common/nav_c.jsp"></jsp:include>
<div id="container">
    <div class="content memver_c">
        <jsp:include page="../common/left_c.jsp"></jsp:include>

        <div class="c_right">
            <p class="layui-elem-quote">产品管理</p>
            <div class="layui-form">
                <table class="layui-table" lay-skin="line">
                    <colgroup>
                        <col width="150">
                        <col width="150">
                        <col width="200">
                        <col></colgroup>
                    <col width="150">
                    <thead>
                    <tr>
                        <th>图片</th>
                        <th>产品标题</th>
                        <th>类目</th>
                        <th>更新时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>贤心</td>
                        <td>汉族</td>
                        <td>1989-10-14</td>
                        <td>人生似修行</td>
                        <td><a href="javascript:void(0);">修改</a>&nbsp;
                            <a href="javascript:void(0);">下架</a>&nbsp;
                            <a href="javascript:void(0);">删除</a>
                        </td>
                    </tr>
                    <tr>
                        <td>张爱玲</td>
                        <td>汉族</td>
                        <td>1920-09-30</td>
                        <td>于千万人之中遇见你所遇见的人，于千万年之中，时间的无涯的荒野里…</td>
                        <td>
                            <a href="javascript:void(0);">修改</a>&nbsp;
                            <a href="javascript:void(0);">下架</a>&nbsp;
                            <a href="javascript:void(0);">删除</a>
                        </td>
                    </tr>
                    <tr>
                        <td>Helen Keller</td>
                        <td>拉丁美裔</td>
                        <td>1880-06-27</td>
                        <td> Life is either a daring adventure or nothing.</td>
                        <td><a href="javascript:void(0);">修改</a>&nbsp;<a href="javascript:void(0);">删除</a></td>
                    </tr>
                    <tr>
                        <td>岳飞</td>
                        <td>汉族</td>
                        <td>1103-北宋崇宁二年</td>
                        <td>教科书再滥改，也抹不去“民族英雄”的事实</td>
                        <td><a href="javascript:void(0);">修改</a>&nbsp;<a href="javascript:void(0);">删除</a></td>
                    </tr>
                    <tr>
                        <td>孟子</td>
                        <td>华夏族（汉族）</td>
                        <td>公元前-372年</td>
                        <td>猿强，则国强。国强，则猿更强！ </td>
                        <td><a href="javascript:void(0);">修改</a>&nbsp;<a href="javascript:void(0);">删除</a></td>
                    </tr>
                    </tbody>
                </table>
            </div>
<div id="productPager"></div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<script src="../plugins/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use(['laypage', 'layer'], function(){
        var laypage = layui.laypage
                ,layer = layui.layer;

        laypage({
            cont: 'productPager'
            ,pages: 100 //总页数
            ,groups: 5 //连续显示分页数
        });
    });
        </script>
</body>
</html>