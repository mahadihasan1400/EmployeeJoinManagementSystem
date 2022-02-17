<div class="content-wrapper"  style="margin:0px;">
    <section class="content-header">
        <h1>
            All Lookup List
        </h1>
        <ul class="top-links">
           <li><a class="btn btn-block btn-primary btn-xs" href="${pageContext.request.contextPath}/allLookupForm.do"><i
                    class="fa fa-plus"></i>Add new Lookup</a></li>
        </ul>
    </section>

    <!-- Main content -->
    <section class="content">

        <!-- Serch box -->
        <div class="box box-info">
            <form>
                <div class="box-header with-border">
                    <h3 class="box-title">Search</h3>

                    <div class="box-tools pull-right">
                        <!-- <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" data-target="#searchbox"
                                title="Collapse"><i class="fa fa-minus"></i></button> -->
                                <button type="button" id="collapseBtn" class="btn btn-info btn-box-tool" data-toggle="collapse"
								data-target="#searchbox">
								<i id="collapseIcn" class="fa fa-plus"> </i>
							</button>
                    </div>
                </div>

				<div  id="searchbox" class="collapse"> 
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>URL Path</label>
                                <input name="urlPath" id="urlPath"
                                            type="text" class="form-control input-sm"/>
                            </div><!-- /.form-group -->
                        </div><!-- /.col -->
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Menu Title</label>
                                <input name="urlPath" id="urlPath"
                                            type="text" class="form-control input-sm"/>
                            </div><!-- /.form-group -->
                        </div><!-- /.col -->
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Parent Menu</label>
                                <select id="parentMenu" class="form-control select2 input-sm" name="parentMenuId">
                                	<option> BD </option>
                                	<option> UK </option>
                                	<option> US </option>
                                	<option> KSA </option>
                                </select>
                            </div><!-- /.form-group -->
                        </div><!-- /.col -->
                    </div><!-- /.row -->
                </div><!-- /.box-body -->
                <div class="box-footer">
                    <button type="submit" class="btn btn-primary pull-right"><i class="fa fa-search"></i>Search
                    </button>
                </div><!-- /.box-footer-->
                </div>
            </form>
        </div><!-- /.box -->

        <div class="row">
            <div class="col-xs-12">
                <div class="box box-primary">
                    <div class="box-body table-responsive no-padding">
                    
                    	<!-- ----------Start table ----------- -->
                    		<div id="main" style="width: 100%; height: 400px; padding: 10px;"></div>
							<hr />
							<button class="w2ui-btn" onclick="allLookupShow(w2ui.grid.getSelection(id))">Show</button>
							
							<script type="text/javascript">
								function allLookupShow(lookupId) {
									//w2alert(lookupId+"1st");
									var contextPath = $('#contextPath').val();
									var path = contextPath+'/allLookupShow.do';
									var params = {
											id : lookupId
										}
									formSubmitGetPost(path, params, "GET");
								}
															
								var config = {
									grid : {
										name : 'grid',
										show : {
											footer : true,
											toolbar : true,
											lineNumbers : true,
											selectColumn : true
										},
										multiSearch : true,
										multiSelect : true,
							
										searches : [ {
											field : 'role_id',
											caption : 'ID ',
											type : 'int'
										}, {
											field : 'role',
											caption : 'Role Name',
											type : 'text'
										}, {
											field : 'remarks',
											caption : 'Remarks',
											type : 'text'
										}, {
											field : 'createdBy',
											caption : 'Created By',
											type : 'text'
										}, {
											field : 'createdDate',
											caption : 'Created Date',
											type : 'date'
										}, {
											field : 'modifiedBy',
											caption : 'Modified By',
											type : 'text'
										}, {
											field : 'modifiedDate',
											caption : 'Modified Date',
											type : 'date'
										} ],
							
										columns : [ {
											field : 'role_id',
											caption : 'ID',
											size : '100px',
											sortable : true,
											searchable : 'int',
											resizable : true
										}, {
											field : 'role',
											caption : 'Role Name',
											size : '240px',
											sortable : true,
											searchable : 'text',
											resizable : true
										}, {
											field : 'remarks',
											caption : 'Remarks',
											size : '240px',
											sortable : true,
											searchable : 'text',
											resizable : true
										}, {
											field : 'createdBy',
											caption : 'Created By',
											size : '120px',
											resizable : true,
											sortable : true
										}, {
											field : 'createdDate',
											caption : 'Created Date',
											size : '120px',
											resizable : true,
											sortable : true,
											render : 'date'
										}, {
											field : 'modifiedBy',
											caption : 'Modified By',
											size : '120px',
											resizable : true,
											sortable : true
										}, {
											field : 'modifiedDate',
											caption : 'Modified Date',
											size : '120px',
											resizable : true,
											sortable : true,
											render : 'date'
										}]
									}
								};
							
								$(function() {
							
									var contextPath = $('#contextPath').val();
							
									var cData = {
										id : '1'
									}
							
									$.ajax({
										type : "POST",
										url : contextPath + "/getProductInfo.do",
										data : JSON.stringify(cData),
										contentType : "application/json",
										success : function(data) {
											var cData = JSON.parse(data);
											$().w2grid(config.grid);
											for (var i = 0; i < cData.length; i++) {
												w2ui['grid'].records.push({
													//recid : i + 1,
													recid : cData[i].id,
													role_id : cData[i].role_id,
													role : cData[i].role,
													remarks : cData[i].remarks,
													createdBy : cData[i].createdBy,
													createdDate : cData[i].createdDate,
													modifiedBy : cData[i].modifiedBy,
													modifiedDate : cData[i].modifiedDate
													
												});
											}
							
											w2ui.grid.refresh();
											$('#main').w2render('grid');
										},
										error : function(err) {
											alert("Product Information Load Failed...");
										}
							
									});
								});
								
								
								$(document).ready(function(){
									$("#collapseBtn").click(function(){										
										$('#collapseIcn').toggleClass('fa-plus fa-minus');
										$(this).toggleClass('btn-info btn-warning');
									});
								});
							</script>
                    	<!-- ----------End Table ------------- -->
                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div>
        </div>
        
    </section><!-- /.content -->
</div>