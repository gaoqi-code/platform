/**
 * Created by Administrator on 2016/3/7.
 */
/*
$(function(){
	$(".rigFlotItem").show();
    var $win_h=$(window).height()/2;
    var $h=$(".fixedbox").height()/2;
    $(".rigFlotItem").css("margin-top",-$h);
    $(".t-doyoo-two .close").click(function(){
        $(this).parents(".t-doyoo-two").fadeOut();
    });
	window.setTimeout(
		function(){
			if($('#zx_div_tk').is(":hidden")){
				$(".t-doyoo-two").show();
			}
		},10000
	);
});
*/

function col(id){
    $('#'+id).hide();
    $("#"+id+" .zx_phone").val("");
    $("#"+id+" #boda").show();
	$("#"+id+" #jietong").hide();
}

function show(){
	$('#zx_div_tk').show();
	$('#t-doyoo-two').hide();
}

function callphone(id){
	var tel=/^(1[3-8])\d{9}$/;
	var phone = $("#"+id+" .zx_phone").val();
	if(!tel.test(phone)){
		$("#"+id+" .zx_phone").val("");
		$("#"+id+" .zx_phone").attr("placeholder","请输入正确的手机号！");
	}else{
		$.get("/call_adviser.htm",{
				customerTel:phone
			},function(data){
				if(data.error == 0){
					layer.alert("稍后你将接到我们的电话，该通话对你完全免费，请放心接听");
					$("#"+id+" #boda").hide();
					$("#"+id+" #jietong").show();
				}else{
					layer.alert(data.msg);
				}
		},'json');
	}
}

//让弹出的窗口垂直
function openlive800(){
	DGGkefu.open();
}
