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
<title>Payment</title>
<link rel="stylesheet" href="CSS/tab/css" type="CSS/tab/css">
<link rel="stylesheet" href="css1.css" type="CSS/tab/css">
<link rel="stylesheet" href="w3.css" type="tab/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	type="tab/css">
</head>
<body>
	<div id="header">
		<div>
			<div class="Logo">
				<a href="index.jsp">Food Shop</a>
			</div>
		</div>
		<div>
			<div class="Logo">
				<a href="index.jsp">Log out</a>
			</div>
		</div>
	</div>
	<div>
		<div style="text-align: center">
			<h4>
				Total Order<br> We Serve The Taste you Love!.
			</h4>
		</div>
	</div>
	
	
	
	<center>
		<table class="table table-bordered" style="background-color: #fsfsfs">
			<thead style="background-color: tomato">
				<tr>
					<th align="center">Food ID</th>
					<th align="center">Food Quantity</th>
					<th align="center">Amount</th>
				</tr>
			</thead>
			<%
int id=Integer.parseInt(request.getParameter("id"));
Connection con=null;
Statement st=null;
ResultSet rs=null;
try {
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_order","root","L#1726@rlav");
	if(!con.isClosed())
	{
		PreparedStatement ps=con.prepareStatement("select food_id,quantity, amount from order_item where id='"+id+"'");
	    rs=ps.executeQuery();
		while(rs.next())
		{
			%>
			<tr>
			<td align="center"><%=rs.getInt(1) %></td>
			<td align="center"><%=rs.getString(2) %></td>
			<td align="center"><%=rs.getInt(3) %></td>
			</tr>
		<% 	
		}
	}else
	{
		out.println("Invalid Id");
	}
}
catch(Exception e)
{
e.printStackTrace();	
}
%>
		</table>
	</center>
	<br>
	<br>
	<br>

	<div style="text-align: center">
		<h4>Congrats!..</h4>
	</div>
	</div>
	<br>

	</div>
	<br>
	<br>
	<footer>
		<div class="jumbotron text-center" style="margin-bottom: 0">
			<p class="">Made with Love by lav@aynavla@26.</p>
		</div>
	</footer>




</body>
</html>