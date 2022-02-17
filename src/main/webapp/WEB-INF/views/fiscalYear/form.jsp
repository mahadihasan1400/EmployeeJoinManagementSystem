<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<input id="id" name="id" value="${fiscalYear.id}" type="hidden"
	class="form-control" />
<div class="form-group">
	<label for="name" class="col-sm-2 control-label"> <strong>
			Name :
	</strong>
	</label>
	<div class="col-sm-6">
		<input id="name" disabled="disabled" readonly="readonly" value="${fiscalYear.name}"
			class="form-control" />
	</div>
</div>

<div class="form-group">
	<label for="fromDate"  title="format: DD-MM-YYYY" class="col-sm-2 control-label"> <strong>
			From Date <span style="color: red">*</span>: </strong>
	</label>
	<div class="col-sm-6">
		<input id="fromDate" name="fromDate" value="${fiscalYear.fromDate}" type="eu-date1" class="form-control" title="format: DD-MM-YYYY"/>
	</div>
</div>

<div class="form-group">
	<label for="toDate" class="col-sm-2 control-label"> <strong>
			To Date <span style="color: red">*</span>: </strong>
	</label>
	<div class="col-sm-6">
		<input id="toDate" name="toDate" value="${fiscalYear.toDate}" type="eu-date2"
			class="form-control" />
	</div>
</div>

<div class="form-group">
	<label for="remarks" class="col-sm-2 control-label"> <strong>Remarks : </strong>
	</label>
	<div class="col-sm-6">
		<textarea class="form-control" id="remarks" name="remarks">${fiscalYear.remarks}</textarea>
	</div>
</div>

<script>

$(function () {
    var month = (new Date()).getMonth() + 1;
    var year  = (new Date()).getFullYear();
    // US Format
    $('input[type=eu-date]').w2field('date',  { format: 'dd-mm-yyyy' });
    
    $('input[type=eu-date1]').w2field('date', { format: 'dd-mm-yyyy', end: $('input[type=eu-date2]') });
    $('input[type=eu-date2]').w2field('date', { format: 'dd-mm-yyyy', start: $('input[type=eu-date1]') });
    
});
    
	$(function() {
		
		$('#fromDate', '#toDate').on("change",function() {
			if($('#fromDate').val().trim().length == 8 && $('#toDate').val().trim().length == 8 ){
				jQuery.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/checkUniquefiscalYear",
					dataType : 'json',
					data : {
						fromDate : $('#fromDate').val(), toDate : $('#toDate').val(), id : $('#id').val()
					},
					success : function(res) {
						if (res.fiscalYearInfo != null) {
							$('#fromDate').val("");
							$('#toDate').val("");
							w2alert("This date range already exists. Please try with right value.");
						} 
					}
				});
			}
			
		});

		
		// Initialize form validation on the registration form.
		// It has the name attribute "registration"
		$("form[name='form']").validate({
			// Specify validation rules
			rules : {
				// The key name on the left side is the name attribute
				// of an input field. Validation rules are defined
				// on the right side
				fromDate : "required",
				toDate : "required"
			},

			// Make sure the form is submitted to the destination defined
			// in the "action" attribute of the form when valid
			submitHandler : function(form) {
				form.submit();
			}
		});
	});
</script>