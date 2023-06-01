<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Item Manager</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
</head>
<body>
<script>
function validate()
{
	var name=document.getElementById("name").value;
	var regex=/^[a-zA-Z ]+$/;
	var category=document.getElementById("category").value;
	var type=document.getElementById("type").value;
	if(regex.test(name))
		document.getElementById("user").style.visibility="visible";
     else
		document.getElementById("foodname").style.visibility="visible";
	if(regex.test(category))
		document.getElementById("user").style.visibility="visible";
	else
		document.getElementById("cat").style.visibility="visible";
	if(regex.test(type))
		document.getElementById("user").style.visibility="visible";
	else
		document.getElementById("types").style.visibility="visible";		
}
</script>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color:  tomato">
            <ul class="navbar-nav">
					<li><a href="<%=request.getContextPath()%>/list"
						class="nav-link">Items</a></li>
				</ul>
		</nav>
	</header>
	<br>
	<div class="container col-md-5">
	<div class="card">
		<div class="card-body">
			<c:if test="${item !=null}">
				<form action="update" method="post">
			</c:if>
			<c:if test="${item ==null}">
				<form action="insert" method="post">
			</c:if>
			
			<capiton>
			<h2>
			<c:if test="${item!=null}">
			Edit Item
			</c:if>
			<c:if test="${item==null}">
			Add New Item
			</c:if>
			</h2>
			</capiton>
			
			<c:if test="${item !=null }">
			<input type="hidden" name="id" value="<c:out value='${item.id }'/>"/>
			</c:if>
			<fieldset class="form-group">
			<label>Item Name:</label><input placeholder="Enter Food Name" id="name" type="text" value="<c:out value='${item.name}'/>" class="form-control" name="name" required="required">
			<label id="foodname" style="color:red;visibility:hidden">Invalid Food Name</label>
			</fieldset>
			<fieldset class="form-group">
			<label>Item Price:</label><input placeholder="Enter Food Price" id="price" min="1" type="number" value="<c:out value='${item.price}'/>" class="form-control" name="price" >
			</fieldset>
			<fieldset class="form-group">
			<label>Item Category:</label><input id="category" placeholder="Enter Food Category" type="text" value="<c:out value='${item.category}'/>" class="form-control" name="category" >
			<label id="cat" style="color:red;visibility:hidden">Invalid Food Category</label>
			</fieldset>
			<fieldset class="form-group">
			<label>Item Food Type:</label><input id="type" placeholder="Enter Food Type" type="text" value="<c:out value='${item.food_type}'/>" class="form-control" name="food_type" >
			<label id="types" style="color:red;visibility:hidden">Invalid Food Type</label>
			</fieldset>
			<fieldset class="form-group">
			<label>Quantity:</label><input min="1" placeholder="Enter Food Quantity" type="number" value="<c:out value='${item.quantity}'/>" class="form-control" name="quantity" >
			</fieldset>
            <button onclick="validate();" type="submit" class="btn btn-success">Save</button>
            </form>
            <div>
		<label id="user" style="color:green;visibility:hidden">valid Food Details
        </label>
		</div>
            </div>
            </div>
		</div>	
</body>
</html>