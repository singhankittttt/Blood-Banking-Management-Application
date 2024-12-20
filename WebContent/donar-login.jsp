<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<title>Blood Bank Management System | Login</title>
<!-- Meta tag Keywords -->

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
				<li class="breadcrumb-item active" aria-current="page">Login</li>
			</ol>
		</div>
	</div>
	<!-- //page details -->

	<!-- about -->
	<section class="about py-5">
		<div class="container py-xl-5 py-lg-3">
			<div class="login px-4 mx-auto mw-100">
				<h5 class="text-center mb-4">Login Now</h5>
						<%
							String loginDetails = (String) session.getAttribute("message");
							if (loginDetails != null) {
							session.removeAttribute("message");
						%>
						<div class="alert alert-danger" id="danger">Invalid login details, please enter valid details</div>
						<%
							}
						%>
				<form action="DonarLogin" method="post" name="login">
					<div class="form-group">
						<label>Email ID</label> <input type="email" class="form-control"
							name="email" placeholder="Enter your registered email id" required="">
					</div>
					<div class="form-group">
						<label class="mb-2">Password</label> <input type="password"
							class="form-control" name="password" id="password" placeholder="Your password"
							required="">
					</div>
					<button type="submit" class="btn submit mb-4" name="login">Login</button>
					<!--     <p class="forgot-w3ls text-center pb-4">
                                    <a href="#" class="text-white">Forgot your password?</a>
                                </p> -->
					<p class="account-w3ls text-center pb-4" style="color: #000">
						Don't have an account? <a href="donar-sign-up.jsp">Create one
							now</a>
					</p>
				</form>
			</div>
		</div>
	</section>
	<!-- //about -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- Js files -->
	<!-- JavaScript -->
	<script src="js/jquery-2.2.3.min.js"></script>
	<!-- Default-JavaScript-File -->

	<!-- banner slider -->
	<script src="js/responsiveslides.min.js"></script>
	<script>
		$(function() {
			$("#slider4").responsiveSlides({
				auto : true,
				pager : true,
				nav : true,
				speed : 1000,
				namespace : "callbacks",
				before : function() {
					$('.events').append("<li>before event fired.</li>");
				},
				after : function() {
					$('.events').append("<li>after event fired.</li>");
				}
			});
		});
	</script>
	<!-- //banner slider -->

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