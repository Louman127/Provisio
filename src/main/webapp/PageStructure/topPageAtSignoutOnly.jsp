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


	<header id="header">
		<h1 id="headerWords"> <img src="PageStructure/provisio_200_1.gif"> </h1>
	</header>

	<div id="leftbar">

		<a href="signin.jsp" id="signin">Sign In</a>
		<br/>
		<br/>	
		<a href="register.jsp" id="register">or Register</a><br />

	</div>

	<div id="menuDiv">

		<a href="index.jsp" id="indexItem">Reservations</a> 
		<a href="about.jsp" id="aboutItem">About</a> 
		<a href="locations.jsp" id="locationsItem">Locations</a> 
		<a href="loyalty.jsp" id="loyaltyItem">Loyalty Points</a>
		
	</div>

	<div id="rightbar">
		
		<%-- <a href="contactsupport.jsp" id="contact">Contact Support</a> --%>
		<br/> 
		<br />
		<a href="existingreservation.jsp" id="existingRev">Existing Reservation</a>
		<br />
		<br />
		<!--
		<label id="langLabel">Choose Language:</label>
		<select name="Language" id="lang">
			  <option value="english">English</option>
			  <option value="espanol">Espanol</option>
		</select>
		-->	

	</div>

</body>
</html>