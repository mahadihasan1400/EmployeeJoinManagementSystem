<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<input id="id" name="id" value="${jobAdvance.id}" type="hidden"
	class="form-control" />


<c:if test="${not empty error}">
	<div class="col-sm-12" id="deletesuccess">
		<div class="alert alert-danger">
			<strong>Error File Upload Failed!</strong> ${error}

		</div>
	</div>
</c:if>

<div class="form-group">
	<label for="jobpointId" class="col-sm-2 control-label"> <strong>Point <span class="red">*</span>:
	</strong>
	</label>
	<div class="col-sm-6">
		<select name="jobpointId" id="jobpointId" class="form-control select-2-field">
			<option value="">Select One</option>
			<c:forEach items="${jobPointList}" var="jobPoint">

				<c:if test="${jobAdvance.jobPoint.id eq jobPoint.id}">
					<option value="${jobPoint.id}" selected="selected">${jobPoint.name} - (${jobPoint.pointKeyword})</option>
				</c:if>
				<c:if test="${jobAdvance.jobPoint.id ne jobPoint.id}">
					<option value="${jobPoint.id}">${jobPoint.name} - (${jobPoint.pointKeyword})</option>
				</c:if>
			</c:forEach>
		</select>

	</div>
</div>

<div class="form-group">
	<label for="isBillable" class="col-sm-2 control-label"> <strong>Billable
			Status <span class="red">*</span>:
	</strong>
	</label>
	<div class="col-sm-6">
		<label class="radio-inline"> <input type="radio"
			name="isBillable" id="isBillable"
			${jobAdvance.isBillable=='1'?'checked':''} value="1">Billable
		</label> <label class="radio-inline"> <input type="radio"
			name="isBillable" id="isBillable"
			${jobAdvance.isBillable=='0'?'checked':''} value="0">Not
			Billable
		</label>

	</div>
</div>

<div class="form-group" id="not_bill_reson_section">
	<label for="notBillableReason" class="col-sm-2 control-label">
		<strong>Reason <span class="red">*</span>:
	</strong>
	</label>
	<div class="col-sm-6">
		<textarea class="form-control" id="notBillableReason"
			name="notBillableReason">${jobAdvance.notBillableReason}</textarea>
	</div>
</div>

<div class="form-group">
	<label for="jobPurpose" class="col-sm-2 control-label"> <strong>Job
			Purpose <span class="red">*</span>:
	</strong>
	</label>
	<div class="col-sm-6">
		<textarea class="form-control" id="jobPurpose" name="jobPurpose">${jobAdvance.jobPurpose}</textarea>
	</div>
</div>

<div class="form-group">
	<label for="jobPurpose" class="col-sm-2 control-label"> <strong>Job
			Type <span class="red">*</span>:
	</strong>
	</label>
	<div class="col-sm-6">
		
  <label class="radio-inline">
      <input type="radio" name="jobType" value="1" ${jobAdvance.jobType eq '1'?'checked':''}>General
    </label>
    <label class="radio-inline">
      <input type="radio" name="jobType" value="2" ${jobAdvance.jobType eq '2'?'checked':''}>Local Travel
    </label>
    <label class="radio-inline">
      <input type="radio" name="jobType" value="3" ${jobAdvance.jobType eq '3'?'checked':''}>OutSider Travel
    </label>
	</div>
</div>
<div id="localTravel_section" style="display:none ">
<div class="form-group" >
	<label for="localTravelId" class="col-sm-2 control-label"> <strong>Local Travel <span class="red">*</span>:
	</strong>
	</label>
	<div class="col-sm-6">
		<select name="localTravelId" id="localTravelId" class="form-control ">
			<option value="">Select One</option>
			<c:forEach items="${localtravelList}" var="localTravel">

				<c:if test="${jobAdvance.localTravel.id eq localTravel.id}">
					<option value="${localTravel.id}" selected="selected">${localTravel.reqUniqueNumber} - (${localTravel.tripPurpose})</option>
				</c:if>
				<c:if test="${jobAdvance.localTravel.id ne localTravel.id}">
					<option value="${localTravel.id}">${localTravel.reqUniqueNumber} - (${localTravel.tripPurpose})</option>
				</c:if>
			</c:forEach>
		</select>

	</div>
</div>
</div>
<div id="outSider_section" style="display: none">
<div class="form-group" >
	<label for="travelId" class="col-sm-2 control-label"> <strong>OutSider Travel <span class="red">*</span>:
	</strong>
	</label>
	<div class="col-sm-6">
		<select name="travelId" id="travelId" class="form-control ">
			<option value="">Select One</option>
			<c:forEach items="${travelList}" var="travel">

				<c:if test="${jobAdvance.travel.id eq travel.id}">
					<option value="${travel.id}" selected="selected">${travel.reqUniqueNumber} - (${travel.tripPurpose})</option>
				</c:if>
				<c:if test="${jobAdvance.travel.id ne travel.id}">
					<option value="${travel.id}">${travel.reqUniqueNumber} - (${travel.tripPurpose})</option>
				</c:if>
			</c:forEach>
		</select>

	</div>
</div>
</div>

<div class="form-group">
	<label for="advAmount" class="col-sm-2 control-label"> <strong>Job
			Amount <span class="red">*</span>:
	</strong>
	</label>
	<div class="col-sm-6">
		<input class="form-control" type="number" id="advAmount"
			value="${jobAdvance.advAmount}" name=advAmount>
	</div>
