<%@page import="com.food.util.ConnectionUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/tab.css">
<head>
<meta charset="ISO-8859-1">
<title>menu card</title>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="CSS/tab/css" type="CSS/tab/css">
<link rel="stylesheet" href="css1.css" type="CSS/tab/css">
<link rel="stylesheet" href="w3.css" type="tab/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	type="tab/css">
</head>
<body>
<header>
		<nav class="navbar navbar-expand-md navbar-dark" style="background-color:tomato">
			<ul class="navbar-nav"> 
				<li><a href="history.jsp" class="nav-link">History</a></li>
				<li><a href="veg.jsp" class="nav-link">Vegetarian</a></li>
				<li><a href="nonveg.jsp" class="nav-link">Non Vegetarian</a></li>
				<li><a href="mycart.jsp" class="nav-link">My Cart</a></li>
			</ul>
		</nav> 		
	</header>
	<% 
	String userName=(String)session.getValue("userName");
	String customerId=(String)session.getValue("customerId");
	session.putValue("customerId", customerId);
	session.putValue("userName", userName);
	
	%>
	<h3 align="center">Welcome  :<%=userName %></h3>
	<div>
		<div style="text-align:center"><h4>Menu Card<br> We Serve The Taste you Love!.</h4></div>
	</div>
	<br>
	<br>
	<div align="center">
	<div align="center" class="card" style="width: 18rem; align="center"">
    <ul class="list-group list-group-flush">
    <li align="center" class="list-group-item" ><a href="break-fast.jsp">BreakFast</a></li>
    <li align="center" class="list-group-item" ><a href="category-list.jsp">Lunch</a></li>
    <li align="center" class="list-group-item" ><a href="dinner.jsp">Dinner</a></li>
    <li align="center" class="list-group-item" ><a href="snacks.jsp">Dessert</a></li>
  </ul>
  </div>
</div>	
<br>
<br>

<center>
<table class="table table-bordered" style="background-color: #fsfsfs">
<thead style="background-color: tomato">
				<tr>
					<th align="center">Food Name</th>
					<th align="center">Price</th>
					<th align="center">Category</th>
					<th align="center">Food_Type</th>
					<th align="center">Actions</th>
					
				</tr>
			</thead><tbody>
<%
Connection con=ConnectionUtil.init();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select id,name,price,Category,food_type from food_item");
while(rs.next()){
     int id=rs.getInt(1);
	 String name=rs.getString(2);
	 int price=rs.getInt(3);
	 String category=rs.getString(4);
	 String type=rs.getString(5);
%>
<tr>
<td><%=name %></td>
<td><%=price %></td>
<td><%=category %></td>
<td><%=type %></td>
<td><a href="order-form.jsp?CustomerId=<%=customerId %>&foodName=<%=name %>&price=<%=price %>">Add to Cart</a></td>
</tr>
<%
}
%>

</center>
</tbody>
</table>
</body></html>