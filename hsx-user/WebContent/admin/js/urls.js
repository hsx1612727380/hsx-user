var urls = {
	menuURL : {
		url :  ctx + "/index/init" 
	},
  saveUser:{
    url:ctx+"/user/saveUser"
  },	
	/****************AdminUser start************************/
	addAdminUser : {
	  url : ctx+ "/adminUser/insert"
	},
  selectAdminUserAndSetData:{
    url:ctx+"/adminUser/select"
  },
  deleteAdminUser:{
    url:ctx+"/adminUser/delete"
  },
	selectAdminList:{//管理员列表
	  url : ctx+"/adminUser/selectList"
	},
	//adminuser列表url
	adminUserUrl : ctx+"/adminUser/selectList",
	updateAdminUser:{
	  url:ctx+"/adminUser/update"
	},
	/****************AdminUser end************************/	
	 
	/****************adminUserRole start******************/
	selectAdminUserRoles:{
		url:ctx + "/adminUserRole/selectList"
	},
	
	insertAdminUserRole : {
		url:ctx + "/adminUserRole/insert"
	},
	
	selectListByUserRoles : {
		url:ctx + "/adminUserRole/selectListByUserRoles"
	},
	/****************adminUserRole end******************/
	
	/*****************Menu start*******************/
  saveMenu:{
    url:ctx+"/menu/insert"
  }, 
	selectMenuList:{
    url:ctx+"/menu/selectList"
  },
	updateMenu:{
	  url:ctx+"/menu/update"
	},
	selectMenu:{
	  url:ctx+"/menu/select"
	},
	selectMenuAndSetData:{
	  url:ctx+"/menu/select"
	},
	deleteMenu:{
	  url:ctx+"/menu/delete"
	},
	/*****************Menu end*********************/
	
	/*****************Role start*******************/
//  saveRole:{
//    url : ctx+"/role/insert"
//  },
//	selectRoleList:{
//	  url:ctx+"/role/selectList"
//	},
//	selectRoleAndSetData:{
//	  url:ctx+"/role/select"
//	},
//	updateRole:{
//	  url:ctx+"/role/update"
//	},
//	deleteRole:{
//	  url:ctx+"/role/delete"
//	},
	/*****************Role end*******************/
	
	/*****************SysConfig start*************************/
	selectSysConfigList:{
	  url:ctx+"/sysConfig/selectList"
	},
	saveSysConfig:{
	  url:ctx+"/sysConfig/insert"
	},
	selectSysConfigAndSetData:{
	  url:ctx+"/sysConfig/select"
	},
	updateSysConfig:{
	  url:ctx+"/sysConfig/update"
	},
	deleteSysConfig:{
	  url:ctx+"/sysConfig/delete"
	},
	/*****************SysConfig end*************************/
	
	/*****************SysDictionary start*************************/
	selectSysDictionaryList:{
	  url:ctx+"/sysDictionary/selectList"
	},
	saveSysDictionary:{
	  url:ctx+"/sysDictionary/insert"
	},
	selectSysDictionaryAndSetData:{
	  url:ctx+"/sysDictionary/select"
	},
	updateSysDictionary:{
	  url:ctx+"/sysDictionary/update"
	},
	deleteSysDictionary:{
	  url:ctx+"/sysDictionary/delete"
	},
	/*****************SysDictionary end*************************/
	
	/*****************SysDictionaryType start*******************/
	selectSysDictionaryTypeList:{
	  url:ctx+"/sysDictionaryType/selectList"
	},
	selectSysDictionaryTypeListAll:{
	  url:ctx+"/sysDictionaryType/selectListAll"
	},
	saveSysDictionaryType:{
	  url:ctx+"/sysDictionaryType/insert"
	},
	selectSysDictionaryTypeAndSetData:{
	  url:ctx+"/sysDictionaryType/select"
	},
	updateSysDictionaryType:{
	  url:ctx+"/sysDictionaryType/update"
	},
	deleteSysDictionaryType:{
	  url:ctx+"/sysDictionaryType/delete"
	},
	/*****************SysDictionaryType end*******************/
	
	
/*****************roleAuthority start*******************/
//	 //角色权限
//	//查询所有的角色
//  selectListByPage : {
//	  url : ctx + "/roleAuthority/seleList"
//  },
//  
//  //查询权限；根据roleId查询权限
//  selectListByRole : {
//	  url : ctx + "/roleAuthority/seleListByRoleId"
//  },	
//  
//  //权限新增
//  insert : {
//	  url : ctx + "/roleAuthority/insert"
//  },
  
  /*****************roleAuthority end*******************/
  
  /****************Authority start****************/
//  //查询所有权限
//  selectAuthorityList:{
//    url:ctx+"/authority/selectList"
//  },
//  //分页列表查询所有权限
//  selectListAll:{
//    url:ctx+"/authority/selectListAll"
//  },
//  //保存权限
//  saveAuth:{
//    url:ctx+"/authority/insert"
//  },
//  //根据主键ID查询权限
//  selectAuthAndSetData:{
//    url:ctx+"/authority/select"
//  },
//  //修改权限
//  updateAuth:{
//    url:ctx+"/authority/update"
//  },
//  //根据主键ID删除权限
//  deleteAuth:{
//    url:ctx+"/authority/delete"
//  },
  /*****************Authority end*****************/
  
  /**********************************/
//  //根据权限查询对应的menu
//  selectListByAuth:{
//    url:ctx+"/authorityMenu/selectListByAuth"
//  },
//  //保存权限菜单
//  insertAuthMenu:{
//    url:ctx+"/authorityMenu/insert"
//  },
  /**********************************/
  
  /****************AuthUaer start******************/
//	addAuthUser :{
//		url:ctx + "/auth/insert"
//	},
//	
//	selectAuthUser : {
//		url:ctx + "/auth/select"
//	},
//	
//	deleteAuthUser : {
//		url:ctx + "/auth/delete"
//	},
//	
//	updateAuthUser : {
//		url:ctx + "/auth/update"
//	},
//	
//	selectListAuthUser : {
//		url:ctx + "/auth/selectList"
//	},
	/****************AuthUaer end******************/
	
	/*****************API start********************/
//	selectApiList:{
//	  url:ctx + "/api/selectList"
//	},
//	saveApi:{
//	  url:ctx+"/api/insert"
//	},
//	deleteApi:{
//	  url:ctx+"/api/delete"
//	},
//	updateApi:{
//	  url:ctx+"/api/update"
//	},
	/*****************API end**********************/
	/****************ApiDetail start***************/
//	saveApiDetail:{
//	  url:ctx+"/apiDetail/insert"
//	},
//	selectApiDetail:{
//	  url:ctx+"/apiDetail/selectByApiId"
//	},
//	updateApiDetail:{
//	  url:ctx+"/apiDetail/update"
//	},
	/****************ApiDetail end*****************/
	/****************logout start*****************/
	logout:{
		url:ctx+"/logout/logoutSession"
	}
	/****************logout end*****************/
}