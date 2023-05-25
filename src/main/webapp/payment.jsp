<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.food.util.ConnectionUtil"%>
 <%@ page import="java.sql.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
	 <link rel="stylesheet" href="css/tab.css">
	 </head>
<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark" style="background-color:tomato">
			<div>
				<a href="" class="navbar-brand">Food Shop</a>
				</div>
			<ul class="navbar-nav"> 
				<li><a href="menuCard.jsp" class="nav-link">Back to Menu</a></li>
				<li><a href="index.jsp" class="nav-link">Log out</a></li>
			</ul>
		</nav> 
	</header>
<%
String csid = (String)session.getValue("customerId");
int customerId=Integer.parseInt(csid);
%>
<div><br><br>
		<div style="text-align:center"><h4>Payment Details<br> We Serve The Taste you Love!.</h4></div>
	</div>
	<center>
<table class="table table-bordered" style="background-color: #fsfsfs">
<thead style="background-color: tomato">
				<tr>
				<th align="center">Food Name</th>
				<th align="center">Price</th>
				<th align="center">Quantity</th>
					<th align="center">Amount</th>
				</tr>
			</thead>
			<tbody>
	<%
	Connection conn=ConnectionUtil.init();
	String find="select food_name,price,quantity,amount from order_item where customer_id=?";
	PreparedStatement ps=conn.prepareStatement(find);
	ps.setInt(1, customerId);
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
		String name=rs.getString(1);
		int price=rs.getInt(2);
		int quantity=rs.getInt(3);
		int amount=rs.getInt(4);
	%>
	<tr>
	<td><%=name %></td>
	<td><%=price %></td>
	<td><%=quantity %></td>
	<td><%=amount %></td>
	</tr>
	<%
	}
	%>	
</tbody>
</table>
<br>
<br><br><br>
<table class="table table-bordered" style="background-color: #fsfsfs">
<thead>
				<tr>
				<th align="center">Total Amount</th></tr>
<%
Connection con1=ConnectionUtil.init();
String total="select customer_id,sum(amount)as total from order_item group by  customer_id having sum(order_item.amount);";
PreparedStatement pst=con1.prepareStatement(total);
ResultSet rs1=pst.executeQuery();
while(rs1.next())
{
int totalAmountc =rs1.getInt(1);	
int totalamnt=rs1.getInt(2);
%>
<tr>
<td><h4>Your Total Amount is :  </h4></td>
<td><%=totalamnt%></td>
</tr>
<%
}
%>
</thead></table>	
</body>
<br>
<br>
<div>
	<a href=thank.jsp?customerId=<%=customerId %> class="navbar-brand">Pay</a>
</div>
<br>
<br>
<br>
<br>
<footer>
	<div class="jumbotron text-center" style="margin-bottom:0">
	<p class="">Made with Love by lav@lavanaya@fs26.</p>
	</div>
</footer>
</html>