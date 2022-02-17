<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.clsDatePicker {
    z-index: 100000;
}
</style>

<div class="content-wrapper" style="margin: 0px;">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Job Advance Detail</h1>
		<ul class="top-links">
			
			<c:if test="${showAppRjctBtn}">
				<li>
					<button title="${jobAdvance.jobSetting.btnText}"
						onClick="submitJobAdvance(${jobAdvance.id},${jobAdvance.jobSetting.amountFlag},${jobAdvance.advAmount} )"
						class="${jobAdvance.jobSetting.btnColor}">
						<i class="${jobAdvance.jobSetting.btnIcon}"></i>
						${jobAdvance.jobSetting.btnText}
					</button>
				</li>
				
				<c:if test="${jobAdvance.jobSetting.rjtRemoveBtnStatus eq '2' }">
					<li>
						<button title="${jobAdvance.jobSetting.btnText}"
							onClick="rejectJobAdvance(${jobAdvance.id},${jobAdvance.jobSetting.isRjtResonMandatory},${jobAdvance.advAmount} )"
							class="btn btn-danger btn-xs">
							<i class="fa fa-clock"></i> Reject
						</button>
					</li>
				</c:if>
			</c:if>
			<li><a class="btn btn-block btn-primary btn-xs"
				href="${pageContext.request.contextPath}/myJobsList"><i
					class="fa fa-reorder"></i>My Job List</a></li>
			<li><a class="btn btn-block btn-primary btn-xs"
				href="${pageContext.request.contextPath}/newJobAdvanceForm"><i
					class="fa fa-plus"></i>Add new Job Advance</a></li>

			<c:if
				test="${(jobAdvance.status == '1' || jobAdvance.status == '2') && jobAdvance.jobSetting.stage=='10' }">
				<li>
					<button id="approveJobAdvancePopup" title="${jobAdvance.jobSetting.btnText}"
						onClick="submitJobAdvance(${jobAdvance.id},${jobAdvance.jobSetting.amountFlag},${jobAdvance.advAmount} )"
						class="${jobAdvance.jobSetting.btnColor}">
						<i class="${jobAdvance.jobSetting.btnIcon}"></i>
						${jobAdvance.jobSetting.btnText}
					</button>
				</li>
				<li><a class="btn btn-block btn-warning btn-xs"
					href="${pageContext.request.contextPath}/editJobAdvance/${jobAdvance.id}"><i
						class="fa fa-fw fa-edit"></i>Edit</a></li>


				<c:if test="${jobAdvance.jobSetting.rjtRemoveBtnStatus == '1'}">
					<li><a class="btn btn-block btn-danger btn-xs"
						href="${pageContext.request.contextPath}/deleteJobAdvance/${jobAdvance.id}"
						id="${jobAdvance.id}"
						onclick="return confirm('Are you sure you want to delete this record?');"><i
							class="fa fa-trash"></i>Delete</a></li>
				</c:if>

				<c:if test="${jobAdvance.jobSetting.rjtRemoveBtnStatus == '2'}">
					<li>
						<button title="${jobAdvance.jobSetting.btnText}"
							onClick="rejectJobAdvance(${jobAdvance.id},${jobAdvance.jobSetting.isRjtResonMandatory},${jobAdvance.advAmount} )"
							class="btn btn-danger btn-xs">
							<i class="fa fa-clock"></i> Reject
						</button>
					</li>
				</c:if>

			</c:if>

		</ul>
	</section>
	<style>
