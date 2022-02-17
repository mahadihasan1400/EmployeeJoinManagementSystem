<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<input id="id" name="id" value="${jobSettings.id}" type="hidden"
	class="form-control" />
	

<div class="form-group">
	<label for="fromDate"  title="format: YYYY-MM-DD" class="col-sm-2 control-label"> <strong>
			From Date <span style="color: red">*</span>: </strong>
	</label>
	<div class="col-sm-6">
		<input id="fromDate" name="fromDate" value="" type="eu-date1" class="form-control" title="format: YYYY-MM-DD"/>
	</div>
	
</div>
<div class="form-group">
	
	<label for="toDate" class="col-sm-2 control-label"> <strong>
			To Date <span style="color: red">*</span>: </strong>
	</label>
	<div class="col-sm-6">
		<input id="toDate" name="toDate" value="" type="eu-date2"
			class="form-control" />
	</div>
</div>
<div class="form-group">
	<label for="jobpointId" class="col-sm-2 control-label"> <strong>Point <span class="red"></span>:
	</strong>
	</label>
	<div class="col-sm-6">
		<select name="jobpointId" id="jobpointId" class="form-control select-2-field">
			<option value="">Select One</option>
			<c:forEach items="${jobPointList}" var="jobPoint">
			<option value="${jobPoint.id}" >${jobPoint.name} - (${jobPoint.pointKeyword})</option>

			
			</c:forEach>
		</select>

	</div>
	
</div>

<div class="form-group">
	
	<label for="employeeId" class="col-sm-2 control-label"> <strong>Employee <span class="red"></span>:
	</strong>
	</label>
	<div class="col-sm-6">
		<select name="employeeId" id="employeeId" class="form-control select-2-field">
			<option value="">Select One</option>
			<c:forEach items="${empList}" var="employee">
			<option value="${employee.id}" >${employee.name} - (${employee.lxnId})</option>

			
			</c:forEach>
		</select>

	</div>
</div>
<div class="form-group">
	<label for="isBillable" class="col-sm-2 control-label"> <strong>Billable status <span class="red"></span>:
	</strong>
	</label>
	<div class="col-sm-6">
		<select name="isBillable" id="isBillable" class="form-control">
			<option value="">Select One</option>
			<option value="1">Billable</option>
			<option value="0">Not Billable</option>
			
		</select>

	</div>
	
	
</div>



<script>
	$(function() {
		var month = (new Date()).getMonth() + 1;
		var year = (new Date()).getFullYear();
		// US Format
		$('input[type=eu-date]').w2field('date', {
			format : 'yyyy-mm-dd'
		});

		$('input[type=eu-date1]').w2field('date', {
			format : 'yyyy-mm-dd',
			end : $('input[type=eu-date2]')
		});
		$('input[type=eu-date2]').w2field('date', {
			format : 'yyyy-mm-dd',
			start : $('input[type=eu-date1]')
		});

	});

	$(function() {



		
		// Initialize form validation on the registration form.
		// It has the name attribute "registration"
		$("form[name='form']").validate({
			// Specify validation rules
			rules : {
				// The key name on the left side is the name attribute
				// of an input field. Validation rules are defined
				// on the right side
				fromDate : "required",
				toDate : "required",
				
				
			},

			// Make sure the form is submitted to the destination defined
			// in the "action" attribute of the form when valid
			submitHandler : function(form) {
				form.submit();
			}
		});
	});
	
	$(document).ready(function() {
		$('.select-2-field').select2();			
	});
</script>