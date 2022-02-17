<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<div class="content-wrapper" style="margin: 0px;">
	<section class="content-header">
		<h1>Rejected Jobs</h1>		
	</section>
<style>
.com_status{
	width: 74px;

}
</style>
	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box box-primary">
					<div class="box-body table-responsive no-padding">					
						<!-- ----------Start table ----------- -->
						<table class="table table-striped display" id="table_id">
							<thead>
								<tr style="background-color: #428bca;">
									<th class="text-center">Sl NO.</th>
									<th class="text-center">Job Number</th>
									<th class="text-center">Amount</th>									
									<th class="text-center">Purpose</th>
									<th class="text-center">Status</th>	
									<th class="text-center">Work Flow</th>	
									<th class="text-center">Reject Reason</th>									
									<th class="text-center"> Date</th>																			
									<th class="text-center">Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${rejectedJobList}" var="myJob" varStatus="tr">
									<tr class="row_no_${tr.count}">
										<td class="text-center" title="Show Job Advance">
											<a href="${pageContext.request.contextPath}/showJobAdvance/${myJob.id}">${tr.count}</a>											
										</td>                                      
                                       <td class="text-center">${myJob.jobNumber}</td>
										<td class="text-center">${myJob.advAmount}</td>										
										<td class="text-center">${myJob.jobPurpose}</td>
										<td class="text-center">
											<c:if test="${myJob.status == '1'}">
												<span  class="btn btn-success btn-xs com_status"> Active </span>
											</c:if>
											<c:if test="${myJob.status == '2'}">
												<span class="btn btn-warning btn-xs com_status"> Rejected</span>
											</c:if>
											<c:if test="${myJob.status == '3'}">
												<span class="btn btn-info btn-xs com_status"> Approved </span>
											</c:if>
											
																				
										</td>
										<td class="text-left"><span  style="width: 241px" class="${myJob.jobSetting.btnColor} "> ${myJob.jobSetting.viewText} </span></td>
										<td class="text-center">${myJob.rejectionReason}</td>
										
										<td class="text-center">${myJob.createdDate}</td>										
										
										
										
										<td class="text-center">
										<c:if
														test="${(myJob.status == '1' || myJob.status == '2') && myJob.jobSetting.stage=='10' }">
														<a href="editJobAdvance/${myJob.id}"><i
															class="fa fa-pencil-square-o" aria-hidden="true"
															title="Edit"></i></a>| <a
															href="${pageContext.request.contextPath}/deleteJobAdvance/${myJob.id}"
															onclick="return archiveFunction('${pageContext.request.contextPath}/deleteJobAdvance/${myJob.id}', 'Do you want to delete this Item?')">
															<i class="fa fa-trash-o red" aria-hidden="true" title="Delete"></i>
														</a>
														|
										</c:if>
													<a href="${pageContext.request.contextPath}/showJobAdvance/${myJob.id}" title="Show Job Advance"><i class="fa fa-eye green" aria-hidden="true"> </i></a>
													<a href="${pageContext.request.contextPath}/jobAdvanceReport/${myJob.id}" title="Job Advance History"><i class="fa fa-file-pdf-o red" aria-hidden="true"> </i></a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						
						<script type="text/javascript">	
							$(document).ready(function() {
								$('#table_id').DataTable({
									"aoColumnDefs": [
									      { "sClass": "my_class", "aTargets": [0]}
									 ]
								});
							});

							$(document).ready(function() {
								$("#collapseBtn").click(function() {
									$('#collapseIcn').toggleClass('fa-plus fa-minus');
									$(this).toggleClass('btn-info btn-warning');
								});
							});
						</script>
						<!-- ----------End Table ------------- -->
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
		</div>

	</section>
	<!-- /.content -->
</div>