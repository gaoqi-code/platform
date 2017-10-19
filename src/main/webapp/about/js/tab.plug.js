/*
 * tab 切换
 * Author:xtt
 * 2017.03.06
 */
;(function(){
	//alert(0)
	var Tabs = function(ele,opt){
		this.$element=ele,
			defaults = {
				outBox:'',//最外层div类名
				tabTitle:'',//操作tab层
				content:'',//切换tab外出
				checkStyle:'active',//tab选中样式类名
				eve:'click'//触发事件,只有click与hover这两个参数
			},
			this.options=$.extend({}, defaults,opt)
	};
	Tabs.prototype = {
		start:function(){
			var outBox=$(this.$element).selector,
				content=this.options.content,
				tabTitle=this.options.tabTitle,
				eve=this.options.eve,
				checkStyle=this.options.checkStyle;
			$(this.$element).each(function(){
				var i=0;
				var ishas=$(this).children(tabTitle).children().hasClass(checkStyle);
				$(this).children(tabTitle).children().each(function(){
					if(ishas) {
						if($(this).hasClass(checkStyle)==true) {
							$(this).parent().parent(outBox).find(content).children().hide();
							$(this).parent().parent(outBox).find(content).children().eq(i).show();
						}
					}else{
						$(this).parent().children().eq(0).addClass(checkStyle);
						$(this).parent().parent(outBox).find(content).children().hide();
						$(this).parent().parent(outBox).find(content).children().eq(0).show();
					}
					$(this).attr('data-num',i);
					i++;
				});
			});
//			$(this.$element).on(eve,$(tabTitle).children(),function(){
//				var opt_num=$(this).attr('data-num');
//				console.log($(this).text());
//				$(this).find(content).children().hide();
//				$(this).find(content).children().eq(opt_num).show();
//				$(this).children().children().removeClass(checkStyle);
//				$(this).addClass(checkStyle);
//			})
			if(eve=="hover") {
				$(this.$element).children(tabTitle).children().hover(function(){
					var opt_num=$(this).attr('data-num');
					$(this).parent().parent(outBox).children(content).children().hide();
					$(this).parent().parent(outBox).children(content).children().eq(opt_num).show();
					$(this).parent().children().removeClass(checkStyle);
					$(this).addClass(checkStyle);
				});
			}
			else if(eve=="click") {
				$(this.$element).children(tabTitle).children().click(function(){
					var opt_num=$(this).attr('data-num');
					$(this).parent().parent(outBox).children(content).children().hide();
					$(this).parent().parent(outBox).children(content).children().eq(opt_num).show();
					$(this).parent().children().removeClass(checkStyle);
					$(this).addClass(checkStyle);
				});
			}
		}
	};
	$.fn.myTab = function(options) {
		var tabs = new Tabs(this,options);
		return tabs.start();
	}
})();