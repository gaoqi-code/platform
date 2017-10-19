<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String basePath = request.getScheme() + "://"
        + request.getServerName();
%>
<style>
    .layui-elem-quote2{
        margin-bottom: 10px;
        padding: 10px;
        line-height: 22px;
        border-left: 0px;
        border-radius: 0 2px 2px 0;
        background-color: #349DCD;font-size: 14px;color: #FFF;}
</style>
<div class="c_left">
    <div class="member_menu">
        <p class="layui-elem-quote2">我的信息</p>
        <ul>
            <li><a href="member/info.html">完善资料</a></li>
            <li><a href="javascript:void(0);" id="getInviteUrl">邀请链接</a></li>
        </ul>
        <p class="layui-elem-quote2">需求管理</p>
        <ul>
            <li><a href="member/need/toAdd/0.html">发布需求</a></li>
            <li><a href="member/need/list.html">需求列表</a></li>
        </ul>
        <p class="layui-elem-quote2">账户管理</p>
        <ul>
            <li><a href="member/account/toUpdatePW.html">修改密码</a></li>
        </ul>
        <c:if test="${sessionScope.currentUser.type==1}">
            <p class="layui-elem-quote2">店铺管理</p>
            <ul>
                <li><a href="/member/company/list.html">关联企业</a></li>
            </ul>
            <p class="layui-elem-quote2">产品管理</p>
            <ul>
                <li><a href="member/product/toAdd/0.html">发布产品</a></li>
                <li><a href="member/product/list.html">产品列表</a></li>
            </ul>
        </c:if>
    </div>
    <div class="kefu">
        <!--<div></div>-->
        <!--<div>-->
        <!--<div>-->
        <!--<p>企业客服</p>-->
        <!--<p>QQ</p>-->
        <!--<p>15600183076</p>-->
        <!--</div>-->
        <!--</div>-->
    </div>
    <%--<div class="gonggao_title">公告栏</div>--%>
    <%--<div class="gonggao">--%>

        <%--<ul id="notice">--%>
            <%--&lt;%&ndash;<li><a href="article.html">公告1111111111111</a></li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<li><a href="javascript:void(0);">公告1111111111111</a></li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<li><a href="javascript:void(0);">公告1111111111111</a></li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<li><a href="javascript:void(0);">公告1111111111111</a></li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<li><a href="javascript:void(0);">公告1111111111111</a></li>&ndash;%&gt;--%>
        <%--</ul>--%>
    <%--</div>--%>
</div>
<script type="text/javascript">
    $(function () {
//        $.ajax({
//            type: "get",
//            url: "/article/list.json",
//            success: function(data){
//                var articles = data.articles;
//                if(articles) {
//                    var content = '';
//                    articles.forEach(function (item, index) {
//                        content += '<li><a href="/article/detail/'+item.id+'.html">'+item.title+'</a></li>';
//                    });
//                    $("#notice").html(content);
//                }
//            }
//        });
        var inviteCode = "${sessionScope.currentUser.inviteCode}";
        $("#getInviteUrl").click(function(){
//            var inviteUrl = $("#qbbPath").val()+"/register/reg/"+inviteCode+".html";
            var inviteUrl = "<%=basePath%>"+"/register/reg/"+inviteCode+".html";
            layer.open({
                 type: 0
                ,title: "邀请链接"
                ,area: ['500px', '185px']
                ,shade: 0.4
                ,content: "<div style='font-size: 18px;text-align: center;'>推荐朋友注册，获得查看商机次数！<div id='inviteUrl' style='font-size: 18px;margin-top: 5px;' class='ts'>"+inviteUrl+"</div></div>"
                ,btn: ['好的'] //按钮
                ,scrollbar: false //屏蔽浏览器滚动条
                ,好的:function(index){
                    layer.close(index);
                }
            });
            selectText("inviteUrl");
            document.execCommand("Copy"); //执行浏览器复制命令
        });
        function selectText(element) {
            var text = document.getElementById(element);
            if (document.body.createTextRange) {
                var range = document.body.createTextRange();
                range.moveToElementText(text);
                range.select();
            } else if (window.getSelection) {
                var selection = window.getSelection();
                var range = document.createRange();
                range.selectNodeContents(text);
                selection.removeAllRanges();
                selection.addRange(range);
                /*if(selection.setBaseAndExtent){
                 selection.setBaseAndExtent(text, 0, text, 1);
                 }*/
            } else {
                alert("none");
            }
        }
    });
</script>