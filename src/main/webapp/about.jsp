<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="PageStructure/style.css">
<%@include file="PageStructure/topPage.jsp" %>

<script>
	function validateForm() {
		var x = document.forms["supportTicket"]["fname"]["lname"]["email"].value;
		if (x == "" || x == null) {
			alert("Please fill out all fields.");
			return false;
		}
	}
</script>


<title>About Us</title>
</head>
<body>

<h1 class="pageTitle">About Us</h1>

<div id="pageContainterAbout">
	<div id="aboutSub">	
		<h2>Providing you with the tools you need to plan your unforgettable journey.</h2>
		<br />
		<img src="PageStructure/hotel_room.jpg">
		<br />	<br />	<br />	<br />	<br />	
	</div>


	<div id="aboutRow">
		<div id="aboutImg">
			<img src="PageStructure/travel_2.jpg">
		</div>
		<br />
		<div id="aboutPara">
			<h3 id="paraTime">Our Purpose</h3>
			<br />
			<p id="paraTime">
			Every individual has a unique tale to tell, experiences to
			share, and stories to unfold.
			We are here because we believe travel is a force of good.
			Let us help you create unforgettable
			stories, whether they consist of comfort and relaxation, adventure
			and excitement, or all of the above! We know travelling can be hard,
			but it's always worth it. With each trip comes new opportunities to
			witness marvels that we may not have seen before!
			<br /> 
			<i>The world begins with you, so take each chance you get
			to broaden your horizons!</i> <br /> <br />
			</p>
		</div>
	</div>
	
	<div id="aboutRow">
		<div id="aboutImg">
			<img src="PageStructure/travel_3.jpg" width="610" height="400">
		</div>
		<div id="aboutPara"> 
			<h3>Who We Are</h3>
			<br />
			<p> 
			We're just like you, travelers. From accross time zones,
			hemispheres, cultures, and languages, we share the passion and joys
			that come with traveling. Provisio was founded in 2023 by
			a group of college students who love traveling. Scattered across the
			United States, we've come together on our shared need to see the
			world. Some of us love to sleep on the beaches of Hawaii. Others love
			to explore the rich history of Egypt. Regardless, we all have reasons
			to adventure and for every reason out there, do it!
			<br /> 
			<i>The journey, not the arrival, matters; but we might as well make
			the arrival great too!</i> <br /> <br />
			</p>
			</div>	
	</div>	

	<div id="aboutRow">
		<div id="aboutImg">
			<img src="PageStructure/travel_1.jpg">
		</div>
		<div id="aboutPara">
			<h3>What We Do</h3>
			<br /> 
			<p>
			We
			want to build great experiences, memories, and connectinos between
			travelers and our partners around the world. Every trip is uniquely
			your's, as we help you orchestrate the best adventure possible.
			Allow us to sift through countless offers and options to provide you
			the best choices of transportation and lodging.
			<br /> 
			<i>Let us find the right path for you to make the most
			out of your journey!</i> <br />
			</p>
		</div>		
	</div>
	
	<div id="contactUs">
	<br /><br /><br /><br /><br />
		<h3>If you need help, send us an email at: <a href = "mailto: support@provisio.com">support@provisio.com</a> <br />
		Or fill out this Support form below! <br /> </h3>
		<form action="supportTicket.jsp" name="supportTicket" onsubmit="return validateForm()">
			
			<label for="fname">First Name:</label>
			<input type="text" id="fname" name="fname" required>
			<br />
			<label for="lname">Last Name:</label>
			<input type="text" id="lname" name="lname" required>
			<br />
			<label for="email">Email:</label>
			<input type="email" id="email" name="email" required>
			<br />
			<label for="issue">Type of Issue:</label>
			<select id="issue" name="issue" >
				<option selected="selected" value="reservation">Reservation Issue</option>
				<option value="payment">Payment/Bank Issue</option>
				<option value="account">Account Issue</option>
				<option value="other">Other</option>
			</select>
			<br />
			<label for="description">Describe your issue: <br /></label>
			<textarea id="description" name="description" rows="10" cols="30" maxlength="200" placeholder="Maximum of 200 characters..." required></textarea>
			<br /><br />
			<input type="submit" value="Submit">
			
		</form>
	
	</div>
	

	

</div>
<div id="somethjing" style="display: block; height: 100%; padding-bottom: 20px;">

</div>
	<footer style="position: relative; box-sizing: border-box; bottom: 0; text-align: center; left: 0; right: 0; color: white; font-size: 10pt;">
	   &copy Copyright Charlie Team 2023
	</footer>
</body>
</html>