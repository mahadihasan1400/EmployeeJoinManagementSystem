<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<script src="resource/tabs/jquery-ui.js"></script>
<link href="resource/tabs/jquery-ui.css" rel="stylesheet">

<div class="content-wrapper" style="margin: 0px;">
	<section class="content-header">
		<h1>Concern Dashboard</h1>
	</section>
	<style>
.com_status {
	width: 74px;
}
</style>

	<script>
		$(function() {
			$("#tabs").tabs();
		});
	</script>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-xs-12">

				<div id="tabs">
					<ul>
						<li><a href="#tabs-pending-jobs">Pending Jobs Request</a></li>
						<li><a href="#tabs-approved-jobs">Approved/Forwarded/Submitted Jobs by Me</a></li>
						<li><a href="#tabs-rejected-jobs">Rejected Jobs by Me</a></li>
					</ul>


					<div id="tabs-pending-jobs">
						<div class="box box-primary">
							<div class="box-body table-responsive no-padding">
								<!-- ----------Start table ----------- -->
								<table class="table table-striped display" id="table_id_1">
									<thead>
										<tr style="background-color: #428bca;">
											<th class="text-center">Sl NO.</th>
											<th class="text-center">Job Number</th>
											<th class="text-center">Job Type</th>
											<th class="text-center">Amount</th>
											<th class="text-center">Purpose</th>
											<th class="text-center">Status</th>
											<th class="text-center">Work Flow</th>
											<th class="text-center">Reject Reason</th>
											<th class="text-center">Date</th>

											<th class="text-center">Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${pendingJobList}" var="pendingJob"
											varStatus="tr">
											<tr class="row_no_${tr.count}">
												<td class="text-center" title="Show Job Advance"><a
													href="${pageContext.request.contextPath}/showJobAdvance/${pendingJob.id}">${tr.count}</a>
												</td>
												<td class="text-center">${pendingJob.jobNumber}</td>
												<c:set var="localVarivable" value="Local Travel No:-${pendingJob.localTravel.reqUniqueNumber}-${pendingJob.localTravel.tripPurpose}" />
												<c:set var="outSiderVarivable" value="OutSider Travel No:-${pendingJob.travel.reqUniqueNumber}-${pendingJob.travel.tripPurpose}" />
												<td class="text-center">${pendingJob.jobType eq '1'?'General Job':pendingJob.jobType eq '2'?localVarivable:outSiderVarivable}</td>
												<td class="text-center">${pendingJob.advAmount}</td>
												<td class="text-center">${pendingJob.jobPurpose}</td>
												<td class="text-center"><c:if
														test="${pendingJob.status == '1'}">
														<span class="btn btn-success btn-xs com_status">
															Active </span>
													</c:if> <c:if test="${pendingJob.status == '2'}">
														<span class="btn btn-warning btn-xs com_status">
															Rejected</span>
													</c:if> <c:if test="${pendingJob.status == '3'}">
														<span class="btn btn-info btn-xs com_status">
															Approved </span>
													</c:if></td>
												<td class="text-left"><span style="width: 241px"
													class="${pendingJob.jobSetting.btnColor} ">
														${pendingJob.jobSetting.viewText} </span></td>
												<td class="text-center">${pendingJob.rejectionReason}</td>

												<td class="text-center">${pendingJob.createdDate}</td>

												<td class="text-center"><a class="btn btn-info btn-xs"
													title="Show Job Advance"
													href="${pageContext.request.contextPath}/showJobAdvance/${pendingJob.id}"><i
														class="fa fa-eye" aria-hidden="true"> </i>Show</a> 
														<%-- <a class="btn btn-info btn-xs" title="Show Job Advance" href="${pageContext.request.contextPath}/jobAdvanceReport/${pendingJob.id}">
														<i class="fa fa-eye" aria-hidden="true"> </i>Job Advance History </a> --%> 
														<c:if test="${pendingJob.status == 3 && pendingJob.isDocsDeleted == 0}">
														 | <a class="btn btn-warning btn-xs custom-width"
															title="Download Job Advance Docs"
															href='${pageContext.request.contextPath}/downloadZipFile?id=${pendingJob.id}'
															style="color: white;"><i class="fa fa-download"
															aria-hidden="true"></i>&nbsp;&nbsp; Download Docs</a>
															|
															<a href="${pageContext.request.contextPath}/jobAdvanceReport/${pendingJob.id}" title="Job Advance History"><i class="fa fa-file-pdf-o red" aria-hidden="true"> </i></a>
														    |
														<c:if test="${pendingJob.jobType eq '3'}">
														<a href="${pageContext.request.contextPath}/downloadRequisition?id=${pendingJob.travel.id}" title="Travel Doc"><i class="fa fa-file-pdf-o green" aria-hidden="true"> </i></a>
														
														</c:if>
															
													</c:if></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<!-- ----------End Table ------------- -->
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>
<div id="tabs-approved-jobs">
						<div class="box box-primary">
							<div class="box-body table-responsive no-padding">
								<!-- ----------Start table ----------- -->
								<table class="table table-striped display" id="table_id_1">
									<thead>
										<tr style="background-color: #428bca;">
											<th class="text-center">Sl NO.</th>
											<th class="text-center">Job ID</th>
											<th class="text-center">Requester Info</th>
											<th class="text-center">Amount</th>
											<th class="text-center">Purpose</th>											
											<th class="text-center">Work Flow</th>
											
											<th class="text-center">Date</th>

											
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${concenApprovvedList}" var="approvedJob"
											varStatus="tr">
											<tr class="row_no_${tr.count}">
											   <td>${tr.count}</td>
												<td class="text-center" title="Show Job Advance"><a
													href="${pageContext.request.contextPath}/showJobAdvance/${approvedJob.jobAdvance.id}">${tr.count}</a>
												</td>
												<td class="text-center">${approvedJob.jobAdvance.employee.name}(${approvedJob.jobAdvance.employee.lxnId})</td>
											
												<td class="text-center">${approvedJob.advAmount}</td>
												<td class="text-center">${approvedJob.jobAdvance.jobPurpose}</td>
												<td class="text-center">${approvedJob.jobSettings.btnText}${approvedJob.jobSettings.btnText=='Submit'?'ted':approvedJob.jobSettings.btnText=='Approve'?'d':'ed'}</td>
												
												<td class="text-center">${approvedJob.createdDate}</td>

												
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<!-- ----------End Table ------------- -->
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>
					<div id="tabs-rejected-jobs">
						<div class="box box-primary">
							<div class="box-body table-responsive no-padding">
								<!-- ----------Start table ----------- -->
								<table class="table table-striped display" id="table_id_1">
									<thead>
										<tr style="background-color: #428bca;">
											<th class="text-center">Sl NO.</th>
											<th class="text-center">Job ID</th>
											<th class="text-center">Requester Info</th>
											<th class="text-center">Amount</th>
											<th class="text-center">Purpose</th>											
											<th class="text-center">Rejection Reason</th>
											
											<th class="text-center">Date</th>

											
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${concenRejectedList}" var="approvedJob"
											varStatus="tr">
											<tr class="row_no_${tr.count}">
											   <td>${tr.count}</td>
												<td class="text-center" title="Show Job Advance"><a
													href="${pageContext.request.contextPath}/showJobAdvance/${approvedJob.jobAdvance.id}">${tr.count}</a>
												</td>
												<td class="text-center">${approvedJob.jobAdvance.employee.name}(${approvedJob.jobAdvance.employee.lxnId})</td>
												<td class="text-center">${approvedJob.advAmount}</td>
												<td class="text-center">${approvedJob.jobAdvance.jobPurpose}</td>
												<td class="text-center">${approvedJob.rejectionReason}</td>
												
												<td class="text-center">${approvedJob.createdDate}</td>

												
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<!-- ----------End Table ------------- -->
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>
				</div>



			</div>
		</div>

		<script type="text/javascript">
			$(document).ready(function() {
				$('#table_id_1').DataTable({
					"aoColumnDefs" : [ {
						"sClass" : "my_class",
						"aTargets" : [ 0 ]
					} ]
				});
			});

			$(document).ready(function() {
				$("#collapseBtn").click(function() {
					$('#collapseIcn').toggleClass('fa-plus fa-minus');
					$(this).toggleClass('btn-info btn-warning');
				});
			});
		</script>

	</section>
	<!-- /.content -->
</div>