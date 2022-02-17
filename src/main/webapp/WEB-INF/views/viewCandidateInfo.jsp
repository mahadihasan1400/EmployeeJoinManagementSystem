<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3" style="margin-top: 100px">

			<h1>General Info</h1>
			<br>

			<table
				class="table table-bordered table-striped table-hover table-dark">

				<tr>
					<th>ID:</th>
					<td>${singleCandidateInfo.id}</td>
				</tr>

				<tr>
					<th>Name:</th>
					<td>${singleCandidateInfo.name}</td>
				</tr>

				<tr>
					<th>Email:</th>
					<td>${singleCandidateInfo.email}</td>
				</tr>

				<tr>
					<th>Phone Number:</th>
					<td>${singleCandidateInfo.phn}</td>
				</tr>

				<tr>
					<th>Present Address:</th>
					<td>${singleCandidateInfo.presentAdd}</td>
				</tr>

				<tr>
					<th>Permanent Address:</th>
					<td>${singleCandidateInfo.permanentAdd}</td>
				</tr>

				<tr>
					<th>Father Name:</th>
					<td>${singleCandidateInfo.fatherName}</td>
				</tr>

				<tr>
					<th>Mother Name:</th>
					<td>${singleCandidateInfo.motherName}</td>
				</tr>

				<tr>
					<th>NID NO:</th>
					<td>${singleCandidateInfo.nidNo}</td>
				</tr>

				<tr>
					<th>Passport NO:</th>
					<td>${singleCandidateInfo.passNo}</td>
				</tr>

				<tr>
					<th>Image</th>
					<td><img width="100px" height="100px"
						src="${pageContext.request.contextPath}/photo/${singleCandidateInfo.personImagePath}" /></td>
				</tr>

			</table>
			<br>
			<hr />

			<h1>Academic Info & Document</h1>
			<br>

			<table
				class="table table-bordered table-striped table-hover table-dark">

				<tr>
					<th>Degree Name</th>
					<th>Institute Name</th>
					<th>Grade</th>
					<th>Passing Year</th>
					<th>District</th>
					<th>Thana</th>
					<th>Action</th>

				</tr>


				<c:forEach var="tempacademicHistory" items="${listacademicHistory}">
					<tr>
						<td>${tempacademicHistory.degreeName}</td>
						<td>${tempacademicHistory.instituteName}</td>
						<td>${tempacademicHistory.grade}</td>
						<td>${tempacademicHistory.passingYear}</td>
						<td>${tempacademicHistory.district.name}</td>
						<td>${tempacademicHistory.thana.name}</td>

						<td><a
							href="viewAcademicInfoDetails?id=${tempacademicHistory.id}"><i
								class="fas fa-file-alt" aria-hidden="true" title="View Document"></i></a></td>
					</tr>
				</c:forEach>

			</table>

			<br>
			<hr />

			<h1>Other Degrees</h1>
			<br>

			<table
				class="table table-bordered table-striped table-hover table-dark">

				<tr>
					<th>Other Degrees:</th>
					<td>${otherDegrees.degreeInfos}</td>
				</tr>

			</table>




			<br>
			<hr />

			<h1>Employment Info & Document</h1>
			<br>


			<table
				class="table table-bordered table-striped table-hover table-dark">

				<tr>
					<th>Company Name</th>
					<th>Department</th>
					<th>Designation</th>
					<th>Address</th>
					<th>District</th>
					<th>Thana</th>
					<th>Year Of exp</th>
					<th>Action</th>

				</tr>


				<c:forEach var="tempEmployementHistory"
					items="${listemploymentHistory}">
					<tr>
						<td>${tempEmployementHistory.companyName}</td>
						<td>${tempEmployementHistory.department}</td>
						<td>${tempEmployementHistory.designation}</td>
						<td>${tempEmployementHistory.address}</td>
						<td>${tempEmployementHistory.district.name}</td>
						<td>${tempEmployementHistory.thana.name}</td>
						<td>${tempEmployementHistory.yearOfExp}</td>

						<td><a
							href="viewEmploymentInfoDetails?id=${tempEmployementHistory.id}"><i
								class="fas fa-file-alt" aria-hidden="true" title="View Document"></i></a></td>
					</tr>
				</c:forEach>








			</table>


			<br>
			<hr />

			<h1>Applied Department</h1>
			<br>
			<table
				class="table table-bordered table-striped table-hover table-dark">

				<tr>
					<th>Id</th>
					<th>Department</th>
				</tr>

				<c:forEach var="tempDepartmentHistory"
					items="${listDepartmentHistory}">
					<tr>

						<td>${tempDepartmentHistory.id}</td>
						<td>${tempDepartmentHistory.name}</td>
					</tr>
				</c:forEach>
			</table>
			
			<br>
			<hr />
			<a href="reqReport?id=${singleCandidateInfo.id}" class="btn btn-success">Approved & Download Document</a>


		</div>
	</div>
</div>














