<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="content-wrapper"  style="margin:0px;">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Fiscal Year Detail</h1>
		<ul class="top-links">
			<li><a class="btn btn-block btn-primary btn-xs" href="${pageContext.request.contextPath}/fiscalYearList"><i
					class="fa fa-reorder"></i>Fiscal Year List</a></li>
			<li><a class="btn btn-block btn-primary btn-xs" href="${pageContext.request.contextPath}/newFiscalYearForm"><i
					class="fa fa-plus"></i>Add new Fiscal Year</a></li>

			<li><a class="btn btn-block btn-warning btn-xs" href="${pageContext.request.contextPath}/editFiscalYear/${fiscalYear.id}"><i class="fa fa-fw fa-edit"></i>Edit</a></li>
			<li><a class="btn btn-block btn-danger btn-xs" href="${pageContext.request.contextPath}/deleteFiscalYear/${fiscalYear.id}"
				id="${fiscalYear.id}"
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
						<h3 class="box-title">Fiscal Year Detail View</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body no-padding">
						<table class="table table-striped">
							<c:if test="${!empty fiscalYear.name}">
								<tr>
									<th>PAF Year Name</th>
									<td>${fiscalYear.name}</td>
								</tr>
							</c:if>
							<c:if test="${!empty fiscalYear.fromDate}">
								<tr>
									<th>From Date</th>
									<td>${fiscalYear.fromDate}</td>
								</tr>
							</c:if>
							<c:if test="${!empty fiscalYear.toDate}">
								<tr>
									<th>From Date</th>
									<td>${fiscalYear.toDate}</td>
								</tr>
							</c:if>
							<c:if test="${!empty fiscalYear.remarks}">
								<tr>
									<th>Remarks</th>
									<td>${fiscalYear.remarks}</td>
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