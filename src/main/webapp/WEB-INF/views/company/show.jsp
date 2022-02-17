<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="content-wrapper"  style="margin:0px;">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Company Detail</h1>
		<ul class="top-links">
			<li><a class="btn btn-block btn-primary btn-xs" href="${pageContext.request.contextPath}/companyList"><i
					class="fa fa-reorder"></i>Company List</a></li>
			<li><a class="btn btn-block btn-primary btn-xs" href="${pageContext.request.contextPath}/newCompanyForm"><i
					class="fa fa-plus"></i>Add new Company</a></li>

			<li><a class="btn btn-block btn-warning btn-xs" href="${pageContext.request.contextPath}/editCompany/${company.id}"><i class="fa fa-fw fa-edit"></i>Edit</a></li>
			<li><a class="btn btn-block btn-danger btn-xs" href="${pageContext.request.contextPath}/deleteCompany/${company.id}"
				id="${company.id}"
				onclick="return confirm('Are you sure you want to delete this record?');"><i
					class="fa fa-trash"></i>Delete</a></li>
		</ul>
	</section>

	<!-- Main content -->
	<section class="content">

		<div class="row">
			<div class="col-xs-12">

				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">Company Detail View</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body no-padding">
						<table class="table table-striped">
							<c:if test="${!empty company.name}">
								<tr>
									<th>Company Name</th>
									<td>${company.name}</td>
								</tr>
							</c:if>
							<c:if test="${!empty company.companyKeyword}">
								<tr>
									<th>Company Keyword</th>
									<td>${company.companyKeyword}</td>
								</tr>
							</c:if>
							<c:if test="${!empty company.address}">
								<tr>
									<th>Company Address</th>
									<td>${company.address}</td>
								</tr>
							</c:if>
							<c:if test="${!empty company.phone}">
								<tr>
									<th>Phone</th>
									<td>${company.phone}</td>
								</tr>
							</c:if>
							
							<c:if test="${!empty company.email}">
								<tr>
									<th>Email</th>
									<td>${company.email}</td>
								</tr>
							</c:if>
							
							<c:if test="${!empty company.website}">
								<tr>
									<th>Website</th>
									<td>${company.website}</td>
								</tr>
							</c:if>
							
							<c:if test="${!empty company.status}">
								<tr>
									<th>Status</th>
									<td> <c:out value="${company.status == '1' ? 'Active' : 'Inactive'}" /></td>
								</tr>
							</c:if>
							<c:if test="${!empty company.createdBy}">
								<tr>
									<th>Created By</th>
									<td>${company.createdBy}</td>
								</tr>
							</c:if>
							
							<c:if test="${!empty company.createdDate}">
								<tr>
									<th>Created By</th>
									<td><fmt:formatDate pattern = "dd-MM-yyyy hh:mm:ss a" value = "${company.createdDate}" /></td>
								</tr>
							</c:if>
							<c:if test="${!empty company.modifiedBy}">
								<tr>
									<th>Modified By</th>
									<td>${company.modifiedBy}</td>
								</tr>
							</c:if>
							
							<c:if test="${!empty company.modifiedDate}">
								<tr>
									<th>Modified Date</th>
									<td><fmt:formatDate pattern = "dd-MM-yyyy hh:mm:ss a" value = "${company.modifiedDate}" /></td>
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