<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link
	href="https://fonts.googleapis.com/css2?family=Noticia+Text:wght@700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/resources/css/welcome.css"
	type="text/css" />
<title>Welcome</title>
</head>
<body>
	<header class="welcome">
		<!-- Navigation -->
		<div id="nav-bar">
			<nav class="navbar navbar-expand-lg navbar-light">
				<a class="navbar-brand" href="#"><img src="<%= request.getContextPath() %>/resources/images/logo.jpg"
					alt="" style="height: 60px; border-radius: 50%;"> User
					Management System</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarNav" aria-controls="navbarNav"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link" href="#"
							style="color: #fff">ABOUT US</a></li>
					</ul>
				</div>
			</nav>
		</div>
		<div class="main-content">
			<h1>Welcome to User Management System</h1>
			<a href="app/register" class="btn">Register</a>
			<a href="app/login" class="btn btn-login">Login</a>
		</div>
	</header>
</body>
</html>
