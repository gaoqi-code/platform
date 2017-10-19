<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String basePath = request.getScheme() + "://"
        + request.getServerName();
%>
<div class="list">
    <ul>
        <li><p>店铺管理</p><p>store&nbsp;managemengt</p></li>
        <li>
            <a href="/member/product/toAdd/0.html">店铺设置</a>
        </li>
        <li>
            <a href="/member/store.html">产品管理</a>
        </li>
        <li>
            <a href="#">成功案例</a>
        </li>
        <li>
            <a href="/member/company/list.html">关联企业</a>
        </li>
        <p class="p1">好业务，让企巴巴帮你推广</p>
    </ul>
</div>
<script type="text/javascript">
    $(function () {
        $.ajax({
            type: "get",
            url: "/article/list.json",
            success: function(data){
                var articles = data.articles;
                if(articles) {
                    var content = '';
                    articles.forEach(function (item, index) {
                        content += '<li><a href="/article/detail/'+item.id+'.html">'+item.title+'</a></li>';
                    });
                    $("#notice").html(content);
                }
            }
        });
        var inviteCode = "${sessionScope.currentUser.inviteCode}";
        $("#getInviteUrl").click(function(){
//            var inviteUrl = $("#qbbPath").val()+"/register/reg/"+inviteCode+".html";
            var inviteUrl = "<%=basePath%>"+"/register/reg/"+inviteCode+".html";
            layer.open({
                 type: 0
                ,title: "邀请链接"
                ,area: ['500px', '185px']
                ,shade: 0.4
                ,content: "<div style='font-size: 18px;text-align: center;'>推荐朋友注册，获得查看商机次数<div id='inviteUrl' style='font-size: 18px;margin-top: 5px;' class='ts'>"+inviteUrl+"</div></div>"
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