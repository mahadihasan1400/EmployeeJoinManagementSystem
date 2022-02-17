<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="content-wrapper" style="margin: 0px;">
	<section class="content-header">
		<h1>Job Settings List</h1>
		<ul class="top-links">
			<li><a class="btn btn-block btn-primary btn-xs"
				href="${pageContext.request.contextPath}/newJobSettingsForm"><i
					class="fa fa-plus"></i>Add New Configuration</a></li>
		</ul>
	</section>

	<!-- Main content -->
	<section class="content">

		<!-- Serch box start-->
		<!--
		<div class="box box-info">
			<form>
				<div class="box-header with-border">
					<h3 class="box-title">Search</h3>

					<div class="box-tools pull-right">
						<button type="button" id="collapseBtn"
							class="btn btn-info btn-box-tool" data-toggle="collapse"
							data-target="#searchbox">
							<i id="collapseIcn" class="fa fa-plus"> </i>
						</button>
					</div>
				</div>

				<div id="searchbox" class="collapse">
					<div class="box-body">
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label>URL Path</label> <input name="urlPath" id="urlPath"
										type="text" class="form-control input-sm" />
								</div>								
							</div>
							
							<div class="col-md-4">
								<div class="form-group">
									<label>Menu Title</label> <input name="urlPath" id="urlPath"
										type="text" class="form-control input-sm" />
								</div>
								
							</div>
							
							<div class="col-md-4">
								<div class="form-group">
									<label>Parent Menu</label> <select id="parentMenu"
										class="form-control select2 input-sm" name="parentMenuId">
										<option> BD </option>
										<option> UK </option>
										<option> US </option>
										<option> KSA </option>
									</select>
								</div>
								
							</div>
							
						</div>
						
					</div>
					
					<div class="box-footer">
						<button type="submit" class="btn btn-primary pull-right">
							<i class="fa fa-search"></i>Search
						</button>
					</div>
					
				</div>
			</form>
		</div> -->		
		<!-- /search box end -->

		<div class="row">
			<div class="col-xs-12">
				<div class="box box-primary">
					<div class="box-body table-responsive no-padding">					
						<!-- ----------Start table ----------- -->
						<table class="table table-striped display" id="table_id">
							<thead>
								<tr style="background-color: #428bca;">
									<th class="text-center">Sl NO.</th>
									<th class="text-center">Stage</th>
									
									<th class="text-center">Button Text</th>
									<th class="text-center">Button Icon</th>
									<th class="text-center">Button Color</th>
									<th class="text-center">View Text</th>
									
									<th class="text-center">Amount Input Type</th>
									
									<th class="text-center">Is Reject Reason Mandatory</th>
									<th class="text-center">Reject/Remove Btn </th>
									<th class="text-center">Forward To</th>
									<th class="text-center">Reject To </th>
									<th class="text-center">Reject To Email</th>
									<th class="text-center">Common Email</th>
									<th class="text-center">Auth Role</th>
									<th class="text-center">Status</th>									
									<th class="text-center">Remarks</th>	
																										
									<th class="text-center">Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${jobSettingsList}" var="jobSettings" varStatus="tr">
									<tr class="row_no_${tr.count}">

										<td class="text-center" title="Show Job Settings">
											<a href="${pageContext.request.contextPath}/showJobSettings/${jobSettings.id}">${tr.count}</a>											
										</td>
										<td class="text-center">${jobSettings.stage}</td>
										
										<td class="text-center">${jobSettings.btnText}</td>
										<td class="text-center"><i class="${jobSettings.btnIcon}"></i> ${jobSettings.btnIcon}</td>
										<td class="text-center"><span class="${jobSettings.btnColor}"> ${jobSettings.btnColor} </span></td>
										<td class="text-center">${jobSettings.viewText}</td>		
										
										<td class="text-center">${jobSettings.amountFlag == 0?'NOTHING':jobSettings.amountFlag == 1?'UPDATE':'DUE AMOUNT'}</td>
										
										<td class="text-center">${jobSettings.isRjtResonMandatory == 0?'NO':'YES'}</td>
										
										<td class="text-center">${jobSettings.rjtRemoveBtnStatus == 0?'NOTHING':jobSettings.rjtRemoveBtnStatus == 1?'DELETE':'REJECT'}</td>
										<td class="text-center">${jobSettings.forwardStage.stage}</td>
										<td class="text-center">${jobSettings.rejectTo.stage}</td>
										<td class="text-center">${jobSettings.rejectedEmailAddress}</td>
										<td class="text-center">${jobSettings.emailAddress}</td>
										<td class="text-center">${jobSettings.authRole}</td>
										<td class="text-center">${jobSettings.status == 0?'INACTIVE':'ACTIVE'}</td>										
										<td class="text-center">${jobSettings.remarks}</td>
										
										<td class="text-center"><a
											href="editJobSettings/${jobSettings.id}"><i
												class="fa fa-pencil-square-o" aria-hidden="true"
												title="Edit"></i></a>| <a
											href="${pageContext.request.contextPath}/deleteJobSettings/${jobSettings.id}"
											onclick="return archiveFunction('${pageContext.request.contextPath}/deleteJobSettings/${jobSettings.id}', 'Do you want to delete this Item?')"><i
												class="fa fa-trash-o red" aria-hidden="true" title="Delete"></i></a>
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