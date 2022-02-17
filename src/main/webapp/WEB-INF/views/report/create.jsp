<div class="content-wrapper" style="margin: 0px;">
	<!-- Content Header (Page header) -->


	<!-- Main content -->
	<section class="content">

		<div class="row">
			<div class="col-xs-12">

				<!-- Horizontal Form -->
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title center">New Report  Form</h3>
					</div>
					<!-- /.box-header -->
					<!-- form start -->
					<form action="${pageContext.request.contextPath}/getRepoFilter" name="form"
						method="post" class="formValMenu form-horizontal" enctype="multipart/form-data" modelAttribute="command">
						<div class="box-body">
							
							<%@include file="../report/form.jsp"%>							

						</div>
						<!-- /.box-body -->
						<div class="box-footer">
							<button type="reset" class="btn btn-warning">
								<i class="fa fa-hand-paper-o"></i>Reset
							</button>
							<button type="submit" class="btn btn-primary pull-right req-save-update-btn" name="submit_btn" value="save">
								<i class="fa fa-save"></i>Execute
							</button>
						</div>
						<!-- /.box-footer -->
					</form>
				</div>
				<!-- /.box -->
			</div>
		</div>

	</section>
	<!-- /.content -->
</div>