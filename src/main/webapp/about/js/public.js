//xtt
//包含 头部菜单展开、hover展开效果；layer 弹出层
//头部菜单展开、hover展开效果
//ie兼容placeholder
var browserSupport = {
    placeholder: 'placeholder' in document.createElement('input')
}
$(function() {
    //模拟placeholder
    if( !browserSupport.placeholder){
        $('input[placeholder],textarea[placeholder]').each(function(){
            var that = $(this),
                text= that.attr('placeholder'),
                oldType;
            if(that.val()===""){
                that.val(text).addClass('placeholder');
            }
            that.focus(function(){
                //ie8下readonly依然可以上焦点的处理
                if(that.attr('readonly')){
                    that.blur();
                    return;
                }

                that.removeClass('placeholder');

                if(that.val()===text){
                    that.val("");
                }
            }).blur(function(){
                if(that.val()===""){
                    that.val(text).addClass('placeholder');
                    //防止异常情况：当有placeholder类，且值不为空（代码设置值时容易出现）
                }else{
                    that.removeClass('placeholder');
                }
            }).closest('form').submit(function(){
                if(that.val() === text){
                    that.val('');
                }
            });
        });
    }
});
//ie兼容placeholder end
var pathName = getRootPath();
$(function(){
    windowSize();
    $(".global-nav-sub").find(".global-box-sub").find("a:odd").css({"border":"none","padding-left":"30px"});

    $(".hoverClick").mouseenter(function(){
        $(this).addClass("active");
        $(this).find(".hoverOpen").stop(false,true).slideDown();
    });

    $("body").on('mouseenter','.hoverClick',function(){
        $(this).addClass("active");
        $(this).find(".hoverOpen").stop(false,true).slideDown();
    });

    $(".hoverClick").mouseleave(function(){
        $(this).removeClass("active");
        $(this).find(".hoverOpen").stop(false,true).slideUp();
    });

    $("body").on('mouseleave','.hoverClick',function(){
        $(this).removeClass("active");
        $(this).find(".hoverOpen").stop(false,true).slideUp();
    });

    $(".hoverClose").children().click(function(){
        var txt=$(this).text();
        $(this).parent().stop(false,true).slideUp();
        $(this).parent().prev('a').text(txt);
    });
    $(".navPull").mouseenter(function(){
        $(this).find(".navPulldown").stop(false,true).fadeIn();
    });
    $(".navPull").mouseleave(function(){
        $(this).find(".navPulldown").stop(false,true).fadeOut();
    });
    $(".navPullsub").mouseenter(function(){
        $(this).children('a').addClass("active");
        $(this).children(".navPullBox").stop(false,true).fadeIn();
    });
    $(".navPullsub").mouseleave(function(){
        $(this).children('a').removeClass("active");
        $(this).children(".navPullBox").stop(false,true).fadeOut();
    });
    //登陆 注册 hover
    $(".LR_ul li input").click(function(){
        $(this).addClass("hover");
        $(this).parent("li").siblings("li").find("input").removeClass("hover");
    });
    /*工商选择顶呱呱 gtc*/
    $(".module_way4").find("ul.accredit-pk-ul").addClass("icon-bus");
    $(".module_way4").find("ul.icon-bus").find("i.pk-num").append("<i></i>");
    $("ul.icon-bus").find("li:eq(1)").find(".pk-num i").addClass("icon1");
    $("ul.icon-bus").find("li:eq(2)").find(".pk-num i").addClass("icon2");
    $("ul.icon-bus").find("li:eq(3)").find(".pk-num i").addClass("icon3");
    $("ul.icon-bus").find("li:eq(4)").find(".pk-num i").addClass("icon4");
    $("ul.icon-bus").find("li:eq(5)").find(".pk-num i").addClass("icon5");
    /*顾问服务 地区筛选 gtc*/
    $(".area-box .area li>a:eq(0)").css("background","#fff");
    $(".area-box .area li").mouseenter(function(){
        $(this).addClass("active").nextAll("li").css({"border-bottom":"1px solid #dedede","top":"-1px"});
        $(this).find(".sub-area").stop(false,true).slideDown();
    });
    $(".area-box .area li").mouseleave(function(){
        $(this).removeClass("active").nextAll("li").css({"border-bottom":"none","top":"0"});
        $(this).find(".sub-area").stop(false,true).slideUp();
    });
    $(".area-box .sub-area span").click(function(){
        var $txt=$(this).html();
        $(this).parent(".sub-area").siblings("a").html($txt);
        $(this).parent(".sub-area").siblings("a").append("<i></i>");
        $(this).parents(".sub-area").stop(false,true).slideUp();
        $(this).parents("li").removeClass("active").nextAll("li").css({"border-bottom":"none","top":"0"});
    });
    //nav  下拉
    $('.nav-main li').hover(function(){
        $(this).find('.show-info').stop().slideDown();
    },function(){
        $(this).find('.show-info').stop().slideUp();
    });
    /*帮助中心*/
    /*.mouseenter
     .mouseleave
     .fadeIn
     .fadeOut
     */
    /*$(".about-ul li").mouseenter(function(){
     $(this).find(".sub_about").fadeIn();
     });
     $(".about-ul li").mouseleave(function(){
     $(this).find(".sub_about").fadeOut();
     });*/
    //菜单二级下拉
    $(".icbc-service-ul li").mouseenter(function(){
        $(this).addClass("active");
        $(this).siblings("li").removeClass("active");
        $(this).addClass("open");
        $(this).siblings("li").removeClass("open");
    });
    $('.navHover>a').mouseenter(function(){
        $(this).parent().find('.hoverBox').stop(false, true).slideDown();
        $(this).addClass('open');
    });
    $('.navHover').mouseleave(function(){
        $(this).children('.hoverBox').stop(false, true).slideUp();
        $(this).children().removeClass('open');
    });
    $('.navHover1>a').mouseenter(function(){
        $(this).parent().find('.hoverBox1').show();
        $(this).addClass('open');
    });
    $('.navHover1').mouseleave(function(){
        $(this).children('.hoverBox1').hide();
        $(this).children().removeClass('open');
    });
    //8大优势
    $(".eight-Strength").find(".btn-show").click(function(){
        $(this).siblings(".list-show").stop().slideUp(1000);
        $(this).siblings(".list-hide").stop().slideDown(1200);
        $(this).siblings(".btn-hide").stop().slideDown(1000);
        $(this).stop().slideUp(800);
    });
    $(".eight-Strength").find(".btn-hide").click(function(){
        $(this).siblings(".list-hide").stop().slideUp(800);
        $(this).siblings(".list-show").stop().slideDown(800);
        $(this).siblings(".btn-show").stop().slideDown(800);
        $(this).stop().slideUp(600);
        var scrollt = $(this).data("scroll");
        $("body,html").animate({scrollTop:($(scrollt)).offset().top},800);
    });
    //新2级下拉
    /*$(".global-nav-box").slide({
     titCell:".nav-box-hd li",
     mainCell:".nav-box-bd ul",
     titOnClassName:"active",
     trigger:"mouseover",
     autoPage:"false",
     defaultPlay:"true"
     });*/
    //底部
    fixTop();
    $('.hoverEvent').mouseenter(function(){
        var w=$(this).find('.fix-open').children().width();
        $(this).find('.fix-open').animate({width:w},300);
        $(this).addClass('open');
    });
    $('.hoverEvent').mouseleave(function(){
        $(this).find('.fix-open').stop(true,false).animate({width:'0'},300);
        $(this).removeClass('open');
    });
    //缓动锚点跳转
    /*$(".goto").click(function(){
     var scrollt = $(this).data("scroll");
     $("body,html").animate({scrollTop:($(scrollt)).offset().top},800);
     });*/

    //商家中心
    var curWwwPath=window.document.location.href;
    $("#adviser_head>ul>li").each(function () {
        var $href = $(this).find("a").attr("href");
        if($href.indexOf("account_info.htm")>0){ //账户中心
            if(curWwwPath.indexOf("account_info.htm")>0 || curWwwPath.indexOf("account_manage.htm")>0 || curWwwPath.indexOf("update_pwd.htm")>0){
                $(this).addClass("active");
            }
        }

        if($href.indexOf("goods_list.htm")>0){ //服务管理
            if(curWwwPath.indexOf("goods_list.htm")>0 || curWwwPath.indexOf("toadd_goods.htm")>0 || curWwwPath.indexOf("add_goods.htm")>0){
                $(this).addClass("active");
            }
        }
        if($href.indexOf("order_list.htm")>0){ //订单管理
            if(curWwwPath.indexOf("order_list.htm")>0 || curWwwPath.indexOf("apply_list.htm")>0){
                $(this).addClass("active");
            }
        }
    });

});
//xtt
//layer 弹出层
//样式  标题栏为蓝色
function bluepop(tit,id){
    setsize();
    var wi=$(id).width()+'px';
    var index=layer.open({
        title:[tit,"background:#014b92;color:#fff;font-size:16px;"],
        type:1,
        area:'wi',
        content: $(id),
        skin: 'layui-layer-rim'
    });
    $('.layui-layer-setwin .layui-layer-close1').addClass('mydefine');
    $(".myclose").on("click",function(){
        layer.close(index);
    });
}
//样式  标题栏为白色 关闭按钮靠右飘出
function whitepop(tit,id){
    setsize();
    var wi=$(id).width()+'px';
    var index=layer.open({
        title:[tit,"background:#fff;color:#555;font-size:16px;line-height:50px;height:50px;"],
        type:1,
        area:'wi',
        content: $(id)
    });
    $('.layui-layer-setwin .layui-layer-close1').addClass('mydefine1');
    $(".myclose").on("click",function(){
        layer.close(index);
    });
}
//样式  标题栏为白色
function purepop(tit,id){
    setsize();
    var wi=$(id).width()+'px';
    var index=layer.open({
        title:[tit,"background:#fff;color:#555;font-size:16px;line-height:50px;height:50px;margin:0 20px; padding:0;"],
        type:1,
        area:'wi',
        move: false,
        scrollbar: false,
        content: $(id)
    });
    $(".myclose").on("click",function(){
        layer.close(index);
    });
}
window.onresize=function(){
    setsize();
    windowSize();
};
//设置弹出层最大高度
function setsize(){
    var minH=$(window).height()-75;
    $('.pop').css("maxHeight",minH);
}

