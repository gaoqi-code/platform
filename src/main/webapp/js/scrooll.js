//tab选项卡
$('#menu li').click(function(){
	$(this).css('background','#006ebd');
	$(this).siblings().css('background','none');
})