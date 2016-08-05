<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/ace/css/ui.jqgrid.css" />
		<jsp:include page="/admin/inc/inc-header.jsp"/>
	</head>

	<body class="no-skin">
		<!-- #section:basics/navbar.layout -->
		<jsp:include page="/admin/inc/inc-nav.jsp"/>

		<!-- /section:basics/navbar.layout -->
		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

			<!-- #section:basics/sidebar -->
			<div id="sidebar" class="sidebar responsive">
				<jsp:include page="/admin/inc/inc-menu.jsp"/>
			</div>
			
			<!-- /section:basics/sidebar -->
			<div class="main-content">
				<div class="main-content-inner">
					<!-- #section:basics/content.breadcrumbs -->
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="#">主页</a>
							</li>

							<li>
								<a href="#">字典管理</a>
							</li>
							<li class="active">数据类型字典列表</li>
						</ul>

						<!-- #section:basics/content.searchbox -->
						<div class="nav-search" id="nav-search">
							<form class="form-search">
								<span class="input-icon">
									<input type="text" placeholder="搜索 ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
									<i class="ace-icon fa fa-search nav-search-icon"></i>
								</span>
							</form>
						</div><!-- /.nav-search -->

						<!-- /section:basics/content.searchbox -->
					</div>

					<!-- /section:basics/content.breadcrumbs -->
					<div class="page-content">

						<div class="row">
							<div class="col-xs-12">

								<table id="grid-table"></table>

								<div id="grid-pager"></div>

								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->
			<jsp:include page="/admin/inc/inc-footer.jsp"/>

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->

<!-- 弹出框start -->
<!-- <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">修改</button> -->
<div id="myModal" class="modal fade" tabindex="-1">
	<form class="updateForm">
		<div class="modal-dialog">
			<div class="modal-content">
			</div>
		</div>
	</form>		
