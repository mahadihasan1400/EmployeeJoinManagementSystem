<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3" style="margin-top: 100px">
			<a href="addDepartment" class="btn btn-success"
				style="margin-bottom: 20px">Add Department</a>
			<table class="table table-bordered">
				<tr>
					<th>Department Name</th>
					<th>Action</th>
				</tr>
				<c:forEach var="tempDepartment" items="${departments}">

					<c:url var="updateLink" value="/showFormForUpdateDepartment">
						<c:param name="departmentId" value="${tempDepartment.id}" />
					</c:url>

					<c:url var="deleteLink" value="/deleteDepartment">
						<c:param name="departmentId" value="${tempDepartment.id}" />
					</c:url>

					<tr>
						<td>${tempDepartment.name}</td>
						<td><a href="${updateLink}">Update</a> || 
						
						<a href="${deleteLink}"
							onclick="if (!(confirm('Are you sure you want to delete this Department?'))) return false">Delete</a>

						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>














