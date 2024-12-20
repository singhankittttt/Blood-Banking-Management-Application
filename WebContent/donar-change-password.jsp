<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<title>Blood Bank Management System !! Change Password</title>

<script>
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);

	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>
<script type="text/javascript">
	function checkpass() {
		if (document.changepassword.newpassword.value != document.changepassword.confirmpassword.value) {
			alert('New Password and Confirm Password field does not match');
			document.changepassword.confirmpassword.focus();
			return false;
		}
		return true;
	}
</script>

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
				<li class="breadcrumb-item active" aria-current="page">Change
					Password</li>
			</ol>
		</div>
	</div>
	<!-- //page details -->

	<!-- contact -->
	<div class="appointment py-5">
		<div class="py-xl-5 py-lg-3">
			<div class="w3ls-titles text-center mb-5">
				<h3 class="title">Change Password</h3>
				<span> <i class="fas fa-user-md"></i>
				</span>
			</div>
			<div class="d-flex">
				<div class="appoint-img"></div>
				<div class="contact-right-w3l appoint-form">
					<h5 class="title-w3 text-center mb-5">Reset your password if
						needed</h5>
					<%
						String message = (String) session.getAttribute("password-change-success");
						if (message != null) {
							session.removeAttribute("password-change-success");
					%>
					<div class='alert alert-success' id='success'>Password change
						successfully.</div>
					<%
						}
					%>
					<%
						String fail = (String) session.getAttribute("password-change-fail");
						if (fail != null) {
							session.removeAttribute("password-change-fail");
					%>
					<div class="alert alert-danger" id='danger'>Old password does
						not match..</div>
					<%
						}
					%>
					<%
						String passwordConfirm = (String) session.getAttribute("password-not-match");
						if (passwordConfirm != null) {
							session.removeAttribute("password-not-match");
					%>
					<div class="alert alert-danger" id='danger'>New password and
						confirm password does not match.</div>
					<%
						}
					%>
					<form action="DonarChangePassword" method="post"
						onsubmit="return checkpass();" name="changepassword">
						<%
							ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblblooddonars where FullName ='"
								+ session.getAttribute("FullName") + "' OR EmailId='" + session.getAttribute("email") + "' ");
						while (resultset.next()) {
						%>
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">Current
								Password</label> <input type="password" class="form-control"
								name="cpassword" id="currentpassword" required='true'
								value="<%=resultset.getString("Password")%>" readonly>
						</div>
						<div class="form-group">
							<label for="recipient-phone" class="col-form-label">New
								Password</label> <input type="password" name="password"
								class="form-control" required="true" placeholder="New Password">
						</div>
						<div class="form-group">
							<label for="recipient-phone" class="col-form-label">Confirm
								Password</label> <input type="password" class="form-control"
								name="confpass" id="confirmpassword" required='true'
								placeholder="Confirm Password">
						</div>

						<input type="submit" value="Update" name="change" class="btn_apt">
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