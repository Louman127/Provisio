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

	<form action="registrationProcess.jsp" method="post">

		 First name : <input type="text" name="fname" /> <br><br>
		 
		 Last name : <input type="text" name="lname" /> <br><br>
		 
		 Email : <input type="text" name="email" /><br><br>
		 
		 Phone : <input type="text" name="phone" /><br><br> 
		 
		 Password : <input type="password" name="password" /> <br><br>
		 
		 Country Name : <input type="text" name="country" /> <br><br>
		 
		 Zip : <input type="text" name="zip" /> <br><br>
		 
		 <input type="submit" />

	</form>
<%
	}

%>

	<%
	if (request.getMethod().equals("POST")) {
	%>

	Hash hasher = new Hash();
	String fname = request.getParameter("fname");
	String lname = request.getParameter("lname");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String password = request.getParameter("password");
	String country = request.getParameter("country");
	String zip = request.getParameter("zip");
	String hash = Hash.generate(password);
	
	
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/provisio_db", "prov_user", "provisio");
		Statement st = conn.createStatement();
		int i = st.executeUpdate("insert into users(first_name,last_name,email,phone,country,zip,password)values('" + fname
		+ "','" + lname + "','" + email + "','" + phone + "','" + country + "','" + zip + "','" + hash + "')");
		out.println("Thank you for register ! Please <a href='index.html'>Login</a> to continue.");
	} catch (Exception e) {
		System.out.print(e);
		e.printStackTrace();
	}

<%

	}

%>





</body>
</html>