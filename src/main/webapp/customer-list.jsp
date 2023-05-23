<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
	 <link rel="stylesheet" href="css/tab.css">
	 <title>Customer List</title>
	 
<head>
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
				<li><a href="index.jsp" class="nav-link">Log out</a></li>
			</ul>
		</nav> 
	</header><br>
	<div class="row">
		<div class="container">
			<h3 class="text-center">List OF Customer</h3>
			<br>
			<br>
	<center>
<table class="table table-bordered" style="background-color: #fsfsfs">
<thead style="background-color: tomato">
				<tr>
	<th align="center">First Name</th>
	<th align="center">Last Name</th>
	<th align="center">Email</th>
	<th align="center">User Name</th>
	</tr>
	</thead>
	<%
Connection con=null;
Statement st=null;
ResultSet rs=null;
try {
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_order","root","L#1726@rlav");
st=con.createStatement();
String get="select first_name,last_name,email,user_name from members ";
rs=st.executeQuery(get);
while(rs.next())
{
%>
<tr>
<td align="center"><%=rs.getString(1) %></td>
<td align="center"><%=rs.getString(2) %></td>
<td align="center"><%=rs.getString(3) %></td>
<td align="center"><%=rs.getString(4) %></td>
</tr>
<%
}
}catch(Exception e)
{
e.printStackTrace();	
}
%>
	</table>
	</center>
	</div>
	</div>
</body>
</html>