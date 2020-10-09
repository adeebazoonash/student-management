<%-- 
    Document   : login
    Created on : Apr 28, 2020, 6:33:17 PM
    Author     : acer
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%-- <%@page contentType="text/html" pageEncoding="UTF-8"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/style.css" type="text/css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Oleo+Script+Swash+Caps&family=Rouge+Script&display=swap" rel="stylesheet"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <title>Login</title>
    </head>
    <body class="outer">
         <div class="container">
        <div class="row">
            <div class="col-md-5" style="padding-top: 15%;">
                <h2>Hello, there!</h2><br>
                <h4>Use a valid Email and Password to gain access to UMS.</h4> <br>
                <h5>Don't have an account? <a href="http://localhost:8080/usermgmt/app/register" class="btn btn-primary">Sign up!</a> </h5>
                <img src="<%= request.getContextPath() %>/resources/images/lock.png" alt="lock" style="height: 40%; width: 42%;">
            </div>
            <div class="col-md-7" style="padding: 15.3%;">
                <div class="card" style="width: 30rem;">
                  <div class="card-body">
                    <h5 class="card-title text-center title">Administration</h5>
                  </div>
                </div>

                <div class="card text-center" style="width: 30rem;">
                  <div class="card-body">
                    <img src="<%= request.getContextPath() %>/resources/images/user.png" alt="" class="img-rounded" style="height: 40%; width: 40%;"><br><br>
                    <h5 style="color:green;">${regSuccess}</h5>
	                <h5 style="color:green;">${pwUpdatedSuccess}</h5>
	                <h5 style="color:red;"> ${userMsg}</h5>
                    <form:errors path="loginForm.*"/>
                    <form method="post" action="/usermgmt/app/submitLogin" name="vform" onsubmit="return Validate()">
                      <div class="form-group">
                        <label>Email address</label>
                        <input type="email" class="form-control" name="email" aria-describedby="emailHelp">
                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                        <div id="email_error"></div>
                      </div>
                      <div class="form-group">
                        <label>Password</label>
                        <input type="password" class="form-control" name="password">
                        <div id="password_error"></div>
                      </div>
                      <p><a href="http://localhost:8080/usermgmt/app/forgotPassword">Forgot Password?</a></p>
                      <button type="submit" class="btn btn-primary">Login</button>
                    </form>
                  </div>
              </div>
            </div>
        </div>
    </div>
    <!--Adding JavaScript  -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	
	<script type=text/javascript>	
	
		// SELECTING ALL TEXT ELEMENTS
		var email = document.forms["vform"]["email"];
		var password = document.forms["vform"]["password"];
		
		// SELECTING ALL ERROR DISPLAY ELEMENTS
		
		var email_error = document.getElementById("email_error");
		var password_error = document.getElementById("password_error");
		
		// SETTING EVENT LISTENERS
		
		email.addEventListener("blur", emailVerify, true);
		password.addEventListener("blur", passwordVerify, true);
		
		// VALIDATION FUNCTION
			function Validate(){
				if(email.value == ""){
					email.style.border = "1px solid red";
					document.getElementById('email_error').style.color = "red";
					email_error.textContent = "Email is required.";
					email.focus();
					return false;
				}
				if(password.value == ""){
					password.style.border = "1px solid red";
					document.getElementById('password_error').style.color = "red";
					password_error.textContent = "Password is required.";
					password.focus();
					return false;
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
			function passwordVerify(){
				if (password.value != ""){
					password.style.border = "1px solid #5E6E66";
					password_error.innerHTML = "";
					return true;
				}
			}
		</script>
    </body>
</html>
