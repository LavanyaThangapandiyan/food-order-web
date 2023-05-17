<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Food Shop</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
	 <link rel="stylesheet" href="css/tab.css">
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: tomato">
			<div>
				<a href="" class="navbar-brand">Food Shop</a>
			</div>
			<ul class="navbar-nav">
				<li><a href="#" class="nav-link">Locations</a></li>
				<li><a href="#" class="nav-link">Our chefs</a></li>
				<li><a href="#" class="nav-link">About us</a></li>
				<li><a href="register.jsp" class="nav-link">RegistrationPage</a></li>
				<li><a href="AdminLogin.jsp"class="nav-link" >Admin</a></li>
			</ul>
		</nav>
	</header>
	<br>
	<br>
	<div>
		<fieldset style="width: 27-px; float: center; background: white">
			<div class="Container col-md-20">
				<div class="card">
					<div class="card-body">
					<div>
	<div style="text-align:center">Delivers Excellent Customer Service at our Restaurant<br><h4>Get Fresh Food In a Easy Way</h4></div>
	</div>
						<form action="UserRegister" method="post">
							<fieldset class="form-group">
								<lable>
								<i class="fa fa-user"></i>&nbsp&nbspUser Name:</lable>
								<input type="text" class="form-control" name="userName"
									placeholder="Enter your User Name" value="" required="required">
							</fieldset>
							<fieldset class="form-group">
								<lable>
								<i class="fas fa-unlock-alt"></i>&nbsp&nbspPassword:</lable>
								<input type="password" class="form-control" name="password"
									placeholder="Enter your password" value="" required="required">
							</fieldset>
							<table>
							<tr>
					<td><input type="submit" name="submit" value="Login"></td>
					<td><a href="register.jsp">Registration</a></td>
				</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</fieldset>
	</div>
	
				
	
</body>
<footer>
<div class="jumbotron text-center" style="margin-bottom:0">
<p class=""> Made with love by lav2yavala@s26.</p>
</div>
</footer>
</html>