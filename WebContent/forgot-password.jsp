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

<title>Blood Bank Management System | Forgot Password</title>
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
<script type="text/javascript">
	function valid() {
		if (document.chngpwd.newpassword.value != document.chngpwd.confirmpassword.value) {
			alert("New Password and Confirm Password Field do not match  !!");
			document.chngpwd.confirmpassword.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div class="login-page bk-img"
		style="background-image: url(admin/img/forgot-password.JPG);">
		<div class="form-content">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-md-offset-3">
						<h1 class="text-center text-bold text-light mt-4x">Blood Bank
							Management System Forgot Password</h1>
						<div class="well row pt-2x pb-3x bk-light">
							<%
								String success = (String) session.getAttribute("forgot-password");
								if (success != null) {
								session.removeAttribute("forgot-password");
							%>
							<div class="alert alert-success" id="success">Your Password succesfully changed.</div>
							<%
								}
							%>
							<%
								String failed = (String) session.getAttribute("fail");
								if (failed != null) {
								session.removeAttribute("fail");
							%>
							<div class="alert alert-danger" id="danger">Email id or Mobile no is invalid.</div>
							<%
								}
							%>
							<div class="col-md-8 col-md-offset-2">
								<form action="ForgetPassword" method="post" name=""
									onsubmit="return checkpass();">
									<label for="" class="text-uppercase text-sm">Email </label> <input
										type="email" class="form-control mb"
										placeholder="Email Address" required="true" name="email">
									<label for="" class="text-uppercase text-sm">Mobile
										Number</label> <input type="text" class="form-control mb"
										name="mobile" placeholder="Mobile Number" required="true"
										maxlength="10" pattern="[0-9]+" pattern="[0-9]+"
										onkeypress="return numberValidate(event)"> <label
										for="" class="text-uppercase text-sm">New Password</label> <input
										class="form-control mb" type="password" name="newpassword"
										placeholder="New Password" required="true" /> <label for=""
										class="text-uppercase text-sm">Confirm Password</label> <input
										class="form-control mb" type="password" name="confirmpassword"
										placeholder="Confirm Password" required="true" />

									<button class="btn btn-primary btn-block" name="submit"
										type="submit">Reset</button>
									<br> <a href="index.jsp">Click Here, Admin Login</a>
								</form>
								<div class="card-footer text-center" style="padding-top: 30px;">
									<div class="small">
										<a href="index.jsp" class="btn btn-primary">Back to Home</a>
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

</html>