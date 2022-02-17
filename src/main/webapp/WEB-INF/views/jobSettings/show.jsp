<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="content-wrapper"  style="margin:0px;">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Job Settings Detail</h1>
		<ul class="top-links">
			<li><a class="btn btn-block btn-primary btn-xs" href="${pageContext.request.contextPath}/jobSettingsList"><i
					class="fa fa-reorder"></i>Job Settings List</a></li>
			<li><a class="btn btn-block btn-primary btn-xs" href="${pageContext.request.contextPath}/newJobSettingsForm"><i
					class="fa fa-plus"></i>Add new Job Settings</a></li>

			<li><a class="btn btn-block btn-warning btn-xs" href="${pageContext.request.contextPath}/editJobSettings/${jobSettings.id}"><i class="fa fa-fw fa-edit"></i>Edit</a></li>
			<li><a class="btn btn-block btn-danger btn-xs" href="${pageContext.request.contextPath}/deleteJobSettings/${jobSettings.id}"
				id="${jobSettings.id}"
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
						<h3 class="box-title">Job Settings Detail View</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body no-padding">
						<table class="table table-striped">
							<c:if test="${!empty jobSettings.stage}">
								<tr>
									<th>Stage</th>
									<td>${jobSettings.stage}</td>
								</tr>
							</c:if>
							
							<c:if test="${!empty jobSettings.btnText}">
								<tr>
									<th>Button Text</th>
									<td>${jobSettings.btnText}</td>
								</tr>
							</c:if>
							
							<c:if test="${!empty jobSettings.btnIcon}">
								<tr>
									<th>Button Icon</th>
									<td><i class="${jobSettings.btnIcon}"></i> ${jobSettings.btnIcon}</td>
								</tr>
							</c:if>
							
							<c:if test="${!empty jobSettings.btnColor}">
								<tr>
									<th>Button Color</th>
									<td><span class="${jobSettings.btnColor}"> ${jobSettings.btnColor} </span></td>
								</tr>
							</c:if>
							
							<c:if test="${!empty jobSettings.btnText}">
								<tr>
									<th>Actual Button</th>
									<td><span class="${jobSettings.btnColor}"><i class="${jobSettings.btnIcon}"></i> ${jobSettings.btnText} </span></td>
								</tr>
							</c:if>
							
							<c:if test="${!empty jobSettings.viewText}">
								<tr>
									<th>View Text</th>
									<td>${jobSettings.viewText}</td>
								</tr>
							</c:if>
							
							<c:if test="${!empty jobSettings.amountFlag}">
								<tr>
									<th>Amount Input Type</th>
									<td>${jobSettings.amountFlag == 0?'NOTHING':jobSettings.amountFlag == 1?'UPDATE':'DUE AMOUNT'}</td>
								</tr>
							</c:if>
							
							<c:if test="${!empty jobSettings.isRjtResonMandatory}">
								<tr>
									<th>Is Reject Reason Mandatory?</th>
									<td>${jobSettings.isRjtResonMandatory == 0?'NO':'YES'}</td>
								</tr>
							</c:if>
							
							<c:if test="${!empty jobSettings.rjtRemoveBtnStatus}">
								<tr>
									<th>Reject/Remove Button</th>
									<td>${jobSettings.rjtRemoveBtnStatus == 0?'NOTHING':jobSettings.rjtRemoveBtnStatus == 1?'DELETE':'REJECT'}</td>
								</tr>
							</c:if>
							
							<c:if test="${!empty jobSettings.forwardStage.stage}">
								<tr>
									<th>Forward After Rejected</th>
									<td>${jobSettings.forwardStage.stage}</td>
								</tr>
							</c:if>
							
							<c:if test="${!empty jobSettings.status}">
								<tr>
									<th>Current Status</th>
									<td>${jobSettings.status == 0?'INACTIVE':'ACTIVE'}</td>
								</tr>
							</c:if>
							
							<c:if test="${!empty jobSettings.remarks}">
								<tr>
									<th>Remarks</th>
									<td>${jobSettings.remarks}</td>
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