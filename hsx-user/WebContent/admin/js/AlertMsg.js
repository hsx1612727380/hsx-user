var timeoutStr = 3000;
var AlertMsg={
	alertSuccess : function( msg ,desc ) {
		var classStr = ".alert.alert-block.alert-success";
		var messageObj = $(classStr).clone();
		messageObj.attr("class","alert.alert-block alert-success clone");
		messageObj.show();
		repalceMsg( messageObj , msg , desc );
		setTimeout("closeAlert()",timeoutStr)
	},

	alertError : function( msg ,desc) {
		var classStr = ".alert.alert-danger";
		var messageObj = $(classStr).clone();
		messageObj.attr("class","alert alert-danger clone");
		messageObj.show();
		repalceMsg( messageObj , msg , desc );
		setTimeout("closeAlert()",timeoutStr);
	},
	
	alertWaring : function( msg , desc ) {
		var classStr = ".alert.alert-warning";
		var messageObj = $(classStr).clone();
		messageObj.attr("class","alert alert-warning clone");
		messageObj.show();
		repalceMsg( messageObj , msg , desc );
		setTimeout("closeAlert()",timeoutStr)
	},
	
	alertInfo : function( msg , desc ) {
		var classStr = ".alert.alert-info";
		var messageObj = $(classStr).clone();
		messageObj.attr("class","alert alert-info clone");
		messageObj.show();
		repalceMsg( messageObj , msg , desc );
		setTimeout("closeAlert()",timeoutStr)
	}
	
}

/**
 * @author yhl
 * @param msg    提示标题
 * @param desc   描述信息
 */
function repalceMsg( messageObj, msg , desc ){
	messageObj.find( "strong" ).append( msg );
	messageObj.append( desc );
	$(".page-content").prepend(messageObj);
}

function closeAlert(){
	//$(".clone").alert("close");
  $(".clone").remove();
}