</div>

<div class="form-group">
	<label for="adjustedWithin" class="col-sm-2 control-label"> <strong>Adjusted Within <span class="red">*</span>:
	</strong>
	</label>
	<div class="col-sm-6">
		<input class="form-control" type="text" id="adjustedWithin"
			value="${jobAdvance.adjustedWithin}" name=adjustedWithin>
	</div>
</div>

<input type="hidden" name="editCheck" value="${edit}">

<c:if test="${!edit}">
	<div class="form-group">
		<label for="files" class="col-sm-2 control-label"> <strong>Documents
				<span class="red">*</span>:
		</strong>
		</label>
		<div class="col-sm-6">
			<input type="file" id="files" name="files" multiple="multiple">
			<label id="file-error" class="error" for="files"></label>
		</div>
	</div>
</c:if>

<div class="form-group">
	<label for="thead" class="col-sm-2 control-label"> <strong>
	</strong>
	</label>
	<div class="col-sm-6">
		<table class="table table-striped">
			<thead id="thead">
				<tr>
					<th>SL NO.</th>
					<th>File Name</th>
				</tr>
			</thead>
			<tbody id="mytable">

			</tbody>
		</table>
	</div>
</div>
<script>
	$(document).ready(function() {
		$('#thead').hide();
		//$('#not_bill_reson_section').hide();
		$('#deletesuccess').delay(3000).fadeOut();
		var valJobType=$('input[name=jobType]:checked').val()
		//alert(valJobType);
		checkradioFiled(valJobType);
		/* if ($('input[name=isBillable]:checked').val() == '1') {
				$('#not_bill_reson_section').hide();
			} else {
				$('#not_bill_reson_section').show();
			} */
	});
	
	$(function() {
		$('.req-save-update-btn').on('click', function(e){
			$('#file-error').text("");
			if(document.getElementById('files').files.length<1){
				$('#file-error').text("Documents must reaquired Please upload your document Here.");
				 e.preventDefault();
			}
		});

		
		$('input[name=jobType]').click(function() {
			var valJobType=$('input[name=jobType]:checked').val()
			//alert(valJobType);
			checkradioFiled(valJobType);
		});

		$('#files').on('change', function() {

			if (this.files.length > 0) {
				$('#thead').show();

			} else {
				$('#thead').hide();
			}
			$('#mytable').empty();
			$('#file-error').text("");
			//$('.req-save-update-btn').
			 $(':input[type="submit"]').prop('disabled', false);
			
			for (var i = 0; i < this.files.length; i++) {
				console.log(this.files[i].name);
				var html = '<tr>';
				html += '<td>' + (i + 1) + '</td>';
				html += '<td>' + this.files[i].name + '</td>';
				html += '</tr>'
				$('#mytable').append(html);
				
				if(!validateFile(getExtension(this.files[i].name))){
					$('#file-error').text("File you enter invalid type.The valid types are jpg,jpeg,png,bmp,pdf");
					$(':input[type="submit"]').prop('disabled', true);
					break;
				}
			}
		});

		
	});
	
	/*$(':input[type="submit"]').on("click",function(e){
		$('#file-error').text("");
		if(document.getElementById('files').files.length<1){
			$('#file-error').text("Documents must reaquired Please upload your document Here.");
			 e.preventDefault();
		}
	});*/
	
	function checkradioFiled(val){
		if(val=='2'){
			$("#localTravel_section").show();
			$("#outSider_section").hide();
		}else if(val=='3'){
			$("#localTravel_section").hide();
			$("#outSider_section").show();
		}else{
			$("#localTravel_section").hide();
			$("#outSider_section").hide();
		}
	}



	function validateFile(ext) {
		var extension=['jpeg','jpg','png','bmp','pdf'];
		var flag=false;
		 $.each(extension,function(i,v){
		     if(ext===v){
		    	 flag=true;
		    	 return false;
		     }
		    })
		    
		    return flag;
	}
	function getExtension(filename) {
	    return filename.split('.').pop().toLowerCase();
	}
</script>
<script>
	$(function() {

		// Initialize form validation on the registration form.
		// It has the name attribute "registration"
		$("form[name='form']").validate({
			// Specify validation rules
			rules : {
				// The key name on the left side is the name attribute
				// of an input field. Validation rules are defined
				// on the right side
				jobPurpose : "required",
				isBillable : "required",
				advAmount : "required",
				jobpointId : "required",
				adjustedWithin : "required",
				jobType : "required",
				localTravelId : "required",
				travelId : "required",
				notBillableReason : {
					required : '#isBillable:checked'
				},
				
									

			},
			

			// Make sure the form is submitted to the destination defined
			// in the "action" attribute of the form when valid
			submitHandler : function(form) {
				form.submit();
			}
		});
	});
	
	$(document).ready(function() {
	    $("#advAmount").keydown(function (e) {
	        // Allow: backspace, delete, tab, escape, enter and .
	        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110]) !== -1 ||
	             // Allow: Ctrl+A, Command+A
	            (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
	             // Allow: home, end, left, right, down, up
	            (e.keyCode >= 35 && e.keyCode <= 40)) {
	                 // let it happen, don't do anything
	                 return;
	        }
	        // Ensure that it is a number and stop the keypress
	        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
	            e.preventDefault();
	        }
	    });
	});
	
	$(document).ready(function() {
		$('.select-2-field').select2();			
	});
</script>