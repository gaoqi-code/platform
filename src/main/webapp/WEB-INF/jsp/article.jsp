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
        .selectSpan span{float: left;display: inline-block;min-width: 60px;height: 30px;line-height:30px;text-align: center;margin-right: 10px;}
        .adviser-list-info span{font-size:22px;margin-right: 20px;}
        .adviser-list-info p{line-height: 35px;height: 35px;}
        .adviser-list-href a{border: 2px solid #ee4134;padding: 10px 30px;color:#ee4134;}

        .need_mainli{margin-top: 10px;}
        .need_mainli tr{height:80px;}
        .layui-table[lay-skin=line] td, .layui-table[lay-skin=line] th{border-bottom:1px dashed #e2e2e2;}
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

        .article_left{width: 932px;margin-right:5px;float: left;    border: 1px solid #d7d7d7;}
        .adviser_right{width:240px; text-align: center; float: left;background: url("images/order-adviser.jpg") no-repeat;}
        .order-form{border:1px solid #eee;border-top:0px;text-align: center;margin-top: 105px;}
        /*文本框样式调整*/
        .layui-input-block{width:225px;margin-left:auto;margin-right: auto;}
        .layui-form-item .layui-input-inline{width:225px;margin-left:5px;}

        /*** 资讯页面样式***/
        .title{height: 90px;width: 98%;
            border-bottom: 1px dashed #d7d7d7;margin-left: auto;;margin-right: auto;
            text-align: center;}
        .title-h2{line-height: 65px;
            font-size: 22px;
            font-weight: bold;
            color: #3c3c3c;}
        .article_content{width: 97%;margin: 0px auto;}

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
        <a href="/tmbrandsearch/index.htm">找需求</a>
    </div>


    <div class="content">

        <div class="article_left">
            <div class="title">
                <h2 class="title-h2">网购商品七日无理由退货今施行&nbsp;这些要注意</h2>
                <span class="time">2017-03-16 13:57:18  浏览量：66</span>
            </div>
            <div class="article_content">
                <p style="margin-top:10px;margin-bottom:10px;text-indent:32px;line-height:30px;background:white"><span style=";color:#333333">近年来，网购已成为了大众购物消费的主要途径之一。网购无法看到商品的实物，到手后难免有不称心如意的时候。虽然已有</span><span style="font-family:'Arial','sans-serif';color:#333333">“7</span><span style=";color:#333333">天无理由退货</span><span style="font-family:'Arial','sans-serif';color:#333333">”</span><span style=";color:#333333">的规定，但退货过程中商家和消费者之间总会存在不少矛盾和争议。</span><span style="font-family:'Arial','sans-serif';color:#333333">3</span><span style=";color:#333333">月</span><span style="font-family:'Arial','sans-serif';color:#333333">15</span><span style=";color:#333333">日，国家实施的《网络购买商品七日无理由退货暂行办法》（以下简称</span><span style="font-family:'Arial','sans-serif';color:#333333">“</span><span style=";color:#333333">《暂行办法》</span><span style="font-family:'Arial','sans-serif';color:#333333">”</span><span style=";color:#333333">）对这些争议问题做出了明确规定，这将进一步保障消费者权利，同时也让商家吃下</span><span style="font-family:'Arial','sans-serif';color:#333333">“</span><span style=";color:#333333">定心丸</span><span style="font-family:'Arial','sans-serif';color:#333333">”</span><span style=";color:#333333">。</span></p>
                <p style="margin-top: 10px; margin-bottom: 10px; text-indent: 32px; line-height: 30px; text-align: center; background: white;"><span style=";color:#333333"><img alt="" src="http://img1.99114.com/group1/M00/8E/01/wKgGTFjKJvmAJCpAAABZl8cXV5A756.jpg"></span></p>
                <p style="margin: 0 0 0;text-indent: 32px;line-height: 30px;font-stretch: normal;word-wrap: break-word;orphans: 2;widows: 2;float: left;overflow: hidden;background: white"><strong><span style="font-family:宋体;color:#333333">七类商品不适用七日无理由退货</span></strong></p>
                <p style="margin: 10px 0;text-indent: 32px;line-height: 30px;font-stretch: normal;word-wrap: break-word;orphans: 2;widows: 2;float: left;overflow: hidden;background: white"><span style="font-family:'Arial','sans-serif';color:#333333">“</span><span style=";color:#333333">有些客人把货物买回去了，拆开包装品尝后说不是想象中的味道，一定要我们退款，不退款就给差评，这样让我们很为难。</span><span style="font-family:'Arial','sans-serif';color:#333333">”</span><span style=";color:#333333">从事食品生意的网店店主黄小姐告诉笔者，自从网购平台要求推行</span><span style="font-family:'Arial','sans-serif';color:#333333">“</span><span style=";color:#333333">七日内无理由退货</span><span style="font-family:'Arial','sans-serif';color:#333333">”</span><span style=";color:#333333">制度后，很多客人就会钻这个空当，现在网购退换货新规终于出台，这对商家的利益也提供了不少保障。</span></p>
                <p style="margin: 10px 0;text-indent: 32px;line-height: 30px;font-stretch: normal;word-wrap: break-word;orphans: 2;widows: 2;float: left;overflow: hidden;background: white"><span style=";color:#333333">据了解，</span><span style="font-family:'Arial','sans-serif';color:#333333">2014</span><span style=";color:#333333">年实施的《新消法》首次提出了</span><span style="font-family:'Arial','sans-serif';color:#333333">“</span><span style=";color:#333333">网购七天无理由退货</span><span style="font-family:'Arial','sans-serif';color:#333333">”</span><span style=";color:#333333">的规定。三年时间过去了，这个规定也暴露出来一些新的问题。尽管当初已有消费者在订购鲜活易腐的商品，在线下载或者消费者拆封的音像制品、计算机软件等数字化商品，以及交付的报纸、期刊等四类商品不适用七日无理由退货，但消费者和商家间的矛盾还是存在。</span></p>
                <p style="margin: 10px 0px; text-indent: 32px; line-height: 30px; font-stretch: normal; word-wrap: break-word; orphans: 2; widows: 2; float: left; overflow: hidden; text-align: center; background: white;"><span style="color: rgb(51, 51, 51);"><img alt="" src="http://img1.99114.com/group1/M00/8E/04/wKgGTFjKKB-AIWBNAACMtP0QfuE846.jpg"></span></p>
                <p style="margin: 10px 0;text-indent: 32px;line-height: 30px;font-stretch: normal;word-wrap: break-word;orphans: 2;widows: 2;float: left;overflow: hidden;background: white"><span style=";color:#333333">据了解，</span><span style="font-family:'Arial','sans-serif';color:#333333">2014</span><span style=";color:#333333">年实施的《新消法》首次提出了</span><span style="font-family:'Arial','sans-serif';color:#333333">“</span><span style=";color:#333333">网购七天无理由退货</span><span style="font-family:'Arial','sans-serif';color:#333333">”</span><span style=";color:#333333">的规定。三年时间过去了，这个规定也暴露出来一些新的问题。尽管当初已有消费者在订购鲜活易腐的商品，在线下载或者消费者拆封的音像制品、计算机软件等数字化商品，以及交付的报纸、期刊等四类商品不适用七日无理由退货，但消费者和商家间的矛盾还是存在。</span></p>
                <p style="margin: 10px 0;text-indent: 32px;line-height: 30px;font-stretch: normal;word-wrap: break-word;orphans: 2;widows: 2;float: left;overflow: hidden;background: white"><span style=";color:#333333">据了解，</span><span style="font-family:'Arial','sans-serif';color:#333333">2014</span><span style=";color:#333333">年实施的《新消法》首次提出了</span><span style="font-family:'Arial','sans-serif';color:#333333">“</span><span style=";color:#333333">网购七天无理由退货</span><span style="font-family:'Arial','sans-serif';color:#333333">”</span><span style=";color:#333333">的规定。三年时间过去了，这个规定也暴露出来一些新的问题。尽管当初已有消费者在订购鲜活易腐的商品，在线下载或者消费者拆封的音像制品、计算机软件等数字化商品，以及交付的报纸、期刊等四类商品不适用七日无理由退货，但消费者和商家间的矛盾还是存在。</span></p>
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