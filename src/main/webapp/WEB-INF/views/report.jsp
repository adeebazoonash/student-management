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
	href="<%=request.getContextPath()%>/resources/css/chanepw.css"
	type="text/css" />
<title>Report</title>
</head>
<body class="home">
	<div class="wrapper">
		<div class="sidebar">
			<h2 class="menu">Menu</h2>
			<ul>
				<li><a href="#"><i class="fas fa-home"></i>Home</a></li>
				<li><a href="#"><i class="fas fa-user"></i>Profile</a></li>
				<li><a href="#"><i class="fas fa-history"></i>History</a></li>
				<li><a href="#"><i class="fas fa-clipboard"></i>Report</a></li>
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
			<div class="header" style="font-size: 30px;">Report</div>
			<div class="container" style="margin-top: 20px">
				<h3>Select the date range to see the list of users registered
					or removed.</h3>
				<br>
				<form action="http://localhost:8080/usermgmt/app/report/display"
					method="post">
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputEmail4">From</label> <input type="date"
								name="from" class="form-control">
						</div>
						<div class="form-group col-md-6">
							<label for="inputPassword4">To</label> <input type="date"
								name="to" class="form-control">
						</div>

						<button type="submit" class="btn btn-primary">Submit</button>
					</div>
				</form>
				
									<h3 style="color:red; text-align:center">${msg}</h3>


				<c:choose>
					<c:when test="${not empty report}">
						<table class="table"
							style="width: 80%; margin-left: auto; margin-right: auto;">
							<thead class="thead-dark">
								<tr>
									<th scope="col">First Name</th>
									<th scope="col">Last Name</th>
									<th scope="col">Role</th>
									<th scope="col">Action</th>
									<th scope="col">Date</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="report" items="${report}">
									<tr>
										<td><c:out value="${report.firstName}" /></td>
										<td><c:out value="${report.lastName}" /></td>
										<td><c:out value="${report.email}" /></td>
										<td><c:out value="${report.activity}" /></td>
										<td><c:out value="${report.date}" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:when>
				</c:choose>

			</div>
		</div>
	</div>
	</div>

	<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
</body>
</html>
