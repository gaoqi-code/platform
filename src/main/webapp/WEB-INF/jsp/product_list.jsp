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
        .search-select{border:1px solid #eee;}
        .search-select li{margin: 15px;border-bottom: 1px solid #eee;padding-bottom: 20px;}
        .search-select h3{width:100px;height: 30px;line-height: 30px;display:block;float: left;}
        .allSelect{background-color:#ee4134;color: #FFF;display:block;}
        .selectSpan span{float: left;display: inline-block;min-width: 60px;height: 30px;line-height:30px;text-align: center;margin-right: 10px;}
        .adviser_mainli li{height: 195px;border-bottom: 1px solid #eee;}
        .li-img{width: 165px;height: 165px;border-radius: 50%;border: 7px solid rgba(255,255,255,.2);overflow: hidden;float: left;}
        .li-img img{width: 165px;}
        .adviser-list-info{height: 165px;float: left;width: 600px;}
        .adviser-list-content{margin-top:30px;margin-left: 30px;}
        .adviser-list-info span{font-size:22px;margin-right: 20px;}
        .adviser-list-info p{line-height: 35px;height: 35px;}
        .adviser-list-href{height: 165px;line-height:165px;float: left}
        .adviser-list-href a{border: 2px solid #ee4134;padding: 10px 30px;color:#ee4134;}
        .position2{width: 1180px;padding: 14px 0 10px;margin: auto;background: url(../images/position.png) no-repeat left center;text-indent: 18px;font-size: 12px;}

        .adviser_right_tj{width:90px;height:90px;border-radius: 50%;border: 7px solid rgba(255,255,255,.2);overflow: hidden;float: left;}
        .adviser_right_tj img{width:90px;}
        .adviser_right_tjperson{float:left;height: 90px;line-height: 90px;}
        .adviser_right_tjperson p{height:30px;line-height: 30px;}
        .adviser_right_tj_personwork{text-align: left;border-bottom: 1px solid #eee;margin-bottom: 20px;}
        .adviser_right_tj_personwork p{height:30px;line-height: 30px;padding-left:10px;}
        .adviser_tj_title{height: 35px;line-height: 35px;}
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

        .adviser_left{width: 935px;margin-right:5px;float: left;}
        .adviser_right{width:240px; text-align: center; float: left;background: url("images/order-adviser.jpg") no-repeat;}
        .order-form{border:1px solid #eee;border-top:0px;text-align: center;margin-top: 105px;}
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
        <a href="/tmbrandsearch/index.htm">找产品</a>
    </div>


    <div class="content">

        <div class="adviser_left">

            <div class="search-select">
                <ul>
                    <li>
                        <h3>业务类别：</h3>
                        <div class="selectSpan">
                            <span><a class="allSelect" href="javascript:void(0);">全部</a></span><span><a href="javascript:void(0);">工商注册</a></span><span><a href="javascript:void(0);">金融服务</a></span><span><a href="javascript:void(0);">法律顾问</a></span>
                        </div>
                        <div class="clear"></div>
                    </li>
                    <li style="border: 0px;">
                        <h3>服务区域：</h3>
                        <div class="selectSpan">
                            <span><a class="allSelect" href="javascript:void(0);">全部</a></span><span><a href="javascript:void(0);">上海</a></span><span><a href="javascript:void(0);">北京</a></span><span><a href="javascript:void(0);">天津</a></span>
                        </div>
                        <div class="clear"></div>
                    </li>
                </ul>
            </div>

            <div class="adviser_mainli">
                <ul>
                    <li>
                        <div class="li-img"><img src="http://www.dgg.net/images/portrait.jpg"></div>
                        <div class="adviser-list-info">
                            <div class="adviser-list-content">
                                <p>产品名称-工商注册</p>
                                <p>产品类型</p>
                                <p><span>张三</span>贷款顾问 <img src="images/qq/qq.gif"></p>
                                <p>个人简介：审计、验资、财税咨询</p>
                            </div>
                        </div>
                        <div class="adviser-list-href"><a href="product/1.html">查看详情</a></div>
                        <div class="clear"></div>
                    </li>
                    <li>
                        <div class="li-img"><img src="http://www.dgg.net/images/portrait.jpg"></div>
                        <div class="adviser-list-info">
                            <div class="adviser-list-content">
                                <p>产品名称-贷款20万元</p>
                                <p>产品类型</p>
                                <p><span>张三</span>贷款顾问 <img src="images/qq/qq.gif"></p>
                                <p>个人简介：审计、验资、财税咨询</p>
                            </div>
                        </div>
                        <div class="adviser-list-href"><a href="javascript:void(0);">查看详情</a></div>
                        <div class="clear"></div>
                    </li>
                    <li>
                        <div class="li-img"><img src="http://www.dgg.net/images/portrait.jpg"></div>
                        <div class="adviser-list-info">
                            <div class="adviser-list-content">
                                <p>北京中汛担保有限公司&nbsp;金牌顾问&nbsp;执行7年</p>
                                <p>产品类型</p>
                                <p><span>张三</span>贷款顾问 <img src="images/qq/qq.gif"></p>
                                <p>擅长领域：审计、验资、财税咨询</p>
                            </div>
                        </div>
                        <div class="adviser-list-href"><a href="javascript:void(0);">查看详情</a></div>
                        <div class="clear"></div>
                    </li>
                </ul>

            </div>

        </div>
        <div class="adviser_right">
            <div class="liuyan">
                <form class="layui-form order-form" action="">
                    <div class="layui-form-item">

                        <div class="layui-input-inline">
                            <select name="quiz1">
                                <option value="">请选择省</option>
                                <option value="浙江" selected="">浙江省浙江省浙江省浙江省</option>
                                <option value="你的工号">江西省</option>
                                <option value="你最喜欢的老师">福建省</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <div class="layui-input-block">
                            <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit="" style="width: 100%;" lay-filter="demo1">立即提交</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="adviser_tj">
                <div class="adviser_tj_title">顾问推荐</div>
                <div class="adviser_tj_li">
                    <div>
                        <div class="adviser_right_tj"><img src="http://www.dgg.net/images/portrait.jpg"></div>
                        <div class="adviser_right_tjperson">
                            <div style="margin-top: 15px;">
                                <p>金牌顾问</p><p>张三<img src="images/qq/qq.gif"></p>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <div class="adviser_right_tj_personwork">
                            <p><span>执业经验：</span>8年</p>
                            <p><span>主营业务：</span>8年</p>
                            <p><span>个人简介：</span>8年</p>
                            <p><span>所在地区：</span>北京市昌平区</p>
                        </div>
                    </div>
                </div>
                <div class="adviser_tj_li">
                    <div>
                        <div class="adviser_right_tj"><img src="http://www.dgg.net/images/portrait.jpg"></div>
                        <div class="adviser_right_tjperson">
                            <div style="margin-top: 15px;">
                                <p>金牌顾问</p><p>张三<img src="images/qq/qq.gif"></p>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <div class="adviser_right_tj_personwork">
                            <p><span>执业经验：</span>8年</p>
                            <p><span>主营业务：</span>8年</p>
                            <p><span>个人简介：</span>8年</p>
                            <p><span>所在地区：</span>北京市昌平区</p>
                        </div>
                    </div>
                </div>
                <div class="adviser_tj_li">
                    <div>
                        <div class="adviser_right_tj"><img src="http://www.dgg.net/images/portrait.jpg"></div>
                        <div class="adviser_right_tjperson">
                            <div style="margin-top: 15px;">
                                <p>金牌顾问</p><p>张三<img src="images/qq/qq.gif"></p>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <div class="adviser_right_tj_personwork">
                            <p><span>执业经验：</span>8年</p>
                            <p><span>主营业务：</span>8年</p>
                            <p><span>个人简介：</span>8年</p>
                            <p><span>所在地区：</span>北京市昌平区</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="clear"></div>
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