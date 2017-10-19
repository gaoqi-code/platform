//2016.12.15 add 解决ie10下免费电话placeHolder属性不支持的问题
$(function () {
	//ie兼容placeholder
	var  browserSupport  =  {
		placeholder:  'placeholder'  in  document.createElement('input')
	}
});
function  placehodlers(){
	//模拟placeholder
	if(  !browserSupport.placeholder){
		$('input[placeholder],textarea[placeholder]').each(function(){
			var  that  =  $(this),
				text=  that.attr('placeholder'),
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
				if(that.val()  ===  text){
					that.val('');
				}
			});
		});
	}
}
/*免费电话【咨询顾问】*/
function freephone(url,id,name){
	if(url == "http://7xrgpz.com2.z0.glb.clouddn.com/"){
		url = "../images/portrait.jpg";
	}
	layer.open({
		type: 1,
		title: ['免费电话咨询', 'background:#fff;color:#525252;'],
		skin: 'layui-layer-rim',
		area: ['520px', '410px'],
		content: '<div class="tankbox" id="tankBox2" >'
				+'<div class="free" ><div class="f_pic"><img src="'+url+'" alt="" style="margin:auto;display:block;"/></div>'
				+'<h3>'+name+'</h3><table class="jt_kf"><tr>'
				+'<th>输入您的电话号码：</th><td><input class="zx_phone" type="text" placeholder="请输入电话号码"/></td>'
				+'</tr><tr><th></th><td><input onclick="hb('+id+')" type="submit" value="开始免费电话咨询"/></td>'
				+'</tr></table></div></div>'
		});
	placehodlers();
}
			
function hb(guwen) {
	var tel = /^(1[3-8])\d{9}$/;
	var phone = $("#id-mobile2").val();
	if (!tel.test(phone)) {
		$("#id-mobile2").val("");
	/*	$("#tankBox2 .zx_phone").attr("placeholder","请输入正确的手机号码");*/
		layer.tips('请输入正确的手机号码', '#id-mobile2', {tips: [1, '#78BA32']});
	} else {
		$.get("/call_adviser.htm",{
				customerTel:phone,
				adviserId:guwen
			},function(data){
				if(data.error == 0){
					layer.closeAll();
                    layer.alert("稍后你将接到顾问的电话，该通话对你完全免费，请放心接听。")
				}
		},'json');
	}
}