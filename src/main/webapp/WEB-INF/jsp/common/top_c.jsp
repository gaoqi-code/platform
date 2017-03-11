<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<div class="top_out">
    <div class="content">
        <div class="top_logo">企巴巴</div>
        <div class="top_out_right">
            <div class="top_welcome">您好，欢迎XXX来到企巴巴</div>
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
                <a href="javascript:void(0);" class="search_a"><span id="cret">供应</span><s class="icon-down"></s></a>
                <ul class="search_options" id="labObj"><li class="on"><a href="javaScript:loadNavi.setInexCreat(0)">供应</a></li><li class=""><a href="javaScript:loadNavi.setInexCreat(1)">求购</a></li><li class=""><a href="javaScript:loadNavi.setInexCreat(2)">公司</a></li><li class=""><a href="javaScript:loadNavi.setInexCreat(3)">招商</a></li></ul>
            </div>
            <div class="t_form">
                <input type="text" class="keywords inptText" placeholder="请输入您感兴趣的产品" id="txtKey">
            </div>
            <div class="t_btn_div">
                <button class="search_btn" type="submit" id="btnSearch" hidefocus="" onclick="loadNavi.setIndex(0,0);">找<span>供应</span></button>

                <button class="search_btn a" type="submit" id="unionSearch" hidefocus="" onclick="loadNavi.setIndex(0,1);">联盟搜</button>

            </div>
        </div>
    </div>
</div>