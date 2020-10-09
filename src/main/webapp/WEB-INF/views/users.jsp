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
<title>Users</title>
</head>
<body class="home">
	<div class="wrapper">
		<div class="sidebar">
			<h2 class="menu">Menu</h2>
			<ul>
				<li><a href="http://localhost:8080/usermgmt/app/admin/home"><i
						class="fas fa-home"></i>Dashboard</a></li>
				<li><a href="http://localhost:8080/usermgmt/app/admin/profile"><i
						class="fas fa-user"></i>Profile</a></li>
				<li><a href="http://localhost:8080/usermgmt/app/history"><i
						class="fas fa-history"></i>History</a></li>
				<li><a href="http://localhost:8080/usermgmt/app/users"><i class="fas fa-users"></i>Users</a></li>
				<li><a href="http://localhost:8080/usermgmt/app/users"><i
						class="fas fa-clipboard"></i>Report</a></li>
				<c:choose>
					<c:when test="${not empty loggedInUser}">
						<li><a href="http://localhost:8080/usermgmt/app/logout">
								<i class="fas fa-sign-out-alt"></i>Logout</a></li>
					</c:when>
				</c:choose>
			</ul>
		</div>
		<div class="main_container">
			<div class="header">Users</div>
			<div class="info">
				<a class="btn btn-primary"
					href="http://localhost:8080/usermgmt/app/newuser" role="button"
					style="float: right; margin-bottom: 25px;">Create New User</a>
				<div class="clearfix"></div>
				<div style="text-align: center;">
					<table class="table"
						style="width: 80%; margin-left: auto; margin-right: auto;">
						<thead class="thead-dark">
							<tr>
								<th scope="col">First Name</th>
								<th scope="col">Last Name</th>
								<th scope="col">Role</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="user" items="${allUsers}">
								<tr>
									<td><c:out value="${user.firstName}" /></td>
									<td><c:out value="${user.lastName}" /></td>
									<td><c:out value="${user.role}" /></td>
									<td><a href="http://localhost:8080/usermgmt/app/user/edit?id=${user.id}" class="btn btn-secondary">Edit User Info</a>
									<form method ="post" action="http://localhost:8080/usermgmt/app/user/delete"><br>
									<input type="hidden" name="deleteUserId" value="${user.id}" />
									<input type="hidden" name="email" value="${user.email}" />							
									<input type="submit" value= "DELETE USER" class="btn btn-danger" role="button">
									</form>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
</body>
</html>
