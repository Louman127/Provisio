<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Provisio Home</title>

<link rel="stylesheet" href="PageStructure/style.css" media="screen">
<%@include file="PageStructure/topPage.jsp"%>
<%@include file="PageStructure/bottomPage.jsp"%>

</head>
<body>

	<h1 class="pageTitle">Reservations</h1>

	<div id="pageContainterIndex">

		<div id="mainpic">
			<img id="vacation" src="PageStructure/vacation_spot_866.gif"
				alt="picture of new york">
			<p id="addlink">
				Registered members collect 150<br> points per night on every
				stay!<br> <a href="signin.jsp" id="signin2">Sign In</a> or <a
					href="register.jsp" id="register2">create an account</a><br>
				and start gaining points!
			</p>
		</div>

		<div id="searchdiv">
			<form id="searchform" action="#" method="post">
				<table>
					<tr>
						<td><label><strong class="asterik">*</strong>Destination<br>
								<input type="text" name="destination" size="30"
								required="required"></label></td>
					</tr>
					<tr>
						<td><label><strong class="asterik">*</strong>From<br>
								<input type="date" name="arrive" required="required"></label></td>
						<td><label><strong class="asterik">*</strong>To<br>
								<input type="date" name="depart" required="required"></label></td>
					</tr>
					<tr>
						<td><label><strong class="asterik">*</strong>From<br>
								<input type="date" name="arrive" required="required"></label></td>
						<td><label><strong class="asterik">*</strong>To<br>
								<input type="date" name="depart" required="required"></label></td>
					</tr>
					<tr>
						<td>Number of People:</td>
					</tr>
					<tr>
						<td><label><strong class="asterik">*</strong>Adults <input
								type="text" name="adults" size="3" required="required"></label>
						</td>
						<td><label><strong class="asterik">*</strong>Children
								<input type="text" name="kids" size="3" required="required"></label>
						</td>
					</tr>
					<tr>
						<td><label><strong class="asterik">*</strong>Number
								of Rooms <input type="text" name="rooms" size="3"
								required="required"></label></td>
					</tr>
					<tr>
						<td><label><strong class="asterik">*</strong>Room
								Size <input type="text" name="rm_size" size="3"
								required="required"></label></td>
					</tr>
					<tr>
						<td>Amenities:<br> <br> <label>Wifi($12.99
								flat rate) <input type="checkbox" name="wifi" value="Wifi">
						</label><br> <label>Breakfast($8.99 per night) <input
								type="checkbox" name="breakfast" value="breakfast">
						</label><br> <label>Preferred Parking($19.99 per night) <input
								type="checkbox" name="parking" value="parking"></label>
						</td>
					</tr>
					<tr></tr>
					<tr>
						<td align="right"><input type="submit" name="subbutn"
							value="Submit"> <input type="reset" name="clearbutn"
							value="Reset"></td>
					</tr>
				</table>
			</form>
		</div>

	</div>

</body>
</html>