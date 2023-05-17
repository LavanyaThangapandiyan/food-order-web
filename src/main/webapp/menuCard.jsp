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
<div id="header">
		<div>
			<div class="Logo">
				<a href="index.jsp">Food Shop</a>
			</div>
		</div>
	</div>
	<div>
		<div style="text-align:center"><h4>Menu Card<br> We Serve The Taste you Love!.</h4></div>
	</div>
<center>
<table class="table table-bordered" style="background-color: #fsfsfs">
<thead style="background-color: tomato">
				<tr>
					<th align="center">Food ID</th>
					<th align="center">Food Name</th>
					<th align="center">Price</th>
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
String get="select * from food_item";
rs=st.executeQuery(get);
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
}catch(Exception e)
{
e.printStackTrace();	
}
%>
</table>
	</center>
	
<br>
		<br>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: tomato"></nav>
		<div style="text-align:center"><h4> Here Place Your Order!.</h4></div>
	</div><br>
		<fieldset style="width: 27-px; float: center; background: white">
			<div class="Container col-md-20">
				<div class="card">
					<div class="card-body">
						<form action="OrderServlet" method="post">
							<fieldset class="form-group">
								<lable> <i class="fa fa-user"></i>&nbsp&nbspFood Id:</lable>
								<input type="text" class="form-control" name="foodId"
									placeholder="Enter Food Id" value="" required="required">
							</fieldset>
							<fieldset class="form-group">
								<lable> <i class="fas fa-unlock-alt"></i>&nbsp&nbspCustomer ID:</lable>
								<input type="number" class="form-control" name="customerId"
									placeholder="Enter Customer ID" value="" required="required">
							</fieldset>
							<fieldset class="form-group">
								<lable> <i class="fas fa-unlock-alt"></i>&nbsp&nbspQuantity:</lable>
								<input type="number" class="form-control" name="quantity"
									placeholder="Enter Quantity" value="" required="required">
							</fieldset>
							<table>
								<tr>
									<td><input type="submit" name="submit" value="Confirm"></td>
									<td></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</fieldset>
		
		</div><br><br>
		<footer>
			<div class="jumbotron text-center" style="margin-bottom: 0">
				<p class="">Made with Love by lav@aynavla@26.</p>
			</div>
		</footer>
</body>
</html>