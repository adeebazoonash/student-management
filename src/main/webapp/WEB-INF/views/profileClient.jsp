<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
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
	href="<%= request.getContextPath() %>/resources/css/changepw.css" type="text/css" />
<title>Home</title>
</head>
<body class="home">
	<div class="wrapper">
		<div class="sidebar">
			<h2 class="menu">Menu</h2>
			<ul>
				<li><a href="http://localhost:8080/usermgmt/app/home"><i
						class="fas fa-home"></i>Home</a></li>
				<li><a href="http://localhost:8080/usermgmt/app/profile"><i
						class="fas fa-user"></i>Profile</a></li>
				<li><a href="http://localhost:8080/usermgmt/app/history"><i
						class="fas fa-history"></i>History</a></li>
				<li><a href="http://localhost:8080/usermgmt/app/home"><i
						class="fas fa-list-alt"></i>Contact Us</a></li>
				<c:choose>
					<c:when test="${not empty loggedInUser}">
						<li><a href="http://localhost:8080/usermgmt/app/logout">
								<i class="fas fa-sign-out-alt"></i>Logout
						</a></li>
					</c:when>
				</c:choose>
			</ul>
		</div>
		<div class="main_container">
			<div class="header" style="font-size: 30px;">Profile</div>
			<div class="card info">
				<div class="row no-gutters">
					<div class="col-md-2">
						<br> <img
							src="<%= request.getContextPath() %>/resources/images/user.png"
							style="height: 60%; width: 97%;">
					</div>
					<div class="col-md-10">
						<div class="card-body">
							<h5 class="card-title">Information</h5>
							<p class="card-text">Name: ${loggedInUser.firstName}
								${loggedInUser.lastName}</p>
							<p class="card-text">Role: ${loggedInUser.role}</p>
							<p class="card-text">Email: ${loggedInUser.email}</p>
							<br> <a
								href="http://localhost:8080/usermgmt/app/changePassword"
								class="btn btn-primary">Change password</a> <a href="#"
								onclick="myFunction()" class="btn btn-info" id="btn">Edit
								Profile</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row" id="edit">
		<div class="col-md-6">
			<div class="card info">
				<div class="card-body">
					<h3 style="text-align: center;">Edit Your Profile</h3>
					<form action="/usermgmt/app/profile/update" style="margin: 50px;"
						method="post">
						<div class="form-group">
							<label for="fname">First Name</label> <input type="text"
								class="form-control" value= "${user.firstName}" name="firstName">
						</div>
						<div class="form-group">
							<label for="mname">Middle Name</label> <input type="text"
								class="form-control" value= "${user.middleName}" name="middleName" id="mname">
						</div>
						<div class="form-group">
							<label for="lname">Last Name</label> <input type="text"
								class="form-control" value= "${user.lastName}" name="lastName">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Email address</label> <input
								type="email" class="form-control" name="email" value= "${user.email}" 
								aria-describedby="emailHelp">
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
						<label>Which city were you born in?</label> <input type="text"
							class="form-control" name="ans1" value= "${user.ans1}"  placeholder="Your answer here..">
					</div>
					<div class="form-group">
						<label>What is the name of your pet?</label> <input type="text"
							class="form-control" name="ans2" value= "${user.ans2}" 
							placeholder="Your answer here..">
					</div>
					<br>
					<button class="btn btn-primary" type="Submit">Submit</button>
				</div>
			</div>
		</div>
		</form>
	</div>
	</div>
	</div>
	<!-- Adding JS -->
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>

	<script type=text/javascript>
      $(document).ready(function(){
      $("#edit").hide();
      $("#btn").click(function(){
        $("#edit").show();
        $("#btn").hide();
      });
    });
    </script>
	<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
</body>
</html>
