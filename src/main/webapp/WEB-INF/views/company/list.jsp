<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="content-wrapper" style="margin: 0px;">
	<section class="content-header">
		<h1>Company List</h1>
		
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
									<th class="text-center">Company Name</th>
									<th class="text-center">Company Logo</th>
									
									
									<th class="text-center">Keyword</th>
									<th class="text-center">Created BY</th>
									<th class="text-center">Created Date</th>																					
									
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${companies}" var="company" varStatus="tr">
									<tr class="row_no_${tr.count}">

										<td class="text-center">
											<a href="${pageContext.request.contextPath}/showCompany/${company.id}">${tr.count}</a>											
										</td>
										<td class="text-center">${company.name}</td>
										<td class="text-center"><img width="120" height="100"
											src="${pageContext.request.contextPath}/companyLogo/${company.companyKeyword}">
										</td>
										
										
										<td class="text-center">${company.companyKeyword}</td>
										<td class="text-center">${company.createdBy}</td>
										<td class="text-center"><fmt:formatDate pattern = "dd-MM-yyyy hh:mm:ss a" value = "${company.createdDate}" /></td>
										
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