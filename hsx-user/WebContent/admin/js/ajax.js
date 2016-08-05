var Ajax = {
	json : function( datas ) {
		$.ajax({
			type : datas.type,	
			url : datas.url,
			dataType:"json",
			data : datas.data,
			success : datas.success,
			error: function(XMLHttpRequest, textStatus, errorThrown){
				alert('系统繁忙,请稍后再试!');
			  }
		});
	},
	/**
	 * 同步ajax请求
	 * @param datas
	 */
	jsonSync : function( datas ) {
	  $.ajax({
	    type : datas.type,	
	    url : datas.url,
	    dataType:"json",
	    data : datas.data,
	    success : datas.success,
	    async: false,
	    error: function(XMLHttpRequest, textStatus, errorThrown){
	      alert('系统繁忙,请稍后再试!');
	    }
	  });
	},
	//跨域调用
	jsonp :function ( datas ){
		$.ajax({
			type : datas.type,
			url : data.url,
			dataType:"jsonp",
			data : datas.data,
			success :datas.success,
			error: function(XMLHttpRequest, textStatus, errorThrown){
				//alert('系统繁忙,请稍后再试!');
			  }
		});
	}

}