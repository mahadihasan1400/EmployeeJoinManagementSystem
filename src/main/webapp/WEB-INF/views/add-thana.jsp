<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3" style="margin-top: 50px">

			<form:form action="saveThana" modelAttribute="thana" method="POST"
				name="editThanaForm">
				
				<form:hidden path="id" />
				
				<div class="form-group">
					<label for="exampleInputDistrict">Choose District:</label>

					<form:select path="districtId" cssClass="form-control">
						<form:options items="${districtList}" />
					</form:select>
				</div>


				<div class="form-group">
					<label for="exampleInputThana">Thana Name:</label>
					<form:input path="name" cssClass="form-control" />
				</div>

				<button type="submit" class="btn btn-success">Save</button>
			</form:form>
		</div>
	</div>
</div>

<script>
	document.forms['editThanaForm'].elements['districtId'].value = '${thana.district.id}'
</script>
