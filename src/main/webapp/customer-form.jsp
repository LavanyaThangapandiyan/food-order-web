<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
</head>
<body>
<header>
<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color:  tomato">
		</div>
            <ul class="navbar-nav">
				</ul>
		</nav>
</header><br>
<div class="container col-md-5">
	<div class="card">
		<div class="card-body">
<c:if test="${ user !=null }">
			<input type="hidden" name="id" value="<c:out value='${user.id }'/>"/>
			</c:if>
			<fieldset class="form-group">
			<label>First Name:</label><input type="text" value="<c:out value='${user.fname}'/>" class="form-control" name="fname" required="required">
			</fieldset>
			<fieldset class="form-group">
			<label>Last Name:</label><input type="text" value="<c:out value='${user.lname}'/>" class="form-control" name="lname" >
			</fieldset>
			<fieldset class="form-group">
			<label>Email:</label><input type="text" value="<c:out value='${user.email}'/>" class="form-control" name="email" >
			</fieldset>
			<fieldset class="form-group">
			<label>User Name:</label><input type="text" value="<c:out value='${user.uname}'/>" class="form-control" name="uname" >
			</fieldset>
            <button type="submit" class="btn btn-success">Save</button>
            </form>
            </div>
            </div>
            </div>  
</body>
</html>