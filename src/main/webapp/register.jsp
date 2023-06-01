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
<script>
function validate()
{
	var firstName=document.getElementById("first").value;
	var lastName=document.getElementById("last").value;
	var userName=document.getElementById("user").value;
	var email=document.getElementById("email").value;
	var password=document.getElementById("pass").value;
	var regex=/^[a-zA-Z ]+$/;
	var emailRegex=/^(.+)@(.+)$/;
	var passwordRegex=/^[a-zA-Z0-9]{8,}$/;
	if(regex.test(firstName))
		document.getElementById("user").style.visibility="visible";
	else
		document.getElementById("firstname").style.visibility="visible";
	if(regex.test(lastName))
		document.getElementById("user").style.visibility="visible";
	else
		document.getElementById("lastname").style.visibility="visible";
	if(emailRegex.test(email))
		document.getElementById("user").style.visibility="visible";
	else
		document.getElementById("em").style.visibility="visible";
	if(regex.test(userName))
		document.getElementById("user").style.visibility="visible";
	else
		document.getElementById("username").style.visibility="visible";
	if(passwordRegex.test(password))
		document.getElementById("user").style.visibility="visible";
	else
		document.getElementById("password").style.visibility="visible";
	if(regex.test(firstName)&&regex.test(lastName)&&emailRegex.test(email)&&regex.test(userName)&&passwordRegex.test(password))
		{
		alert(" Registration Successfully  !... \n Back To Login and Continue")
		}
	else
		alert("Please Enter Valid Details")
		
}
</script>
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
						Name:</label> <input id="first" type="text" class="form-control" name="firstname"
						placeholder="Enter the First Name" required="required">
						<label id="firstname" style="color:red;visibility:hidden">Invalid First Name</label>
				</fieldset>

				<fieldset class="form-group">
					<label><i class="fas fa-file-signature"></i>&nbsp&nbsp&nbspLast
						Name:</label> <input id="last" type="text" class="form-control" name="lastname"
						placeholder="Enter the Last Name" required="required">
						<label id="lastname" style="color:red;visibility:hidden">Invalid Last Name</label>
				</fieldset>

				<fieldset class="form-group">
					<label><i class="fa fa-envelope"></i>&nbsp&nbsp&nbspEmail :</label>
					<input id="email" type="text" class="form-control" name="email"
						placeholder="Enter your Email" required="required">
						<label id="em" style="color:red;visibility:hidden">Please Enter Valid Email</label>
				</fieldset>

				<fieldset class="form-group">
					<label><i class="fa fa-user"></i>&nbsp&nbsp&nbspUser Name:</label>
					<input id="user" type="text" class="form-control" name="userName"
						placeholder="Enter the user Name" required="required">
						<label id="username" style="color:red;visibility:hidden">Invalid User Name</label>
				</fieldset>
				<fieldset class="form-group">
					<label><i class="fas fa-uunlock-alt"></i>&nbsp&nbsp&nbspPassword
						:</label> <input id="pass" type="password" class="form-control" name="password"
						placeholder="Enter the Password" required="required">
						<label id="password" style="color:red;visibility:hidden">Invalid PassWord</label>
				</fieldset>
				<table>
				<tr>
					<td><input onclick="validate();" type="submit" name="submit" value="Register"></td>
					<td></td>
				</tr>
				</table>
				<div>
		<label id="user" style="color:green;visibility:hidden">valid User Details
        </label>
		</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>