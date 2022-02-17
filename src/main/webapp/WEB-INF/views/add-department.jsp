<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3" style="margin-top: 50px">

			<form:form action="saveDepartment" modelAttribute="department"
				method="POST">


				<!-- need to associate this data with customer id -->
				<form:hidden path="id" />


				<div class="form-group">
					<label for="exampleInputEmail1">Department Name:</label>
					<form:input path="name" cssClass="form-control" />
				</div>

				<button type="submit" class="btn btn-success">Save</button>
			</form:form>
		</div>
	</div>
</div>


