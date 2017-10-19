(function($)
{
	$.fn.maxlength = function(options)
	{
		var settings = jQuery.extend(
			{
				events:				      [], // Array of events to be triggerd
				maxCharacters:		  10, // Characters limit
				status:				      false, // True to show status indicator bewlow the element
				statusClass:		    "status", // The class on the status div
				statusText:			    null, // The status text
				notificationClass:	"notification",	// Will be added to the emement when maxlength is reached
				showAlert: 			    false, // True to show a regular alert message
				alertText:			    "You have typed too many characters.", // Text in the alert message
				slider:				      false // Use counter slider
			}, options );

		// Add the default event
		$.merge(settings.events, ['keyup']);

		return this.each(function()
		{
			var item = $(this);
			var charactersLength = $(this).val().length;

			// Update the status text
			function updateStatus()
			{
				if(null!=settings.statusText){
					var charactersLeft = settings.maxCharacters - charactersLength;

					if(charactersLeft < 0)
					{
						charactersLeft = 0;
					}
					item.next("div").html("é™"+settings.maxCharacters+"å­—ä»¥å†…ï¼Œä½ è¿˜å¯ä»¥è¾“å…¥"+charactersLeft + "" + settings.statusText);
				}
			}

			function checkChars()
			{
				var valid = true;

				// Too many chars?
				if(charactersLength >= settings.maxCharacters)
				{
					// Too may chars, set the valid boolean to false
					valid = false;
					// Add the notifycation class when we have too many chars
					item.addClass(settings.notificationClass);
					// Cut down the string
					item.val(item.val().substr(0,settings.maxCharacters));
					// Show the alert dialog box, if its set to true
					showAlert();
				}
				else
				{
					// Remove the notification class
					if(item.hasClass(settings.notificationClass))
					{
						item.removeClass(settings.notificationClass);
					}
				}

				if(settings.status)
				{
					updateStatus();
				}
			}

			// Shows an alert msg
			function showAlert()
			{
				if(settings.showAlert)
				{
					alert(settings.alertText);
				}
			}

			// Check if the element is valid.
			function validateElement()
			{
				var ret = false;

				if(item.is('textarea')) {
					ret = true;
				} else if(item.filter("input[type=text]")) {
					ret = true;
				} else if(item.filter("input[type=password]")) {
					ret = true;
				}

				return ret;
			}

			// Validate
			if(!validateElement())
			{
				return false;
			}

			// Loop through the events and bind them to the element
			$.each(settings.events, function (i, n) {
				item.bind(n, function(e) {
					charactersLength = item.val().length;
					checkChars();
				});
			});

			// Insert the status div
			if(settings.status)
			{
				item.after($("<div/>").addClass(settings.statusClass).html('-'));
				updateStatus();
			}

			// Remove the status div
			if(!settings.status)
			{
				var removeThisDiv = item.next("div."+settings.statusClass);

				if(removeThisDiv) {
					removeThisDiv.remove();
				}

			}

			// Slide counter
			if(settings.slider) {
				item.next().hide();

				item.focus(function(){
					item.next().slideDown('fast');
				});

				item.blur(function(){
					item.next().slideUp('fast');
				});
			}

		});
	};
})(jQuery);
var strFunJson = {"required":"isNull","mobile":"isNoMobile",minlength:"minlength",maxlength:"maxlength","positive":"isNoPositive","price":"isNoPrice"};
var WK_VALIDATE = {
	"message" : {
		required : "ä¸èƒ½ä¸ºç©º",
		minlength : "è¾“å…¥çš„å†…å®¹å¤ªå°‘"
	},isScroll:true,
	"isNull":function(val,regulation){
		if(val==null||val=="")
			return true;
		return false;
	},isNoPositive:function(val,regulation){
		if(val==null||val=="")
			return true;
		else{
			if(regulation!=null){
				var myreg1 = /^([1-9]\d{0,8})(\.\d{1,3})?$/;
				var myreg2 = /^[0](\.\d{1,3})+$/;
				if((myreg1.test(val))||(myreg2.test(val))){
					return false;
				}
			}
			return true;
		}
		return false;
	},"maxlength":function(val,regulation){
		if(val!=null&&val.length>regulation)
			return true;
		return false;
	},"minlength":function(val,regulation){
		if(val==null||val==""||val.length<regulation)
			return true;
		return false;
	},"isNoMobile":function(mobile){
		myreg = /^(((1[2,3,4,5,6,7,8][0-9]{1})|159)+\d{8})$/;
		if(!myreg.test(mobile))
			return true;
		return false;
	},isNoPrice:function(val,regulation){
		if((val==null||val=="")&&!regulation)
			return false;
		else if(val!=null&&val!=""&&(isNaN(val)||val<0.01))
			return true;
		return false;
	},
	currentEleValidate:function(formEleObj){
//			console.log("..............");
		formEleObj  = $(formEleObj);
		var dataValidate = null,dataValidateJson = null;
		dataValidate = formEleObj.attr("data-validate");

		if(dataValidate!=null){
			//è§£æždata validate
			dataValidateJson =  eval('(' + dataValidate + ')');
			for(var key in dataValidateJson){
				if(WK_VALIDATE[strFunJson[key]](formEleObj.val(),dataValidateJson[key])){
					WK_VALIDATE["setErrorInfo"](formEleObj,formEleObj.attr("name"),key,WK_VALIDATE.message);
					return false;
				}else{
					formEleObj.removeClass("errorRed");
					if(null!=formEleObj.next().attr("class")&&formEleObj.next().attr("class")=="prompt perror"){
						formEleObj.next().remove();
					}
				}
			}
		}

//			if(formObj.message!=null)
//				WK_VALIDATE.message = formObj.message;
//			//dataValidate:è¡¨å•å…ƒç´ çš„éªŒè¯è§„åˆ™ï¼ŒdataValidateJsonä¸ºéªŒè¯è§„åˆ™è½¬åŒ–æˆçš„JSON
//			var dataValidate = null,dataValidateJson = null;
//			var formEleObj = $(formEleObj);
//			dataValidate = $(formEleObj).attr("data-validate");
//			if(dataValidate!=null){
//				//è§£æždata validate
//				dataValidateJson =  eval('(' + dataValidate + ')');
//				for(var key in dataValidateJson){
//					if(WK_VALIDATE[strFunJson[key]](formEleObj.val(),dataValidateJson[key])){
//						WK_VALIDATE["setErrorInfo"](formEleObj,formEleObj.attr("name"),key,WK_VALIDATE.message);
//						return false;
//					}else{
//						$(formEleObj).removeClass("errorRed");
//						$("span[name='"+formEleObj.attr("name")+"_info"+"']").removeClass("errorShow");
//					}
//				}
//			}
	},
	validateForm:function(formObj){
		if(formObj.message!=null)
			WK_VALIDATE.message = formObj.message;
		$("form span").removeClass("errorShow");
		var isSubmit = true,form = $("#"+formObj.formId);
		//dataValidate:è¡¨å•å…ƒç´ çš„éªŒè¯è§„åˆ™ï¼ŒdataValidateJsonä¸ºéªŒè¯è§„åˆ™è½¬åŒ–æˆçš„JSON
		var dataValidate = null,dataValidateJson = null;
		$.each(form[0],function(obj){
			var formEleObj = $(form[0][obj]);
			try {
				formEleObj.bind("blur",function(data){
					WK_VALIDATE.currentEleValidate(this);
				});
				dataValidate = $(form[0][obj]).attr("data-validate");
			} catch (e) {
				dataValidate = null;
			}
			if(dataValidate!=null){
				//è§£æždata validate
				dataValidateJson =  eval('(' + dataValidate + ')');
				for(var key in dataValidateJson){
					if(WK_VALIDATE[strFunJson[key]](formEleObj.val(),dataValidateJson[key])){
						isSubmit = false;
						WK_VALIDATE["setErrorInfo"](formEleObj,formEleObj.attr("name"),key,WK_VALIDATE.message);
						if(WK_VALIDATE.isScroll){
							WK_VALIDATE.scrollOffset(formEleObj);
							WK_VALIDATE.isScroll=false;
						}
						break;
//							return false;
					}else{
						$(this).removeClass("errorRed");
						if(null!=formEleObj.next().attr("class")&&formEleObj.next().attr("class")=="prompt perror"){
							formEleObj.next().remove();
						}
					}
				}
			}
		});
		WK_VALIDATE.isScroll=true;
		return isSubmit;
	},setErrorInfo:function(formEleObj,tempCurrentName,key,errorInfo){
		var JQObj = $(formEleObj);
		if(null!=JQObj.next().attr("class")&&JQObj.next().attr("class")=="prompt perror"){

		}else{
			if(errorInfo[tempCurrentName]!=null&&typeof(errorInfo[tempCurrentName])=="string"){
				JQObj.after('<span class="prompt perror">'+WK_VALIDATE["message"][tempCurrentName]+'</span>');
			}else if(typeof(errorInfo[tempCurrentName])=="object"){
				JQObj.after('<span class="prompt perror">'+WK_VALIDATE["message"][tempCurrentName][key]+'</span>');
			}else if(typeof(errorInfo[tempCurrentName])=="function"){
				errorInfo[tempCurrentName](JQObj.val());
			}else{
				JQObj.after('<span class="prompt perror">è¾“å…¥ä¿¡æ¯ä¸æ­£ç¡®</span>');
			}
			JQObj.addClass("errorRed");
		}
	},scrollOffset:function(obj) {
		if(obj.attr("type")=="hidden"){
			obj = obj.parent();
		}
		$("body,html").animate({
			scrollTop: obj.offset().top-70
		}, 600);

	}
}