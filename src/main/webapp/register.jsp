<%@page import="ehotel.Hash"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="PageStructure/style.css">
<%@include file="PageStructure/topPage.jsp"%>

<%@page import="java.sql.*,java.util.*"%>

<title>Register Account</title>
</head>
<body>

	<h1 class="pageTitle">Register</h1>

	<%
	if (request.getMethod().equals("GET")) {
	%>

	<div id="registerPageContainer">

		<div id="register-formDiv">

			<form id=registerform action="CreateAccountServlet" method="post">

				<label>First Name:</label><br> <input type="text" name="fname" required="required"/>
				<br>
				<br> <label>Last Name:</label><br> <input type="text"
					name="lname" required="required"/> <br>
				<br> <label>Email:</label><br> <input type="email"
					name="email" required="required"/><br>
				<br> <label>Phone:</label><br> <input type="text"
					name="phone" required="required"/><br>
				<br> <label>Country:</label><br> <input type="text"
					name="country" required="required"/> <br>
				<br> <label>Zip:</label><br> <input type="text" name="zip" required="required"/>
				<br>
				<br> <label>Password: <br>At least 8 characters with 1 upper and 1 lowercase letter</label><br> <input type="password"
					name="password" required="required" pattern="^(?=.*[a-z])(?=.*[A-Z])[a-zA-Z\d!@#$%^&*-=]{8,}$"/> <br>
				
				<br> <label>Confirm Password:</label><br> <input type="password"
					name="passwordConfirm" required="required" pattern="^(?=.*[a-z])(?=.*[A-Z])[a-zA-Z\d!@#$%^&*-=]{8,}$"/> <br><br>
					
				<input type="submit"/>
				
				<br><br> or <a href="signin.jsp"> Sign In </a>

			</form>

		</div>

	</div>

	<%
	}
	%>
	<footer style="position: relative; box-sizing: border-box; bottom: 0px; text-align: center; left: 0; right: 0; color: white; font-size: 10pt;">
	   &copy Copyright Charlie Team 2023
	</footer>
</body>
</html>