.com_status {
	width: 74px;
}
</style>
	<!-- Main content -->
	<section class="content">

		<div class="row">
			<div class="col-xs-12">

				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">Job Advance Detail View</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body no-padding">

						<div class="box-header">
							<button data-toggle="collapse"
								class="box-title btn btn-info btn-sm" data-target="#job_history">Job
								History</button>
							<button data-toggle="collapse"
								class="box-title btn btn-success btn-sm" data-target="#job_docs">Supporting
								Docs</button>
						</div>
						<c:if test="${not empty message}">
							<div class="col-sm-12" id="deletesuccess">
								<div class="alert alert-success">
									<strong>Success!</strong> ${message}

								</div>
							</div>
						</c:if>
						<c:if test="${not empty error}">
							<div class="col-sm-12" id="deletesuccess">
								<div class="alert alert-danger">
									<strong>Error File Upload Failed!</strong> ${error}

								</div>
							</div>
						</c:if>

						<div id="job_history" class="collapse">
							<%-- <c:set var="jobHistoryList"
								value="${jobAdvance.jobAdvanceHistory}" /> --%>

							<c:if test="${!empty jobHistoryList}">


								<div class="col-sm-12">
									<div class="table-responsive">
										<table class="table table-striped">
											<c:forEach var="history" items="${jobHistoryList}">
												<c:if test="${!empty history.advAmount}">
													<tr>
														<td>${history.jobSettings.amountFlag=='2'?'Due ':''}Amount:
															${history.advAmount}</td>
														
														
														<c:if test="${history.isRejected=='0'}">
														<td>Action:
															${history.jobSettings.btnText}${history.jobSettings.btnText=='Submit'?'ted':history.jobSettings.btnText=='Approve'?'d':'ed'}</td>
														<td style="color:green">Status: Done</td>
														</c:if>
														
														<c:if test="${history.isRejected=='1'}">
														<td>Action:
															Rejected</td>
														<td style="color:red">Status: Rejected</td>
														</c:if>
														
														<td>
															<c:if test="${history.isRejected=='1'}">												
																Reject Reason: ${history.rejectionReason}
															</c:if>
														</td>
														<c:if test="${history.isRejected=='0'}">
															<td>${history.jobSettings.btnText}${history.jobSettings.btnText=='Submit'?'ted':history.jobSettings.btnText=='Approve'?'d':'ed'}
															By: ${history.createdBy.name}</td>
														<td>${history.jobSettings.btnText}${history.jobSettings.btnText=='Submit'?'ted':history.jobSettings.btnText=='Approve'?'d':'ed'}
															Date: <fmt:formatDate pattern="dd-MM-yyyy hh:mm:ss a"
																value="${history.createdDate}" />
														</c:if>
														<c:if test="${history.isRejected=='1'}">
															<td style="color:red">Rejected By: ${history.createdBy.name}</td>
															<td  style="color:red">Rejected Date: <fmt:formatDate pattern="dd-MM-yyyy hh:mm:ss a"
																value="${history.createdDate}" />
														</c:if>
														
														</td>
														<td>Comments : ${history.remarks}</td>
													</tr>
												</c:if>
											</c:forEach>
										</table>
									</div>

								</div>

							</c:if>
						</div>
						<div id="job_docs" class="collapse">
							<%-- <c:set var="jobDocuments" value="${jobAdvance.jobDocuments}" /> --%>
							<table class="table table-striped">
								<thead>
									<tr>
										<th>SL No.</th>
										<th>Name</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="doc" items="${jobDocuments}" varStatus="trdoc">
										<c:if test="${doc.isDeleted=='0'}">
											<tr>
												<td>${trdoc.index+1}</td>
												<td>${doc.name}</td>
												<td>
												<a class="btn btn-success btn-xs custom-width" title="View Document" target="_blank"
													href='${pageContext.request.contextPath}/viewDocument/${doc.jobAdvance.id}/${doc.name}' 
														style="color: yellow;"><i class="fa fa-eye " style="color: yellow;" aria-hidden="true"></i>View</a>
												
												<c:if
													test="${(jobAdvance.status == '1' || jobAdvance.status == '2') && jobAdvance.jobSetting.stage=='10' }">
												<a
													href="${pageContext.request.contextPath}/deleteDoc?docId=${doc.id}&jobId=${doc.jobAdvance.id}"
													class="btn btn-danger btn-xs"
													onclick="return confirm('Are you sure you want to delete this record?');"><i
														class="fa fa-trash" aria-hidden="true"></i>Delete</a>
												</c:if>			
											</td>
														
											</tr>
										</c:if>


									</c:forEach>
								</tbody>
								<c:if
									test="${(jobAdvance.status == '1' || jobAdvance.status == '2') && jobAdvance.jobSetting.stage=='10' }">
								<tfoot>
									<tr>
										<td style="text-align: right;">Add New Document</td>
										<td>
											<form
												action="${pageContext.request.contextPath}/saveFileToDoc"
												name="form" id="form" method="post"
												class="formValMenu form-horizontal"
												enctype="multipart/form-data" modelAttribute="command">
												<span class="btn btn-info"><i class="fa fa-plus"
													style="color: yellow;" aria-hidden="true"></i><input
													type="file" id="files" style="width: 170px" name="files"
													multiple="multiple"></span>


												<button type="button" style="height: 57px; width: 91px"
													class="btn btn-success" data-toggle="modal"
													data-target="#myModal">Upload</button>
												<input type="hidden" name="id" value="${jobAdvance.id}">

												<div id="myModal" class="modal fade" role="dialog">
													<div class="modal-dialog">

														<!-- Modal content-->
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal">&times;</button>
																<h4 class="modal-title">Are you sure you want to
																	upload ?.</h4>
															</div>
															<div class="modal-body">
																<label id="file-error" class="error" for="files"></label>
																<table class="table table-striped">
																	<thead id="thead">
																		<tr>
																			<th>SL NO.</th>
																			<th>File Name</th>
																		</tr>
																	</thead>
																	<tbody id="mytable">

																	</tbody>
																</table>
															</div>
															<div class="modal-footer">
																<button type="submit"
																	class="btn btn-success pull-left req-save-update-btn">Submit</button>

																<button type="button" class="btn btn-danger pull-right"
																	data-dismiss="modal">Cancel</button>
															</div>
														</div>

													</div>
												</div>
											</form>


										</td>
									</tr>
								</tfoot>
								</c:if>
							</table>
						</div>



						<table class="table table-striped">
							<tr>
								<th colspan="2"><h4>Employee Information</h4></th>
							</tr>
							<c:if test="${!empty jobAdvance.employee.name}">
								<tr>
									<th>Employee name</th>
									<td>${jobAdvance.employee.name}</td>
								</tr>
							</c:if>
							<c:if test="${!empty jobAdvance.employee.lxnId}">
								<tr>
									<th>Employee ID</th>
									<td>${jobAdvance.employee.lxnId}</td>
								</tr>
							</c:if>

							<c:if test="${!empty jobAdvance.employee.designation}">
								<tr>
									<th>Designation</th>
									<td>${jobAdvance.employee.designation}</td>
								</tr>
							</c:if>

							<c:if test="${!empty jobAdvance.employee.department}">
								<tr>
									<th>Department</th>
									<td>${jobAdvance.employee.department}</td>
								</tr>
							</c:if>
							<c:if test="${!empty jobAdvance.employee.company}">
								<tr>
									<th>Company</th>
									<td>${jobAdvance.employee.company.name}</td>
								</tr>
							</c:if>

							<tr>
								<th colspan="2"><h4>Job Information</h4></th>
							</tr>



							<c:if test="${!empty jobAdvance.jobNumber}">
								<tr>
									<th>Job Number</th>
									<td>${jobAdvance.jobNumber}</td>
								</tr>
							</c:if>
							<c:if test="${!empty jobAdvance.createdDate}">
								<tr>
									<th>Apply Date</th>
									<td><fmt:formatDate pattern="dd-MM-yyyy hh:mm:ss a"
											value="${jobAdvance.createdDate}" /></td>
								</tr>
							</c:if>
							<c:if test="${!empty jobAdvance.advAmount}">
								<tr>
									<th>Amount</th>
									<td>${jobAdvance.advAmount}</td>
								</tr>
							</c:if>
							
							<c:if test="${!empty jobAdvance.adjustedWithin}">
								<tr>
									<th>Adjusted Within</th>
									<td>${jobAdvance.adjustedWithin}</td>
								</tr>
							</c:if>
							
							<c:if test="${!empty jobAdvance.isBillable}">
								<tr>
									<th>Billable Status</th>
									<td>${jobAdvance.isBillable=='1'?'Billable':'Not Billable'}</td>
								</tr>
							</c:if>
							<c:if test="${!empty jobAdvance.jobPurpose}">
								<tr>
									<th>Job Purpose</th>
									<td>${jobAdvance.jobPurpose}</td>
								</tr>
							</c:if>
							<c:if test="${!empty jobAdvance.dueAmount}">
								<tr>
									<th>Dues Amount</th>
									<td>${jobAdvance.dueAmount}</td>
								</tr>
							</c:if>
							<c:if test="${!empty jobAdvance.jobNumberInFiscalYear}">
								<tr>
									<th>Job Number In Fiscal Year</th>
									<td>${jobAdvance.jobNumberInFiscalYear}</td>
								</tr>
							</c:if>





							<c:if test="${!empty jobAdvance.status}">
								<tr>
									<th>Status</th>
									<td><c:if test="${jobAdvance.status == '1'}">
											<span class="btn btn-success btn-xs com_status">
												Active </span>
										</c:if> <c:if test="${jobAdvance.status == '2'}">
											<span class="btn btn-warning btn-xs com_status">
												Rejected</span>
										</c:if> <c:if test="${jobAdvance.status == '3'}">
											<span class="btn btn-info btn-xs com_status"> Approved
											</span>
										</c:if></td>
								</tr>
							</c:if>
							<c:if test="${!empty jobAdvance.jobSetting.viewText}">
								<tr>
									<th>Current Work Flow</th>
									<td><span class="${jobAdvance.jobSetting.btnColor} ">
											${jobAdvance.jobSetting.viewText} </span></td>
								</tr>
							</c:if>
							<c:if test="${!empty jobAdvance.fiscalYear.name}">
								<tr>
									<th>Fiscal Year</th>
									<td>${jobAdvance.fiscalYear.name}</td>
								</tr>
							</c:if>

							<c:if test="${!empty jobAdvance.createdBy.name}">
								<tr>
									<th>Created By</th>
									<td>${jobAdvance.createdBy.name}</td>
								</tr>
							</c:if>

							<c:if test="${!empty jobAdvance.modifiedBy.name}">
								<tr>
									<th>Modified By</th>
									<td>${jobAdvance.modifiedBy.name}</td>
								</tr>
							</c:if>

							<c:if test="${!empty jobAdvance.modifiedDate}">
								<tr>
									<th>Modified Date</th>
									<td><fmt:formatDate pattern="dd-MM-yyyy hh:mm:ss a"
											value="${jobAdvance.modifiedDate}" /></td>
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
<script>
$( document ).ready(function() {
	$('#thead').hide();
	$('#not_bill_reson_section').hide();
});


	$(function() {
	
		
		$('.req-save-update-btn').on('click', function(e){
			
			$('#file-error').text("");
			if(document.getElementById('files').files.length<1){
				$('#file-error').text("Documents must reaquired Please upload your document Here.");
				 e.preventDefault();
			}
			if(document.getElementById('files').files.length>=1){
				for (var i = 0; i < document.getElementById('files').files.length; i++) {
				if(!validateFile(getExtension(document.getElementById('files').files[i].name))){
					$('#file-error').text("File you enter invalid type.The valid types are jpg,jpeg,png,bmp,pdf");
					 e.preventDefault();
					break;
				}
			  }
		   }
			
		});
		$('#files').on('change', function() {
			
			
			if(this.files.length>0){
				$('#thead').show();
				
			}else{
				$('#thead').hide();
			}
			$('#mytable').empty();
			for (var i = 0; i < this.files.length; i++) {
				console.log(this.files[i].name);
				var html='<tr>';
				html+='<td>'+(i+1)+'</td>';
				html+='<td>'+this.files[i].name+'</td>';
				html+='</tr>'
				$('#mytable').append(html);
			}
		});

		
	});
	
	function validateFile(ext) {
		var extension=['jpeg','jpg','png','bmp','pdf'];
		var flag=false;
		 $.each(extension,function(i,v){
		     if(ext===v){
		    	 flag=true;
		    	 return false;
		     }
		    })
		    
		    return flag;
	}
	function getExtension(filename) {
	    return filename.split('.').pop().toLowerCase();
	}
