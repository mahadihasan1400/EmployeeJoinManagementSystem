<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3" style="margin-top: 100px">
			<a href="addDistrict" class="btn btn-success"
				style="margin-bottom: 20px">Add District</a>
			<table class="table table-bordered">
				<tr>
					<th>District Name</th>
					<th>Action</th>
				</tr>
				<c:forEach var="tempDistrict" items="${districts}">

					<c:url var="updateLink" value="/showFormForUpdateDistricts">
						<c:param name="districtId" value="${tempDistrict.id}" />
					</c:url>

					<c:url var="deleteLink" value="/deleteDistrict">
						<c:param name="districtId" value="${tempDistrict.id}" />
					</c:url>
					
					<tr>
						<td>${tempDistrict.name}</td>
						<td><a href="${updateLink}">Update</a> || 
						
						<a href="${deleteLink}"
							onclick="if (!(confirm('Are you sure you want to delete this District?'))) return false">Delete</a>

						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>














