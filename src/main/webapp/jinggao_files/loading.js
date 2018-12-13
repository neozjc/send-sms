(function ($) {
    $.extend($.fn, {
        showLoading: function () {
            var original = $(this);
            var position = original.offset();
            var width = original.outerWidth();
            var height = original.outerHeight();

            var loadingdiv = $(document.body).find("> div.loading-div-gen");

            if (loadingdiv.size() == 0) {
                loadingdiv = $('<div class="loading-div-gen" ><div style="display:block;margin-top:300px;"><i style="font-size: 75px; color: rgb(0, 153, 255);" class="icon-spinner icon-spin"></i></div></div>');
                loadingdiv.appendTo($(document.body));
            }

            loadingdiv.css({
                position: 'fixed',
                top: 0,
                left: 0,
                'z-index': 1051,
                opacity: 1,
                'text-align': 'center',
                width: screen.width,
                height: screen.height
            });

            return loadingdiv;
        },
        hideLoading: function () {
            var target = $(document.body).find("> div.loading-div-gen");
            target.fadeOut(1000, function () {
                target.remove();
            });
        }
    });


//    $.ajaxSubmitBak = $.fn.ajaxSubmit;

//    $.fn.ajaxSubmit = function (options) {
//        $(this).valid() && $.ajaxSubmitBak.call(this, options);
//    }

//    $.uuid = function (size) {
//        size = size || 32;
//        var s = [];
//        var hexDigits = "0123456789abcdef";
//        for (var i = 0; i < 36; i++) {
//            s[i] = hexDigits.substr(Math.floor(Math.random() * 0x10), 1);
//        }
//        s[14] = "4";  // bits 12-15 of the time_hi_and_version field to 0010
//        s[19] = hexDigits.substr((s[19] & 0x3) | 0x8, 1);  // bits 6-7 of the clock_seq_hi_and_reserved to 01
//        s[8] = s[13] = s[18] = s[23] = "";

//        return s.join("").substr(0, size);
//    }

//    $.ajaxBak = $.ajax;

//    $.ajax = function (options) {
//        options.timeout = 300000;
//        options.url = options.url + (options.url.indexOf("?") > 0 ? "&" : "?") + "r=" + Math.random();
//        options.error = function (xhr, ajaxOptions, msg) {
//            bootbox.alert("服务器数据异常:" + xhr.statusText + ":" + xhr.responseText);
//        }
//        options.complete = function (e) {
//            $(document.body).hideLoading();
//        }

////        if (options.success) {
////            var successBak = options.success;
////            
////                options.success = function (e) {
////                    if (e.OK === false && !options.customError) {
////                       if (e.Message === "登录超时，请重新登录" && $("#relogin-modal").size() > 0) {
////                            $("#relogin-modal").modal();
////                        } else if ($(".loading-error").size() > 0) {
////                            $(".loading-error").html(e.Message);
////                        }
////                        //验证码
////                        else {
////                            bootbox.alert(e.Message);
////                        }
////                    }
////                    else {
////                            successBak.call(this, e);
////                            initTooltip();
////                    }
////                }
////        }

//        $(document.body).showLoading();

//        try {
//            return $.ajaxBak.call(this, options);
//        } catch (e) {
//            bootbox.alert(e);
//            $(document.body).hideLoading();
//        }
//        return this;
//    }
})(jQuery);

//$(function () {
//	$(document).on("show", ".modal", function (e) {
//		var w = $(this).width();
//		var h = $(this).height();
//		var docw = $(window).width();
//		var doch = $(window).height();

//		//h = h > doch - 60 ? doch - 60 : h;
//		$('html, body').css({
//			'overflow': 'hidden',
//			'height': '100%'
//		});

//		$(this).css({ left: (docw - w) / 2, "margin-left": 0, "margin-top": 0, top: (doch - h) / 2, height: h });
//	});

//	$(document).on("hide", ".modal", function (e) {
//		//h = h > doch - 60 ? doch - 60 : h;
//		$('html, body').css({
//			'overflow': 'auto',
//			'height': 'auto'
//		});
//	});


//	if ($("#relogin-modal form").size() > 0) {
//		$("#relogin-modal").on("click", "a.btn-primary", function (e) {
//			$("#relogin-modal form").ajaxSubmit({
//				success: function (data) {
//					if (data.OK) {
//						$('#relogin-modal').modal("hide");
//					}
//					else {
//						bootbox.alert(data.Message);
//					}
//				}
//			});
//		});
//	}

//	if ($(".action-add-shortcut").size() > 0) {
//		$(".action-add-shortcut").on("click", function (e) {
//			var funcid = $(this).data("funcid");

//			$.ajax({
//				url: '/ashx/profile.ashx?action=addShortcut',
//				type: 'POST',
//				data: { functionID: funcid },
//				success: function (result) {
//					bootbox.alert(result.Message);
//				}
//			});
//		});
//	}
//});

