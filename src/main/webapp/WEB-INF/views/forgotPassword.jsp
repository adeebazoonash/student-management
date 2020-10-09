<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
	href="<%=request.getContextPath()%>/resources/css/forgotpw.css"
	type="text/css" />
<title>Home</title>
</head>
<body class="bg">
	<section class="container-fluid">
		<div class="row justify-content-center">
			<section class="col-12 col-sm-6 col-md-3">
				<div class="card card-design" style="width: 30rem;">
					<div class="card-header">Please fill up the form below.</div>
					<div class="card-body">
						<img src="<%=request.getContextPath()%>/resources/images/user.png" alt="" class="img-rounded"
							style="height: 40%; width: 40%; margin-left: 115px;" /><br />
							<h3>${pwChangeMsg}</h3>
							<h3>${pwUpdatedSuccess}</h3>
						<form action="/usermgmt/app/forgotPassword/submit" method="post">
							<div class="form-group">
								<label for="cemail">Email address</label> <br /> <input
									type="email" class="form-control" name="email"
									aria-describedby="emailHelp" />
								<div class="cemail_error"></div>
							</div>
							<div class="form-group">
								<label>Which city were you born in?</label> <input type="text"
									class="form-control" name="ans1" />
								<div class="cans1_error"></div>
							</div>
							<div class="form-group">
								<label>What is the name of your pet?</label> <input type="text"
									class="form-control" name="ans2" />
								<div class="cans1_error"></div>
							</div>
							<div class="form-group">
								<label for="cpass1">New Password</label> <input type="password"
									class="form-control" name="newPassword" />
								<div class="cpass1_error"></div>
							</div>
							<div class="form-group">
								<label for="cpass1">Confirm Password</label> <input
									type="password" class="form-control" name="confirmPassword" />
								<div class="cpass2_error"></div>
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</section>
		</div>
	</section>
	<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
</body>
</html>
