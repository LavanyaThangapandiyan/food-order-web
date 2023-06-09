<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Item List</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
	 <link rel="stylesheet" href="css/tab.css">
</head>
<body>
	<header>
		<nav class="navbar-expand-md navbar-dark"
			style="background-color: tomato">
			<div>
			<ul class="navbar-nav"> 
				<li><a href="customer-list.jsp" class="nav-link">Our Customers</a></li>
				<li><a href="index.jsp" class="nav-link">Log out</a></li>
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link"> Items</a></li>
			</ul>
		</div>
		</nav>
	</header>
	<br>
	<div class="row">
		<div class="container">
			<h3 class="text-center">List of Items</h3>
			<br>
			<div class="container text-left">
				<a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add New Items </a>
			</div>
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						
						<th>Food Name</th>
						<th>Price</th>
						<th>Category</th>
						<th>Food Type</th>
						<th>Quantity</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${listItem}">
						<tr>
						
						<td><c:out value="${item.name }"/></td>
						<td><c:out value="${item.price}"/></td>
						<td><c:out value="${item.category}"/></td>
						<td><c:out value="${item.food_type}"/></td>
						<td><c:out value="${item.quantity }"/></td>
							<td><a href="edit?id=<c:out value='${item.id }'/>">Edit</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="delete?id=<c:out value='${item.id }'/>">Delete</a></td>
							</tr>
							</c:forEach>
						<!-- } -->							
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>