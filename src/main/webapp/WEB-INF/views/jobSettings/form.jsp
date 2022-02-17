<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<input id="id" name="id" value="${jobSettings.id}" type="hidden"
	class="form-control" />
	

<div class="form-group">
	<label for="stage"
		class="col-sm-2 control-label"> <strong> Stage <span
			style="color: red">*</span>:
	</strong>
	</label>
	<div class="col-sm-6">
		<input id="stage" name="stage" value="${jobSettings.stage}"
			type="number" class="form-control"/>
	</div>
</div>

<div class="form-group">
	<label for="rejectToId" class="col-sm-2 control-label"> <strong>
			Reject To : </strong>
	</label>
	<div class="col-sm-6">
		<select id="rejectToId" name="rejectToId" class="form-control">
			<option value="">Select One</option>
			<c:forEach items="${jobSettingsList}" var="jobSet">
				<c:if test="${jobSettings.rejectTo.id eq jobSet.id}">
					<option value="${jobSet.id}" selected="selected">${jobSet.stage}</option>
				</c:if>
				<c:if test="${jobSettings.rejectTo.id ne jobSet.id}">
					<option value="${jobSet.id}">${jobSet.stage}</option>
				</c:if>
			</c:forEach>
		</select>
	</div>
</div>

<div class="form-group">
	<label for="stage"
		class="col-sm-2 control-label"> <strong> Reject Notify Email :
	</strong>
	</label>
	<div class="col-sm-6">
		<input id="rejectedEmailAddress" name="rejectedEmailAddress" value="${jobSettings.rejectedEmailAddress}"
			type="text" class="form-control"/>
	</div>
</div>
<div class="form-group">
	<label for="stage"
		class="col-sm-2 control-label"> <strong> Stage Common Email :
	</strong>
	</label>
	<div class="col-sm-6">
		<input id="emailAddress" name="emailAddress" value="${jobSettings.emailAddress}"
			type="text" class="form-control"/>
	</div>
</div>
<div class="form-group">
	<label for="stage"
		class="col-sm-2 control-label"> <strong> Authentication Role
	</strong>
	</label>
	<div class="col-sm-6">
		<input id="authRole" name="authRole" value="${jobSettings.authRole}"
			type="text" class="form-control"/>
	</div>
</div>

<div class="form-group">
	<label for="forwardStageId" class="col-sm-2 control-label"> <strong>
			Forward Stage : </strong>
	</label>
	<div class="col-sm-6">
		<select id="forwardStageId" name="forwardStageId" class="form-control">
			<option value="">Select One</option>
			<c:forEach items="${jobSettingsList}" var="jobSet">
				<c:if test="${jobSettings.forwardStage.id eq jobSet.id}">
					<option value="${jobSet.id}" selected="selected">${jobSet.stage}</option>
				</c:if>
				<c:if test="${jobSettings.forwardStage.id ne jobSet.id}">
					<option value="${jobSet.id}">${jobSet.stage}</option>
				</c:if>
			</c:forEach>
		</select>
	</div>
</div>
<div class="form-group">
	<label for="btnText"
		class="col-sm-2 control-label"> <strong> Button Text <span
			style="color: red">*</span>:
	</strong>
	</label>
	<div class="col-sm-6">
		<input id="btnText" name="btnText" value="${jobSettings.btnText}"
			type="text" class="form-control"/>
	</div>
</div>

<div class="form-group">
	<label for="btnColor"
		class="col-sm-2 control-label"> <strong> Button color <span
			style="color: red">*</span>:
	</strong>
	</label>
	<div class="col-sm-6">
		<%-- <input id="btnColor" name="btnColor" value="${jobSettings.btnColor}"
			type="text" class="form-control"/> --%>
		<select id="btnColor" name="btnColor" class="form-control">
			<option value="">Select One</option>
			<c:if test="${!empty jobSettings}">
				<option value="${jobSettings.btnColor}" selected="selected">${jobSettings.btnColor}</option>
			</c:if>
				<option value="btn btn-basic btn-xs">Basic</option>
				<option value="btn btn-default btn-xs">Default</option>
				<option value="btn btn-primary btn-xs">Primary</option>
				<option value="btn btn-success btn-xs">Success</option>
				<option value="btn btn-info btn-xs">Info</option>
				<option value="btn btn-warning btn-xs">Warning</option>
				<option value="btn btn-danger btn-xs">Danger</option>	
		</select>
	</div>
</div>

<div class="form-group">
	<label for="btnIcon"
		class="col-sm-2 control-label"> <strong> Button Icon:
	</strong>
	</label>
	<div class="col-sm-6">
		<input id="btnIcon" name="btnIcon" value="${jobSettings.btnIcon}"
			type="text" class="form-control"/>
	</div>
</div>

<div class="form-group">
	<label for="viewText"
		class="col-sm-2 control-label"> <strong> View Text <span
			style="color: red">*</span>:
	</strong>
	</label>
	<div class="col-sm-6">
		<input id="viewText" name="viewText" value="${jobSettings.viewText}"
			type="text" class="form-control"/>
	</div>
</div>

<div class="form-group">
	<label for="isRjtResonMandatory" class="col-sm-2 control-label"> <strong>
			Reject Reason Mandatory<span style="color: red">*</span>? </strong>
	</label>
	<div class="col-sm-6">
		<select id="isRjtResonMandatory" name="isRjtResonMandatory" class="form-control">
			<option value="">Select One</option>
			<c:choose>
				<c:when test="${!empty jobSettings}">
					<c:if test="${jobSettings.isRjtResonMandatory eq '1'}">
						<option value="1" selected="selected">YES</option>
						<option value="0">NO</option>
					</c:if>
					<c:if test="${jobSettings.isRjtResonMandatory ne '1'}">
						<option value="0" selected="selected">NO</option>
						<option value="1">YES</option>
					</c:if>
				</c:when>
				<c:otherwise>
					<option value="1">YES</option>
					<option value="0">NO</option>
				</c:otherwise>
			</c:choose>				
		</select>
	</div>
