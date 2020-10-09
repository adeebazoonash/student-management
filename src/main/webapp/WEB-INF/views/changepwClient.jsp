<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link
	href="https://fonts.googleapis.com/css2?family=Josefin+Slab:wght@700&display=swap"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/changepw.css"
	type="text/css" />
<title>Home</title>
</head>
<body class="home">
	<div class="wrapper">
		<div class="sidebar">
			<h2 class="menu">Menu</h2>
			<ul>
				<li><a href="http://localhost:8080/usermgmt/app/home"><i
						class="fas fa-home"></i>Home</a></li>
				<li><a href="http://localhost:8080/usermgmt/app/profileClient"><i
						class="fas fa-user"></i>Profile</a></li>
				<li><a href="http://localhost:8080/usermgmt/app/history"><i
						class="fas fa-history"></i>History</a></li>
				<li><a href="http://localhost:8080/usermgmt/app/home"><i
						class="fas fa-list-alt"></i>Contact Us</a></li>
				<c:choose>
					<c:when test="${not empty loggedInUser}">
						<li><a href="http://localhost:8080/usermgmt/app/logout"><i
								class="fas fa-sign-out-alt"></i>Logout</a></li>
					</c:when>
				</c:choose>
			</ul>
		</div>
		<div class="main_container">
			<div class="header"style="font-size: 30px;">Change your password.</div>
			<div class="info">
				<div>
					<div class="card" style="width: 30rem; margin-left: 30%;">
						<div class="card-header">Please fill up the form below.</div>
						<div class="card-body">
							<img
								src="<%=request.getContextPath()%>/resources/images/user.png"
								alt="" class="img-rounded"
								style="height: 40%; width: 40%; margin-left: 128px;" /><br />
							<h3 style="color: red;">${pwChangeMsg}</h3>
							<form action="/usermgmt/app/changePassword/submit" method="post"
								name="vform" onsubmit="return Validate()">
								<div class="form-group">
									<label>Email address</label> <br /> <input type="email"
										class="form-control" name="email" aria-describedby="emailHelp" />
									<div id="cemail_error"></div>
								</div>
								<div class="form-group">
									<label>Password</label> <input type="password"
										class="form-control" name="password" />
									<div id="cpass1_error"></div>
									<small>Enter the last password</small>
								</div>
								<div class="form-group">
									<label>New Password</label> <input type="password"
										class="form-control" name="newPassword" />
									<div id="cpass2_error"></div>
								</div>
								<div class="form-group">
									<label>Confirm Password</label> <input
										type="password" class="form-control" name="confirmPassword" />
									<div id="cpass3_error"></div>
								</div>
								<button type="submit" class="btn btn-primary">Submit</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!--Adding JavaScript  -->
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>

	<script type=text/javascript>	
	
		// SELECTING ALL TEXT ELEMENTS
		var email = document.forms["vform"]["email"];
		var password = document.forms["vform"]["password"];
		var newPassword = document.forms["vform"]["newPassword"];
		var confirmPassword = document.forms["vform"]["confirmPassword"];
		
		// SELECTING ALL ERROR DISPLAY ELEMENTS	
		var cemail_error = document.getElementById("cemail_error");
		var cpass1_error = document.getElementById("cpass1_error");
		var cpass2_error = document.getElementById("cpass2_error");
		var cpass3_error = document.getElementById("cpass3_error");

		// SETTING EVENT LISTENERS		
		email.addEventListener("blur", emailVerify, true);
		password.addEventListener("blur", passwordVerify, true);
		newPassword.addEventListener("blur", newPasswordVerify, true);
		confirmPassword.addEventListener("blur", confirmPasswordVerify, true);
		
		// VALIDATION FUNCTION
		function Validate(){
			if(email.value == ""){
				email.style.border = "1px solid red";
				document.getElementById('cemail_error').style.color = "red";
				cemail_error.textContent = "Email is required.";
				email.focus();
				return false;
			}
			if(password.value == ""){
				password.style.border = "1px solid red";
				document.getElementById('cpass1_error').style.color = "red";
				cpass1_error.textContent = "Password is required.";
				password.focus();
				return false;
			}
			if(newPassword.value == ""){
				newPassword.style.border = "1px solid red";
				document.getElementById('cpass2_error').style.color = "red";
				cpass2_error.textContent = "Password is required.";
				newPassword.focus();
				return false;
			}
			if(confirmPassword.value == ""){
				confirmPassword.style.border = "1px solid red";
				document.getElementById('cpass3_error').style.color = "red";
				cpass3_error.textContent = "Password is required.";
				confirmPassword.focus();
				return false;
			}
			
			// VERIFYING EMAIL
			function emailVerify(){
				if (email.value != ""){
					email.style.border = "1px solid #5E6E66";
					cemail_error.innerHTML = "";
					return true;
				}
			}
			
			// VERIIFYING PASSWORD
			function passwordVerify(){
				if (password.value != ""){
					password.style.border = "1px solid #5E6E66";
					cpass1_error.innerHTML = "";
					return true;
				}
				
			// VERIIFYING NEW PASSWORD
			function newPasswordVerify(){
				if (newPassword.value != ""){
					newPassword.style.border = "1px solid #5E6E66";
					cpass2_error.innerHTML = "";
					return true;
				}
			
			// VERIIFYING CONFIRM PASSWORD
			function confirmPasswordVerify(){
				if (confirmPassword.value != ""){
					confirmPassword.style.border = "1px solid #5E6E66";
					cpass3_error.innerHTML = "";
					return true;
				}
			}
	}
	</script>
</body>
</html>
