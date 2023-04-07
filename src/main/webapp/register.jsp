<%@page import="ehotel.Hash"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="PageStructure/style.css">
<%@include file="PageStructure/topPage.jsp"%>
<%@include file="PageStructure/bottomPage.jsp"%>
<%@page import="java.sql.*,java.util.*"%>

<title>Insert title here</title>
</head>
<body>

	<h1 class="pageTitle">Register</h1>

	<%
	if (request.getMethod().equals("GET")) {
	%>

	<div id="registerPageContainer">

		<div id="register-formDiv">

			<form id=registerform action="CreateAccountServlet" method="post">

				<label>First Name:</label><br> <input type="text" name="fname" />
				<br>
				<br> <label>Last Name:</label><br> <input type="text"
					name="lname" /> <br>
				<br> <label>Email:</label><br> <input type="text"
					name="email" /><br>
				<br> <label>Phone:</label><br> <input type="text"
					name="phone" /><br>
				<br> <label>Country:</label><br> <input type="text"
					name="country" /> <br>
				<br> <label>Zip:</label><br> <input type="text" name="zip" />
				<br>
				<br> <label>Password:</label><br> <input type="password"
					name="password" /> <br><br>
				<input type="submit" />
				
				<br><br> or <a href="signin.jsp"> Sign In </a>

			</form>

		</div>

	</div>

	<%
	}
	%>

</body>
</html>