<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="PageStructure/style.css">
<%@include file="PageStructure/topPage.jsp"%>

<title>Provisio Sign-In</title>
</head>
<body>

	<h1 class="pageTitle">Sign In</h1>

	<div id="signinPageContainer">

		<div id="signinFormDiv">

			<form id="signinform" action="LoginServlet" method="post">
				<table>
					<tr>
						<td><label>Email:</label><br> <input type="text"
							name="email" required="required"></td>
					</tr>
					<tr>
						<td><label>Password</label><br> <input type="password"
							name="password" required="required"></td>
					</tr>
					<tr>
						<th></th>
						<br>
						<th><input type="submit" value="Login"></th>
					</tr>
				</table>
				
				<br>Not Registered? <a href="register.jsp"> Create an Account</a>
			
			</form>

		</div>

	<footer style="position: absolute; box-sizing: border-box; bottom: 0px; text-align: center; left: 0; right: 0; color: white; font-size: 10pt;">
	   &copy Copyright Charlie Team 2023
	</footer>
</body>
</html>