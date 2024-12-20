<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en" class="no-js">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Blood Bank Management System | Admin Login</title>
<link rel="stylesheet" href="admin/css/font-awesome.min.css">
<link rel="stylesheet" href="admin/css/bootstrap.min.css">
<link rel="stylesheet" href="admin/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="admin/css/bootstrap-social.css">
<link rel="stylesheet" href="admin/css/bootstrap-select.css">
<link rel="stylesheet" href="admin/css/fileinput.min.css">
<link rel="stylesheet" href="admin/css/awesome-bootstrap-checkbox.css">
<link rel="stylesheet" href="admin/css/style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>

<body>
	<div class="login-page bk-img"
		style="background-image: url(admin/img/admin-login.JPG);">
		<div class="form-content">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-md-offset-3">
						<h1 class="text-center text-bold text-light mt-4x"><span>BBMS</span> Admin Log in</h1>
						<div class="well row pt-2x pb-3x bk-light">
							<%
								String loginDetails = (String) session.getAttribute("message");
								if (loginDetails != null) {
								session.removeAttribute("message");
							%>
							<div class="alert alert-danger" id="danger">Invalid login details, please enter valid details</div>
							<%
								}
							%>
							<div class="col-md-8 col-md-offset-2">
								<form action="AdminLogin" method="post">
									<label for="" class="text-uppercase text-sm">Admin
										User Name </label> <input type="text" placeholder="User Name"
										name="username" class="form-control mb" style="border: 1px solid #555;color:1px solid #555;"> <label for=""
										class="text-uppercase text-sm">Password</label> <input
										type="password" placeholder="Password" name="password"
										class="form-control mb" style="border: 1px solid #555;">

									<button class="btn btn-primary btn-block" name="login"
										type="submit">LOGIN</button><br>
									<a href="forgot-password.jsp">Forgot Password</a>
								</form>
								<div class="card-footer text-center" style="padding-top: 30px;">
									<div class="small">
										<a href="index.jsp" class="btn btn-primary">Back to
											Home</a>
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
</body>
</html>