</div>
<!-- 弹出框end -->


		<!-- page specific plugin scripts -->
		<script src="${pageContext.request.contextPath}/admin/ace/js/date-time/bootstrap-datepicker.js"></script>
		<script src="${pageContext.request.contextPath}/admin/ace/js/jqGrid/jquery.jqGrid.js"></script>
		<script src="${pageContext.request.contextPath}/admin/ace/js/jqGrid/i18n/grid.locale-cn.js"></script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			jQuery(function($) {
				var grid_selector = "#grid-table";
				var pager_selector = "#grid-pager";
				
				var parent_column = $(grid_selector).closest('[class*="col-"]');
				$(window).on('resize.jqGrid', function () {
					$(grid_selector).jqGrid( 'setGridWidth', parent_column.width() );
			    })
				
				$(document).on('settings.ace.jqGrid' , function(ev, event_name, collapsed) {
					if( event_name === 'sidebar_collapsed' || event_name === 'main_container_fixed' ) {
						//setTimeout is for webkit only to give time for DOM changes and then redraw!!!
						setTimeout(function() {
							$(grid_selector).jqGrid( 'setGridWidth', parent_column.width() );
						}, 0);
					}
			    })
				
				var jqGridJSON = {
				  			
			 					subGridOptions : {
									plusicon : "ace-icon fa fa-plus center bigger-110 blue",
									minusicon  : "ace-icon fa fa-minus center bigger-110 blue",
									openicon : "ace-icon fa fa-chevron-right center orange"
								}, 
								
								url:urls.selectSysDictionaryTypeList.url,
								datatype: "json",
								mtype:"POST",
								height: 350,
								colNames:['ID','数据字典类型名称','数据字典类型描述', '状态','创建时间','修改时间','operation'],
								colModel:[
									{name:'id',index:'id', width:100, sorttype:"int", editable: true},
									{name:'dicName',index:'dicName',width:105, editable:true, sortable:false},
									{name:'dicDesc',index:'dicDesc', width:105,editable: true, sortable:false},
									{name:'status',index:'status', width:105, editable: false, sortable:false},
									{name:'createDate',index:'createDate', width:105, sortable:false,editable: false}, 
									{name:'updateDate',index:'updateDate', width:105, sortable:false,editable: false}, 
									{name:'operation',index:'operation', width:50, sortable:false,editable: false}, 
								], 
						
								viewrecords : true,
								rowNum:10,
								rowList:[10,20,30],
								pager : pager_selector,
								altRows: true,
								//toppager: false,
								
								jsonReader: { 
									root: "data",
									total: "pageSize",//总共有多少页
									page: "pageNo",//当前第几页
									records: "totalCount",//json中代表数据行总数的数据
									repeatitems: false
								},
								
								prmNames : {
									page : "pageNo",
									totalrows:"totalCount"
								},
								
								
								multiselect: true,
						        multiboxonly: true,
						
								loadComplete : function() {
									var table = this;
									setTimeout(function(){
										styleCheckbox(table);
										
										updateActionIcons(table);
										updatePagerIcons(table);
										enableTooltips(table);
									}, 0);
								},
						
								editurl: ctx+"/adminUser/update",//nothing is saved
								caption: "数据字典类型列表",
								autowidth: true,
							}
				jQuery(grid_selector).jqGrid(jqGridJSON);
				$(window).triggerHandler('resize.jqGrid');//trigger window resize to make the grid get the correct size
			
				//navButtons
				jQuery(grid_selector).jqGrid('navGrid',pager_selector,
					{ 	//navbar options
  						edit: true,
						editicon : 'ace-icon fa fa-pencil blue',
						add: true,
						addicon : 'ace-icon fa fa-plus-circle purple',
						del: true,
						delicon : 'ace-icon fa fa-trash-o red',
						search: true,
						searchicon : 'ace-icon fa fa-search orange',
						refresh: true,
						refreshicon : 'ace-icon fa fa-refresh green',
						view: true,
						viewicon : 'ace-icon fa fa-search-plus grey',
						addfunc : addSysDictionaryTypeModal, 
						delfunc : deleteSysDictionaryType,
						editfunc : editSysDictionaryTypeModal, 
					},
					{
						//edit record form
						width: 1120,
						closeAfterEdit: true,
						recreateForm: true,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
							style_edit_form(form);
						},
						onClickButton :function(e){
						  	alert("ssss");
						}
					},
					{
						//new record form
						width: 1120,
						closeAfterAdd: true,
						recreateForm: true,
						viewPagerButtons: false,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
							style_edit_form(form);
						}
					},
					{
						//delete record form
						recreateForm: true,
						beforeShowForm : function(e) {
						  	alert("sss");
							var form = $(e[0]);
							if(form.data('styled')) return false;
							
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
							style_delete_form(form);
							
							form.data('styled', true);
						},
						onClick : function(e) {
							//alert(1);
						}
					},
					{
						//search form
						width: 600,
						recreateForm: true,
						afterShowSearch: function(e){
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
							style_search_form(form);
						},
						afterRedraw: function(){
							style_search_filters($(this));
						}
						,
						multipleSearch: true,
						/**
						multipleGroup:true,
						showQuery: true
						*/
					},
					{
						//view record form
						width: 1120,
						recreateForm: true,
						beforeShowForm: function(e){
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
						}
					}
				)
			
				function style_edit_form(form) {
					form.find('input[name=createTimeStr]').datepicker({format:'yyyy-mm-dd hh:ii' , autoclose:true})
					
					form.find('input[name=stock]').addClass('ace ace-switch ace-switch-5').after('<span class="lbl"></span>');
					//update buttons classes
					var buttons = form.next().find('.EditButton .fm-button');
					buttons.addClass('btn btn-sm').find('[class*="-icon"]').hide();//ui-icon, s-icon
					buttons.eq(0).addClass('btn-primary').prepend('<i class="ace-icon fa fa-check"></i>');
					buttons.eq(1).prepend('<i class="ace-icon fa fa-times"></i>')
					
/* 					buttons = form.next().find('.navButton a');
					buttons.find('.ui-icon').hide();
					buttons.eq(0).append('<i class="ace-icon fa fa-chevron-left"></i>');
					buttons.eq(1).append('<i class="ace-icon fa fa-chevron-right"></i>') */;		
				}
			
				function style_delete_form(form) {
					var buttons = form.next().find('.EditButton .fm-button');
					buttons.addClass('btn btn-sm btn-white btn-round').find('[class*="-icon"]').hide();//ui-icon, s-icon
 					buttons.eq(0).addClass('btn-danger').prepend('<i class="ace-icon fa fa-trash-o"></i>');
					buttons.eq(1).addClass('btn-default').prepend('<i class="ace-icon fa fa-times"></i>') 
				}
				
				function style_search_filters(form) {
					form.find('.delete-rule').val('X');
					form.find('.add-rule').addClass('btn btn-xs btn-primary');
					form.find('.add-group').addClass('btn btn-xs btn-success');
					form.find('.delete-group').addClass('btn btn-xs btn-danger');
				}
				function style_search_form(form) {
					var dialog = form.closest('.ui-jqdialog');
					var buttons = dialog.find('.EditTable')
					buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-sm btn-info').find('.ui-icon').attr('class', 'ace-icon fa fa-retweet');
					buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-sm btn-inverse').find('.ui-icon').attr('class', 'ace-icon fa fa-comment-o');
					buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-sm btn-purple').find('.ui-icon').attr('class', 'ace-icon fa fa-search');
				}
				
				function beforeDeleteCallback(e) {
					var form = $(e[0]);
					if(form.data('styled')) return false;
					
					form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
					style_delete_form(form);
					form.data('styled', true);
				}
				
				function beforeEditCallback(e) {
					alert( "beforeEditCallback" );
					var form = $(e[0]);
					form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
					style_edit_form(form);
				}
			
			
			
				//it causes some flicker when reloading or navigating grid
				//it may be possible to have some custom formatter to do this as the grid is being created to prevent this
				//or go back to default browser checkbox styles for the grid
				function styleCheckbox(table) {
				/**
					$(table).find('input:checkbox').addClass('ace')
					.wrap('<label />')
					.after('<span class="lbl align-top" />')
			
			
					$('.ui-jqgrid-labels th[id*="_cb"]:first-child')
					.find('input.cbox[type=checkbox]').addClass('ace')
					.wrap('<label />').after('<span class="lbl align-top" />');
				*/
				}
				
			
				//unlike navButtons icons, action icons in rows seem to be hard-coded
				//you can change them like this in here if you want
				function updateActionIcons(table) {
					/**
					var replacement = 
					{
						'ui-ace-icon fa fa-pencil' : 'ace-icon fa fa-pencil blue',
						'ui-ace-icon fa fa-trash-o' : 'ace-icon fa fa-trash-o red',
						'ui-icon-disk' : 'ace-icon fa fa-check green',
						'ui-icon-cancel' : 'ace-icon fa fa-times red'
					};
					$(table).find('.ui-pg-div span.ui-icon').each(function(){
						var icon = $(this);
						var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
						if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
					})
					*/
				}
				
				//replace icons with FontAwesome icons like above
				function updatePagerIcons(table) {
					var replacement = 
					{
						'ui-icon-seek-first' : 'ace-icon fa fa-angle-double-left bigger-140',
						'ui-icon-seek-prev' : 'ace-icon fa fa-angle-left bigger-140',
						'ui-icon-seek-next' : 'ace-icon fa fa-angle-right bigger-140',
						'ui-icon-seek-end' : 'ace-icon fa fa-angle-double-right bigger-140'
					};
					$('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
						var icon = $(this);
						var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
						if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
					})
				}
			
				function enableTooltips(table) {
					$('.navtable .ui-pg-button').tooltip({container:'body'});
					$(table).find('.ui-pg-div').tooltip({container:'body'});
				}
			
				//var selr = jQuery(grid_selector).jqGrid('getGridParam','selrow');
			
				$(document).one('ajaxloadstart.page', function(e) {
					$.jgrid.gridDestroy(grid_selector);
					$('.ui-jqdialog').remove();
				});
			});
		</script>
		<script type="text/javascript">
			var roleId = "";
			<%-- 添加start --%>	
			var addSysDictionaryTypeModal = function(){
			  	$("#myModal").modal({
			  	  	remote:ctx+"/admin/sys/sysconfig/sysdictionarytype/add.jsp",
			  	})
			}
			function saveSysDictionaryType(){
				var datas = urls.saveSysDictionaryType;
				datas.type = "POST";
				datas.data = $("form.updateForm").serializeArray();
				datas.success = function(res){
					if(res.code == 1){
					  	window.location.reload();
					}else{
					  	alert(res.desc);
					}
				}
				Ajax.jsonSync(datas);
			}
			<%-- 修改end --%>
			<%-- 修改start --%>
			var editSysDictionaryTypeModal = function(rowId){
/* 			  	var form = $("form.updateForm");
			  	if(selectAndSetData(rowId,form)) $('#myModal').modal('show'); */
			  	roleId = rowId;
			  	$("#myModal").modal({
			  	  	remote:ctx+"/admin/sys/sysconfig/sysdictionarytype/add.jsp",
			  	})
			}
			function updateSysDictionaryType(){
			  	var datas = urls.updateSysDictionaryType;
				datas.type = "POST";
				datas.data = $("form.updateForm").serializeArray();
				datas.success = function(res){
				  	if(res.code == 1){
						window.location.reload();
					}else{
					  	alert(res.desc);
					}
				}
				Ajax.jsonSync(datas);			  
			}
			<%-- 修改end --%>
			
			<%-- 删除start --%>
			var deleteSysDictionaryType = function(rowId){
 				var datas = urls.deleteSysDictionaryType;
 				datas.url = datas.url + "?id="+rowId;
				datas.success = function(res){
					if(res.code == 1){
					  	window.location.reload();
					}else{
					  	alert(res.desc);
					}
				}
				Ajax.jsonSync(datas);	
			}
			<%-- 修改end --%>
			
		</script>
		<script type="text/javascript">
			function selectAndSetData(id,form){
/* 		  		var flag = false;
				var datas = urls.selectRoleAndSetData;
				datas.url = datas.url + "?id="+id;
				datas.type="POST";
				datas.success = function(res){
					if(res.code == 1){
					  	var menu = res.obj
					  	form.find("input[name=id]").val(id);
					  	form.find("input[name=roleName]").val(menu.roleName);
					  	form.find("input[name=roleDescription]").val(menu.roleDescription);
					  	flag = true;
					}else{
					  	alert(res.desc);
					}
				}
				Ajax.jsonSync(datas);
				return flag; */			  
			}
			
			<%-- bootstrap modal 监视器，loaded.bs.modal：表示从远端的数据源加载完数据之后触发该事件 --%>
			$('#myModal').on('loaded.bs.modal', function (e) {
			  	//判断roleId是否为全部数字，如果是，则表示当前操作为修改操作，则执行下面数据加载JS
				if($.trim(roleId) != "" && !isNaN(roleId)){
				  	var modal = $(this);
					var datas = urls.selectSysDictionaryTypeAndSetData;
					datas.url = (datas.url.indexOf("?")>0?datas.url.substring(0,datas.url.indexOf("?")):datas.url) + "?id="+roleId;
					datas.type="POST";
					datas.success = function(res){
						if(res.code == 1){
						  	var dictionaryType = res.obj;
						  	modal.find("input[name=id]").val(""+dictionaryType.id);
						  	modal.find("input[name=dicName]").val(dictionaryType.dicName);
						  	modal.find("input[name=dicDesc]").val(dictionaryType.dicDesc);
						  	modal.find("select[name=status]").val(dictionaryType.status);
						  	modal.find("button#submitButton").attr("onClick","updateSysDictionaryType()");
						}else{
						  	alert(res.desc);
						}
					}
					Ajax.jsonSync(datas);
					//重新对roleId赋值，以避免点击其它操作时，也执行数据加载
					roleId = "";
				}		
			})
			
			<%-- bootstrap modal 监视器，hidden.bs.modal：此事件在模态框被隐藏（并且同时在 CSS 过渡效果完成）之后被触发 --%>
			$('#myModal').on('hide.bs.modal', function (e) {
				//由于使用了remote属性对bootstrap modal进行加载数据，
				//而remote只会对modal进行一次加载，所以每次modal都必须清楚之前加载的数据
			  	$(this).removeData("bs.modal");
			})
		</script>
	</body>
</html>

