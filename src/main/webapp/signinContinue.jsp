<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="PageStructure/style.css">
<%@include file="PageStructure/topPage.jsp"%>
<%@include file="PageStructure/bottomPage.jsp"%>
<title>Provisio Sign-In</title>
</head>
<body>

	<%
	
	String destination = request.getParameter("properties");

	String arrive = "";
	String depart = "";
	String adults = "";
	String kids = "";
	String rooms = "";
	String rm_size = "";
	String wifiCheckBox = "";
	String breakfastCheckBox = "";
	String parkingCheckBox = "";

	int id;
	String hotel = "";
	String country = "US";
	String stAddressFL = "777 Wonderful Street";
	String stAddressNE = "123 Grand Street";
	String stAddressAZ = "789 Happy Street";

	String state = "";
	String city = "";
	String zip = "";
	String phone = "";

	String hotelFL = "Florida Provisio Hotel";
	String hotelNE = "Nebraska Provisio Hotel";
	String hotelAZ = "Arizona Provisio Hotel";

	// Getting parameters from HTML
	//String prop = request.getParameter("properties");
	String select = request.getParameter("selection");
	String orlando = request.getParameter("orlando");
	String omaha = request.getParameter("omaha");
	String grand = request.getParameter("grand");
	arrive = request.getParameter("start");
	depart = request.getParameter("finish");
	adults = request.getParameter("grown");
	kids = request.getParameter("babies");
	rooms = request.getParameter("rooms");
	rm_size = request.getParameter("rm_size");
	
	HttpSession session1 = request.getSession(false);
	String prop = (String) session1.getAttribute("properties");

	//out.println(prop);

	%>
	



	<h1 class="pageTitle">Sign In</h1>

	<div id="signinPageContainer">

		<div id="signinFormDiv">

			<form id="signinform" action="LoginServletContinue" method="post">
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

	</div>

</body>
</html>