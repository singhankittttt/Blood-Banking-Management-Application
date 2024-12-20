<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<title>Blood Bank Management System | Sign Up</title>
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
				<li class="breadcrumb-item active" aria-current="page">Signup</li>
			</ol>
		</div>
	</div>
	<!-- //page details -->

	<!-- about -->
	<section class="about py-5">
		<div class="container py-xl-5 py-lg-3">
			<div class="login px-4 mx-auto mw-100">
				<h5 class="text-center mb-4">Donar Register Now</h5>
						<%
							String register = (String) session.getAttribute("success");
							if (register != null) {
							session.removeAttribute("success");
						%>
						<div class="alert alert-info" id="info">Donar account created sucessfully.</div>
						<%
							}
						%>
				<form action="AddDonar" method="post" name="signup"
					onsubmit="return checkpass();">
					<div class="form-row">
						<div class="form-group col-md-6">
							<label>Full Name</label> <input type="text" class="form-control"
								name="fullname" id="fullname" placeholder="Full Name" onkeypress="return lettersValidate(event)" required>
						</div>
						<div class="form-group col-md-6">
							<label>Mobile Number</label> <input type="text"
								class="form-control" name="mobileno" id="mobileno"
								required="true" placeholder="Mobile Number" maxlength="10"
								pattern="[0-9]+" onkeypress="return numberValidate(event)" required>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label class="mb-2">Email Id</label> <input type="email"
								name="emailid" class="form-control" placeholder="Email Id" required>
						</div>
						<div class="form-group col-md-6">
							<label class="mb-2">Age</label> <input type="text"
								class="form-control" name="age" id="age" placeholder="Age"
								required="" onkeypress="return numberValidate(event)" maxlength="3" required>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label class="mb-2">Gender</label> <select name="gender"
								class="form-control" required>
								<option value="">Select</option>
								<option value="Male">Male</option>
								<option value="Female">Female</option>
							</select>
						</div>
						<div class="form-group col-md-6">
							<label class="mb-2">Blood Group</label> <select name="bloodgroup"
								class="form-control" required>
								<%
									String bloodGroup = null;
									ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select BloodGroup from tblbloodgroup");
									while (resultset.next()) {
									bloodGroup = resultset.getString(1);
								%>
								<option value="<%=bloodGroup%>"><%=bloodGroup%></option>
								<%
									}
								%>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label>Address</label> <input type="text" class="form-control"
							name="address" id="address" required="true" placeholder="Address" required>
					</div>
					<div class="form-group">
						<label>Message</label>
						<textarea class="form-control" name="message" required> </textarea>
					</div>
					<div class="form-group">
						<label>Password</label> <input type="password"
							class="form-control" name="password" id="password" required placeholder="Password" oninput="limitChar(this)" maxlength="12">
					</div>
					<button type="submit" class="btn btn-primary submit mb-4"
						name="submit">Register</button>
					<p class="account-w3ls text-center pb-4" style="color: #000">
						Already Registered? <a href="donar-login.jsp">Signin now</a>
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
<script type="text/javascript">
		let limitChar = (element) => {
	        const maxChar = 12;
	        
	        let ele = document.getElementById(element.id);
	        let charLen = ele.value.length;
	        
	        let p = document.getElementById('charCounter');
	        p.innerHTML = maxChar - charLen + ' characters remaining';
	        
	        if (charLen > maxChar) 
	        {
	            ele.value = ele.value.substring(0, maxChar);
	            p.innerHTML = 0 + ' characters remaining'; 
	        }
	    }
		let limitNumber = (element) => {
	        const maxNumber = 6;
	        
	        let ele = document.getElementById(element.id);
	        let numberLen = ele.value.length;
	        
	        let p = document.getElementById('numberCounter');
	        p.innerHTML = maxNumber - numberLen + ' number remaining';
	        
	        if (numberLen > maxNumber) 
	        {
	            ele.value = ele.value.substring(0, maxNumber);
	            p.innerHTML = 0 + ' number remaining'; 
	        }
	    }
		function lettersValidate(key) {
	    	var keycode = (key.which) ? key.which : key.keyCode;
	   		if ((keycode > 64 && keycode < 91) || (keycode > 96 && keycode < 123) || keycode == 32)  
	    	{     
	           return true;    
	    	}else{
	           return false;
	    	}    
	    }
		function numberValidate(key) {
	    	var keycode = (key.which) ? key.which : key.keyCode;
	   		if ((keycode > 47 && keycode < 58))  
	    	{     
	           return true;    
	    	}else{
	           return false;
	    	} 
	    }
</script>
<script>
	 $(document).ready(function() {
         $("#btnValidate").click(function() {
             var dname = $("#dname").val();
             var emailId = $("#emailId").val();
             var txtMB = $("#txtMB").val();
             var address = $("#address").val();
             var uname = $("#uname").val();
             var upass = $("#upass").val();
             if (dname === "" || emailId === "" || address ===""|| uname === "" || upass === "")
             {
                 $("#dname").css("border-color", "red");
                 $("#emailId").css("border-color", "red");
                 $("#txtMB").css("border-color", "red");
                 $("#address").css("border-color", "red");
                 $("#uname").css("border-color", "red");
                 $("#upass").css("border-color", "red");
                 alert("All fields are mandatory.");
                 return false;
             }
         });
     });                                              
</script>
<script>
	//This function will validate Email.
	function ValidateEmail() {
		var uemail = document.driverRegister.demail;
		var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		if (uemail.value.match(mailformat)) {
			document.driverRegister.desc.focus();
			return true;
		} else {
			alert("Please enter valid email id.!");
			uemail.focus();
			return false;
		}
	}

	function ValidateMobNumber(txtMobId) {
		var fld = document.getElementById(txtMobId);
		if (fld.value == "") {
			alert("You didn't enter a mobile number.");
			fld.value = "";
			fld.focus();
			return false;
		} else if (isNaN(fld.value)) {
			alert("The mobile number contains illegal characters.");
			fld.value = "";
			fld.focus();
			return false;
		} else if (!(fld.value.length == 10)) {
			alert("The mobile number is the wrong length. \nPlease enter 10 digit mobile no.");
			fld.value = "";
			fld.focus();
			return false;
		}

	}
</script>
</html>