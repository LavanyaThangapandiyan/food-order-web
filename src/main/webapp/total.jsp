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
<title>Know amount</title>
<link rel="stylesheet" href="CSS/tab/css" type="CSS/tab/css">
<link rel="stylesheet" href="css1.css" type="CSS/tab/css">
<link rel="stylesheet" href="w3.css" type="tab/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	type="tab/css">
</head>
<body>
<div align="center">
<div id="header">
		<div>
			<div class="Logo">
				<a href="menuCard.jsp">Menu card</a>
			</div>
		</div>
		<div>
		<div style="text-align: center">
			<h4>
				Total Order<br>If You Know Total Order Amount Here Enter Your ID!.
			</h4>
		</div>
		
		<br>
		<br>
		<br>
<form action="bill.jsp" method="post" >
Customer Id
<input type="text" name="id" placeholder="Enter Id"> 
<input type="submit" value="get details">
</form>
</div>


<footer>
		<div class="jumbotron text-center" style="margin-bottom: 0">
			<p class="">Made with Love by lav@aynavla@26.</p>
		</div>
	</footer>
</body>
</html>