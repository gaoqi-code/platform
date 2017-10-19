//ie兼容placeholder
var browserSupport = {
    placeholder: 'placeholder' in document.createElement('input')
}
/*var url = getRootPath();*/
$(function () {
    //模拟placeholder
    if (!browserSupport.placeholder) {
        $('input[placeholder],textarea[placeholder]').each(function () {
            var that = $(this),
                text = that.attr('placeholder'),
                oldType;
            if (that.val() === "") {
                that.val(text).addClass('placeholder');
            }
            that.focus(function () {
                //ie8下readonly依然可以上焦点的处理
                if (that.attr('readonly')) {
                    that.blur();
                    return;
                }

                that.removeClass('placeholder');

                if (that.val() === text) {
                    that.val("");
                }
            }).blur(function () {
                if (that.val() === "") {
                    that.val(text).addClass('placeholder');
                    //防止异常情况：当有placeholder类，且值不为空（代码设置值时容易出现）
                } else {
                    that.removeClass('placeholder');
                }
            }).closest('form').submit(function () {
                if (that.val() === text) {
                    that.val('');
                }
            });
        });
    }
    //搜索
    $("#queryType,#query_type").submit(function (e) {
        e.preventDefault;
        var $type = $(this).attr("id");
        var $id;
        var $var;
        if ($type == "queryType") {
            $id = $(this).find("ul").find("li[class='active']").attr("id");
            $var = $(this).find("input").val();
        } else {
            $id = $(this).find("select").val();
            $var = $(this).find("input[class='fix-search-input']").val();
        }

        var $urls = window.location.href;
        if ($id == 1) {
            if ($urls.indexOf("/search.htm") > 0) {
                window.location.href = url + "/service/search.htm?key=" + $var;
            } else {
                window.open(url + "/service/search.htm?key=" + $var);
            }
            return false;
        } else if ($id == 2) {
            window.open(url + "/icsite/company/search.htm?type=&keyword=" + $var);
            return false;
        } else if ($id == 3) {
            // $(this).attr("action",url+"/brand/query_brand.htm");
            window.open(url + "/tmbrandsearch/search.htm?type=&searchType=&city=&keyword=" + $var);
            return false;
        } else if ($id == 4) {
            window.open(url + "/adviser/list_v1.htm?viserName=" + $var);
            return false;
        }
    });
});
//ie兼容placeholder end
// head-nav fixed
$(window).scroll(function () {
    fixed_nav();
});
$(function () {
    fixed_nav();
    //关闭小火箭
    $('.close-rocket').click(function () {
        $(this).parent().hide();
    });
    $(".search-form-tab").find("li").click(function () {
        $(".search-form-tab li").removeClass("active");
        $(this).addClass("active");
    });
});
// head-nav fixed
var $top;
if ($('.nav-main-box').length != 0) {
    $top = $('.nav-main-box').offset().top;
}
function fixed_nav() {
    var scrollTop = $(document).scrollTop();
    if (scrollTop > $top) {
        $('.fix-nav').show();
    } else {
        $('.fix-nav').hide();
    }
}
// head-nav fixed end
//hover展开效果
$(function () {
    $(".hoverClick").mouseenter(function () {
        $(this).addClass("active");
        $(this).find(".hoverOpen").stop(false, true).slideDown();
    });

    $("body").on('mouseenter', '.hoverClick', function () {
        $(this).addClass("active");
        $(this).find(".hoverOpen").stop(false, true).slideDown();
    });

    $(".hoverClick").mouseleave(function () {
        $(this).removeClass("active");
        $(this).find(".hoverOpen").stop(false, true).slideUp();
    });

    $("body").on('mouseleave', '.hoverClick', function () {
        $(this).removeClass("active");
        $(this).find(".hoverOpen").stop(false, true).slideUp();
    });
    //子站下拉菜单
    $('.navHover>a').mouseenter(function () {
        $(this).parent().find('.hoverBox').stop(false, true).slideDown();
        $(this).addClass('open');
    });
    $('.navHover').mouseleave(function () {
        $(this).children('.hoverBox').stop(false, true).slideUp();
        $(this).children().removeClass('open');
    });
    //法律头部hover
    $(".law-menuHover").mouseenter(function () {
        $(this).addClass("active").find(".law-menuOpen").stop().show()
    });
    $(".law-menuHover").mouseleave(function () {
        $(this).removeClass("active").find(".law-menuOpen").stop().hide()
    });
});
//layer  标题栏为白色
function purepop(tit, id) {
    var name = $("#name").val("");
    var contacts = $("#contacts").val("");
    var mobile = $("#mobile").val("");
    var area = $("#area").val("");
    var address = $("#address").val("");
    var statutoryName = $("#statutoryName").val("");
    var createTime = $("#createTime").val("");
    var business = $("#business").val("");

    //清除地区
    $(".clearfix dd a").attr("class", "");
    $(".title span").remove();
    $("#area").attr("placeholder", "选择省/市/区");
    $(".title").text("");
    $(".placeholder").show();

    setsize();
    var wi = $(id).width() + 'px';
    var index = layer.open({
        title: [tit, "background:#fff;color:#555;font-size:16px;line-height:50px;height:50px;margin:0 20px; padding:0;"],
        type: 1,
        area: 'wi',
        move: false,
        scrollbar: false,
        content: $(id)
    });
    $(".myclose").on("click", function () {
        layer.close(index);
    });
}
//返回顶部
function gotop() {
    $('html,body').animate({scrollTop: 0}, 800);
}
//子业态公用头部导航 start -yjc-2016.12.9
$(".sub-pull-nav").mouseenter(function () {
    $(this).find(".mouse-in-display").stop(true, true).slideDown();
});
$(".sub-pull-nav").mouseleave(function () {
    $(this).find(".mouse-in-display").stop(true, true).slideUp();
    $(this).find(".inside-type").stop().fadeOut("slow");
});
$(".sub-pull-first>li:last-child .inside-tit>dd").css({"borderBottom": "0"});
$(".sub-pull-first>li").mouseenter(function () {
    if ($(this).find(".inside-type").length != 0) {
        $(this).prev("li").find(".inside-tit>dd").css({"borderBottomColor": "#fff"});
        $(this).addClass("hover");
        $(this).find(".inside-type").stop(true, true).fadeIn(300);
        var insideTyep = $(this).find(".inside-type").height() + parseInt($(this).find(".inside-type").css("paddingBottom"));
        var insideTyepInner = $(this).find(".inside-type>ul").height();
        var subPullIndex = $(this).index();
        var subPullOffset = $(this).offset().top - $(".sub-pull-first").offset().top;
        var thisHeight = $(this).height();
        var finalNum = 174.5 - (subPullOffset + thisHeight / 2);
        var remainingHeight = 349 - (subPullOffset + thisHeight)
        var subPullLenght = $(".sub-pull-first>li").length;
        var subPullListsH = 349 - $(".sub-pull-first").height();
        if (insideTyep >= 349) {
            $(this).find(".inside-type>ul").css({"height": "240px"});
            $(this).find(".inside-type").css({"padding-bottom": "66px"});
            $(this).find(".inside-type>.more-btn").css({"display": "block"});
        }
        if (subPullIndex == 0) {
            $(this).find(".inside-type").css({"top": 0});
        } else if (subPullIndex == subPullLenght - 1 && insideTyep > (349 - subPullOffset)) {
            $(this).find(".inside-type").css({"bottom": -subPullListsH});
        } else {
            if (insideTyep / 2 - thisHeight / 2 > subPullOffset || insideTyep / 2 - thisHeight / 2 > remainingHeight) {
                $(this).find(".inside-type").css({"top": "50%", "marginTop": -insideTyep / 2 + finalNum});
            } else {
                $(this).find(".inside-type").css({"top": "50%", "marginTop": -insideTyep / 2});
            }
        }
    }
});
$(".sub-pull-first>li").mouseleave(function () {
    if ($(this).find(".inside-type").length != 0) {
        $(this).prev("li").find(".inside-tit>dd").css({"borderBottomColor": "#e5e5e5"});
        $(this).removeClass("hover");
        $(this).find(".inside-type").stop(true, true).fadeOut(300);
    }
});
function isInclude(name) {
    var js = /js$/i.test(name);
    var es = document.getElementsByTagName(js ? 'script' : 'link');
    for (var i = 0; i < es.length; i++)
        if (es[i][js ? 'src' : 'href'].indexOf(name) != -1)return true;
    return false;
}
//banner start
var insideBannerL = $(".sub-banner-inner .bd ul>li").length;
if (insideBannerL > 1) {
    $(".sub-banner-inner").slide({
        titCell: ".hd ul",
        mainCell: ".bd ul",
        trigger: "mouseover",
        autoPlay: true,
        autoPage: true,
        delayTime: 800,
        titOnClassName: "on",
        effect: "leftLoop"
    })
    $(".sub-banner-inner").mouseenter(function () {
        $(this).find(".sub-station-btn").fadeIn();
    })
    $(".sub-banner-inner").mouseleave(function () {
        $(this).find(".sub-station-btn").fadeOut();
    })
} else {
    $(".sub-banner-inner .hd ul").hide();
}
//banner end
//banner 浮框文字滚动
if ($(".appointment-box").length > 0) {
    $(".appointment-box").slide({
        mainCell: ".appointment-lists",
        autoPlay: true,
        effect: "topMarquee",
        interTime: 100,
        trigger: "click"
    });
}
if ($(".appointment-counsellor-box").length > 0) {
    $(".appointment-counsellor-box").slide({
        mainCell: "ul",
        trigger: "mouseover",
        autoPlay: true,
        autoPage: false,
        delayTime: 800,
        titOnClassName: "on",
        effect: "leftLoop"
    })
}