//底部
$(window).scroll(function(){
//  scrotop();
    scrotopnew();
});
var len=$('.fix-box li').length*65;
var newHei=$('.fix-new').height();//新浮动 在线咨询模块高度
var win=$(window).height();
var middle=(win-len)/2;
var newmiddle=(win-newHei)/2;//新浮动 在线咨询模块定位高度 top值
var lastScrollTop =0;
function fixTop(){
    $('.fix-box').css("top",middle);
    $('.fix-new').css("top",newmiddle);
}
function scrotop(){
    var scroTop=$(window).scrollTop();
//                alert(scroTop)
    middle=middle+scroTop-lastScrollTop;
//                $('.fix-box').animate({top:middle},500);
    $('.fix-box').stop().animate({top:middle},500);
    //setTimeout(alert(11),3000)
    lastScrollTop=scroTop;
}
function scrotopnew(){//新浮动 在线咨询滚动方法
    var scroTop=$(window).scrollTop();
    newmiddle=newmiddle+scroTop-lastScrollTop;
    $('.fix-new').stop().animate({top:newmiddle},500);
    lastScrollTop=scroTop;
}
function canles(){
    $('html,body').animate({scrollTop:0},300);
}
//法律头部hover
$(function(){
    $(".law-menuHover").mouseenter(function(){
        $(this).addClass("active").find(".law-menuOpen").stop().show()
    });
    $(".law-menuHover").mouseleave(function(){
        $(this).removeClass("active").find(".law-menuOpen").stop().hide()
    });
});
//公用登录
var index;
var htm='<div class="popLogin popopBig">'

    +'<div class="popup-main"><div class="popup-form">'
    +'<ul>'
    +'<li><span>账&nbsp;&nbsp;号：</span><label class="placeholder"><input type="text" name="userinfoName" id="userinfoName" placeholder="请输入注册时的手机号或账号登录"></label></li>'
    +'<li><span>登录密码：</span><label class="placeholder"><input type="password" name="userinfoPassword" id="userinfoPassword" placeholder="请填写登录密码"></label></li>'
    +'</ul>'
    +'<div class="register-box pt"><button type="button" class="register-btn" id="lastBtn_userInfo">登录</button></div>'
    +'<div class="forget-pwd">'
    +'<a href="javascript:;" onclick="whitepops(\'注册账号\',regHtm)" class="register-a">注册新账号</a>'
    +'<a href="'+pathName+'/find_pwd_1.htm">忘记密码？</a>'
    +'</div></div>'
    +'<div class="login-href">'
    +'<div class="popup-logo"><img src="'+pathName+'/images/dgg_logo1.png"></div>'
    +'<p>暂无帐号？使用手机号动态登录吧！</p>'
    +'<a href="javascript:;" onclick="whitepops(\'手机动态登录\',phoneHtm)">手机动态登录</a>'
    +'</div></div></div>';
