<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div id="navbar" class="navbar navbar-default">
	<script type="text/javascript">
		try{ace.settings.check('navbar' , 'fixed')}catch(e){}
		
		 function logout(obj){
			var datas = urls.logout;
			datas.type = "POST";
			datas.success = function(res){
			  		console.log(res);
			  	if(res.code == 1){
			  	  window.location.href= ctx+"/login.jsp";
				}else{
				  	alert(res.desc);
				}
			}
			Ajax.json(datas);			  	
		}
	</script>
	<div class="navbar-container" id="navbar-container">
		<!-- #section:basics/sidebar.mobile.toggle -->
		<button type="button" class="navbar-toggle menu-toggler pull-left"
			id="menu-toggler" data-target="#sidebar">
			<span class="sr-only">Toggle sidebar</span> <span class="icon-bar"></span>

			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>

		<div class="navbar-header pull-left">
			<a href="#" class="navbar-brand"> <small> <i class="fa fa-leaf"></i> 云医助手 </small></a>
		</div>
		<div class="navbar-buttons navbar-header pull-right" role="navigation">
			<ul class="nav ace-nav">
				<li class="light-blue"><a data-toggle="dropdown" href="#"
					class="dropdown-toggle"> <img class="nav-user-photo"
						src="${pageContext.request.contextPath}/admin/ace/avatars/user.jpg"
						alt="Jason's Photo" /> <span class="user-info"> <small>欢迎,</small>
							${adminUser.userName}
					</span> <i class="ace-icon fa fa-caret-down"></i>
				</a>
					<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
						<li><a href="#"> <i class="ace-icon fa fa-cog"></i>设置</a></li>
						<li><a href="profile.html"> <i class="ace-icon fa fa-user"></i> 个人信息 </a></li>
						<li class="divider"></li>
						<li><a href="#" onclick="logout()"> <i class="ace-icon fa fa-power-off"></i>退出</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</div>
