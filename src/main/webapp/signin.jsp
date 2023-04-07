<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="PageStructure/style.css">
<%@include file="PageStructure/topPage.jsp" %>
<%@include file="PageStructure/bottomPage.jsp" %>
<title>Provisio Sign-In</title>
</head>
<body>

<h1 class="pageTitle">Sign In</h1>

<div class="signin-form">

	<form id="signinform" action="LoginServlet" method="post">
		<table>
			<tr>
				<td>
					Email: <input type="text" name="email" required="required">
				</td>
			</tr>
			<tr>
				<td>
					Password: <input type="password" name="password" required="required">
				</td>
			</tr>
			<tr>
				<th></th>
				<th><input type="submit" value="Login"></th>
			</tr>
		</table>
	
	</form>

</div>

</body>
</html>