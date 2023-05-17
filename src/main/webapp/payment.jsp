<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
</head>
<body>
<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color:  tomato">
            <ul class="navbar-nav">
					<li><a href="Menu.jsp"
						class="nav-link">Confirm</a></li>
				</ul>
		</nav>
	</header><br>
	<table class="table table-bordered">
				<thead>
					<tr>
						<th> Order ID</th>
						<th>Food ID</th>
						<th>Quantity</th>
						<th>TOTAL ORDER</th>
					</tr>
				</thead>
				<tbody>
				
				<tr>
				<td><c:out value="${order.id }"/></td>
				<td><c:out value="${order.foodId }"/></td>
				<td><c:out value="${order.quantity }"/></td>
				<td><c:out value="${order.amount }"/></td>
				</tr>
				
				</tbody>
				</table>			
</body>
</html>