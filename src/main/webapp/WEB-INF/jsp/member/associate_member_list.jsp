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
            <p class="layui-elem-quote">关联企业</p>
            <div class="layui-form-item">
                <label class="layui-form-label">企业名称</label>
                <div class="layui-input-block">
                    <input style="width: 150px;display: inline;position: relative;top: 2px;" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入企业名称" class="layui-input">
                    <button class="layui-btn">搜索</button>
                </div>
            </div>

            <div class="layui-form">
                <table class="layui-table" lay-skin="line">
                    <colgroup>
                        <col></colgroup>
                        <col width="150">
                        <col width="100">
                    <thead>
                    <tr>
                        <th>公司名称</th>
                        <th>所在地区</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>贤心</td>
                        <td>汉族</td>
                        <td><a href="javascript:void(0);"><button class="layui-btn layui-btn-small">申请加入</button></a></td>
                    </tr>
                    <tr>
                        <td>张爱玲</td>
                        <td>汉族</td>
                        <td><a href="javascript:void(0);"><button class="layui-btn layui-btn-small">申请加入</button></a></td>
                    </tr>
                    <tr>
                        <td>Helen Keller</td>
                        <td>拉丁美裔</td>
                        <td><a href="javascript:void(0);"><button class="layui-btn layui-btn-small">申请加入</button></a></td>
                    </tr>
                    <tr>
                        <td>岳飞</td>
                        <td>汉族</td>
                        <td><a href="javascript:void(0);"><button class="layui-btn layui-btn-small">申请加入</button></a></td>
                    </tr>
                    <tr>
                        <td>孟子</td>
                        <td>华夏族（汉族）</td>
                        <td><a href="javascript:void(0);"><button class="layui-btn layui-btn-small">申请加入</button></a></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <br />
            <table class="layui-table" lay-skin="line">
                <tr>
                    <th>公司名称</th>
                    <th>所在地区</th>
                    <th>操作</th>
                </tr>
                <tr>
                    <td colspan="3" style="text-align: center;">没有找到该企业，<a class="ta1" href="member/company_add.html">添加企业</a></td>
                </tr>
            </table>
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
