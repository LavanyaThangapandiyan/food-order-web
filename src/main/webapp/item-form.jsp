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
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color:  tomato">
		</div>
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
			<label>Item Name:</label><input type="text" value="<c:out value='${item.name}'/>" class="form-control" name="name" required="required">
			</fieldset>
			<fieldset class="form-group">
			<label>Item Price:</label><input type="text" value="<c:out value='${item.price}'/>" class="form-control" name="price" >
			</fieldset>
            <button type="submit" class="btn btn-success">Save</button>
            </form>
            </div>
            </div>
		</div>	
</body>
</html>