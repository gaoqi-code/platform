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
                <li><span>姓名：${need.member.name}</span><span>所在地区：${need.areaFullName}-${need.member.address}</span><button>查看联系方式</button></li>
                <li class="libg">贷款信息</li>
                <li>
                    <c:forEach items="${need.attributes}" var="attribute" >
                        <span>${attribute.name}：<b class="b1">${attribute.value}</b></span>
                    </c:forEach>
                </li>
                <li><span>贷款金额：<b class="b1">20.0万</b></span><span>贷款期限：一年内</span><span class="rs">查看次数：<b class="b2">${need.hits != null ? need.hits : 0}人</b></span></li>
                <li>
                    <span>贷款类型：金融服务</span>
                    <span>发布日期：<fmt:formatDate value="${need.updateTime != null ? need.updateTime:need.addTime}"   pattern="yyyy-MM-dd" type="date" dateStyle="long" /></span>
                    <span>截止日期：<fmt:formatDate value="${need.endTime}"   pattern="yyyy-MM-dd" type="date" dateStyle="long" /></span>
                </li>
                <li class="posi"><span>审核状态：<b class="b2">已验证</b></span></li>
                <li>需求详情：${need.content}
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

    <div class="center_bg"></div>

    <div class="content">
        <div class="tab_left">
            <h1>需求推荐</h1>
            <ul>
                <li>需求名称</li>
                <li>类型</li>
                <li>联系人</li>
                <li>联系电话</li>
                <li>地区</li>
                <li>发布日期</li>
            </ul>
            <ul>
                <li>下午茶服务</li>
                <li>员工福利</li>
                <li>小鬼</li>
                <li>1301111****</li>
                <li>北京市-北京</li>
                <li>2014-4-17</li>
            </ul>
            <ul>
                <li>下午茶服务</li>
                <li>员工福利</li>
                <li>小鬼</li>
                <li>1301111****</li>
                <li>北京市-北京</li>
                <li>2014-4-17</li>
            </ul>
            <ul>
                <li>下午茶服务</li>
                <li>员工福利</li>
                <li>小鬼</li>
                <li>1301111****</li>
                <li>北京市-北京</li>
                <li>2014-4-17</li>
            </ul>
            <ul>
                <li>下午茶服务</li>
                <li>员工福利</li>
                <li>小鬼</li>
                <li>1301111****</li>
                <li>北京市-北京</li>
                <li>2014-4-17</li>
            </ul>
            <ul>
                <li>下午茶服务</li>
                <li>员工福利</li>
                <li>小鬼</li>
                <li>1301111****</li>
                <li>北京市-北京</li>
                <li>2014-4-17</li>
            </ul>
            <ul>
                <li>下午茶服务</li>
                <li>员工福利</li>
                <li>小鬼</li>
                <li>1301111****</li>
                <li>北京市-北京</li>
                <li>2014-4-17</li>
            </ul>
            <ul>
                <li>下午茶服务</li>
                <li>员工福利</li>
                <li>小鬼</li>
                <li>1301111****</li>
                <li>北京市-北京</li>
                <li>2014-4-17</li>
            </ul>
            <ul>
                <li>下午茶服务</li>
                <li>员工福利</li>
                <li>小鬼</li>
                <li>1301111****</li>
                <li>北京市-北京</li>
                <li>2014-4-17</li>
            </ul>
            <ul>
                <li>下午茶服务</li>
                <li>员工福利</li>
                <li>小鬼</li>
                <li>1301111****</li>
                <li>北京市-北京</li>
                <li>2014-4-17</li>
            </ul>
            <ul>
                <li>下午茶服务</li>
                <li>员工福利</li>
                <li>小鬼</li>
                <li>1301111****</li>
                <li>北京市-北京</li>
                <li>2014-4-17</li>
            </ul>
            <ul>
                <li>下午茶服务</li>
                <li>员工福利</li>
                <li>小鬼</li>
                <li>1301111****</li>
                <li>北京市-北京</li>
                <li>2014-4-17</li>
            </ul>
            <ul>
                <li>下午茶服务</li>
                <li>员工福利</li>
                <li>小鬼</li>
                <li>1301111****</li>
                <li>北京市-北京</li>
                <li>2014-4-17</li>
            </ul>
        </div><!--tab_left-->
        <div class="tab_right">
            <div class="img1"><img src="/images/guwentuijian.jpg" alt=""><hr><p>顾问推荐</p><hr></div>
            <div class="tab_right_list">
                <div class="img2"><img src="images/man.jpg"></div>
                <div class="text">
                    <p>王如瑾</p>
                    <p>普通顾问</p>
                    <p></p>
                    <p>七年职业经验</p>
                    <p><a href="#">进入主页</a>&nbsp;<a href="#">QQ留言</a></p>
                </div>
            </div>
            <div class="tab_right_list">
                <div class="img2"><img src="images/woman.jpg"></div>
                <div class="text">
                    <p>李亚蓉</p>
                    <p>普通顾问</p>
                    <p></p>
                    <p>七年职业经验</p>
                    <p><a href="#">进入主页</a>&nbsp;<a href="#">QQ留言</a></p>
                </div>
            </div>
            <div class="tab_right_list">
                <div class="img2"><img src="images/woman.jpg"></div>
                <div class="text">
                    <p>李亚蓉</p>
                    <p>普通顾问</p>
                    <p></p>
                    <p>七年职业经验</p>
                    <p><a href="#">进入主页</a>&nbsp;<a href="#">QQ留言</a></p>
                </div>
            </div>
        </div><!--tab_right-->
    </div>

</div>

<jsp:include page="../common/bottom.jsp"></jsp:include>

</body>
</html>