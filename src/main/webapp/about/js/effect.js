//Author:xtt

//tab 切换
;(function(){
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
//滚动
;(function(){
	var anchor=function(ele,opt) {
		this.$element=ele,
		defaults={
			//nav:'nav',//浮动菜单
			obj:'objBox',//目标盒子
			height:'100',//目标盒子距离窗口的高度
			check:'active',//当前菜单选中样式
			fix:'fix'

		}
		this.options=$.extend({},defaults,opt);
	};
	anchor.prototype = {
		start:function(){
			var nav=$(this.$element).selector,
				obj=this.options.obj,
				height=this.options.height,
				check=this.options.check;
			var $top=$(nav).offset().top;

			$(nav).find('li').click(function(){
				var $id=$(this).children('a').attr('href');
				var newTop=$($id).offset().top-height+10;
				$('body,html').animate({scrollTop: newTop},500);
			  });
			$(window).scroll(function(){
				scrolls(nav,obj,height,check,$top);
			});
			$(function(){
				scrolls(nav,obj,height,check,$top);
			});
		}
	};
	function scrolls(nav,obj,height,check,$top) {
		var scrollTop=$(document).scrollTop();
		if(scrollTop>$top){
			$(nav).addClass('fix');
		}else{
			$(nav).removeClass('fix');
		}
		$(obj).each(function(){
			var $id=$(this).attr("id");
			var objTop=$(this).offset().top-height;
			//console.log(objTop)
			if(scrollTop>objTop) {
				$('a[href=#'+$id+']').parents('ul').find('li').removeClass(check);
				$('a[href=#'+$id+']').parent('li').addClass(check);
			}
		});
	}
	$.fn.myAnchors = function(options) {
		var anchors=new anchor(this,options);
		return anchors.start();
	}
})();
