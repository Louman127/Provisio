<%@page import="ehotel.LoginServlet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@ page import="javax.servlet.RequestDispatcher"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="PageStructure/style.css">
<%@include file="PageStructure/topPageAtSignoutOnly.jsp"%>

<title>Provisio Sign Out</title>
</head>
<body>

	<h1 class="pageTitle">Signed Out</h1>

	<div id="signOutPageContainer">
		<p style="margin-left: 40%; font-size: 20pt;">You are signed out
			successfully</p>

		<%
		Connection con = (Connection) session.getAttribute("Loggedin");
		
		if (con != null) {
			
			try {
				
				con.close();
				System.out.println("Connection closed");
				
			} 
			
			catch (SQLException e) {
				
				System.out.println("The connection did not close.");
				
			}
			
			session.removeAttribute("Loggedin");
		}
		
		
		session.invalidate();
		System.out.println("Session now invalid.");
		%>

	</div>

	<footer style="position: absolute; box-sizing: border-box; bottom: 0px; text-align: center; left: 0; right: 0; color: white; font-size: 10pt;">
	   &copy Copyright Charlie Team 2023
	</footer>
</body>
</html>