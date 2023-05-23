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
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color:  tomato">
            <ul class="navbar-nav">
            </ul></nav>
			<div>
				<a href="index.jsp" class="navbar-brand">Log Out</a>
			</div>
<%
String customer=request.getParameter("customerId");
int cusId=Integer.parseInt(customer);
String userName=(String)session.getValue("userName");
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
</html>