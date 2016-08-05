Date.prototype.Format = function (fmt) {  
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}


var modalBox = {
        show: function() {
        	var myShade= '<div id="myShade"><i class="ace-icon fa fa-spinner fa-spin orange bigger-125"></i></div>'
        	$('body').append(myShade)

            var $loading = $('#myShade');
            var pic = $('.fa-spin')

            var clientW = $(window).width();
            var clientH = $(window).height();
            var L = (clientW - $loading.width()) / 2;
            var T = (clientH - $loading.height()) / 2;
            $loading.show().css({
                "position": "absolute",
                "background": "rgba(0,0,0,.3)",
                "z-index": "999",
                "width": clientW,
                "height": clientH,
                "top": 0,
                "left": 0
            })
            $('.fa-spin').css({
                "position": "absolute",
                "top": "50%",
                "left": "50%",
            })

        },
        hide: function() {
            $('#myShade').remove();
        }
    }
