<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="style.css">
<title>Insert title here</title>
</head>
<body>


	<div id="header">
		<h1 id="headerWords">Provisio!</h1>
		
		<a href="signin.jsp">Sign In</a>
		
		<br />
		
		or
		
		<br />
		
		<a href="register.jsp">Register</a><br />
		
	
	</div>
		<a href="contactsupport.jsp" id="contact">Contact Support</a>
		
		<a href="existingreservation.jsp" id="existingRev">Existing Reservation</a>
		
		<label id="langLabel">Choose Language:</label>
		<select name="Language" id="lang">
  			<option value="english">English</option>
  			<option value="espanol">Espanol</option>
		</select>
		
		
		
		


	<div id="menuDiv">

		<a href="index.jsp" class="menuItems">Reservations</a> 
		<a href="about.jsp" class="menuItems">About</a> 
		<a href="locations.jsp" class="menuItems">Locations</a> 
		<a href="loyalty.jsp" class="menuItems">Loyalty Points</a>


	</div>













</body>
</html>