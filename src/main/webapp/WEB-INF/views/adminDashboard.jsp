<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	
<script src="resource/tabs/jquery-ui.js"></script> 
<link href="resource/tabs/jquery-ui.css" rel="stylesheet">

<div class="content-wrapper" style="margin: 0px;">
	<section class="content-header">
		<h1>Administrator Dashboard</h1>
	</section>
	<style>
.com_status {
	width: 74px;
}

.white-box {
	background: #fff;
	padding: 25px;
	margin-bottom: 30px;
}

.white-box .box-title {
	margin: 0 0 12px;
	font-weight: 500;
	text-transform: uppercase;
	font-size: 16px;
}

.analytics-info .list-inline {
	margin-bottom: 0;
}

.list-inline {
	padding-left: 0;
	margin-left: -5px;
	list-style: none;
}

.list-inline>li {
	display: inline-block;
	padding-left: 5px;
	padding-right: 5px;
}

.text-success {
	color: #7ace4c;
}

.text-right {
	text-align: right;
}

.list-inline>li {
	display: inherit;
	padding-left: 5px;
	padding-right: 5px;
}
</style>

	<script>
		$(function() {
			$("#tabs").tabs();
		});
	</script>

	<!-- Main content -->
	<section class="content">
		<div class="" style="background-color: #E4E6E9;">
			<div class="col-xs-12">
				<div class="col-lg-4 col-sm-6 col-xs-12">
					<div class="white-box analytics-info">
						<h3 class="box-title blue">Approved Jobs (${fiscalYearName})</h3>
						<ul class="list-inline two-part">
							<li style="align-content: center;">
								<h2 class="center success" style="color: green;">${empty totalApprovedJob ? 0: totalApprovedJob}</h2>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 col-xs-12">
					<div class="white-box analytics-info">
						<h3 class="box-title blue">Pending Jobs</h3>
						<ul class="list-inline two-part">
							<li style="align-content: center;">
								<h2 class="center warning" style="color: orange;">${empty totalPendingJob ? 0: totalPendingJob}</h2>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 col-xs-12">
					<div class="white-box analytics-info">
						<h3 class="box-title blue">Rejected Jobs</h3>
						<ul class="list-inline two-part">
							<li style="align-content: center;">
								<h2 class="center danger" style="color: red;">${empty totalRejectedJob ? 0: totalRejectedJob}</h2>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-xs-12">

				<div id="tabs">
					<ul>
						<li><a href="#tabs-pending-jobs">Pending Jobs</a></li>
						<li><a href="#tabs-approved-jobs">Approved Jobs</a></li>
						<li><a href="#tabs-rejected-jobs">Rejected Jobs</a></li>
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
											<th class="text-center" style="width: 270px;">Work Flow</th>
											<th class="text-center">Created Date</th>
											<th class="text-center">Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${pendingJobList}" var="pendingJob" varStatus="tr">
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
												<td class="text-center"><span style="width: 241px"
													class="${pendingJob.jobSetting.btnColor} ">
														${pendingJob.jobSetting.viewText} </span></td>
																
												<td class="text-center"> <fmt:formatDate pattern="dd-MM-yyyy hh:mm:ss a" value="${approvedJob.createdDate}" /></td>
		
												<td class="text-center">
												<a class="btn btn-info btn-xs" title="Show Job Advance"
													href="${pageContext.request.contextPath}/showJobAdvance/${pendingJob.id}"><i class="fa fa-eye" aria-hidden="true"> </i>Show</a>
													<%-- <a class="btn btn-success btn-xs" title="Show Job Advance History"
													href="${pageContext.request.contextPath}/jobAdvanceReport/${pendingJob.id}"><i class="fa fa-eye" aria-hidden="true"> </i>History</a> --%>
												</td>
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
								<table class="table table-striped display" id="table_id_2">
									<thead>
										<tr style="background-color: #428bca;">
											<th class="text-center">Sl NO.</th>
											
											<th class="text-center">Job Number</th>
											<th class="text-center">Job Type</th>
											<th class="text-center">Amount</th>
											<th class="text-center">Purpose</th>
											<th class="text-center">Status</th>
											<th class="text-center">Work Flow</th>
											<th class="text-center">Created Date</th>
											<th class="text-center">Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${approvedJobList}" var="approvedJob" varStatus="tr">
											<tr class="row_no_${tr.count}">
												<td class="text-center" title="Show Job Advance"><a
													href="${pageContext.request.contextPath}/showJobAdvance/${approvedJob.id}">${tr.count}</a>
												</td>
												<td class="text-center">${approvedJob.jobNumber}</td>
												<c:set var="localVarivable" value="Local Travel No:-${approvedJob.localTravel.reqUniqueNumber}-${approvedJob.localTravel.tripPurpose}" />
												<c:set var="outSiderVarivable" value="OutSider Travel No:-${approvedJob.travel.reqUniqueNumber}-${approvedJob.travel.tripPurpose}" />
												<td class="text-center">${approvedJob.jobType eq '1'?'General Job':approvedJob.jobType eq '2'?localVarivable:outSiderVarivable}</td>
												<td class="text-center">${approvedJob.advAmount}</td>
												<td class="text-center">${approvedJob.jobPurpose}</td>
												<td class="text-center"><c:if
														test="${approvedJob.status == '1'}">
														<span class="btn btn-success btn-xs com_status">
															Active </span>
													</c:if> <c:if test="${approvedJob.status == '2'}">
														<span class="btn btn-warning btn-xs com_status">
															Rejected</span>
													</c:if> <c:if test="${approvedJob.status == '3'}">
														<span class="btn btn-info btn-xs com_status">
															Approved </span>
													</c:if></td>
												<td class="text-left"><span style="width: 241px"
													class="${approvedJob.jobSetting.btnColor} ">
														${approvedJob.jobSetting.viewText} </span></td>


												<td class="text-center"><fmt:formatDate
														pattern="dd-MM-yyyy hh:mm:ss a"
														value="${approvedJob.createdDate}" /></td>



												<td class="text-center"><a class="btn btn-info btn-xs" title="Show Job Advance"
													href="${pageContext.request.contextPath}/showJobAdvance/${approvedJob.id}"><i class="fa fa-eye" aria-hidden="true"> </i>Show</a>
													<%-- <a class="btn btn-success btn-xs" title="Show Job Advance History"
													href="${pageContext.request.contextPath}/jobAdvanceReport/${approvedJob.id}"><i class="fa fa-eye" aria-hidden="true"> </i>History</a> --%>
													| <a class="btn btn-success btn-xs" href="${pageContext.request.contextPath}/jobAdvanceReport/${approvedJob.id}" title="Job Advance History"><i class="fa fa-file-pdf-o red" aria-hidden="true"> </i> Download</a>
													| <a class="btn btn-warning btn-xs custom-width"
															title="Download Job Advance Docs"
															href='${pageContext.request.contextPath}/downloadZipFile?id=${approvedJob.id}'
															style="color: white;"><i class="fa fa-download"
															aria-hidden="true"></i>&nbsp;&nbsp; Download Docs</a>
													</td>
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
								<table class="table table-striped display" id="table_id_3">
									<thead>
										<tr style="background-color: #428bca;">
											<th class="text-center">Sl NO.</th>
											<th class="text-center">Job Number</th>
											<th class="text-center">Job Type</th>
											<th class="text-center">Amount</th>
											<th class="text-center">Purpose</th>
											<th class="text-center">Status</th>
											<th class="text-center">Rejected By</th>
											<th class="text-center">Reject Reason</th>
											<th class="text-center">Rejected Date</th>
											<th class="text-center">Created Date</th>
											<th class="text-center">Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${rejectedJobList}" var="rejectedJob" varStatus="tr">
											<tr class="row_no_${tr.count}">
												<td class="text-center" title="Show Job Advance"><a
													href="${pageContext.request.contextPath}/showJobAdvance/${rejectedJob.id}">${tr.count}</a>
												</td>
												<td class="text-center">${rejectedJob.jobNumber}</td>
												<c:set var="localVarivable" value="Local Travel No:-${rejectedJob.localTravel.reqUniqueNumber}-${rejectedJob.localTravel.tripPurpose}" />
												<c:set var="outSiderVarivable" value="OutSider Travel No:-${rejectedJob.travel.reqUniqueNumber}-${rejectedJob.travel.tripPurpose}" />
												<td class="text-center">${rejectedJob.jobType eq '1'?'General Job':rejectedJob.jobType eq '2'?localVarivable:outSiderVarivable}</td>
												<td class="text-center">${rejectedJob.advAmount}</td>
												<td class="text-center">${rejectedJob.jobPurpose}</td>
												<td class="text-center"><c:if
														test="${rejectedJob.status == '1'}">
														<span class="btn btn-success btn-xs com_status">
															Active </span>
													</c:if> <c:if test="${rejectedJob.status == '2'}">
														<span class="btn btn-warning btn-xs com_status">
															Rejected</span>
													</c:if> <c:if test="${rejectedJob.status == '3'}">
														<span class="btn btn-info btn-xs com_status">
															Approved </span>
													</c:if></td>
												<td class="text-left"><span style="width: 241px"
													class="${rejectedJob.jobSetting.btnColor} ">
														${rejectedJob.modifiedBy.name} </span></td>
												<td class="text-center">${rejectedJob.rejectionReason}</td>
		
												<td class="text-center"> <fmt:formatDate pattern="dd-MM-yyyy hh:mm:ss a" value="${rejectedJob.modifiedDate}" /></td>
												<td class="text-center"> <fmt:formatDate pattern="dd-MM-yyyy hh:mm:ss a" value="${rejectedJob.createdDate}" /></td>
												
												<td class="text-center"><a class="btn btn-info btn-xs" title="Show Job Advance"
													href="${pageContext.request.contextPath}/showJobAdvance/${rejectedJob.id}"><i class="fa fa-eye" aria-hidden="true"> </i>Show</a></td>
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
				$('#table_id_2').DataTable({
					"aoColumnDefs" : [ {
						"sClass" : "my_class",
						"aTargets" : [ 0 ]
					} ]
				});
			});
			
			$(document).ready(function() {
				$('#table_id_3').DataTable({
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