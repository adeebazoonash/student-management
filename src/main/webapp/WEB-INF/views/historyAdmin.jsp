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
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"/>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/chanepw.css"
	type="text/css" />
<title>Dashboard</title>
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
						<li><a href="http://localhost:8080/usermgmt/app/logout"><i class="fas fa-sign-out-alt"></i>Logout</a></li>
					</c:when>
				</c:choose>
			</ul>
		</div>
		<div class="main_container">
			<div class="header">
				<h5>History</h5>
				<form class="form-inline my-2 my-lg-0">
					<input class="form-control mr-sm-2" type="search"
						placeholder="Search" aria-label="Search" />
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit"
						style="text-align: right;">Search</button>
				</form>		
			</div>
			<div class="info">
					<div style="text-align: center;">
						<table class="table" style="width:80%;margin-left: auto; margin-right: auto;">
							<thead class="thead-dark">
							    <tr>
							      <th scope="col">First Name</th>
							      <th scope="col">Last Name</th>
							      <th scope="col">Role</th>
							      <th scope="col">Activity</th>
							      <th scope="col">Email</th>
							       <th scope="col">Date</th>
							    </tr>
							 </thead>
							 <tbody>
								<c:forEach var="history" items="${allHistory}">
								<tr>
									<td><c:out value="${history.firstName}" /></td>
									<td><c:out value="${history.lastName}" /></td>
									<td><c:out value="${history.role}" /></td>
									<td><c:out value="${history.activity}" /></td>
										<c:choose>
											<c:when test="${not empty history.newUser}">
												<td><c:out value="${history.newUser}" /></td>
											</c:when>
										</c:choose>
										
										<td><c:out value="${history.date}" /></td>
								</c:forEach>
								</tr>
							</tbody>
						</table>
					</div>
			</div>
	</div>

	<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
</body>
</html>
