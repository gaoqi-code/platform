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