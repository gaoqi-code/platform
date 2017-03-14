<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>企巴巴-一站式商业服务平台</title>
    <link rel="stylesheet" type="text/css" href="css/base.css">
    <link rel="stylesheet" href="./plugins/layui/css/layui.css"  media="all">
    <link rel="stylesheet" type="text/css" href="css/adviser_tui.css">
    <script type="text/javascript" src="js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="js/jquery.kinMaxShow-1.1.min.js"></script>
    <style>
        .counselor-head-update{width: 100%;min-width: 1180px;height: 330px;			background: url(./images/head-bg.jpg) no-repeat center center;}
        .position2{    width: 1180px;
            padding: 14px 0 10px;
            margin: auto;
            background: url(../images/position.png) no-repeat left center;
            text-indent: 18px;
            font-size: 12px;}
        .head-update-box{position: relative;
            padding-top: 50px;
            overflow: hidden;}
        .head-update-left{float: left;
            width: 194px;}
        .head-update-left{width: 180px;
            height: 180px;			border-radius: 50%;			border: 7px solid rgba(255,255,255,.2);			overflow: hidden;}
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
            width: 580px;
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
        .head-update-right {
            float: right;
            margin-top: 40px;
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
        <a href="/tmadviser/list.htm">找顾问</a>
        &gt;李婷婷个人主页
    </div>
    <div class="counselor-head-update">
        <div class="content head-update-box">
            <div class="head-update-left">
                <div class="head-update-img">

                    <img src="http://o6yahvsqr.bkt.clouddn.com/detail/20160812184829965595.jpg?crop/140x140">


                </div>
                <div class="head-update-ewm">
                    <i></i>
                    <p>扫一扫 手机访问</p>
                    <div class="ewm">
                        <div id="codeAdviser"></div>
                        <i></i>
                    </div>
                </div>
            </div>
            <div class="head-update-middle">
                <div class="til">
                    <span class="c-name">李婷婷</span>
                    <i class="size25 icon7"></i>
                    <span class="c-post">金牌顾问</span>
                </div>
                <div class="sub-til">
                    <span>北京中讯担宝</span>
                </div>
                <div class="sub-til">
                    <span>在线咨询：<a href="javascript:void(0);"><img src="images/qq/qq.gif" /></a></span>
                </div>
                <div class="sub-til">
                    <span>联系电话：15600183076</span>
                </div>
                <div class="sub-til">
                    <span>主营业务：公司注册、会计理财</span>
                </div>
                <div class="sub-til">
                    <span>所在地区：北京市昌平区永旺大楼321</span>
                </div>
            </div>

            <div class="head-update-right">
                <p class="tel-num"><i></i>13540250791</p>
                <a href="javascript:void(0)" class="btn-free" onclick="freephone('http://o6yahvsqr.bkt.clouddn.com/detail/20160812184829965595.jpg','117','李婷婷')">免费电话</a>
                <a href="javascript:openlive800()" class="btn-online">在线咨询</a>
            </div>

        </div>
        <div class="clear"></div>

    </div>

    <div class="content contentTop">

        <div class="adviser_left">
            <div class="layui-collapse" lay-accordion="">
                <div class="layui-colla-item">
                    <h2 class="layui-colla-title">个人简介</h2>
                    <div class="layui-colla-content layui-show">
                        <p>在前端技术快速变革的今天，layui 仍然坚持语义化的组织模式，甚至于模块理念都是采用类AMD组织形式，并非是有意与时代背道而驰。layui 认为以jQuery为核心的开发方式还没有到完全消亡的时候，而早期市面上基于jQuery的UI都普通做得差强人意，所以需要有一个新的UI去重新为这一领域注入活力，并采用一些更科学的架构方式。
                            <br>
                            因此准确地说，layui 更多是面向那些追求开发简单的前端工程师们，以及所有层次的服务端程序员。</p>
                    </div>
                </div>
                <div class="layui-colla-item">
                    <h2 class="layui-colla-title">提供的服务</h2>
                    <div class="layui-colla-content  layui-show">
                        <p>有不少其他答案说是因为JS太差。我下面的答案已经说了，这不是根本性的原因。但除此之外，我还要纠正一些对JS具体问题的误解。JS当初是被作为脚本语言设计的，所以某些问题并不是JS设计得差或者是JS设计者的失误。比如var的作用域问题，并不是“错误”，而是当时绝大部分脚本语言都是这样的，如perl/php/sh等。模块的问题也是，脚本语言几乎都没有模块/命名空间功能。弱类型、for-in之类的问题也是，只不过现在用那些老的脚本语言的人比较少，所以很多人都误以为是JS才有的坑。另外有人说JS是半残语言，满足不了开发需求，1999年就该死。半残这个嘛，就夸张了。JS虽然有很多问题，但是设计总体还是优秀的。——来自知乎@贺师俊</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="adviser_right">
            <div class="liuyan">
                <form class="layui-form order-form" action="">
                    <div class="layui-form-item">

                        <div class="layui-input-inline">
                            <select name="quiz1">
                                <option value="">请选择省</option>
                                <option value="浙江" selected="">企业服务</option>
                                <option value="你的工号">金融服务</option>
                                <option value="你最喜欢的老师">法律顾问</option>
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