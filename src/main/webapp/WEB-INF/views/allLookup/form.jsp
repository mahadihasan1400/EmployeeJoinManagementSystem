
<div class="form-group">
	<label for="name" class="col-sm-2 control-label"> <strong>
			Role Name : </strong>
	</label>
	<div class="col-sm-6">
		<input id="name" name="role" value="${role.role}" class="form-control" />
	</div>
</div>

<%-- <div class="form-group">
	<label for="name" class="col-sm-2 control-label"> <strong>
			Name : </strong> <span class="required-indicator">*</span>
	</label>
	<div class="col-sm-6">
		<input id="name" name="name" value="" class="form-control" />
	</div>
</div>

<div class="form-group">
	<label for="name" class="col-sm-2 control-label"> <strong>
			Select : </strong>
	</label>
	<div class="col-sm-6">
		<!-- <select class="form-control">
									<option value="NONE" label="--- Select ---" />
									<option value="1" label="BD" />
									<option value="2" label="UK" />
									</select> -->
		<form:select path="country" items="${country}" cssClass="form-control" />
	</div>
</div> --%>