</script>
<script>
	function submitJobAdvance(jobId, amountFlag, amount){
		w2confirm('Are you sure?', function btn(answer) {
		    if(answer == 'Yes'){
		    	if(amountFlag == 0){
		    		approvePopupWithOnlyComments(jobId, amount);
				}else if (amountFlag == 1){
					approvePopupWithReviewAmount(jobId, amount);
				} else {					
					approvePopupWithDueAmount(jobId, amount);					
				}
		    }
		});	
		
	}
	
	function rejectJobAdvance(jobId,isRjtResonMandatory, amount){
		w2confirm('Are you sure?', function btn(answer) {
		    if(answer == 'Yes'){
		    	//w2alert(jobId +" : "+ isRjtResonMandatory +" : "+ amount);
		    	rejectJObAdvancePopUp(jobId,isRjtResonMandatory,amount);
		    }
		});	
	}
	
	function rejectJObAdvancePopUp(jobId,isRjtResonMandatory,amount){
		w2popup.open({
		    title   : 'Reject Job Advance.',
		    body    : '<input id="jobId" type="hidden" value="'+jobId+'"><input id="isRjtResonMandatory" type="hidden" value="'+isRjtResonMandatory+'"><h2> Requested Amount is : '+amount+' <h2/> <br/>  Reject Reason : <br> <textarea style="resize: none;" placeholder="Please Input reson Heare Here" id="rejectionReason" class="form-control"> </textarea><br/> <p id="worngOtpMsg" style="color:green;"></p>',
		    buttons : '<button id="rejectModalSubmitButton" class="btn btn-danger"> Reject </button>',
		    modal           : true,
		    width           : 500,
		    height          : 290,
		    showClose       : true,
		    showMax			: true,
		    keyboard        : false,
		    mouse 			: false
		});
	}
	
	function approvePopupWithDueAmount(jobId, amount){
		w2popup.open({
		    title   : 'Outstanding Balance of Advance Info.',
		    body    : '<input id="jobId" type="hidden" value="'+jobId+'"><h2> Requested Amount is : '+amount+' <h2/> <br/> Due Amounts : <br> <input type="number" required="required" placeholder="Please Input Due Amount Here" id="dueAmount" class="form-control"/></br> Due Amount Date:<br/><div> <input id="dueAmountDate" type="text" class="form-control datepicker clsDatePicker" placeholder="DD-MM-YYYY" maxLength="10" title="format: DD-MM-YYYY"></div> <br/> Comments : <br> <textarea style="resize: none;" placeholder="Please Input Comments Here" id="remarks" class="form-control"> </textarea><br/> <p id="worngOtpMsg" style="color:green;"></p>',
		    buttons : '<button id="dueAmountModalSubmitButton"> Submit </button>',
		    modal           : true,
		    width           : 500,
		    height          : 420,
		    showClose       : true,
		    showMax			: true,
		    keyboard        : false,
		    mouse 			: false		    
		});
	}
	
	$(document).on("click",".datepicker",function() {
		$('.datepicker').datepicker({
			format:'dd-mm-yyyy'
		});
		$('.datepicker').datepicker('show');
    });
	
	function approvePopupWithReviewAmount(jobId, amount){
		w2popup.open({
		    title   : 'Amount Information',
		    body    : '<input id="jobId" type="hidden" value="'+jobId+'"><h2> Requested Amount is : '+amount+' <h2/> <br/> Approve Amounts : <br> <input type="number" required="required" placeholder="Please Input Amount Here" id="advAmount" class="form-control"/> <br/> Comments : <br> <textarea style="resize: none;" placeholder="Please Input Comments Here" id="remarks" class="form-control"> </textarea><br/> <p id="worngOtpMsg" style="color:green;"></p>',
		    buttons : '<button id="reviewAmountModalSubmitButton"> Submit </button>',
		    modal           : true,
		    width           : 500,
		    height          : 350,
		    showClose       : true,
		    showMax			: true,
		    keyboard        : false,
		    mouse 			: false
		});
	}
	
	function approvePopupWithOnlyComments(jobId, amount){
		w2popup.open({
		    title   : 'Forword Confirmation',
		    body    : '<input id="jobId" type="hidden" value="'+jobId+'"><h2> Requested Amount is : '+amount+' <h2/> <br> Comments : <br> <textarea style="resize: none;" placeholder="Please Input Comments Here" id="remarks" class="form-control"> </textarea><br/> <p id="worngOtpMsg" style="color:green;"></p>',
		    buttons : '<button id="onlyCommentModalSubmitButton"> Submit </button>',
		    modal           : true,
		    width           : 500,
		    height          : 300,
		    showClose       : true,
		    showMax			: true,
		    keyboard        : false,
		    mouse 			: false
		});
	}
	$(document).on("click","#rejectModalSubmitButton",function() {
		if($('#isRjtResonMandatory').val()=='1'){
			if($('#rejectionReason').val().trim().length > 0 ){
				$("#rejectModalSubmitButton").prop("disabled", true);
				$('#worngOtpMsg').text('Please Wait...');
				$('#worngOtpMsg').css( "color", "green" )
				
				var contextPath = $('#contextPath').val();
				var path = contextPath+'/rejectJobAdvance';
				var params = {
					id : $('#jobId').val(),
					isRjtResonMandatory : $('#isRjtResonMandatory').val(),
					rejectionReason :  $('#rejectionReason').val(),
					status:2
				}
										
				formSubmitGetPost(path, params, "POST");
				
			}else{					
				$('#worngOtpMsg').text('Your Input Rejected reson. Please Try again..');
				$('#worngOtpMsg').css( "color", "red" )
				return;
			}
		}else{
			
			$("#rejectModalSubmitButton").prop("disabled", true);
			$('#worngOtpMsg').text('Please Wait...');
			$('#worngOtpMsg').css( "color", "green" )
			
			var contextPath = $('#contextPath').val();
			var path = contextPath+'/rejectJobAdvance';
			var params = {
				id : $('#jobId').val(),
				isRjtResonMandatory : $('#isRjtResonMandatory').val(),
				rejectionReason :  $('#rejectionReason').val()
			}
									
			formSubmitGetPost(path, params, "POST");
			
		}
		
	});
	
	$(document).on("click","#dueAmountModalSubmitButton",function() {
		if($('#dueAmount').val().trim().length >0 && $('#dueAmountDate').val().trim().length > 0 ){
			$("#dueAmountModalSubmitButton").prop("disabled", true);
			$('#worngOtpMsg').text('Please Wait...');
			$('#worngOtpMsg').css( "color", "green" )
			
			var contextPath = $('#contextPath').val();
			var path = contextPath+'/approveJobAdvance';
			var params = {
				id : $('#jobId').val(),
				dueAmount : $('#dueAmount').val(), 
				dueAmountDate : $('#dueAmountDate').val(), 
				remarks :  $('#remarks').val()
			}
									
			formSubmitGetPost(path, params, "POST");
			
		}else{					
			$('#worngOtpMsg').text('Your Input Due Amount. Please Try again..');
			$('#worngOtpMsg').css( "color", "red" )
			return;
		}
	});
	
	$(document).on("click","#reviewAmountModalSubmitButton",function() {
		if($('#advAmount').val().trim().length > 0 ){
			$("#reviewAmountModalSubmitButton").prop("disabled", true);
			$('#worngOtpMsg').text('Please Wait...');
			$('#worngOtpMsg').css( "color", "green" )
			
			var contextPath = $('#contextPath').val();
			var path = contextPath+'/approveJobAdvance';
			var params = {
				id : $('#jobId').val(),
				advAmount : $('#advAmount').val(), 
				remarks :  $('#remarks').val()
			}
									
			formSubmitGetPost(path, params, "POST");
			
		}else{					
			$('#worngOtpMsg').text('Your Input Amount. Please Try again..');
			$('#worngOtpMsg').css( "color", "red" )
			return;
		}
	});
	
	$(document).on("click","#onlyCommentModalSubmitButton",function() {
		
			$("#onlyCommentModalSubmitButton").prop("disabled", true);
			$('#worngOtpMsg').text('Please Wait...');
			$('#worngOtpMsg').css( "color", "green" )
			
			var contextPath = $('#contextPath').val();
			var path = contextPath+'/approveJobAdvance';
			var params = {
				id : $('#jobId').val(),
				remarks :  $('#remarks').val()
			}
									
			formSubmitGetPost(path, params, "POST");
	});
	
	$(document).ready( function() {
        $('#deletesuccess').delay(3000).fadeOut();
     });
	
	/* $(function () {
		 var year  = (new Date()).getFullYear();
		    // US Format
		    $('input[type=eu-date]').w2field('date',  { format: 'dd-mm-yyyy' });
		    
		    $('input[type=eu-date1]').w2field('date', { format: 'dd-mm-yyyy', end: $('input[type=eu-date2]') });
		    $('input[type=eu-date2]').w2field('date', { format: 'dd-mm-yyyy', start: $('input[type=eu-date1]') });
		    
		    
	}); */	
	
</script> 