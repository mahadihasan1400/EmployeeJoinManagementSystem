<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="content-wrapper"  style="margin:0px;">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>My Profile</h1>		
	</section>

	<!-- Main content -->
	<section class="content">

		<div class="row">
			<div class="col-xs-12">

				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">My Profile Detail View</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body no-padding">
						<table class="table table-striped">
							<c:if test="${!empty myProfile.name}">
								<tr>
									<th>PAF Year</th>
									<td>${myProfile.name}</td>
								</tr>
							</c:if>
							
							<c:if test="${!empty myProfile.lxnId}">
								<tr>
									<th>Employee ID</th>
									<td>${myProfile.lxnId}</td>
								</tr>
							</c:if>
							
							
							<c:if test="${!empty myProfile.designation}">
								<tr>
									<th>Designation</th>
									<td>${myProfile.designation}</td>
								</tr>
							</c:if>
							
							<c:if test="${!empty myProfile.department}">
								<tr>
									<th>Department</th>
									<td>${myProfile.department}</td>
								</tr>
							</c:if>
							
							<c:if test="${!empty myProfile.company.name}">
								<tr>
									<th>Company Name</th>
									<td>${myProfile.company.name}</td>
								</tr>
							</c:if>
							
							<c:if test="${!empty myProfile.dateJoined}">
								<tr>
									<th>Date of Joined</th>
									<td>${myProfile.dateJoined}</td>
								</tr>
							</c:if>
							<c:if test="${!empty myProfile.dob}">
								<tr>
									<th>Date of Birth</th>
									<td>${myProfile.dob}</td>
								</tr>
							</c:if>
							
							

						</table>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
		</div>
	</section>
	<!-- /.content -->
</div>