<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="blue bigger">修改信息</h4>
				</div>
				<div class="modal-body">
					<div class="form-group" style="display: none;">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">ID</label>
						<div class="col-sm-9">
							<input name="id" type="hidden">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">姓名</label>
						<div class="col-sm-9">
							<input name="userName" type="text" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">昵称</label>
						<div class="col-sm-9">
							<input name="userNikename" type="text" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">手机</label>
						<div class="col-sm-9">
							<input name="userMobile" type="text" />
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn btn-sm" data-dismiss="modal"><i class="ace-icon fa fa-times"></i> 取消</button>
					<button id="submitButton" class="btn btn-sm btn-primary" data-dismiss="modal" onclick="updateAdminUser(this)"><i class="ace-icon fa fa-check"></i> 提交</button>
				</div> 	
