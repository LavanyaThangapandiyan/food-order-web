<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.PreparedStatement"%>
<%@page import="com.food.util.ConnectionUtil"%>
 <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Thank you</title>
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
String customer=request.getParameter("customerId");
int cusId=Integer.parseInt(customer);
String userName=(String)session.getValue("userName");
String foodName=(String)session.getValue("name");
%>
			</header> 
			<br>
			<br>
			<br>
			<br>
			
			<h3 align="center">Payment Successfully Completed .....</h3>
			<br>
			<br>
			<h4 align="center"> Thank you For Your Order...<%=userName%></h4>
			<br>
			<br>
			<br>
			<br>		
			
<%
Connection con=ConnectionUtil.init();
String find="delete from order_item where customer_id=?";
PreparedStatement ps=con.prepareStatement(find);
ps.setInt(1, cusId);
ps.executeUpdate();
%>			
</body>
<br>
<br>
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