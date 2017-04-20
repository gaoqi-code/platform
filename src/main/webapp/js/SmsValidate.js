$(function () {
    /**
     * 发送短信验证码
     */
    function sendSmsCode() {
        $.ajax({
            type: "POST",
            url: "/validate/sendSmsCode.json",
            data: {
                mobile:$("#mobile").val(),
                imgCode:$("#yzmValue").val(),
                verifyType:$("#verifyType").val()
            },
            dataType: "json",
            success: function (data) {
                if (!data.flag) {
                    layer.msg(data.msg);
                    countdown = 0;
                }
            }
        });
    }
    //倒计时
    var smsClick = true;
    var time=60;//倒计时的秒数
    var countdown = time;
    function setTime($obj) {
        if(countdown == time) {
            $obj.attr("disabled", true);
            sendSmsCode();
        }
        if (countdown == 0) {
            $obj.attr("disabled", false);
            $obj.html("获取验证码");
            smsClick = true;
            countdown = time;
            return;
        } else {
            $obj.html("重新发送(" + countdown + ")");
            countdown--;
        }
        setTimeout(function() {
            setTime($obj);
        },1000)
    }
    $("#sendSms").click(function () {
        if(!smsClick) {
            return;
        }
        var mobile = $("#mobile").val();
        if(!mobile){
            layer.msg("电话号码不能为空");
            return;
        }
        if(!(/^1[34578]\d{9}$/.test(mobile))){
            layer.msg("手机号码有误，请重填");
            return false;
        }
        var code = $("#yzmValue").val();
        if(!code) {
            layer.msg("请先填写验证码!");
            return;
        }
        smsClick = false;
        setTime($(this));
    });

    /**
     *获得图片验证码
     */
    getImgCode();
    function getImgCode() {
        $.ajax({
            type: "POST",
            url: "/validate/sendImgCode.json",
            data: {verifyType:$("#verifyType").val()},
            dataType: "json",
            success: function (data) {
                if (data && data.success) {
                    $("#yzm").attr("src", "/"+data.codePath);
                }
            }
        });
    }

    $("#yzm").click(function () {
        getImgCode();
    });

});