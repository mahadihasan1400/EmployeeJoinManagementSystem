<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page session="true"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="content-wrapper" style="margin: 0px;">
		<!-- Content Header (Page header) -->
		<section class="content-header">
		<h1>Select Company</h1>
		</section>

		<!-- Main content -->
		<section class="content">

		<div class="row">
			<div class="col-xs-12">

				<!-- Horizontal Form -->
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title center">Company Select Form</h3>
					</div>
					<!-- /.box-header -->
					<!-- form start -->
					<form action="${pageContext.request.contextPath}/index"
						method="GET" class="formValMenu form-horizontal">
						<div class="box-body">

							<div class="form-group">
								<label for="name" class="col-sm-2 control-label"> <strong>
										Select Company : </strong>
								</label>
								<div class="col-sm-6">
									<select name="companyId" id="companyId" class="form-control">
										<c:if test="${!empty companyList}">
											<c:forEach items="${companyList}" var="company">
												<option value="${company.id}"> ${company.name}</option>
											</c:forEach>
										</c:if>
									</select>
								</div>
							</div>

						</div>
						<!-- /.box-body -->
						<div class="box-footer">
							<button type="reset" class="btn btn-warning">
								<i class="fa fa-hand-paper-o"></i>Reset
							</button>
							<button type="submit" class="btn btn-primary pull-right">
								<i class="fa fa-send-o"></i>Submit
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
</body>
</html>