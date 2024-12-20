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

<title>BBMS | Admin Dashboard</title>

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
						<h2 class="page-title">Dashboard</h2>
						<div class="row">
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-4">
										<div class="panel panel-default">
											<div class="panel-body bk-primary text-light">
												<div class="stat-panel text-center">
													<%
														int bloodGroupCount=0;
														ResultSet resultBloodGroup=DatabaseConnection.getResultFromSqlQuery("SELECT count(*) from tblbloodgroup");
														resultBloodGroup.next();
														bloodGroupCount=resultBloodGroup.getInt(1);
													%>
													<div class="stat-panel-number h1 "><%=bloodGroupCount %></div>
													<div class="stat-panel-title text-uppercase">Listed
														Blood Groups</div>
												</div>
											</div>
											<a href="manage-blood-group.jsp"
												class="block-anchor panel-footer">Full Detail <i
												class="fa fa-arrow-right"></i></a>
										</div>
									</div>
									<div class="col-md-4">
										<div class="panel panel-default">
											<div class="panel-body bk-success text-light">
												<div class="stat-panel text-center">

													<%
														int bloodGroupDonars=0;
														ResultSet resultBloodDonar=DatabaseConnection.getResultFromSqlQuery("SELECT count(*) from tblblooddonars");
														resultBloodDonar.next();
														bloodGroupDonars=resultBloodDonar.getInt(1);
													%>
													<div class="stat-panel-number h1 "><%=bloodGroupDonars %></div>
													<div class="stat-panel-title text-uppercase">Registered
														Blood Group</div>
												</div>
											</div>
											<a href="admin-view-donar-list.jsp"
												class="block-anchor panel-footer text-center">Full
												Detail &nbsp; <i class="fa fa-arrow-right"></i>
											</a>
										</div>
									</div>
									<div class="col-md-4">
										<div class="panel panel-default">
											<div class="panel-body bk-info text-light">
												<div class="stat-panel text-center">

													<%
														int totalQueries=0;
														ResultSet resultQueries=DatabaseConnection.getResultFromSqlQuery("SELECT count(*) from tblcontactusquery");
														resultQueries.next();
														totalQueries=resultQueries.getInt(1);
													%>
													<div class="stat-panel-number h1 "><%=totalQueries %></div>
													<div class="stat-panel-title text-uppercase">Total
														Queries</div>
												</div>
											</div>
											<a href="manage-conactus-query.jsp"
												class="block-anchor panel-footer text-center">Full
												Detail &nbsp; <i class="fa fa-arrow-right"></i>
											</a>
										</div>
									</div>
									<!------------------------>
									<div class="col-md-4">
										<div class="panel panel-danger">
											<div class="panel-body bk-info text-light">
												<div class="stat-panel text-center">
													<%
														int totalbloodRequest=0;
														ResultSet resultbloodRequest=DatabaseConnection.getResultFromSqlQuery("SELECT count(*) from tblbloodrequirer");
														resultbloodRequest.next();
														totalbloodRequest=resultbloodRequest.getInt(1);
													%>
													<div class="stat-panel-number h1 "><%=totalbloodRequest%></div>
													<div class="stat-panel-title text-uppercase">Total
														Blood Request Received</div>
												</div>
											</div>
											<a href="blood-request.jsp"
												class="block-anchor panel-footer text-center">Full
												Detail &nbsp; <i class="fa fa-arrow-right"></i>
											</a>
										</div>
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

	<script>
		window.onload = function() {

			// Line chart from swirlData for dashReport
			var ctx = document.getElementById("dashReport").getContext("2d");
			window.myLine = new Chart(ctx).Line(swirlData, {
				responsive : true,
				scaleShowVerticalLines : false,
				scaleBeginAtZero : true,

			});

			// Pie Chart from doughutData
			var doctx = document.getElementById("chart-area3").getContext("2d");
			window.myDoughnut = new Chart(doctx).Pie(doughnutData, {
				responsive : true
			});

			// Dougnut Chart from doughnutData
			var doctx = document.getElementById("chart-area4").getContext("2d");
			window.myDoughnut = new Chart(doctx).Doughnut(doughnutData, {
				responsive : true
			});

		}
	</script>
	<%
		} else {
		response.sendRedirect("index.jsp");
	}
	%>
</body>
</html>