</div>

<div class="form-group">
	<label for="rjtRemoveBtnStatus " class="col-sm-2 control-label"> <strong>
			Reject/Remove Btn<span style="color: red">*</span>? </strong>
	</label>
	<div class="col-sm-6">
		<select id="rjtRemoveBtnStatus " name="rjtRemoveBtnStatus " class="form-control">
			<option value="">Select One</option>
			<c:choose>
				<c:when test="${!empty jobSettings}">
					<c:if test="${jobSettings.rjtRemoveBtnStatus eq '1'}">						
						<option value="0">NOTHING</option>
						<option value="1" selected="selected">DELETE</option>
						<option value="2">REJECT</option>
					</c:if>
					<c:if test="${jobSettings.rjtRemoveBtnStatus eq '2'}">
						<option value="0">NOTHING</option>
						<option value="1">DELETE</option>
						<option value="2" selected="selected">REJECT</option>
					</c:if>					
					<c:if test="${jobSettings.rjtRemoveBtnStatus eq '0'}">
						<option value="0" selected="selected">NOTHING</option>
						<option value="1">DELETE</option>
						<option value="2">REJECT</option>
					</c:if>
				</c:when>
				<c:otherwise>
					<option value="0">NOTHING</option>
					<option value="1">DELETE</option>
					<option value="2">REJECT</option>
				</c:otherwise>
			</c:choose>				
		</select>
	</div>
</div>

<div class="form-group">
	<label for="amountFlag " class="col-sm-2 control-label"> <strong>
			Amount Input Type <span style="color: red">*</span>: </strong>
	</label>
	<div class="col-sm-6">
		<select id="amountFlag " name="amountFlag " class="form-control">
			<option value="">Select One</option>
			<c:choose>
				<c:when test="${!empty jobSettings}">
					<c:if test="${jobSettings.amountFlag eq '1'}">						
						<option value="0">NOTHING</option>
						<option value="1" selected="selected">UPDATE</option>
						<option value="2">DUE AMOUNT</option>
					</c:if>
					<c:if test="${jobSettings.amountFlag eq '2'}">
						<option value="0">NOTHING</option>
						<option value="1">UPDATE</option>
						<option value="2" selected="selected">DUE AMOUNT</option>
					</c:if>					
					<c:if test="${jobSettings.amountFlag eq '0'}">
						<option value="0" selected="selected">NOTHING</option>
						<option value="1">UPDATE</option>
						<option value="2">DUE AMOUNT</option>
					</c:if>
				</c:when>
				<c:otherwise>
					<option value="0">NOTHING</option>
					<option value="1">UPDATE</option>
					<option value="2">DUE AMOUNT</option>
				</c:otherwise>
			</c:choose>				
		</select>
	</div>
</div>

<div class="form-group">
	<label for="status" class="col-sm-2 control-label"> <strong>
			is Active<span style="color: red">*</span>? </strong>
	</label>
	<div class="col-sm-6">
		<select id="status" name="status" class="form-control">
			<option value="">Select One</option>
			<c:choose>
				<c:when test="${!empty jobSettings}">
					<c:if test="${jobSettings.status eq '1'}">
						<option value="1" selected="selected">YES</option>
						<option value="0">NO</option>
					</c:if>
					<c:if test="${jobSettings.status ne '1'}">
						<option value="0" selected="selected">NO</option>
						<option value="1">YES</option>
					</c:if>
				</c:when>
				<c:otherwise>
					<option value="1">YES</option>
					<option value="0">NO</option>
				</c:otherwise>
			</c:choose>				
		</select>
	</div>
</div>

<div class="form-group">
	<label for="remarks" class="col-sm-2 control-label"> <strong>Remarks
			: </strong>
	</label>
	<div class="col-sm-6">
		<textarea class="form-control" id="remarks" name="remarks">${jobSettings.remarks}</textarea>
	</div>
</div>

<script>
	$(function() {
		var month = (new Date()).getMonth() + 1;
		var year = (new Date()).getFullYear();
		// US Format
		$('input[type=eu-date]').w2field('date', {
			format : 'dd-mm-yyyy'
		});

		$('input[type=eu-date1]').w2field('date', {
			format : 'dd-mm-yyyy',
			end : $('input[type=eu-date2]')
		});
		$('input[type=eu-date2]').w2field('date', {
			format : 'dd-mm-yyyy',
			start : $('input[type=eu-date1]')
		});

	});

	$(function() {

		$('#fromDate', '#toDate')
				.on(
						"change",
						function() {
							if ($('#fromDate').val().trim().length == 8
									&& $('#toDate').val().trim().length == 8) {
								jQuery
										.ajax({
											type : "POST",
											url : "${pageContext.request.contextPath}/checkUniquePafYear",
											dataType : 'json',
											data : {
												fromDate : $('#fromDate').val(),
												toDate : $('#toDate').val(),
												id : $('#id').val()
											},
											success : function(res) {
												if (res.pafYearInfo != null) {
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
				stage : "required",
				btnText : "required",
				viewText : "required",
				btnColor : "required",
				isRjtResonMandatory : "required",
				rjtRemoveBtnStatus : "required",
				status : "required",
				amountFlag : "required",
				
			},

			// Make sure the form is submitted to the destination defined
			// in the "action" attribute of the form when valid
			submitHandler : function(form) {
				form.submit();
			}
		});
	});
</script>