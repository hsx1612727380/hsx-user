<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
<%--初次加载只加第一级别菜单--%>
$(function(){
	var datas = urls.menuURL;
	datas.type = "POST";
	datas.success = function(res){
		if( res.code == 1 ){
			var navList = $("#nav-nav-list");
			var firstMenu = $(".firstMenu-temple");
			$.each( res.data , function( key , obj ){
				var firstMenuClone = firstMenu.clone();
				firstMenuClone.find( ".menu-text" ).append( obj.menuName );
				firstMenuClone.find( "#firstMenu-arrow" ).attr( "onclick","loadSecondMenu('"+obj.id+"',this)" );
				firstMenuClone.attr("id",obj.id);
				firstMenuClone.attr("class","");
				firstMenuClone.find( "a" ).attr( "href",ctx+obj.menuUrl );
				firstMenuClone.show();
				navList.append(firstMenuClone);
			})
		}
	}
	Ajax.json(datas);
})

<%--加载第二级菜单--%>
function loadSecondMenu(id,obj){
	<%--防止重复刷--%>
//	var secondMenuList = $("#secondMenuList");
//	if( secondMenuList.length >= 1 ){
//		return false;
//	}
	var secondMenuList = $(obj).parent().parent().find("ul[lang=secondMenuList]");
	if(secondMenuList.length >=1){
	  $(obj).parent().parent().find("ul[lang=secondMenuList]").remove();
	  return false;
	}
	var datas = urls.menuURL;
	datas.type = "POST";
	datas.data = { level : "2" , parentId : id };
	datas.success = function( res ){
		if( res.code == 1 ){
			<%--找到第一级菜单父类--%>
			var firstMenu = $("#"+id);
			<%--找到ul包容li--%>
			var submenuTemple = $(".submenu-temple");
			var submenuTempleClone = submenuTemple.clone();
			submenuTempleClone.attr( "class","submenu nav-show" );
			submenuTempleClone.attr("lang","secondMenuList");
			submenuTempleClone.show();
			<%--二级菜单--%>
			var secondMenu = $(".secondMenu");
			$.each( res.data , function( key , obj ){
				var secondMenuClone = secondMenu.clone();
				secondMenuClone.find( "#menu-text" ).append( obj.menuName );
				secondMenuClone.find( "#secondMenu-arrow" ).attr( "onclick","loadThirdMenu('"+obj.id+"',this)" );
				secondMenuClone.attr("id",obj.id);
				secondMenuClone.attr("class","");
				secondMenuClone.find( "a" ).attr( "href",ctx+obj.menuUrl );
				secondMenuClone.show();
				submenuTempleClone.append(secondMenuClone);
			});
			submenuTempleClone.show();
			firstMenu.append(submenuTempleClone);
		}
	}
	Ajax.json(datas);
}


<%--加载第三级菜单--%>
function loadThirdMenu(id,obj){
	<%--防止重复刷--%>
//	var ThirdMenuList = $("#ThirdMenuList");
//	if( ThirdMenuList.length >= 1 ){
//		return false;
//	}
	var ThirdMenuList = $(obj).parent().parent().find("ul[lang=ThirdMenuList]");
	if(ThirdMenuList.length >=1){
	  $(obj).parent().parent().find("ul[lang=ThirdMenuList]").remove();
	  return false;
	}
	var datas = urls.menuURL;
	datas.type = "POST";
	datas.data = { level : "3" , parentId : id };
	datas.success = function( res ){
		if( res.code == 1 ){
			<%--找到第二级菜单父类--%>
			var secondMenu = $("#"+id);
			<%--找到ul包容li--%>
			var submenuTemple = $(".submenu-temple");
			var submenuTempleClone = submenuTemple.clone();
			submenuTempleClone.attr( "class","submenu nav-show" );
			submenuTempleClone.attr("lang","ThirdMenuList");
			submenuTempleClone.show();
			<%--三级菜单--%>
			var ThirdMenu = $(".thirdMenu-temple");
			$.each( res.data , function( key , obj ){
				var ThirdMenuClone = ThirdMenu.clone();
				ThirdMenuClone.find( "#menu-text" ).append( obj.menuName );
				//secondMenuClone.find( "#secondMenu-arrow" ).attr( "onclick","loadThirdMenu("+obj.id+")" );
				ThirdMenuClone.attr("id",obj.id);
				ThirdMenuClone.attr("class","");
				ThirdMenuClone.find( "a" ).attr( "href",ctx+obj.menuUrl );
				ThirdMenuClone.show();
				submenuTempleClone.append(ThirdMenuClone);
			});
			submenuTempleClone.show();
			secondMenu.append(submenuTempleClone);
		}
	}
	Ajax.json(datas);
}
</script>
<ul class="nav nav-list" id="nav-nav-list">
	<li class="active" ><a href="${pageContext.request.contextPath}/admin/index.jsp"> <i class="menu-icon fa fa-tachometer"></i> 
	<span class="menu-text">后台菜单</span></a> <b class="arrow"></b>
	</li>
</ul>

<%--
模板
 <li class="firstMenu-temple-aa" style="display: none;"><a href="#" class="dropdown-toggle"> <iclass="menu-icon fa fa-desktop"></i> <span class="menu-text">
			一级菜单</span> <b class="arrow fa fa-angle-down"></b></a> <b class="arrow"></b>
		<ul class="submenu-temple">
			<li class="secodMenu"><a href="#" class="dropdown-toggle"> <i class="menu-icon fa fa-caret-right"></i> 二级菜单 
				<b class="arrow fa fa-angle-down"></b> </a> <b class="arrow"></b>
				<ul class="submenu">
					<li class="thirdMenu-temple"><a href="#"> <i class="menu-icon fa fa-leaf green"></i> 三级菜单 </a> <b class="arrow"></b></li>
				</ul>
			</li>
		</ul>
	</li> --%>
	
	<li class="firstMenu-temple" style="display: none;"><a href="#" class="dropdown-toggle"> <i class="menu-icon fa fa-desktop"></i> <span class="menu-text">
		<%--一级菜单 --%></span> <b class="arrow fa fa-angle-down" id="firstMenu-arrow"></b></a> <b class="arrow"></b>
	</li>
	
	<%-- ul样式 --%>
	<ul class="submenu-temple" style="display: none">
	</ul>
	
	<%--  二级菜单 --%>
	<li class="secondMenu" style="display: none;"><a href="#" class="dropdown-toggle" id="menu-text"> <i class="menu-icon fa fa-caret-right"></i> <%--  二级菜单 --%> 
		<b class="arrow fa fa-angle-down" id="secondMenu-arrow"></b> </a> <b class="arrow"></b>
	</li>
	 
	 
	<%--  三级菜单 --%>
		<li class="thirdMenu-temple" style="display: none;"><a href="#" id="menu-text"> <i class="menu-icon fa fa-leaf green"></i> <%--  三级菜单 --%> </a> <b class="arrow"></b></li>



<!-- /.nav-list -->