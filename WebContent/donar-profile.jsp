<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<title>Blood Bank Management System !! Donor Profile</title>

<script>
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);

	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>
<!--// Meta tag Keywords -->

<!-- Custom-Files -->
<link rel="stylesheet" href="css/bootstrap.css">
<!-- Bootstrap-Core-CSS -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<!-- Style-CSS -->
<link rel="stylesheet" href="css/fontawesome-all.css">
<!-- Font-Awesome-Icons-CSS -->
<!-- //Custom-Files -->

<!-- Web-Fonts -->
<link
	href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese"
	rel="stylesheet">
<link
	href="//fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese"
	rel="stylesheet">
<!-- //Web-Fonts -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>

<body>
	<%
		if (session.getAttribute("FullName") != null && session.getAttribute("FullName") != "") {
	%>
	<jsp:include page="header.jsp"></jsp:include>

	<!-- banner 2 -->
	<div class="inner-banner-w3ls">
		<div class="container"></div>
		<!-- //banner 2 -->
	</div>
	<!-- page details -->
	<div class="breadcrumb-agile">
		<div aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Donor
					Profile</li>
			</ol>
		</div>
	</div>
	<!-- //page details -->

	<!-- contact -->
	<div class="appointment py-5">
		<div class="py-xl-5 py-lg-3">
			<div class="w3ls-titles text-center mb-5">
				<h3 class="title">Donor Profile</h3>
				<span> <i class="fas fa-user-md"></i>
				</span>
			</div>
			<div class="d-flex">
				<div class="appoint-img"></div>
				<div class="contact-right-w3l appoint-form">
					<h5 class="title-w3 text-center mb-5">Detail of Your profile</h5>
						<%
							String editProfile = (String) session.getAttribute("success");
							if (editProfile != null) {
							session.removeAttribute("success");
						%>
						<div class="alert alert-info" id="info">Your profile edited sucessfully.</div>
						<%
							}
						%>
					<form action="UpdateDonarProfile" method="post">
						<%
							ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblblooddonars where FullName='"+ session.getAttribute("FullName") + "' OR EmailId='" + session.getAttribute("email") + "'");
							if (resultset.next()) {
						%>
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">Full
								Name <span style="color: red; font-size: 10px;">(Can't be
									Change)</span>
							</label> <input type="text" class="form-control" name="fullname"
								id="fullname" value="<%=resultset.getString("FullName")%>"
								readonly>
						</div>
						<div class="form-group">
							<label for="recipient-phone" class="col-form-label">Mobile
								Number</label> <input type="text" class="form-control" name="mobileno"
								id="mobileno" required="true" maxlength="10" pattern="[0-9]+"
								value="<%=resultset.getString("MobileNumber")%>">
						</div>
						<div class="form-group">
							<label for="recipient-phone" class="col-form-label">Email
								Id <span style="color: red; font-size: 10px;">(Can't be
									Change)</span>
							</label> <input type="email" name="emailid" class="form-control"
								value="<%=resultset.getString("EmailId")%>" readonly>
						</div>
						<div class="form-group">
							<label for="recipient-phone" class="col-form-label">Age</label> <input
								type="text" class="form-control" name="age" id="age" required=""
								value="<%=resultset.getInt("age")%>">
						</div>
						<div class="form-group">
							<label for="datepicker" class="col-form-label">Gender</label> <select
								required="" class="form-control" name="gender">
								<option value="<%=resultset.getString("gender")%>"><%=resultset.getString("gender")%></option>
								<option value="Male">Male</option>
								<option value="Female">Female</option>
							</select>
						</div>

						<div class="form-group">
							<label for="datepicker" class="col-form-label">Blood
								Group</label> <select name="bloodgroup" class="form-control" required>
								<option value="<%=resultset.getString("BloodGroup")%>"><%=resultset.getString("BloodGroup")%></option>
								<%
									ResultSet rsbloodGroup = DatabaseConnection.getResultFromSqlQuery("SELECT * from  tblbloodgroup");
									while (rsbloodGroup.next()) {
								%>
								<option value="<%=rsbloodGroup.getString("BloodGroup")%>"><%=rsbloodGroup.getString("BloodGroup")%></option>
								<%
									}
								%>
							</select>
						</div>
						<div class="form-group">
							<label for="datepicker" class="col-form-label">Address</label> <input
								type="text" class="form-control" name="address" id="address"
								required="true" value="<%=resultset.getString("address")%>">
						</div>
						<div class="form-group">
							<label for="datepicker" class="col-form-label">Message</label>
							<textarea class="form-control" name="message" required><%=resultset.getString("Message")%></textarea>
						</div>
						<input type="submit" value="Update" name="update" class="btn_apt">
						<%
							}
						%>
					</form>
				</div>
				<div class="clerafix"></div>
			</div>
		</div>
	</div>
	<!-- //contact -->

	<jsp:include page="footer.jsp"></jsp:include>
	<!-- Js files -->
	<!-- JavaScript -->
	<script src="js/jquery-2.2.3.min.js"></script>
	<!-- Default-JavaScript-File -->

	<!--start-date-piker-->
	<link rel="stylesheet" href="css/jquery-ui.css" />
	<script src="js/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#datepicker,#datepicker1").datepicker();
		});
	</script>
	<!-- //End-date-piker -->

	<!-- fixed navigation -->
	<script src="js/fixed-nav.js"></script>
	<!-- //fixed navigation -->

	<!-- smooth scrolling -->
	<script src="js/SmoothScroll.min.js"></script>
	<!-- move-top -->
	<script src="js/move-top.js"></script>
	<!-- easing -->
	<script src="js/easing.js"></script>
	<!--  necessary snippets for few javascript files -->
	<script src="js/medic.js"></script>

	<script src="js/bootstrap.js"></script>
	<!-- Necessary-JavaScript-File-For-Bootstrap -->

	<!-- //Js files -->
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