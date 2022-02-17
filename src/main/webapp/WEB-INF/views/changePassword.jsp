<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	
<script src="resource/tabs/jquery-ui.js"></script> 
<link href="resource/tabs/jquery-ui.css" rel="stylesheet">

<script>
	$(document)
			.ready(
					function() {
						var contextPath = $('#contextPath').val();
						$("#changePassword")
								.click(
										function() {
											$("#changePassword").prop(
													"disabled", true);
											var result = false;
											var loginUserId = $('#loginUserId')
													.val();
											var oldPassword = $('#oldPassword')
													.val();
											var newPassword = $('#newPassword')
													.val();
											var reTypeNewPassword = $(
													'#reTypeNewPassword').val();
											var existingPassword = $(
													'#existingPassword').val();

											if (oldPassword == ''
													|| newPassword == ''
													|| reTypeNewPassword == '') {
												result = false;
												$('#oldPassword').val("");
												$('#newPassword').val("");
												$('#reTypeNewPassword').val("");
												
												$("#changePassword").prop(
														"disabled", false);
												w2alert('Please Fillup all the Password Field Correctly...');
												
												
												return;
											} else {
												if (existingPassword == oldPassword) {
													if (newPassword == reTypeNewPassword) {
														result = true;
													} else {
														result = false;
														$("#changePassword").prop(
																"disabled", false);
														$('#oldPassword').val("");
														$('#newPassword').val("");
														$('#reTypeNewPassword').val("");
														w2alert('Your New Password and Re-type does not Match....');
														return;
													}
												} else {
													result = false;
													$('#oldPassword').val("");
													$('#newPassword').val("");
													$('#reTypeNewPassword').val("");
													$("#changePassword").prop(
															"disabled", false);
													w2alert('Your Old Password does not Match....');
													
													return;
												}
											}

											if (result) {
												$("#changePassword").prop(
														"disabled", true);
												var path = contextPath
														+ "/updatePassword";

												var param = {
													password : newPassword,
													id : loginUserId
												}
												postSubmit(path, param, 'POST');
											} else {
												$('#oldPassword').val("");
												$('#newPassword').val("");
												$('#reTypeNewPassword').val("");
												$("#changePassword").prop(
														"disabled", false);
												$("#changePassword").prop(
														"disabled", false);
												return;
											}

										});

					});

	function postSubmit(path, params, method) {
		method = method || "POST";
		var form = document.createElement("form");
		form.setAttribute("method", method);
		form.setAttribute("action", path);
		form.setAttribute("id", "nazdaq415");
		for ( var key in params) {
			if (params.hasOwnProperty(key)) {
				var hiddenField = document.createElement("input");
				hiddenField.setAttribute("type", "hidden");
				hiddenField.setAttribute("name", key);
				hiddenField.setAttribute("value", params[key]);

				form.appendChild(hiddenField);
			}
		}
		document.body.appendChild(form);
		form.submit();
		$("#nazdaq415").remove();
	}
</script>

<div class="content-wrapper" style="margin: 0px;">
	<section class="content-header">
		<h1>Change Password</h1>
	</section>
<hr>
	<script>
		$(function() {
			$("#tabs").tabs();
		});
	</script>

	<!-- Main content -->
	<section class="content">
	<hr>
		<div class="row">
			<div class="col-xs-12">
				<form:form cssClass="form-horizontal" class="form-horizontal">

								<div class="form-group">
									<label class="col-xs-2 control-label">Old Password:</label>
									<div class="col-xs-5">
										<input type="hidden" value="${loginUser.password}" id="existingPassword"/>		
										<input type="hidden" value="${loginUser.id}" id="loginUserId"/>	
										<input type="password" value="" placeholder="Old Password" class="form-control" id="oldPassword" required/>									
									</div>
								</div>

								<div class="form-group">
									<label class="col-xs-2 control-label">New Password:</label>
									<div class="col-xs-5">
										<input type="password" value="" placeholder="New Password" class="form-control" id="newPassword" required/>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-xs-2 control-label">Re-type New Password:</label>
									<div class="col-xs-5">
										<input type="password" value="" placeholder="Re-Type New Password" class="form-control" id="reTypeNewPassword" required/>
									</div>
								</div>

								<div class="form-group">
									<div class="col-lg-offset-2 col-sm-1 col-xs-4" id="">
										<button id="changePassword" class="btn btn-sm btn-primary"> Update Password </button> 
										
									</div>
									<div class="col-sm-offset-1 col-sm-1 col-xs-4">
										<a href="${pageContext.request.contextPath}/"
											class="btn btn-danger">Not Now</a>
									</div>
								</div>
							</form:form>				
			</div>
		</div>
		
		<script type="text/javascript">
			$(document).ready(function() {
				$('#table_id_1').DataTable({
					"aoColumnDefs" : [ {
						"sClass" : "my_class",
						"aTargets" : [ 0 ]
					} ]
				});
			});
			
			$(document).ready(function() {
				$('#table_id_2').DataTable({
					"aoColumnDefs" : [ {
						"sClass" : "my_class",
						"aTargets" : [ 0 ]
					} ]
				});
			});
			
			$(document).ready(function() {
				$('#table_id_3').DataTable({
					"aoColumnDefs" : [ {
						"sClass" : "my_class",
						"aTargets" : [ 0 ]
					} ]
				});
			});

			$(document).ready(function() {
				$("#collapseBtn").click(function() {
					$('#collapseIcn').toggleClass('fa-plus fa-minus');
					$(this).toggleClass('btn-info btn-warning');
				});
			});
		</script>

	</section>
	<!-- /.content -->
</div>