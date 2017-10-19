$(function() {
	$(".nav-li1").mouseover(function() {
		$(".nav-l2-container").css("display", "block");
	});
	$(".nav-l2-container").mouseout(function() {
		if($("#nav").val() != "index") {
			$(".nav-l2-container").css("display", "none");
		}
	});

//	$("a[name='searchType']").click(function() {
//		$("a[name='searchType']").removeClass("selectType");
//		$(this).addClass("selectType");
//	});
//	$("#topSearch").click(function() {
//		var searchType = $(".selectType").attr("searchType");
//		var keyword = $("#keyword").val();
//		var url;
//		if(searchType == 1) {
//			url = "/product/toSearch.html?keyword=" + keyword;
//		}
//		if(searchType == 2) {
//			url = "/need/toSearch.html?keyword=" + keyword;
//		}
//		if(searchType == 3) {
//			url = "/adviser/toSearch.html?keyword=" + keyword;
//		}
//		location.href = url;
//	});
});