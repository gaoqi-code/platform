<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>企巴巴-一站式商业服务平台</title>
    <link rel="stylesheet" type="text/css" href="css/base.css">
    <link rel="stylesheet" href="./plugins/layui/css/layui.css"  media="all">
    <script type="text/javascript" src="js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="js/jquery.kinMaxShow-1.1.min.js"></script>
    <style>
        .search-select li{margin: 15px;border-bottom: 1px solid #eee;padding-bottom: 20px;}
        .search-select h3{width:100px;height: 30px;line-height: 30px;display:block;float: left;}
        .selectSpan span{float: left;display: inline-block;min-width: 60px;height: 30px;line-height:30px;text-align: center;margin-right: 10px;}
        .adviser-list-info span{font-size:22px;margin-right: 20px;}
        .adviser-list-info p{line-height: 35px;height: 35px;}
        .adviser-list-href a{border: 2px solid #ee4134;padding: 10px 30px;color:#ee4134;}

        .need_mainli tr{height:80px;}
        .layui-table[lay-skin=line] td, .layui-table[lay-skin=line] th{border-bottom:1px dashed #e2e2e2;}
        .adviser_right_tj img{width:90px;}
        .adviser_right_tjperson p{height:30px;line-height: 30px;}
        .adviser_right_tj_personwork p{height:30px;line-height: 30px;padding-left:10px;}
        .head-update-img img{width: 100%;border: 0 none;vertical-align: middle;max-width: 100%;}
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
            font-size: 24px;
            font-weight: bold;
        }
        .head-update-middle .sub-til {
            color: white;
            font-size: 12px;
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
            width: 208px;
            height: 38px;
            border-radius: 2px;
            color: white;
            text-align: center;
            line-height: 38px;
            margin-bottom: 20px;
        }
        .head-update-middle ul li b {
            color: #999;
            font-size: 12px;
        }
        .needTitle{font-size: 24px;font-weight: normal;}
        .n_redit{background-color: green;color: #FFF;font-size: 14px;padding: 3px;}
.linkCss li{height:40px;line-height: 40px;}
        .needAtri{background-color:#e2e2e2;padding: 10px;}
.needAtri span{width: 33%;float: left;height: 30px;line-height: 30px;display:inline-block;}
        /*文本框样式调整*/
        .layui-input-block{width:225px;margin-left:auto;margin-right: auto;}
        .layui-form-item .layui-input-inline{width:225px;margin-left:5px;}
    </style>
    <script type="text/javascript">
        $(function(){
            $("#kinMaxShow").kinMaxShow({height:200});
        });

    </script>
</head>
<body>
<jsp:include page="common/top.jsp"></jsp:include>

<div id="container">
    <div class="position2">
        您当前位置：<a href="/index.htm">企巴巴</a> &gt;
        <a href="/tmbrandsearch/index.htm">找需求</a> &gt;
        <a href="javascript:void(0);">需求详情</a>
    </div>


    <div class="content">
        <div>
            <div class="needTitle">需求标题需求标题需求标题&nbsp;&nbsp;<span class="n_redit">已核实</span></div>
            <div class="titleNav">贷款详情：</div>
            <div class="needAtri">
                <span>贷款类型：有房车贷</span><span>贷款金额：100万</span><span>贷款期限：30年</span><span>贷款类型：有房车贷</span><span>贷款金额：100万</span><span>贷款期限：30年</span>
                <span>贷款类型：有房车贷</span><span>贷款金额：100万</span><span>贷款期限：30年</span>
                <div class="clear"></div>
            </div>
            <div class="needAtri" style="border-top:1px solid #fff;">
                <span>发布时间：2017-03-16</span><span>截止时间：2017-03-19</span>
                <div class="clear"></div>
            </div>
            <div class="needAtri" style="border-top:1px solid #fff;">
                <span>查看次数：<i style="color: red;font-size: 16px;">9</i>次</span>
                <div class="clear"></div>
            </div>
            <div class="titleNav">联系方式：</div>
            <div class="linkCss">
                <ul>
                    <li>联系人：王***</li>
                    <li>联系电话：王***</li>
                    <li>所在地区：北京市昌平区龙家堡</li>
                </ul>
            </div>
        </div>

    </div>
</div>

<jsp:include page="common/bottom.jsp"></jsp:include>


<script src="./plugins/layui/layui.js" charset="utf-8"></script>
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
        form.on('submit(demo1)', function(data){
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });


    });
</script>
</body>
</html>