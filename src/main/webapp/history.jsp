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
<head><meta charset="ISO-8859-1">
<title>History</title>
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
			</ul>
		</nav> 
	</header>
	
<%
String userName=(String)session.getValue("userName");
String csid =(String)session.getValue("customerId");
int customerId=Integer.parseInt(csid);
%>
<br>
  <div align="right">
		<button><a href="DeleteAllHistory?csid=<%=csid %>">Clear History</a></button>
		</div>
	<h3>Welcome  :<%=userName %></h3>
	<div>
		<div style="text-align:center"><h4>Order History!.</h4></div>
	</div>
	<br>
	<br>
<center>
<table class="table table-bordered" style="background-color: #fsfsfs">
<thead style="background-color: tomato">
				<tr>
					<th align="center">Food Name</th>
					<th align="center">Price</th>
					<th align="center">Quantity</th>
					<th align="center">Amount</th>
					<th>Actions</th>
				</tr>
			</thead>
<tbody>
<%
Connection con=ConnectionUtil.init();
String history="select id,customer_id,food_name,price,quantity,amount from cart where Customer_id=?";
PreparedStatement ps=con.prepareStatement(history);
ps.setInt(1, customerId);
ResultSet rs=ps.executeQuery();
while(rs.next()){
     int id=rs.getInt(1);
     int cusId=rs.getInt(2);
	 String name=rs.getString(3);
	 int price=rs.getInt(4);
	 int quantity=rs.getInt(5);
	 int amount=rs.getInt(6);	 
%>
<tr>
<td><%=name %></td>
<td>Rs <%=price %></td>
<td><%=quantity %></td>
<td><%=amount %></td>
<td><button><a href="DeleteServlet?id=<%=id %>">Remove</a></button></td>
</tr>
<%
}
%>
</tbody>
</table>
	</center>	

</body>
</html>