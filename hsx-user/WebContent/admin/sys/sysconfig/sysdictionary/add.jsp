<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="blue bigger">保存</h4>
				</div>
				<div class="modal-body">
					<div class="form-group" style="display: none;">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">ID</label>
						<div class="col-sm-9">
							<input name="id" type="hidden" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-select-3">数据字典类型</label>
						<div class="col-sm-9">
							<select name="dicType" style="width: 159px;" id="form-field-select-3" data-placeholder="Choose a State...">

							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">数据字典名称</label>
						<div class="col-sm-9">
							<input name="dicName" type="text" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">数据字典描述</label>
						<div class="col-sm-9">
							<input name="dicDsc" type="text" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">数据字典URL</label>
						<div class="col-sm-9">
							<input name="dicUrl" type="text" />
						</div>
					</div>
<!-- 					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">数据字典上级</label>
						<div class="col-sm-9">
							<input name="dicParentid" type="text" />
						</div>
					</div> -->
				</div>
				<div class="modal-footer">
					<button class="btn btn-sm" data-dismiss="modal"><i class="ace-icon fa fa-times"></i> 取消</button>
					<button id="submitButton" class="btn btn-sm btn-primary" data-dismiss="modal" onclick="saveSysDictionary()"><i class="ace-icon fa fa-check"></i> 提交</button>
				</div> 	
<script type="text/javascript">
$(function(){
	var datas = urls.selectSysDictionaryTypeListAll;
	datas.type = "POST";
	datas.success = function(res){
		if(res.code == 1){
		  	var html = "";
		  	$.each(res.data,function(i,item){
		  	  	html += "<option value=\""+item.id+"\">"+item.dicName+"</option>";
		  	})
		  	$("select#form-field-select-3").html(html);
		}else{
		  	alert(res.desc);
		}
	}
	Ajax.jsonSync(datas);	  
})
</script>