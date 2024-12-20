<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- header -->
<header>
	<!-- top-bar -->
	<div class="top-bar py-3">
		<div class="container">
			<div class="row">
				<div class="col-lg-7 top-social-agile">
					<div class="row">
						<div
							class="col-10 header-top_w3layouts pl-3 text-lg-left text-center">
							<p class="text-white">
								<i class="fas fa-map-marker-alt mr-2"></i> Blood Bank Management
								System
							</p>
						</div>
					</div>
				</div>
				<div class="col-lg-5 top-social-agile text-lg-right text-center">
					<div class="row">
						<div class="col-lg-7 col-6 top-w3layouts">
							<p class="text-white">
								<i class="far fa-envelope-open mr-2"></i> <a
									href="mailto:info@amigos.com" class="text-white">
									bloodbank@blood.com </a>
							</p>
						</div>
						<div class="col-lg-5 col-6 header-w3layouts pl-4 text-lg-left">
							<p class="text-white">
								<i class="fas fa-phone mr-2"></i>+ 9898989898
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>
<!-- //top-bar -->

<!-- header 2 -->
<div id="home">
	<!-- navigation -->
	<div class="main-top py-1">
		<nav class="navbar navbar-expand-lg navbar-light fixed-navi">
			<div class="container">
				<!-- logo -->
				<h1>
					<a class="navbar-brand font-weight-bold font-italic"
						href="index.jsp"> <span>BB</span>MS <i class="fas fa-syringe"></i>
					</a>
				</h1>
				<!-- //logo -->
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse text-center"
					id="navbarSupportedContent">
					<ul class="navbar-nav ml-lg-auto">
						<li class="nav-item active mt-lg-0 mt-3"><a class="nav-link"
							href="index.jsp">Home <span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item mx-lg-4 my-lg-0 my-3"><a class="nav-link"
							href="about.jsp">About Us</a></li>
						<li class="nav-item mx-lg-4 my-lg-0 my-3"><a class="nav-link"
							href="donar-list.jsp">Donor List</a></li>
						<li class="nav-item mx-lg-4 my-lg-0 my-3"><a class="nav-link"
							href="contact.jsp">Contact Us</a></li>

						<%
							if ((String) session.getAttribute("FullName") != null) {
						%>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> My Account </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">

								<a class="dropdown-item" href="donar-profile.jsp">Profile</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="donar-change-password.jsp">Change
									Password</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="request-received.jsp">Request
									Received</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="logout.jsp">Logout</a>
							</div>
						</li>
					</ul>
					<%
						} else {
					%><!-- login -->
					<a href="donar-login.jsp"
						class="login-button ml-lg-5 mt-lg-0 mt-4 mb-lg-0 mb-3"> <i
						class="fas fa-sign-in-alt mr-2"></i>Donar Login
					</a> <a href="admin-login.jsp"
						class="login-button ml-lg-5 mt-lg-0 mt-4 mb-lg-0 mb-3"> <i
						class="fas fa-sign-in-alt mr-2"></i>Admin Login
					</a>
					<!-- //login -->
					<%
						}
					%>
				</div>
			</div>
		</nav>
	</div>
	<!-- //navigation -->
	<!-- modal -->
	<!-- //modal -->
</div>
<!-- //header 2 -->