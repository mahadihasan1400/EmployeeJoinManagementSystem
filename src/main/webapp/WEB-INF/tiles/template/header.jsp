<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page session="true"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<input type="hidden" value="${pageContext.request.contextPath}"
	id="contextPath" />

<div id="navbar" class="navbar navbar-default          ace-save-state">
	<div class="navbar-container ace-save-state" id="navbar-container">
		<button type="button" class="navbar-toggle menu-toggler pull-left"
			id="menu-toggler" data-target="#sidebar">
			<span class="sr-only">Toggle sidebar</span> <span class="icon-bar"></span>

			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>

		<div class="navbar-header pull-left">
			<a href="${pageContext.request.contextPath}/" class="navbar-brand">
				<small> <i class="glyphicon glyphicon-home"></i>
					<%-- ${properties['project.title']} --%>
					EJMS				
			</small>
			</a>		
		</div>
		

		<div class="navbar-buttons navbar-header pull-right" role="navigation">
			<ul class="nav ace-nav">
				<!-- ---------------------------------------------------------------- -->
				<li class="light-blue">
				${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
				<c:set var="userName" value="${sessionScope.userr}" scope="page" />
				<c:set var="userId" value="${sessionScope.userrId}" scope="page" />
				<c:set var="roleName" value="${sessionScope.roleName}" scope="page" />	
				<c:set var="loginEmployee" value="${sessionScope.loginEmployee}" scope="page" />	
				
						<li class="green"> <a href="${pageContext.request.contextPath}/myProfile"> <i
								class="fa fa-fw fa-eye"></i> My Profile
						</a></li>
						
						<li class="purple"> <a href="${pageContext.request.contextPath}/changePassword"> 
						<span class="fa-passwd-reset fa-stack"> <span class="fa fa-undo fa-stack-2x"></span> 
						<span class="fa fa-lock fa-stack-1x"></span> </span> Change Password
						</a></li>
						
						<li class="red"> <a href="${pageContext.request.contextPath}/<c:url value='j_spring_security_logout' />"> <i
								class="ace-icon fa fa-power-off"></i> Logout
						</a></li>
						
						<!-- <li class="light-blue"> -->
						<li class="blue">
							<a href="${pageContext.request.contextPath}/" >
								<img class="nav-user-photo" src="${pageContext.request.contextPath}/resource/assets/images/avatars/user.jpg" alt="Jason's Photo" />
								<span class="user-info">
									<small>Welcome,</small>
									${userName}
								</span>
							</a>
						</li>
					
				<!-- ---------------------------------------------------------------- -->
			</ul>
		</div>

	</div>
	<!-- /.navbar-container -->
</div>