var phoneHtm='<div class="phoneLogin popopBig">'
    +'<div class="popup-main"><div class="popup-form"><ul>'
    +'<li><span>手机号：</span><label class="placeholder"><input type="text" name="userinfoMobile" id="userinfoMobile" placeholder="请输入手机号码"></label></li>'
    +'<li><span>验证码：</span><div class="form-right" id="sendCodes"><label class="placeholder"><input type="text" name="userinfoCode" id="userinfoCode" placeholder="请输入短信验证码"></label><a href="javascript:;" id="userCode">获取验证码</a></div></li>'
    +'</ul>'
    +'<div class="register-box pt"><button type="button" class="register-btn" id="btnLogin">登录</button></div>'
    +'<div class="forget-pwd"><a href="javascript:;" onclick="whitepops(\'注册账号\',regHtm)" class="register-a">注册新账号</a></div>'
    +'</div>'
    +'<div class="login-href">'
    +'<div class="popup-logo"><img src="'+pathName+'/images/dgg_logo1.png"></div>'
    +'<p>已注册账号？马上登录吧！</p>'
    +'<a href="javascript:;" onclick="whitepops(\'账号登录\',htm)">账号登录</a>'
    +'</div></div></div>';
var regHtm='<div class="popRegister popopBig"><div class="popup-main"><div class="popup-form">'
    +'<ul>'
    +'<li><span>手机号：</span><label class="placeholder"><input type="text" name="userinfoMobile" id="userinfoMobile" placeholder="请输入手机号码"></label></li>'
    +'<li><span>验证码：</span><div class="form-right" id="sendCodes"><label class="placeholder"><input type="text" name="userinfoCode" id="userinfoCode" placeholder="请输入短信验证码"></label><a href="javascript:;" id="userCode">获取验证码</a></div></li>'
    +'<li><span>登录密码：</span><label class="placeholder"><input type="password" name="userinfoPasswords" id="userinfoPasswords" placeholder="请输入6位数以上的数字字母组合"></label></li>'
    +'<li><span>重复密码：</span><label class="placeholder"><input type="password" name="comparisonPassword" id="comparisonPassword" placeholder="请输入6位数以上的数字字母组合"></label></li>'
    +'<li class="check-agree"><label><input type="checkbox" id="checkread" value="1" checked>我已阅读并同意<a href="'+pathName+'/register-agreement.jsp" target="_blank">《小顶网注册协议》</a></label></li>'
    +'</ul>'
    +'<div class="register-box"><button type="button" class="register-btn" id="btnRegister">注册</button></div>'
    +'</div>'
    +'<div class="login-href">'
    +'<div class="popup-logo"><img src="'+pathName+'/images/dgg_logo1.png"></div>'
    +'<p>暂无帐号？使用手机号动态登录吧！</p>'
    +'<a href="javascript:;" onclick="whitepops(\'手机动态登录\',phoneHtm)">手机动态登录</a>'
    +'</div></div></div>';
