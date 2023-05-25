<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Place Order</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
</head>
<body>
<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color:  tomato">
            <ul class="navbar-nav">
            </ul></nav>
			</header> <br>        
    <%
    String customerId=request.getParameter("customerId");
    String foodName=request.getParameter("foodName");
    String price=request.getParameter("price");
	String userName=(String)session.getValue("userName");
	session.putValue("customerId", customerId);
	%>
	<div class="container col-md-5">
	<div class="card">
		<div class="card-body">
		<form action="OrderServlet" method="post">
			<fieldset class="form-group">
			<label>Food Name:</label><input value="<%=foodName %>" class="form-control" name="name" required="required">
			</fieldset>
			<fieldset class="form-group">
			<label>Food Price:</label><input placeholder="Rs"  value="<%=price %>" class="form-control" name="price" required="required">
			</fieldset>
			             <fieldset class="form-group">
								<lable> <i class="fas fa-unlock-alt"></i>&nbsp&nbspQuantity:</lable>
								<input type="number" min="1"class="form-control" name="quantity"
									placeholder="Enter Quantity" value="" required="required">
							</fieldset>
			       <table>
				   <tr>
					<td><input type="submit" name="submit" value="Confirm">      <input type="submit" name="submit" value="Cancel"></td>
					<td>
				</td>
				</tr>
				</table>
			<div align="center">
				<a href="menuCard.jsp" class="">Back to Menu</a>
			</div>
			</form>
			</div>
			</div></div>		
</body>
</html>