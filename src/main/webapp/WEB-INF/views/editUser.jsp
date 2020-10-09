<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://fonts.googleapis.com/css2?family=Josefin+Slab:wght@700&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/chanepw.css" type="text/css" />
    <title>Edit User Information</title>
  </head>
  <body class="home">
    <div class="wrapper">
      <div class="sidebar">
        <h2 class="menu">Menu</h2>
        <ul>
          <li>
            <a href="#"><i class="fas fa-home"></i>Home</a>
          </li>
          <li>
            <a href="#"><i class="fas fa-user"></i>Profile</a>
          </li>
          <li>
            <a href="#"><i class="fas fa-history"></i>History</a>
          </li>
          <li>
            <a href="#"><i class="fas fa-list-alt"></i>Report</a>
          </li>
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
        <div class="header" style="font-size: 30px;">Edit User Information</div>
        <div class="row">
            <div class="col-md-6" justify-content-center>
                <div class="card info">
                    <div class="card-body">
                        <h1>Information of ${existingUser.firstName}</h1>
                        <form:errors path="registrationForm.*"/>
                        <form action="/usermgmt/app/user/edit/submit?id=${existingUser.id}" style="margin: 50px;" method="post">
                                    <div class="form-group">
                                        <label for="fname">First Name</label>
                                        <input type="text" class="form-control" value= "${existingUser.firstName}" name="firstName">
                                        <div id="fname_error"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="mname">Middle Name</label>
                                        <input type="text" class="form-control" value= "${existingUser.middleName}" name="middleName">
                                    </div>
                                    <div class="form-group">
                                        <label for="lname">Last Name</label>
                                        <input type="text" class="form-control" value= "${existingUser.lastName}"  name="lastName">
                                        <div id="lname_error"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input type="email" class="form-control" value= "${existingUser.email}"  name="email" aria-describedby="emailHelp">
                                        <div id="email_error"></div>
                                    </div>
                                    <button class="btn btn-primary" type="Submit">Save Changes</button>
                            </div>
                        </div>
                    </div>
                </form>
        </div>
        </div>
      </div>
    </div>

    <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
  </body>
</html>
