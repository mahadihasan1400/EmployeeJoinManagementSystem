<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3" style="margin-top: 100px">


			<h1>Document Details</h1>
			<br>

			<table
				class="table table-bordered table-striped table-hover table-dark">

				<tr>
					<th>Id</th>
					<th>Document Name</th>
					<th>Preview</th>
					<th>Action</th>
				</tr>


				<c:forEach var="tempEmploymentDoc" items="${listEmploymentDoc}">
					<tr>
						<td>${tempEmploymentDoc.id}</td>
						<td>${tempEmploymentDoc.docPath}</td>
						<td><img width="100px" height="100px"
							src="${pageContext.request.contextPath}/photo/${tempEmploymentDoc.docPath}" /></td>


						<td><a
							href="${pageContext.request.contextPath}/photo/${tempEmploymentDoc.docPath}"
							download> <i class="fas fa-download" aria-hidden="true"
								title="Download Document"></i>


						</a></td>
					</tr>
				</c:forEach>

			</table>

		</div>
	</div>
</div>














