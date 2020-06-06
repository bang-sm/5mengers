
var App = new Object();

App.TopPop = function() {
	var self;
	
	return {
		init : function() {
			self = this;

			// popup close
			$('#po_btn_close').on('click', function() {
				console.log("눌름");
				self.setCookie('todayCookie', 'done', 1);
				$('#popup_box').slideUp();
			});
			// Do not open today.
			self.getCookie();
		},
		setCookie : function(name, value, expiredays) {
			var todayDate = new Date();
			todayDate.setDate(todayDate.getDate() + expiredays);
			document.cookie = name + '=' + escape(value) + '; path=/; expires='
					+ todayDate.toGMTString() + ';'
		},
		getCookie : function() {
			
			var cookiedata = document.cookie;
			if (cookiedata.indexOf('todayCookie=done') < 0) {
				$('#popup_box').show();
			} else {
				$('#popup_box').hide();
			}
		}

	}
}();

