<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Administrator Login Page</title>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" >
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
	 <link rel="stylesheet" href="css/tab.css">
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark" style="background-color:tomato">
			<div>
				<a href="" class="navbar-brand">Food Shop</a>
				</div>
			<ul class="navbar-nav"> 
				<li><a href="#" class="nav-link">Locations</a></li>
				<li><a href="index.jsp" class="nav-link">Log out</a></li>
				<li><a href="#" class="nav-link">About us</a></li>
			</ul>
		</nav> 
	</header>
	<br>
	<br>
	<div class="container col-md-20">
		<h4>Admin Login:</h4>
		<div class="card">
		<div class="card-body">
			<form action="AdminValidation" method="get">
				<fieldset class="form-group">
					<label><i class="fa fa-user"></i>&nbsp&nbspUser Name:</label> <input
						type="text" class="form-control" name="userName"
						placeholder="Enter your User Name" value="" required="required">
				</fieldset>
				
				<fieldset class="form-group">
					<label><i class="fa fa-unlock-alt"></i>&nbsp&nbspPassword:</label>
					<input type="password" class="form-control" name="password"
						placeholder="Enter your Password" value="" required="required">
				</fieldset>
				<button type="submit" class="btn btn-success">Sign In</button>

			</form>
			</div>
		</div>
	</div>
</body>
<footer>
	<div class="jumbotron text-center" style="margin-bottom:0">
	<p class="">Made with Love by lav@lavanaya@fs26.</p>
	</div>
</footer>
</html>