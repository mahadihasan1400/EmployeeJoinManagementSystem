<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<input id="id" name="id" value="${company.id}" type="hidden"
	class="form-control" />
<div class="form-group">
	<label for="name" class="col-sm-2 control-label"> <strong>
			Company Name <span style="color: red">*</span>:
	</strong>
	</label>
	<div class="col-sm-6">
		<input id="name" name="name" value="${company.name}"
			class="form-control" />
	</div>
</div>

<div class="form-group">
	<label for="address" class="col-sm-2 control-label"> <strong>
			Company Address <span style="color: red">*</span>: </strong>
	</label>
	<div class="col-sm-6">
		<textarea class="form-control" id="address" name="address">${company.address}</textarea>
	</div>
</div>

<div class="form-group">
	<label for="email" class="col-sm-2 control-label"> <strong>
			Company Email <span style="color: red">*</span>: </strong>
	</label>
	<div class="col-sm-6">
		<input id="email" name="email" value="${company.email}" type="email"
			class="form-control" />
	</div>
</div>

<div class="form-group">
	<label for="phone" class="col-sm-2 control-label"> <strong>
			Phone <span style="color: red">*</span>: </strong>
	</label>
	<div class="col-sm-6">
		<input id="phone" name="phone" value="${company.phone}" type="text"
			class="form-control" />
	</div>
</div>

<div class="form-group">
	<label for="companyKeyword" class="col-sm-2 control-label"> <strong>
			Company Keyword <span style="color: red">*</span>: </strong>
	</label>
	<div class="col-sm-6">
		<c:choose>
			<c:when test="${edit eq '1'}">
				<input id="companyKeyword" name="companyKeyword" style="text-transform: uppercase;"
					value="${company.companyKeyword}" type="text" class="form-control" />
				<span class="companyKeyword_valid_err" style="color: red"></span>
				<input type="hidden" value="0" id="companyKeywordAlready">
			</c:when>
			<c:otherwise>
				<input id="companyKeyword" name="companyKeyword" readonly="readonly"
					value="${company.companyKeyword}" type="text" class="form-control" />
				<span class="companyKeyword_valid_err" style="color: red"></span>
				<input type="hidden" value="0" id="companyKeywordAlready">
			</c:otherwise>
		</c:choose>

	</div>
</div>

<div class="form-group">
	<label for="website" class="col-sm-2 control-label"> <strong>
			Web-Site : </strong>
	</label>
	<div class="col-sm-6">
		<input id="website" name="website" value="${company.website}"
			type="text" class="form-control" />
	</div>
</div>

<div class="form-group">
	<label for="status" class="col-sm-2 control-label"> <strong>
			Status <span style="color: red">*</span>: </strong>
	</label>
	<div class="col-sm-6">
		<c:choose>
			<c:when test="${edit}">
				<c:choose>
					<c:when test="${company.status eq '1'}">
						<input type="radio" name="status" id="status" value="1"
							checked="checked">Active
						<input type="radio" name="status" id="status" value="0">InActive
					</c:when>
					<c:otherwise>
						<input type="radio" name="status" id="status" value="0"
							checked="checked">InActive
						<input type="radio" name="status" id="status" value="1">Active						
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
				<input type="radio" name="status" id="status" value="1"
					checked="checked">Active
				<input type="radio" name="status" id="status" value="0">InActive
			</c:otherwise>
		</c:choose>
	</div>
</div>

<div class="form-group">
	<label for="companyLogo" class="col-sm-2 control-label"> <strong>
			Company Logo : </strong>
	</label>
	<div class="col-sm-6">
		<input type="hidden" value="" id="imageUplodable" name="companyLogo">
		<input id="companyLogo" type="file" name="file"
			class="image-upload form-control" />
		<div class="images">
			<c:if test="${edit}">
				<img width="200" height="150"
					src="${pageContext.request.contextPath}/companyLogo/${company.companyKeyword}">
			</c:if>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		$(".image-upload").ImageResize({
			maxWidth : 200,
			onImageResized : function(imageData) {
				$(".images").html($("<img/>", {
					src : imageData
				}));
				//console.log(imageData)
				$("#imageUplodable").val(imageData);
			}
		});
	});
	$(function() {
		$('#companyKeyword').on("change",function() {
			jQuery.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/checkUnicKcompanyKeyword",
				dataType : 'json',
				data : {
					companyKeyword : $(
							'#companyKeyword').val()
				},
				success : function(res) {
					if (res.companyInfo != null) {
						$('#companyKeywordAlready')
								.val(1);
						$(".companyKeyword_valid_err")
								.text(
										"Company Keyword Already in Use.");
					} else {
						$(".companyKeyword_valid_err")
								.text("");
						$('#companyKeywordAlready')
								.val(0);
					}
				}
			});
		});

		$('.req-save-update-btn').on("click",function(e) {
			if ($('#companyKeywordAlready').val() == 1) {
				e.preventDefault();
				$(".companyKeyword_valid_err")
						.text(
								"Keyword  Already in Use Please try another one.");
			} else {
				$(".companyKeyword_valid_err").text("");
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
				name : "required",
				address : "required",
				email : {
					required : true,
					email : true
				},
				phone : "required",
				status : "required",
				companyKeyword : "required",

			},

			// Make sure the form is submitted to the destination defined
			// in the "action" attribute of the form when valid
			submitHandler : function(form) {
				form.submit();
			}
		});
	});
</script>