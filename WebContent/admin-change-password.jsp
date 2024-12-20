<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<!doctype html>
<html lang="en" class="no-js">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<meta name="theme-color" content="#3e454c">

<title>BBMS | Admin Change Password</title>

<!-- Font awesome -->
<link rel="stylesheet" href="admin/css/font-awesome.min.css">
<!-- Sandstone Bootstrap CSS -->
<link rel="stylesheet" href="admin/css/bootstrap.min.css">
<!-- Bootstrap Datatables -->
<link rel="stylesheet" href="admin/css/dataTables.bootstrap.min.css">
<!-- Bootstrap social button library -->
<link rel="stylesheet" href="admin/css/bootstrap-social.css">
<!-- Bootstrap select -->
<link rel="stylesheet" href="admin/css/bootstrap-select.css">
<!-- Bootstrap file input -->
<link rel="stylesheet" href="admin/css/fileinput.min.css">
<!-- Awesome Bootstrap checkbox -->
<link rel="stylesheet" href="admin/css/awesome-bootstrap-checkbox.css">
<!-- Admin Stye -->
<link rel="stylesheet" href="admin/css/style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
.errorWrap {
	padding: 10px;
	margin: 0 0 20px 0;
	background: #fff;
	border-left: 4px solid #dd3d36;
	-webkit-box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .1);
	box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .1);
}

.succWrap {
	padding: 10px;
	margin: 0 0 20px 0;
	background: #fff;
	border-left: 4px solid #5cb85c;
	-webkit-box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .1);
	box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .1);
}
</style>


</head>

<body>
	<%
		if (session.getAttribute("UserName") != null && session.getAttribute("UserName") != "") {
	%>
	<jsp:include page="admin-header.jsp"></jsp:include>
	<div class="ts-main-content">
		<jsp:include page="admin-leftbar.jsp"></jsp:include>
		<div class="content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<h2 class="page-title">Change Password</h2>
						<div class="row">
							<div class="col-md-10">
								<div class="panel panel-info">
									<div class="panel-heading">Change Password</div><br>
									<%
										String message = (String) session.getAttribute("password-change-success");
										if (message != null) {
											session.removeAttribute("password-change-success");
									%>
									<div class='alert alert-success' id='success'>Password
										change successfully.</div>
									<%
										}
									%>
									<%
										String fail = (String) session.getAttribute("password-change-fail");
										if (fail != null) {
											session.removeAttribute("password-change-fail");
									%>
									<div class="alert alert-danger" id='danger'>Old password
										does not match..</div>
									<%
										}
									%>
									<%
										String passwordConfirm = (String) session.getAttribute("password-not-match");
										if (passwordConfirm != null) {
											session.removeAttribute("password-not-match");
									%>
									<div class="alert alert-danger" id='danger'>New password
										and confirm password does not match.</div>
									<%
										}
									%>
									<div class="panel-body">
										<form action="AdminChangePassword" method="post"
											name="chngpwd" class="form-horizontal"
											onSubmit="return valid();">
											<%
												ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tbladmin where UserName ='" + session.getAttribute("UserName") + "'");
												while (resultset.next()) {
											%>
											<div class="form-group">
												<label class="col-sm-4 control-label">Current
													Password</label>
												<div class="col-sm-8">
													<input type="password" class="form-control"
														name="cpassword" id="password"
														value="<%=resultset.getString("Password")%>" required
														readonly>
												</div>
											</div>
											<div class="hr-dashed"></div>

											<div class="form-group">
												<label class="col-sm-4 control-label">New Password</label>
												<div class="col-sm-8">
													<input type="password" class="form-control" name="password"
														id="newpassword" required placeholder="New Password">
												</div>
											</div>
											<div class="hr-dashed"></div>

											<div class="form-group">
												<label class="col-sm-4 control-label">Confirm
													Password</label>
												<div class="col-sm-8">
													<input type="password" class="form-control" name="confpass"
														id="confirmpassword" required
														placeholder="Confirm Password">
												</div>
											</div>
											<div class="hr-dashed"></div>
											<div class="form-group">
												<div class="col-sm-8 col-sm-offset-4">

													<button class="btn btn-primary" name="submit" type="submit">Save
														changes</button>
												</div>
											</div>
											<%
												}
											%>
										</form>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Loading Scripts -->
	<script src="admin/js/jquery.min.js"></script>
	<script src="admin/js/bootstrap-select.min.js"></script>
	<script src="admin/js/bootstrap.min.js"></script>
	<script src="admin/js/jquery.dataTables.min.js"></script>
	<script src="admin/js/dataTables.bootstrap.min.js"></script>
	<script src="admin/js/Chart.min.js"></script>
	<script src="admin/js/fileinput.js"></script>
	<script src="admin/js/chartData.js"></script>
	<script src="admin/js/main.js"></script>
	<%
		} else {
	response.sendRedirect("index.jsp");
	}
	%>
</body>
<script type="text/javascript">
	$(function() {
		$('#danger').delay(3000).show().fadeOut('slow');
	});

	$(function() {
		$('#success').delay(3000).show().fadeOut('slow');
	});

	$(function() {
		$('#info').delay(3000).show().fadeOut('slow');
	});
</script>
</html>
