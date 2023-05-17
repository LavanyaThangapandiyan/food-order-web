<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
	 <link rel="stylesheet" href="css/tab.css">
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: tomato">
			<div>
				<a href="" class="navbar-brand">Food Shop</a>
			</div>
			<ul class="navbar-nav">
				<li><a href="index.jsp" class="nav-link">Home Page</a></li>
			</ul>
		</nav>
	</header>
	<br>
	<br>
	<div class="container col-md-s">
		<div class="card">
			<div class="card-body">
				<form action="UserRegister" method="post">

				<fieldset class="form-group">
					<label><i class="fas fa-file-signature"></i>&nbsp&nbsp&nbspFirst
						Name:</label> <input type="text" class="form-control" name="firstname"
						placeholder="Enter the First Name" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label><i class="fas fa-file-signature"></i>&nbsp&nbsp&nbspLast
						Name:</label> <input type="text" class="form-control" name="lastname"
						placeholder="Enter the Last Name" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label><i class="fa fa-envelope"></i>&nbsp&nbsp&nbspEmail :</label>
					<input type="text" class="form-control" name="email"
						placeholder="Enter your Email" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label><i class="fa fa-user"></i>&nbsp&nbsp&nbspUser Name:</label>
					<input type="text" class="form-control" name="userName"
						placeholder="Enter the user Name" required="required">
				</fieldset>
				<fieldset class="form-group">
					<label><i class="fas fa-uunlock-alt"></i>&nbsp&nbsp&nbspPassword
						:</label> <input type="password" class="form-control" name="password"
						placeholder="Enter the Password" required="required">
				</fieldset>
				<table>
				<tr>
					<td><input type="submit" name="submit" value="Register"></td>
					<td></td>
				</tr>
				</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>