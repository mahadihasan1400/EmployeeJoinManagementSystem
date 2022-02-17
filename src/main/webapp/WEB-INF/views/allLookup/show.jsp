<div class="content-wrapper"  style="margin:0px;">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>All Lookup Detail</h1>
		<ul class="top-links">
			<li><a class="btn btn-block btn-primary btn-xs" href="${pageContext.request.contextPath}/allLookupList.do"><i
					class="fa fa-reorder"></i>All Lookup List</a></li>
			<li><a class="btn btn-block btn-primary btn-xs" href="${pageContext.request.contextPath}/allLookupForm.do"><i
					class="fa fa-plus"></i>Add new All Lookup</a></li>

			<li><a class="btn btn-block btn-warning btn-xs" href="${pageContext.request.contextPath}/allLookupEdit.do?id=${role.id}"><i class="fa fa-fw fa-edit"></i>Edit</a></li>
			<li><a class="btn btn-block btn-danger btn-xs" href="${pageContext.request.contextPath}/allLookupRemove.do"
				id="${role.id}"
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
						<h3 class="box-title">All Lookup Detail View</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body no-padding">
						<table class="table table-striped">
							<c:if test="${!empty role.id}">
								<tr>
									<th>Role Title</th>
									<td>${role.role}</td>
								</tr>
							</c:if>
							<c:if test="${!empty role.createdBy}">
								<tr>
									<th>Created By</th>
									<td>${role.createdBy.name}</td>
								</tr>
							</c:if>
							
							<c:if test="${!empty role.createdDate}">
								<tr>
									<th>Created By</th>
									<td>${role.createdDate}</td>
								</tr>
							</c:if>
							<c:if test="${!empty role.modifiedBy}">
								<tr>
									<th>Modified By</th>
									<td>${role.modifiedBy.name}</td>
								</tr>
							</c:if>
							
							<c:if test="${!empty role.modifiedDate}">
								<tr>
									<th>Modified Date</th>
									<td>${role.modifiedDate}</td>
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