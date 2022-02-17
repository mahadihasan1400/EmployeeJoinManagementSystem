<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script src="resource/tabs/jquery-ui.js"></script> 
<link href="resource/tabs/jquery-ui.css" rel="stylesheet">

<div class="content-wrapper" style="margin: 0px;">
	<section class="content-header">
		<h1>User Dashboard</h1>		
	</section>
<style>
.com_status{
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
						<li><a href="#tabs-my-jobs">My Jobs</a></li>
						<li><a href="#tabs-subordinate-jobs">
							<c:if test="${!empty subordinateJobList}"><span class="red">Subordinate Jobs</span></c:if>
							<c:if test="${empty subordinateJobList}"><span class="green">Subordinate Jobs</span></c:if>
							<li><a href="#tabs-approved-jobs">Approved Jobs by Me</a></li>
						<li><a href="#tabs-rejected-jobs">Rejected Jobs by Me</a></li>
						</a></li>
					</ul>


					<div id="tabs-my-jobs">
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
										<c:forEach items="${myjobList}" var="myJob" varStatus="tr">
											<tr class="row_no_${tr.count}">
												<td class="text-center" title="Show Job Advance"><a
													href="${pageContext.request.contextPath}/showJobAdvance/${myJob.id}">${tr.count}</a>
												</td>
												<td class="text-center">${myJob.jobNumber}</td>
												<c:set var="localVarivable" value="Local Travel No:-${myJob.localTravel.reqUniqueNumber}-${myJob.localTravel.tripPurpose}" />
												<c:set var="outSiderVarivable" value="OutSider Travel No:-${myJob.travel.reqUniqueNumber}-${myJob.travel.tripPurpose}" />
												<td class="text-center">${myJob.jobType eq '1'?'General Job':myJob.jobType eq '2'?localVarivable:outSiderVarivable}</td>
											
												<td class="text-center">${myJob.advAmount}</t>
												<td class="text-center">${myJob.jobPurpose}</td>
												<td class="text-center"><c:if
														test="${myJob.status == '1'}">
														<span class="btn btn-success btn-xs com_status">
															Active </span>
													</c:if> <c:if test="${myJob.status == '2'}">
														<span class="btn btn-warning btn-xs com_status">
															Rejected</span>
													</c:if> <c:if test="${myJob.status == '3'}">
														<span class="btn btn-info btn-xs com_status">
															Approved </span>
													</c:if></td>
												<td class="text-left"><span style="width: 241px"
													class="${myJob.jobSetting.btnColor} ">
														${myJob.jobSetting.viewText} </span></td>
												<td class="text-center">${myJob.rejectionReason}</td>
		
												<td class="text-center">${myJob.createdDate}</td>
		
		
		
												<td class="text-center"><c:if
														test="${(myJob.status == '1' || myJob.status == '2') && myJob.jobSetting.stage=='10' }">
														<a href="editJobAdvance/${myJob.id}"><i
															class="fa fa-pencil-square-o" aria-hidden="true"
															title="Edit"></i></a>| <a
															href="${pageContext.request.contextPath}/deleteJobAdvance/${myJob.id}"
															onclick="return archiveFunction('${pageContext.request.contextPath}/deleteJobAdvance/${myJob.id}', 'Do you want to delete this Item?')">
															<i class="fa fa-trash-o red" aria-hidden="true" title="Delete"></i></a>
															|
													</c:if>
													<a href="${pageContext.request.contextPath}/showJobAdvance/${myJob.id}" title="Show Job Advance"><i class="fa fa-eye green" aria-hidden="true"> </i></a>
													<a href="${pageContext.request.contextPath}/jobAdvanceReport/${myJob.id}" title="Job Advance History"><i class="fa fa-file-pdf-o red" aria-hidden="true"> </i></a>
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
					<div id="tabs-subordinate-jobs">
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
											<th class="text-center">Reject Reason</th>
											<th class="text-center">Date</th>
											
											<th class="text-center">Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${subordinateJobList}" var="subordinateJob" varStatus="tr">
											<tr class="row_no_${tr.count}">
												<td class="text-center" title="Show Job Advance">
												<c:if test="${subordinateJob.jobSetting.stage eq '20'}">
												<a href="${pageContext.request.contextPath}/showJobAdvance/${subordinateJob.id}" title="Show Job Advance">${tr.count}</a>
												</c:if>	
												<c:if test="${subordinateJob.jobSetting.stage ne '20'}">
												${tr.count}
												</c:if>	
												
												</td>
												<td class="text-center">${subordinateJob.jobNumber}</td>
												<c:set var="localVarivable" value="Local Travel No:-${subordinateJob.localTravel.reqUniqueNumber}-${subordinateJob.localTravel.tripPurpose}" />
												<c:set var="outSiderVarivable" value="OutSider Travel No:-${subordinateJob.travel.reqUniqueNumber}-${subordinateJob.travel.tripPurpose}" />
												<td class="text-center">${subordinateJob.jobType eq '1'?'General Job':subordinateJob.jobType eq '2'?localVarivable:outSiderVarivable}</td>
												<td class="text-center">${subordinateJob.advAmount}</td>
												<td class="text-center">${subordinateJob.jobPurpose}</td>
												<td class="text-center"><c:if
														test="${subordinateJob.status == '1'}">
														<span class="btn btn-success btn-xs com_status">
															Active </span>
													</c:if> <c:if test="${subordinateJob.status == '2'}">
														<span class="btn btn-warning btn-xs com_status">
															Rejected</span>
													</c:if> <c:if test="${subordinateJob.status == '3'}">
														<span class="btn btn-info btn-xs com_status">
															Approved </span>
													</c:if></td>
												<td class="text-left"><span style="width: 241px"
													class="${subordinateJob.jobSetting.btnColor} ">
														${subordinateJob.jobSetting.viewText} </span></td>
												<td class="text-center">${subordinateJob.rejectionReason}</td>
		
												<td class="text-center">${subordinateJob.createdDate}</td>
												
												<td class="text-center">
												<c:if test="${subordinateJob.jobSetting.stage eq '20'}">
												<a href="${pageContext.request.contextPath}/showJobAdvance/${subordinateJob.id}" title="Show Job Advance"><i class="fa fa-eye green" aria-hidden="true"> </i></a>
												</c:if>	
													<a href="${pageContext.request.contextPath}/jobAdvanceReport/${subordinateJob.id}" title="Job Advance History"><i class="fa fa-file-pdf-o red" aria-hidden="true"> </i></a>
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
				$('#table_id_2').DataTable({
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