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
<title>Menu</title>
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
				
				<li><a href="index.jsp" class="nav-link">Food Shop</a></li>
				<li><a href="menuCard.jsp" class="nav-link">Back to Menu</a></li>
				<li><a href="mycart.jsp" class="nav-link">My Cart</a></li>
			</ul>
		</nav> 
	</header>
	<br>
	<br>
	
<%
	String userName=(String)session.getValue("userName");
	String customerId=(String)session.getValue("customerId");
	session.putValue("customerId", customerId);
	session.putValue("userName", userName);
	%>
	<h3>Welcome  :<%=userName %></h3>
	<div>
		<div style="text-align:center"><h4>Menu Card<br> We Serve The Taste you Love!.</h4></div>
	</div>
<br>
<br>
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
					<th>Actions</th>
				</tr>
			</thead>
<tbody>
<%
String categoryName="Snacks";
Connection con=ConnectionUtil.init();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select id,name,price,Category,food_type from food_item where Category='"+categoryName+"'");
while(rs.next()){
     int id=rs.getInt(1);
	 String name=rs.getString(2);
	 int price=rs.getInt(3);
	 String category=rs.getString(4);
	 String type=rs.getString(5);
%>
<tr>
<td><%=name %></td>
<td>Rs <%=price %></td>
<td><%=category %></td>
<td><%=type %></td>
<td><action>
<a href="order-form.jsp?customerId=<%=customerId %>&foodName=<%=name %>&price=<%=price %>"> Add to Cart</a>
</action>
</td>
</tr>
<%
}
%>
</center>

</tbody>

</table>
	</center>	
	
	<div align="center">
				<a href="menuCard.jsp" class="">Back to Menu</a>
			</div>
	
</body>
</html>