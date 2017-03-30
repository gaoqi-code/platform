<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<div class="top_out">
    <div class="content">
        <div class="top_logo"><a href="index.html">企巴巴</a></div>
        <div class="top_out_right">
            <div class="top_welcome"><span class="userName">${sessionScope.currentUser.name}</span>您好，欢迎来到企巴巴</div>
            <div class="top_welcome"><a href="logout.html">退出</a></div>
            <div class="top_tuiguang">网站导航</div>
        </div>
    </div>
</div>

<div class="bgwhite content" style="margin:10px auto;">
    <div class="t_search w1190 clearfix t_buy">
        <div class="t_search_t">
            <div class="t_search_text">会员管理中心
                <%--<span>V3.0</span>--%>
            </div>
            <%--<a href="javascript:javascript:void(0);" class="a_old">返回老版</a>--%>
        </div>
        <div class="t_search_s">
            <div class="search_select">
                <a href="javascript:void(0);" class="search_a"><span id="cret">需求</span><s class="layui-icon">&#xe61a;</s></a>
                <ul class="search_options" id="labObj">
                    <li class=""><a href="javaScript:$('#searchType').val(1);;">产品</a></li>
                    <li class="on"><a href="javaScript:$('#searchType').val(2);">需求</a></li>
                    <li class=""><a href="javaScript:$('#searchType').val(3);">顾问</a></li>
                </ul>
                <input type="hidden" id="searchType" value="2">
            </div>
            <div class="t_form">
                <input type="text" class="keywords inptText" placeholder="请输入您感兴趣的产品" id="keyword">
            </div>
            <div class="t_btn_div">
                <button class="search_btn" type="submit"  onclick="topSearch()">搜索</button>
                <%--<button class="search_btn" type="submit"  onclick="topSearch(2);">找需求</button>--%>
                <%--<button class="search_btn" type="submit"  hidefocus="" onclick="loadNavi.setIndex(0,0);">找顾问</button>--%>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $(".search_a").mouseover(function () {
            $("#labObj").css("display","block");
        });
        $("#labObj").mouseleave(function () {
            $("#labObj").css("display","none");
        });
        $("#labObj a").click(function () {
            $("#cret").html($(this).html());
            $("#labObj").css("display","none");
        });
    });
    function topSearch(){
        var type = $("#searchType").val();
        var keyword = encodeURIComponent(encodeURIComponent($("#keyword").val()));
        if(type == 1) {
            location.href = "/product/toSearch.html?keyword="+keyword;
        }
        if(type == 2) {
            location.href = "/need/toSearch.html?keyword="+keyword;
        }
        if(type == 3) {
            location.href = "/adviser/toSearch.html?keyword="+keyword;
        }
    }

</script>