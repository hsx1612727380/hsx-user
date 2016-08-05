<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv="pragma" content="no-cache"> 
<meta http-equiv="cache-control" content="no-cache"> 
<meta http-equiv="expires" content="0">   
<title>云医助手后台管理系统</title>

<meta name="description" content="overview &amp; stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<script type="text/javascript">
	var ctx = "${pageContext.request.contextPath}";
</script>
<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/ace/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/ace/css/font-awesome.css" />

<!-- page specific plugin styles -->

<!-- text fonts -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/ace/css/ace-fonts.css" />

<!-- ace styles -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/ace/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />


<!--[if lte IE 9]>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/ace/css/ace-part2.css" class="ace-main-stylesheet" />
<![endif]-->

<!--[if lte IE 9]>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/ace/css/ace-ie.css" />
<![endif]-->

<!-- inline styles related to this page -->

<!-- ace settings handler -->
<script src="${pageContext.request.contextPath}/admin/ace/js/ace-extra.js"></script>

<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

<!--[if lte IE 8]>
<script src="${pageContext.request.contextPath}/admin/ace/js/html5shiv.js"></script>
<script src="${pageContext.request.contextPath}/admin/ace/js/respond.js"></script>
<![endif]-->

<!--[if !IE]> -->
<script type="text/javascript">
	window.jQuery || document.write("<script src='${pageContext.request.contextPath}/admin/ace/js/jquery.js'>"+"<"+"/script>");
</script>

<!-- <![endif]-->

<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='${pageContext.request.contextPath}/admin/ace/js/jquery1x.js'>"+"<"+"/script>");
</script>
<![endif]-->
<script type="text/javascript">
	if('ontouchstart' in document.documentElement) document.write("<script src='${pageContext.request.contextPath}/admin/ace/js/jquery.mobile.custom.js'>"+"<"+"/script>");
</script>
<script src="${pageContext.request.contextPath}/admin/ace/js/bootstrap.js"></script>

<!-- page specific plugin scripts -->

<!--[if lte IE 8]>
  <script src="${pageContext.request.contextPath}/admin/ace/js/excanvas.js"></script>
<![endif]-->
<script src="${pageContext.request.contextPath}/admin/ace/js/jquery-ui.custom.js"></script>
<script src="${pageContext.request.contextPath}/admin/ace/js/jquery.ui.touch-punch.js"></script>
<script src="${pageContext.request.contextPath}/admin/ace/js/jquery.easypiechart.js"></script>
<script src="${pageContext.request.contextPath}/admin/ace/js/jquery.sparkline.js"></script>
<script src="${pageContext.request.contextPath}/admin/ace/js/flot/jquery.flot.js"></script>
<script src="${pageContext.request.contextPath}/admin/ace/js/flot/jquery.flot.pie.js"></script>
<script src="${pageContext.request.contextPath}/admin/ace/js/flot/jquery.flot.resize.js"></script>

<!-- ace scripts -->
<script src="${pageContext.request.contextPath}/admin/ace/js/ace/elements.scroller.js"></script>
<script src="${pageContext.request.contextPath}/admin/ace/js/ace/elements.colorpicker.js"></script>
<script src="${pageContext.request.contextPath}/admin/ace/js/ace/elements.fileinput.js"></script>
<script src="${pageContext.request.contextPath}/admin/ace/js/ace/elements.typeahead.js"></script>
<script src="${pageContext.request.contextPath}/admin/ace/js/ace/elements.wysiwyg.js"></script>
<script src="${pageContext.request.contextPath}/admin/ace/js/ace/elements.spinner.js"></script>
<script src="${pageContext.request.contextPath}/admin/ace/js/ace/elements.treeview.js"></script>
<script src="${pageContext.request.contextPath}/admin/ace/js/ace/elements.wizard.js"></script>
<script src="${pageContext.request.contextPath}/admin/ace/js/ace/elements.aside.js"></script>
<script src="${pageContext.request.contextPath}/admin/ace/js/ace/ace.js"></script>
<script src="${pageContext.request.contextPath}/admin/ace/js/ace/ace.ajax-content.js"></script>
<script src="${pageContext.request.contextPath}/admin/ace/js/ace/ace.touch-drag.js"></script>
<script src="${pageContext.request.contextPath}/admin/ace/js/ace/ace.sidebar.js"></script>
<script src="${pageContext.request.contextPath}/admin/ace/js/ace/ace.sidebar-scroll-1.js"></script>
<script src="${pageContext.request.contextPath}/admin/ace/js/ace/ace.submenu-hover.js"></script>
<script src="${pageContext.request.contextPath}/admin/ace/js/ace/ace.widget-box.js"></script>
<script src="${pageContext.request.contextPath}/admin/ace/js/ace/ace.settings.js"></script>
<script src="${pageContext.request.contextPath}/admin/ace/js/ace/ace.settings-rtl.js"></script>
<script src="${pageContext.request.contextPath}/admin/ace/js/ace/ace.settings-skin.js"></script>
<script src="${pageContext.request.contextPath}/admin/ace/js/ace/ace.widget-on-reload.js"></script>
<script src="${pageContext.request.contextPath}/admin/ace/js/ace/ace.searchbox-autocomplete.js"></script>
<%-- 自定义ajax 调用方法 --%>
<script src="${pageContext.request.contextPath}/admin/js/ajax.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/urls.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/AlertMsg.js"></script>


