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
	href="<%=request.getContextPath()%>/resources/css/chanepw.css"
	type="text/css" />
<title>Home</title>
</head>
<body class="home">
	<div class="wrapper">
		<div class="sidebar">
			<h2 class="menu">Menu</h2>
			<ul>
				<li><a href="http://localhost:8080/usermgmt/app/admin/home"><i class="fas fa-home"></i>Dashboard</a></li>
				<li><a href="http://localhost:8080/usermgmt/app/admin/profile"><i class="fas fa-user"></i>Profile</a></li>
				<li><a href="http://localhost:8080/usermgmt/app/history"><i class="fas fa-history"></i>History</a></li>
				<li><a href="http://localhost:8080/usermgmt/app/users"><i class="fas fa-users"></i>Users</a></li>
				<li><a href="http://localhost:8080/usermgmt/app/users"><i class="fas fa-clipboard"></i>Report</a></li>
				<c:choose>
					<c:when test="${not empty loggedInUser}">
						<li><a href="http://localhost:8080/usermgmt/app/logout">
								<i class="fas fa-sign-out-alt"></i>Logout</a></li>
					</c:when>
				</c:choose>
			</ul>
		</div>
		<div class="main_container">
			<div class="header" style="font-size: 30px;">Add a New User</div>
			<div class="info">
				<div>
					<div class="container" style="padding-bottom: 66px;">
						<div class="row">
							<div class="col-md-6">
								<div class="card info">
									<div class="card-body">
										<form:errors path="registrationForm.*" />
										<form action="/usermgmt/app/submit" style="margin: 50px;"
											method="post" onsubmit="return Validate()" name="vform">
											<div class="form-group">
												<label for="fname">First Name</label> <input type="text"
													class="form-control" name="fname">
												<div id="fname_error"></div>
											</div>
											<div class="form-group">
												<label for="mname">Middle Name</label> <input type="text"
													class="form-control" name="mname" id="mname">

											</div>
											<div class="form-group">
												<label for="lname">Last Name</label> <input type="text"
													class="form-control" name="lname">
												<div id="lname_error"></div>
											</div>
											<div class="form-group">
												<label>Role:</label> <input type="radio" id="admin"
													name="role" value="ADMIN"> <label for="admin">Admin</label>
												<input type="radio" id="client" name="role" value="CLIENT">
												<label for="client">Client</label><br>
											</div>
											<div class="form-group">
												<label for="exampleInputEmail1">Email address</label> <input
													type="email" class="form-control" name="email"
													aria-describedby="emailHelp">
												<div id="email_error"></div>
											</div>
											<div class="form-group">
												<label for="Password1">Password</label> <input
													type="password" class="form-control" name="pass1">
												<div id="pass1_error"></div>
												<h1 style="color:red">${pwMsg}</h1>
											</div>
											<div class="form-group">
												<label for="Password2">Confirm Password</label> <input
													type="password" class="form-control" name="pass2">
												<div id="pass2_error"></div>
											</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="card info" style="width: 35rem; margin-left: 70px;">
									<div class="card-body">
										<h5 class="card-title">Security Questions</h5>
										<br>
										<div class="form-group">
											<label>Which city were you born in?</label> <input
												type="text" class="form-control" name="ans1"
												placeholder="Your answer here..">
											<div id="ans1_error"></div>
										</div>
										<div class="form-group">
											<label>What is the name of your pet?</label> <input
												type="text" class="form-control" name="ans2" id="ans2"
												placeholder="Your answer here..">
											<div id="ans2_error"></div>
										</div>
										<br>
										<button class="btn btn-primary" type="Submit">Submit</button>
									</div>
								</div>
							</div>
							</form>
						</div>
					</div>

					<!--Adding JavaScript  -->
					<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
					<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>

					<script type=text/javascript>
            // SELECTING ALL TEXT ELEMENTS
            var fname = document.forms["vform"]["fname"];
            var lname = document.forms["vform"]["lname"];
            var email = document.forms["vform"]['email'];
            var pass1 = document.forms["vform"]["pass1"];
            var pass2 = document.forms["vform"]["pass2"];
            var ans1 = document.forms["vform"]["ans1"];
            var ans2 = document.forms["vform"]["ans2"];
            
            // SELECTING ALL ERROR DISPLAY ELEMENTS
            var fname_error = document.getElementById("fname_error");
            var lname_error = document.getElementById("lname_error");
            var email_error = document.getElementById("email_error");
            var pass1_error = document.getElementById("pass1_error");
            var pass2_error = document.getElementById("pass2_error");
            var ans1_error = document.getElementById("ans1_error");
            var ans2_error = document.getElementById("ans2_error");
            
            // SETTING EVENT LISTENERS
            fname.addEventListener("blur", fnameVerify, true);
            lname.addEventListener("blur", lnameVerify, true);
            lname.addEventListener("blur", emailVerify, true);
            pass1.addEventListener("blur", password1Verify, true);
            pass2.addEventListener("blur", password2Verify, true);
            ans1.addEventListener("blur", ans1Verify, true);
            ans2.addEventListener("blur", ans2Verify, true);
        
            // VALIDATION FUNCTION
            function Validate(){
                if(fname.value == ""){
                    fname.style.border = "1px solid red";
                    document.getElementById('fname_error').style.color = "red";
                    fname_error.textContent = "First Name is required.";
                    fname.focus();
                    return false;
                }
                if(lname.value == ""){
                    lname.style.border = "1px solid red";
                    document.getElementById('lanme_error').style.color = "red";
                    lname_error.textContent = "Last Name is required.";
                    lname.focus();
                    return false;
                }
                if(email.value == ""){
                    email.style.border = "1px solid red";
                    document.getElementById('email_error').style.color = "red";
                    email_error.textContent = "Password is required.";
                    email.focus();
                    return false;
                }
                if(pass1.value == ""){
                    pass1.style.border = "1px solid red";
                    document.getElementById('pass1_error').style.color = "red";
                    pass1_error.textContent = "Password is required.";
                    pass1.focus();
                    return false;
                }
                if(pass2.value == ""){
                    pass2.style.border = "1px solid red";
                    document.getElementById('pass2_error').style.color = "red";
                    pass2_error.textContent = "Confirm password is required.";
                    pass2.focus();
                    return false;
                }
                if(ans1.value == ""){
                    ans1.style.border = "1px solid red";
                    document.getElementById('ans1_error').style.color = "red";
                    ans1_error.textContent = "Answer is required.";
                    ans1.focus();
                    return false;
                }
                if(ans2.value == ""){
                    ans2.style.border = "1px solid red";
                    document.getElementById('ans2_error').style.color = "red";
                    ans2_error.textContent = "Answer is required.";
                    ans2.focus();
                    return false;
                }
                
                 if(password1.value != password2.value){
                    pass1.style.border = "1px solid red";
                    pass2.style.border = "1px solid red";
                    pass2_error.innerHTML = "Passwords do not match";
                } 
                
            }
                
            // VERIFYING FIRST NAME
            function fnameVerify(){
                if (fname.value != ""){
                    fname.style.border = "1px solid #5E6E66";
                    fname_error.innerHTML = "";
                    return true;
                }
            }
            
            // VERIFYING LAST NAME
            function lnameVerify(){
                if (lname.value != ""){
                    lname.style.border = "1px solid #5E6E66";
                    lname_error.innerHTML = "";
                    return true;
                }
            }
            
            // VERIFYING EMAIL
            function emailVerify(){
                if (email.value != ""){
                    email.style.border = "1px solid #5E6E66";
                    email_error.innerHTML = "";
                    return true;
                }
            }
            
            // VERIIFYING PASSWORD
            function password1Verify(){
                if (password1.value != ""){
                    password1.style.border = "1px solid #5E6E66";
                    password1_error.innerHTML = "";
                    return true;
                }
            }
            
            // VERIFYING CONIFRM PASSWORD
            function password2Verify(){
                if (password2.value != ""){
                    password2.style.border = "1px solid #5E6E66";
                    password2_error.innerHTML = "";
                    return true;
                }
            }
            
            // VALIDATING SECURITY ANSWER
            function ans1Verify(){
                if (ans1.value != ""){
                    ans1.style.border = "1px solid #5E6E66";
                    ans1_error.innerHTML = "";
                    return true;
                }
            }
            
            // VALIDATING SECURITY ANSWER 
            function ans2Verify(){
                if (ans2.value != ""){
                    ans2.style.border = "1px solid #5E6E66";
                    ans2_error.innerHTML = "";
                    return true;
                }
            }
                   
            </script>
				</div>
			</div>
		</div>
	</div>

	<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
</body>
</html>