var $count=0;
var currentId;
function whitepops(tit,htm){
    $count = 120;
    clearInterval(currentId);
    setsize();
    layer.close(index);
    var idx=layer.open({
        title:[tit,"background:#fff;color:#555;font-size:16px;line-height:50px;height:50px;"],
        type:1,
        area:['890px'],
        content: htm,
        tipsMore: false
    });
    index = idx;
    $('.layui-layer-setwin .layui-layer-close1').addClass('mydefine1');
    $(".myclose").on("click",function(){
        layer.close(idx);
    });
}
//js获取项目根路径，如： http://localhost:8083/uimcardprj
function getRootPath(){
    //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
    var curWwwPath=window.document.location.href;
    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
    var pathName=window.document.location.pathname;
    var pos=curWwwPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8083
    var localhostPaht=curWwwPath.substring(0,pos);
    //获取带"/"的项目名，如：/uimcardprj
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    return(localhostPaht);
}
function windowSize(){
    var wid=$(window).width();
    if(wid<1366) {
        $('.fix-box').addClass('right0');
    }
    else{
        $('.fix-box').removeClass('right0');
    }
}

//格式化数字
$(function(){
    $(".numberFormat").each(function(){
        var attentionNum = $(this).text();
        if(attentionNum > 10000){
            $(this).text((attentionNum/10000).toFixed(2)+"万");
        }else if(attentionNum > 100000){
            $(this).text((attentionNum/100000).toFixed(2)+"亿");
        }
    });
});
