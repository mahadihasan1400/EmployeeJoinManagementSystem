<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<!-- Title and other stuffs -->
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="">

<!-- bootstrap & fontawesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/assets/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/AdminLTE.min.css" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/assets/font-awesome/4.5.0/css/font-awesome.min.css" />

<!-- text fonts -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/assets/css/fonts.googleapis.com.css" />
<!-- ace styles -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/assets/css/ace.min.css"
	class="ace-main-stylesheet" id="main-ace-style" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/assets/css/ace-skins.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/assets/css/ace-rtl.min.css" />
<!-- ace settings handler -->
<script
	src="${pageContext.request.contextPath}/resource/assets/js/ace-extra.min.js"></script>

<script
	src="${pageContext.request.contextPath}/resource/bufferGrid/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resource/bufferGrid/w2ui.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resource/bufferGrid/w2ui.min.css" />

<script src="${pageContext.request.contextPath}/resource/js/common.js"></script>

<link
	href="${pageContext.request.contextPath}/resource/dataTable/jquery.dataTables.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resource/dataTable/buttons.dataTables.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resource/dataTable/jquery-1.12.3.js"></script>
<script
	src="${pageContext.request.contextPath}/resource/dataTable/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resource/dataTable/dataTables.buttons.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resource/dataTable/buttons.flash.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resource/dataTable/jszip.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resource/dataTable/pdfmake.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resource/dataTable/vfs_fonts.js"></script>
<script
	src="${pageContext.request.contextPath}/resource/dataTable/buttons.html5.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resource/dataTable/buttons.print.min.js"></script>


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css"
	rel="stylesheet" type="text/css">

<link
	href="${pageContext.request.contextPath}/resource/select2/select2.min.css"
	rel="stylesheet" type="text/css">
<script
	src="${pageContext.request.contextPath}/resource/select2/select2.min.js"></script>

<link
	href="${pageContext.request.contextPath}/resource/w2ui/w2ui-1.5.rc1.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resource/w2ui/w2ui-1.5.rc1.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resource/w2ui/w2ui-1.5.rc1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resource/w2ui/w2ui-1.5.rc1.js"></script>