//子业态公用头部导航 end
//新顾问列表（4人-轮播）start
$('.counselor_man li').hover(function () {
    $(this).find('.unhidden_content').stop().animate({top: '0'});
    $(this).find('.counselor_hidden,.hidden_phone').stop().animate({top: '0'});
}, function () {
    $(this).find('.counselor_hidden').stop().animate({top: '-275px'});
    $(this).find('.hidden_phone').stop().animate({top: '75px'});
});
if ($(".counselor_man").length > 0 && $(".counselor_man .bd>ul>li").length > 4) {
    $(".counselor_man").slide({
        titCell: "#con_dot ul",
        mainCell: "#con_main ul",
        autoPage: true,
        effect: "left",
        autoPlay: true,
        vis: 4
    });
}
//新顾问列表（4人-轮播）end
//案例滚动start	
if ($(".business-consulting").length > 0) {
    if ($(".business-consulting").find(".consulting-right ul li").length > 4) {
        $(".business-consulting").slide({
            mainCell: ".consulting-right ul",
            autoPlay: true,
            effect: "topLoop",
            interTime: 1500,
            delayTime: 500,
            trigger: "hover",
            vis: "4"
        });
    }

}

//判断该城市是否有该站点，从而修改js样式

//1.定义获取cookie的方法
function getCookie(name) {
    var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
    if (arr = document.cookie.match(reg))
        return unescape(arr[2]);
    else
        return null;
}

function delCookie(name) {
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval = getCookie(name);
    if (cval != null)
        document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
}
//2.获取cookie
var isNoBusinessCity = getCookie("isNoBusinessCity");
// var businessCode = getCookie("businessCode");
// var areaName = getCookie("areaName");

//3.修改弹窗样式
if (isNoBusinessCity != null && isNoBusinessCity=="noBus") {
    // $.ajax({
    //     type: 'post',
    //     url: '/hava_business.htm',
    //     data: {"businessCode": businessCode, "areaName": areaName},
    //     dataType: "json",
    //     success: function (msg) {
    //         if (msg.bool == "true") {
    //             $(".city-pic-pop").css("display", 'block');
    //             $('.city-pic-pop-info').css('margin-top', '-199px');
    //             $("#getArea").text("您当前所在城市没有该服务，您可以选择以下城市");
    //         }
    //         delCookie("businessCode");
    //     }
    // });
    $(".city-pic-pop").css("display", 'block');
    $('.city-pic-pop-info').css('margin-top', '-199px');
    $("#getArea").text("您当前所在城市没有该服务，您可以选择以下城市");
}
delCookie("businessCode");
delCookie("isNoBusinessCity");