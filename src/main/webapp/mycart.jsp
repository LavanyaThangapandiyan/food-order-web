<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.food.util.ConnectionUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Cart</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
	 <link rel="stylesheet" href="css/tab.css">
</head>
<body>
<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color:  tomato">
            <ul class="navbar-nav">
            </ul></nav>
			<div>
				<a href="menuCard.jsp" class="navbar-brand">Back to Menu</a>
			</div>
			</header> <br> 
<%
String csid = (String)session.getValue("customerId");
int customerId=Integer.parseInt(csid);
%>
<div>
		<div style="text-align:center"><h4>My Cart<br> We Serve The Taste you Love!.</h4></div>
	</div>
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
String find="select id,food_name,price,quantity,amount from order_item where customer_id=?";
PreparedStatement ps=con.prepareStatement(find);
ps.setInt(1, customerId);
ResultSet rs=ps.executeQuery();
while(rs.next())
{
	int id=rs.getInt(1);
	String name=rs.getString(2);
	int price=rs.getInt(3);
	int quantity=rs.getInt(4);
	int amount=rs.getInt(5);
%>
<tr>
<td><%=name %></td>
<td><%=price %></td>
<td><%=quantity %></td>
<td><%=amount %></td>
<td><button><a href="CartServlet?id=<%=id %>">Remove</a></button></td>
</tr>
<%
}
%>
</tbody></table></center>
<div align="center">
	<a href="payment.jsp" class="navbar-brand">Place Order</a>
			</div>
</body>
</html>