<script src="https://cdn.ckeditor.com/4.10.0/standard-all/ckeditor.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/style.css" />
<body>

	<div id="sidebar" class="sidebar responsive ace-save-state">
		<script type="text/javascript">
			try {
				ace.settings.loadState('sidebar')
			} catch (e) {
			}
		</script>

		<div class="sidebar-shortcuts" id="sidebar-shortcuts">
			<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
				<button class="btn btn-success">
					<i class="ace-icon fa fa-signal"></i>
				</button>

				<button class="btn btn-info">
					<i class="ace-icon fa fa-pencil"></i>
				</button>

				<button class="btn btn-warning">
					<i class="ace-icon fa fa-users"></i>
				</button>

				<button class="btn btn-danger">
					<i class="ace-icon fa fa-cogs"></i>
				</button>
			</div>

			<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
				<span class="btn btn-success"></span> <span class="btn btn-info"></span>

				<span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
			</div>
		</div>
		<!-- /.sidebar-shortcuts -->

		<ul class="nav nav-list">
			<li class=""><a href="${pageContext.request.contextPath}/">
					<i class="fab fa-affiliatetheme"></i> <span class="menu-text">
						Dashboard </span>
			</a> <b class="arrow"></b></li>

			<li class=""><a
				href="${pageContext.request.contextPath}/deparmentList"> <i
					class="fas fa-archway"></i> <span class="menu-text">
						Department Info </span>
			</a> <b class="arrow"></b></li>

			<li class=""><a
				href="${pageContext.request.contextPath}/districtList"> <i
					class="fas fa-school"></i> <span class="menu-text"> District
						Info </span>
			</a> <b class="arrow"></b></li>

			<li class=""><a
				href="${pageContext.request.contextPath}/thanaList"> <i
					class="fab fa-old-republic"></i> <span class="menu-text">
						Thana Info </span>
			</a> <b class="arrow"></b></li>

			<li class=""><a
				href="${pageContext.request.contextPath}/applicationForm"> <i
					class="fas fa-atlas"></i> <span class="menu-text">
						Application Form </span>
			</a> <b class="arrow"></b></li>
			
			<li class=""><a
				href="${pageContext.request.contextPath}/applicantList"> <i
					class="fas fa-user"></i> <span class="menu-text">
						Applicants List </span>
			</a> <b class="arrow"></b></li>

			<%-- <sec:authorize access="hasRole('ROLE_ADMIN')">
				<li class=""><a href="javascript:void(0)"
					class="dropdown-toggle"> <i
						class="menu-icon fa fa-gear fa-spin"></i> <span class="menu-text">
							Settings </span> <b class="arrow fa fa-angle-down"></b>
				</a> <b class="arrow"></b>

					<ul class="submenu">
						<li class=""><a href="javascript:void(0)"
							class="dropdown-toggle"> <i
								class="menu-icon fa fa-cogs green"></i> Configuration <b
								class="arrow fa fa-angle-down"></b>
						</a> <b class="arrow"></b>

							<ul class="submenu">
								<li class=""><a
									href="${pageContext.request.contextPath}/newJobSettingsForm">
										<i class="menu-icon fa fa-plus purple"></i> Add Configuration
								</a> <b class="arrow"></b></li>

								<li class=""><a
									href="${pageContext.request.contextPath}/jobSettingsList">
										<i class="menu-icon fa fa-list"></i> Configuration List
								</a> <b class="arrow"></b></li>
							</ul></li>

						<li class=""><a href="javascript:void(0)"
							class="dropdown-toggle"><i
								class="menu-icon fa fa-calendar purple"></i> Fiscal Year <b
								class="arrow fa fa-angle-down"></b> </a> <b class="arrow"></b>

							<ul class="submenu">
								<li class=""><a
									href="${pageContext.request.contextPath}/newFiscalYearForm">
										<i class="menu-icon fa fa-plus purple"></i> Add New Fiscal
										Year
								</a> <b class="arrow"></b></li>

								<li class=""><a
									href="${pageContext.request.contextPath}/fiscalYearList"> <i
										class="menu-icon fa fa-list"></i> Fiscal Year List
								</a> <b class="arrow"></b></li>
							</ul></li>

					</ul></li>

			</sec:authorize> --%>

			<c:if test="${true}">



				<%-- <sec:authorize
					access="hasRole('ROLE_ADMIN') or hasRole('ROLE_JOB_ADMIN') or hasRole('ROLE_USER') or hasRole('ROLE_UTILITY_ADMIN') or hasRole('ROLE_LEAVE_ADMIN') or hasRole('ROLE_LEAVE_SUPERVISOR') or hasRole('ROLE_LEAVE_USER') or hasRole('ROLE_ATTENDANCE_ADMIN') or hasRole('ROLE_ATTENDANCE_SUPERVISOR') or hasRole('ROLE_ATTENDANCE_USER') or hasRole('ROLE_SUPERVISOR') or hasRole('ROLE_COO')or hasRole('ROLE_COO_PA')or hasRole('ROLE_ACC_FIN')or hasRole('ROLE_ACC_COA')">
					<li class=""><a href="javascript:void(0)"
						class="dropdown-toggle"> <i class="menu-icon fa fa-tasks blue"></i>
							<span class="menu-text"> Jobs </span> <b
							class="arrow fa fa-angle-down"></b>
					</a> <b class="arrow"></b>
						<ul class="submenu">
							<li class=""><a
								href="${pageContext.request.contextPath}/newJobAdvanceForm">
									<i class="menu-icon fa fa-plus purple"></i> Add New Job
							</a> <b class="arrow"></b></li>

							<li class=""><a
								href="${pageContext.request.contextPath}/myJobsList"> <i
									class="menu-icon fa fa-list"></i> My Jobs
							</a> <b class="arrow"></b></li>

							<sec:authorize
								access="hasRole('ROLE_ADMIN') or hasRole('ROLE_JOB_ADMIN')">
								<li class=""><a
									href="${pageContext.request.contextPath}/approvedJobList">
										<i class="menu-icon fa fa-list"></i> Approved Jobs
								</a> <b class="arrow"></b></li>

								<li class=""><a
									href="${pageContext.request.contextPath}/pendingJobList"> <i
										class="menu-icon fa fa-list"></i> Pending Jobs
								</a> <b class="arrow"></b></li>

								<li class=""><a
									href="${pageContext.request.contextPath}/rejectedJobList">
										<i class="menu-icon fa fa-list"></i> Rejected Job Request
								</a> <b class="arrow"></b></li>

								<li class=""><a
									href="${pageContext.request.contextPath}/allJobList"> <i
										class="menu-icon fa fa-list"></i> All Jobs
								</a> <b class="arrow"></b></li>

							</sec:authorize>
						</ul></li>
				</sec:authorize> --%>



				<sec:authorize
					access="hasRole('ROLE_ADMIN')  or hasRole('ROLE_JOB_ADMIN') or hasRole('ROLE_ACC_FIN')">
					<li class=""><a href="javascript:void(0)"
						class="dropdown-toggle"> <i
							class="menu-icon fa fa-file-pdf-o red"></i> <span
							class="menu-text"> Reports </span> <b
							class="arrow fa fa-angle-down"></b>
					</a> <b class="arrow"></b>
						<ul class="submenu">
							<li class=""><a
								href="${pageContext.request.contextPath}/jobAdvanceReportForm">
									<i class="menu-icon fa fa-list"></i> Job Report Form
							</a> <b class="arrow"></b></li>


							<li class=""><a
								href="${pageContext.request.contextPath}/rejectedJobReport">
									<i class="menu-icon fa fa-list"></i> Rejected Job
							</a> <b class="arrow"></b></li>

							<li class=""><a
								href="${pageContext.request.contextPath}/pendingJobReport">
									<i class="menu-icon fa fa-list"></i> Pending Job
							</a> <b class="arrow"></b></li>
						</ul></li>
				</sec:authorize>


			</c:if>
		</ul>
		<!-- /.nav-list -->

		<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
			<i id="sidebar-toggle-icon"
				class="ace-icon fa fa-angle-double-left ace-save-state"
				data-icon1="ace-icon fa fa-angle-double-left"
				data-icon2="ace-icon fa fa-angle-double-right"></i>
		</div>
	</div>




</body>
</html>

