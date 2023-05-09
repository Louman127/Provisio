<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.io.PrintWriter"%>


<%@page import="java.lang.Double"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.*"%>
<%@page import="java.text.NumberFormat"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Provisio Home</title>

<link rel="stylesheet" href="PageStructure/style.css" media="screen">
<%@include file="PageStructure/topPage.jsp"%>






</head>
<body>

	<%
	String select;
	String orlando;
	String omaha;
	String grand;
	String destination;
	if (request.getMethod().equals("GET")) {
	%>
	<h1 class="pageTitle">Reservations</h1>

	<div id="pageContainterIndex">

		<div id="mainpic">
			<img id="vacation" src="PageStructure/vacation_spot_866.gif"
				alt="picture of new york">
			<p id="addlink">
				Registered members collect 150<br> points per night on every
				stay!<br> <a href="signin.jsp" id="signin2">Sign In</a> or <a
					href="register.jsp" id="register2">create an account</a><br>
				and start earning points!
			</p>
		</div>

		<div id="searchdiv">
			<form id="searchform" action="index.jsp" method="post">
				<table>
					<tr>
						<td><label><strong class="asterik">*</strong>Property Locations</label><br> 
								
						<select name="properties">
								
								<option value="selection">Select a Property </option>
								<option value="orlando">Orlando, FL</option>
								<option value="omaha">Omaha, NE</option>
								<option value="grand">Grand Canyon Village, AZ</option>
								
						</select></td>
						
					</tr>
					<tr>
						<td><label><strong class="asterik">*</strong>From<br>
								<input type="date" name="start" required="required"></label></td>
						<td><label><strong class="asterik">*</strong>To<br>
								<input type="date" name="finish" required="required"></label></td>
					</tr>
					<tr>
						<td>Number of People:</td>
					</tr>
					<tr>
						<td><label><strong class="asterik">*</strong>Adults <br><input
								type="number" name="grown" size="3" min="0" required="required"></label></td>
						<td><label><strong class="asterik">*</strong>Children
								<br><input type="number" name="babies" size="3" min="0" required="required"></label>
						</td>
					</tr>
					
					<!--  
					<tr>
						<td><label><strong class="asterik">*</strong>Number
								of Rooms <br><input type="number" name="rooms" size="3"
								required="required"></label></td>
					</tr>-->
					
					<tr>
											
						<td><br><label><strong class="asterik">*</strong>Room Size</label><br> 
								
						<select name="rm_size">
								
								<option value="4">Double $120.75</option> <!-- $115.00 -->
								<option value="3">Queen $131.25</option> <!-- $125.00 -->
								<option value="2">Double Queen $157.50</option> <!-- $150.00 -->
								<option value="1">King $173.25</option> <!-- $165.00 -->
								

						</select></td>
					
					</tr>
					<tr>
						<td><br>Amenities:<br> <br> <label>Wifi($12.99
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
	</div> <!-- end of search div -->

<%

}
%>


		
		
		<%
		if(request.getMethod().equals("POST")){
		%>
			<div id="posterIndex">
		<%
		destination = request.getParameter("properties");
		
		// Getting parameters from HTML and setting to session
		HttpSession session1 = request.getSession(true);
		
		try{
			con = (Connection) session1.getAttribute("Loggedin");
			if (con != null){
				System.out.print(session1);
			}
			else{
				System.out.println("No connection to DB");
			}
			
			Statement stmt = con.createStatement();
		}
		catch (Exception e){
			System.out.println(e);
		}
		
		// Creating variables need for display
		String state = "";
		String city = "";
		String zip = "";
		String phone = "";
		String country = "US";
		String stAddressFL = "777 Wonderful Street";
		String stAddressNE = "123 Grand Street";
		String stAddressAZ = "789 Happy Street";
		String hotelFL = "Florida Provisio Hotel";
		String hotelNE = "Nebraska Provisio Hotel";
		String hotelAZ = "Arizona Provisio Hotel";
		
		// Getting parameters
		String wifiCheckBox = request.getParameter("wifi");
		String breakfastCheckBox = request.getParameter("breakfast");
		String parkingCheckBox = request.getParameter("parking");
		
		destination = request.getParameter("properties");
		select = request.getParameter("selection");
		orlando = request.getParameter("orlando");
		omaha = request.getParameter("omaha");
		grand = request.getParameter("grand");
		
		String arrive = request.getParameter("start");
		String depart = request.getParameter("finish");
		String adults = request.getParameter("grown");
		String kids = request.getParameter("babies");
		String rooms = request.getParameter("rooms");
		String rm_size = request.getParameter("rm_size");
		
		// Room amount with holiday that may be added. roomAmt will be converted to USD when it inserts into DB.
		Double roomAmt = 0.00;
        Double holidayAmt=0.00;
		
        // getting month and day from date
        String[] values =arrive.split("-");
        int arrmonth =Integer.parseInt(values[1]);
        int arrday= Integer.parseInt(values[2]);
        String[] val =depart.split("-");
        int depday= Integer.parseInt(val[2]);
        int depmonth =Integer.parseInt(val[1]);
		int room_sizeInt = Integer.valueOf(rm_size);
		String roomSizeDisplay = "";
		
		// Price for rooms. With added 5% increase on base sales
		if(room_sizeInt == 4){
			roomSizeDisplay = "Double";
			roomAmt = 115.0*1.05;
			
		}
		if(room_sizeInt == 3){
			roomSizeDisplay = "Queen";
			roomAmt =125.0*1.05;
			
		}
		if(room_sizeInt == 2){
			roomSizeDisplay = "Double Queen";
			roomAmt =150.0*1.05;
			
		}
		if(room_sizeInt == 1){
			roomSizeDisplay = "King";
			roomAmt = 165.0*1.05;
			
		}
		
		
		// Formula to determine additional holiday fees at 5% per night
		if(arrmonth <= 07  && depmonth >= 07){
            if(arrday <= 04 && depday >= 04){
				    holidayAmt = roomAmt*.05 + holidayAmt;
            }
		}	
		
		if(arrmonth <= 12  && depmonth >= 12){
            if(arrday <= 24 && depday >= 24){
            		holidayAmt = roomAmt*.05 + holidayAmt;
            }
		}
		
		if(arrmonth <= 12  && depmonth >= 12){
            if(arrday <= 25 && depday >= 25){
            		holidayAmt = roomAmt*.05 + holidayAmt;
            }
		}
		
		if(arrmonth <= 12  && depmonth >= 12){
            if(arrday <= 31 && depday >= 31){
				    holidayAmt += roomAmt*.05+ holidayAmt;	   
            }
		}
		
		// Set these attributes to be retrieved from the session
		session1.setAttribute("properties", destination);
		session1.setAttribute("selection", select);
		session1.setAttribute("orlando", orlando);
		session1.setAttribute("omaha", omaha);
		session1.setAttribute("grand", grand);
		session1.setAttribute("start", arrive);
		session1.setAttribute("finish", depart);
		session1.setAttribute("grown", adults);
		session1.setAttribute("babies", kids);
		session1.setAttribute("rm_size", rm_size);
		
		if(destination.equalsIgnoreCase("selection")){
			System.out.println("Please make a valid selection.");
			out.println("Please make a selection");
			%>
<!-- 					<style>
						#posterIndex{
							display: inline-block;
							padding: 50px;
							margin-top: 250px;
							margin-left: 20%;
							background-color: rgba(145, 145, 145, 0.8);
							/*background-color:rgba(21, 70, 153, .8);*/
							border-radius: 10px 10px 10px 10px;
    						box-shadow: 5px 5px 5px 5px rgba(0, 0, 0, 0.2);
						}
					</style> -->
					<br><br>
					<form action="index.jsp" method="get">
				    	<button type="submit">Go Back</button>
					</form>
							
		<%	
		}

		if (destination.equalsIgnoreCase("orlando")) {
		%>
<!-- 							<style>
								#posterIndex{
								    border: 1px solid black;
								    padding-left: 15px;
								    padding-bottom: 15px;
								    width: 500px;
								    background-color: rgba(145, 145, 145, 0.8);
								    margin-left: 32%;
								    margin-top: 240px;
								} 
								
								
								</style> 
							<style>
								#posterIndex{
									display: inline-block;
									padding: 40px;
									margin-top: 240px;
									margin-left: 20%;
									background-color: rgba(145, 145, 145, 0.8);
									/*background-color:rgba(21, 70, 153, .8);*/
									margin-bottom: 40px;
									border-radius: 10px 10px 10px 10px;
    								box-shadow: 5px 5px 5px 5px rgba(0, 0, 0, 0.2);
								}
		
							</style>-->

				<h2>Here's Your Results!</h2>
				<B>Available Property: <%out.println(hotelFL); %></B>
				<br>
				<img id='florida_pic' src='PageStructure/florida_hotel_300.gif'>
				<br>
				<B>Location: <%out.println(country); %></B>
				<br>
				<B>Address: <%out.println(stAddressFL); %></B>
				<br> 
				<B>State: FL</B>
				<br>
				<B>City: Orlando</B> 
				<br>
				<B>Zip Code: 77777</B>
				<br>
				<B>Phone: 123-456-7890</B>
				<br>
				<br>
				<B>Dates of Stay: </B> 
				<br>
				<B>From: <%out.println(arrive); %></B><B> To: <%out.println(depart); %></B>
				<br>
				<B>Number of People: Adults = <%out.println(adults); %> and </B><B> Children = <%out.println(kids); %></B>
				
				<%-- <B>Number of Rooms: <%out.println(rooms); %></B> --%>
				<br>
				<B>Room Size: <%out.println(roomSizeDisplay); %></B>
				<br><br>
				<B>Amenities:</B>
				<br>
				<%
				
				// perform operation to determine nights staying
				LocalDate dateIn = LocalDate.parse(arrive);
				LocalDate dateOut = LocalDate.parse(depart);
				int nightsStaying = (int) (dateOut.toEpochDay() - dateIn.toEpochDay());

				// This will add roomAmt to the holiday fee after the roomAmt is multiplied by number of nights
				roomAmt = (roomAmt * nightsStaying)+ holidayAmt;
				
				int loyalty_points_earned = 150;
				loyalty_points_earned = loyalty_points_earned * nightsStaying;
				
							
				if (wifiCheckBox != "" || wifiCheckBox != null) {
					session1.setAttribute("wifi", wifiCheckBox);
					out.println(" ");
					
					if(wifiCheckBox != null){
						out.println(wifiCheckBox);
						Double wifiPrice = 12.99;
						roomAmt = roomAmt + wifiPrice;
					}
				
				
				}
				if (breakfastCheckBox != "" || breakfastCheckBox != null) {
					session1.setAttribute("breakfast", breakfastCheckBox);
					out.println(" ");
					
					if(breakfastCheckBox != null){
						out.println(breakfastCheckBox);
						Double breakfastPrice = 8.99 * nightsStaying;
						roomAmt = roomAmt + breakfastPrice;
					}
				}
				
				if (parkingCheckBox != "" || parkingCheckBox != null) {
					session1.setAttribute("parking", parkingCheckBox);
					out.println(" ");
					if(parkingCheckBox != null){
						out.println(parkingCheckBox);	
						Double parkingPrice = 19.99 * nightsStaying;
						roomAmt = roomAmt + parkingPrice;
					}
					
				}
				
			/************************** Room Amount being set ***************************************************/	
				session1.setAttribute("roomAmt", roomAmt);
				
				out.println("<br /> <br /><B>Summary:</B> ");
				out.println("<br />The loyalty points you will earn: " + loyalty_points_earned);
				
				String roomAmtCurrency = java.text.NumberFormat.getCurrencyInstance(java.util.Locale.US).format(roomAmt);
				out.println("<br />The total is: " + roomAmtCurrency);
				
				// Note: if there are problems with the below output use the above fully qualified name
				//out.println("<br />The total is: " + NumberFormat.getCurrencyInstance(Locale.US).format(roomAmt));
				
				%>
				<br><br>
				
				<B>Local Attractions:</B>
				<p>Take in the Orlando experience by visiting the Kennedy Space Center<br>
				   complex, or see how motion pictures are made on a tour of Universal<br>
				   Studios.  And it just wouldn't be an official Orlando visit without<br>
				   going to Sea World!</p>
				   
				   <p> Would you like to Book this reservation?<br></p>

					<%Connection conn = (Connection) session.getAttribute("Loggedin");%>
					
					<% if (conn == null) { %>
					    <p>Please sign in</p>
					    
					    <form action="signinContinue.jsp" method="post">
				    		<button type="submit">Sign In</button>
						</form>
					<% 
					}
					else{%>
						
					
						<form action="confirmation.jsp" method="post">
				    		<button type="submit">Book!</button>
						</form>
					<%	
					}
					%>
													
<%

}

%>
		<%
		if (destination.equalsIgnoreCase("omaha")) {
		%>
<!-- 							<style>
								#posterIndex{
									display: inline-block;
									padding: 40px;
									margin-top: 240px;
									margin-left: 20%;
									background-color: rgba(145, 145, 145, 0.8);
									/*background-color:rgba(21, 70, 153, .8);*/
									margin-bottom: 40px;
									border-radius: 10px 10px 10px 10px;
    								box-shadow: 5px 5px 5px 5px rgba(0, 0, 0, 0.2);
								}
							</style> -->

				<h2>Here's Your Results!</h2>
				<B>Available Property: <%out.println(hotelNE); %></B>
				<br>
				<img id='omaha_pic' src='PageStructure/omaha_hotel_300.gif'>
				<br>
				<B>Location: <%out.println(country); %></B>
				<br>
				<B>Address: <%out.println(stAddressNE); %></B>
				<br> 
				<B>State: NE</B>
				<br>
				<B>City: Omaha</B> 
				<br>
				<B>Zip Code: 44444</B>
				<br>
				<B>Phone: 555-555-5555</B>
				<br>
				<br>
				<B>Dates of Stay: </B> 
				<br>
				<B>From: <%out.println(arrive); %></B><B> To: <%out.println(depart); %></B>
				<br>
				<B>Number of People: Adults = <%out.println(adults); %> and </B><B> Children = <%out.println(kids); %></B>
				
				<%-- <B>Number of Rooms: <%out.println(rooms); %></B> --%>
				<br>
				<B>Room Size: <%out.println(roomSizeDisplay); %></B>
				<br><br>
				<B>Amenities:</B>
				<br>
				<%
				
				LocalDate dateIn = LocalDate.parse(arrive);
				LocalDate dateOut = LocalDate.parse(depart);
				int nightsStaying = (int) (dateOut.toEpochDay() - dateIn.toEpochDay());
				
				// This will add roomAmt to the holiday fee after the roomAmt is multiplied by number of nights
				roomAmt = (roomAmt * nightsStaying)+ holidayAmt;
				
				int loyalty_points_earned = 150;
				loyalty_points_earned = loyalty_points_earned * nightsStaying;
				
							
				if (wifiCheckBox != "" || wifiCheckBox != null) {
					session1.setAttribute("wifi", wifiCheckBox);
					out.println(" ");
					
					if(wifiCheckBox != null){
						out.println(wifiCheckBox);
						Double wifiPrice = 12.99;
						roomAmt = roomAmt + wifiPrice;
					}
				
				
				}
				if (breakfastCheckBox != "" || breakfastCheckBox != null) {
					session1.setAttribute("breakfast", breakfastCheckBox);
					out.println(" ");
					
					if(breakfastCheckBox != null){
						out.println(breakfastCheckBox);
						Double breakfastPrice = 8.99 * nightsStaying;
						roomAmt = roomAmt + breakfastPrice;
					}
				}
				
				if (parkingCheckBox != "" || parkingCheckBox != null) {
					session1.setAttribute("parking", parkingCheckBox);
					out.println(" ");
					if(parkingCheckBox != null){
						out.println(parkingCheckBox);	
						Double parkingPrice = 19.99 * nightsStaying;
						roomAmt = roomAmt + parkingPrice;
					}
					
				}
				
				session1.setAttribute("roomAmt", roomAmt);
				out.println("<br /> <br /><B>Summary:</B> ");
				out.println("<br />The loyalty points you will earn: " + loyalty_points_earned);
				
				String roomAmtCurrency = java.text.NumberFormat.getCurrencyInstance(java.util.Locale.US).format(roomAmt);
				out.println("<br />The total is: " + roomAmtCurrency);
				
				%>
				<br><br>
				
				<B>Local Attractions:</B>

				  <p> 
				   Visit the world-famous Omaha Henry Doorly Zoo and checkout<br>
				   the Lied Jungle, the African Safari Exhibit, or the new Aquarium.<br>
				   Other attractions include the historic Old Market and the new Capital<br>
				   District which is host to downtown night life, or visit the beautiful<br>
				   Lauritzen Gardens.</p>
				      
				  <p> Would you like to Book this reservation?<br></p>

					<%Connection conn = (Connection) session.getAttribute("Loggedin");%>
					
					<% if (conn == null) { %>
					    <p>Please sign in</p>
					       
					    <form action="signinContinue.jsp" method="get">
				    		<button type="submit">Sign In</button>
						</form>
					<% 
					}
					else{%>
						<form action="confirmation.jsp" method="get">
				    		<button type="submit">Book!</button>
						</form>
					<%	
					}
					%>
				   
<%
}			
%>
		<%
		if (destination.equalsIgnoreCase("grand")) {
		%>
<!-- 							<style>
								#posterIndex{
									display: inline-block;
									padding: 40px;
									margin-top: 240px;
									margin-left: 20%;
									background-color: rgba(145, 145, 145, 0.8);
									/*background-color:rgba(21, 70, 153, .8);*/
									margin-bottom: 40px;
									border-radius: 10px 10px 10px 10px;
    								box-shadow: 5px 5px 5px 5px rgba(0, 0, 0, 0.2);
								}
							</style> -->

				<h2>Here's Your Results!</h2>
				<B>Available Property: <%out.println(hotelAZ); %></B>
				<br>
				<img id='arizona_pic' src='PageStructure/arizona_hotel_300.gif'>
				<br>
				<B>Location: <%out.println(country); %></B>
				<br>
				<B>Address: <%out.println(stAddressAZ); %></B>
				<br> 
				<B>State: AZ</B>
				<br>
				<B>City: Grand Canyon Village</B> 
				<br>
				<B>Zip Code: 86023</B>
				<br>
				<B>Phone: 444-577-4455</B>
				<br>
				<br>
				<B>Dates of Stay: </B> 
				<br>
				<B>From: <%out.println(arrive); %></B><B> To: <%out.println(depart); %></B>
				<br>
				<B>Number of People: Adults = <%out.println(adults); %> and </B><B> Children = <%out.println(kids); %></B>
				
				<%-- <B>Number of Rooms: <%out.println(rooms); %></B> --%>
				<br>
				<B>Room Size: <%out.println(roomSizeDisplay); %></B>
				<br><br>
				<B>Amenities:</B>
				<br>
				<%
				
				LocalDate dateIn = LocalDate.parse(arrive);
				LocalDate dateOut = LocalDate.parse(depart);
				int nightsStaying = (int) (dateOut.toEpochDay() - dateIn.toEpochDay());

				// This will add roomAmt to the holiday fee after the roomAmt is multiplied by number of nights
				roomAmt = (roomAmt * nightsStaying)+ holidayAmt;
				
				int loyalty_points_earned = 150;
				loyalty_points_earned = loyalty_points_earned * nightsStaying;
				
							
				if (wifiCheckBox != "" || wifiCheckBox != null) {
					session1.setAttribute("wifi", wifiCheckBox);
					out.println(" ");
					
					if(wifiCheckBox != null){
						out.println(wifiCheckBox);
						Double wifiPrice = 12.99;
						roomAmt = roomAmt + wifiPrice;
					}
				
				
				}
				if (breakfastCheckBox != "" || breakfastCheckBox != null) {
					session1.setAttribute("breakfast", breakfastCheckBox);
					out.println(" ");
					
					if(breakfastCheckBox != null){
						out.println(breakfastCheckBox);
						Double breakfastPrice = 8.99 * nightsStaying;
						roomAmt = roomAmt + breakfastPrice;
					}
				}
				
				if (parkingCheckBox != "" || parkingCheckBox != null) {
					session1.setAttribute("parking", parkingCheckBox);
					out.println(" ");
					if(parkingCheckBox != null){
						out.println(parkingCheckBox);	
						Double parkingPrice = 19.99 * nightsStaying;
						roomAmt = roomAmt + parkingPrice;
					}
					
				}
				
				session1.setAttribute("roomAmt", roomAmt);
				out.println("<br /> <br /><B>Summary:</B> ");
				out.println("<br />The loyalty points you will earn: " + loyalty_points_earned);
				
				String roomAmtCurrency = java.text.NumberFormat.getCurrencyInstance(java.util.Locale.US).format(roomAmt);
				out.println("<br />The total is: " + roomAmtCurrency);
				
				%>
				<br><br>
				
				<B>Local Attractions:</B>

				  <p> 
				   Grand Canyon Village offers plenty of tour activities to make your<br>
				   visit exciting.  Take a 45 minute helicopter flight over the entire<br>
				   Canyon, a 3-hour off-road safari into the Canyon's southern rim,<br>
				   take a full day tour of the Grand Canyon by ground transportation and<br>
				   motorized river float!
				   </p>
				    
				   <p> Would you like to Book this reservation?<br></p>

					
					<%Connection conn = (Connection) session.getAttribute("Loggedin");%>
					
					<% if (conn == null) { %>
					    <p>Please sign in</p>
					    
					    <form action="signinContinue.jsp" method="get">
				    		<button type="submit">Sign In</button>
						</form>
					
					<% 
					}
					else{%>
						
						<form action="confirmation.jsp" method="get">
				    		<button type="submit">Book!</button>
						</form>
				
					<%	
					}
					%>
	
<%
}			
%>

<%
}			
%>


	</div>
	<footer style="margin-top: 25%; position: relative; box-sizing: border-box; bottom: 0; text-align: center; left: 0; right: 0; color: white; font-size: 10pt;">
	   &copy Copyright Charlie Team 2023
	</footer> 

</body>


</html>

<%-- 

References that can help:

https://stackoverflow.com/questions/24759384/checking-if-user-is-logged-in-or-not-using-sessions-java-servlet

https://coderanch.com/t/657132/databases/session-setAttribute-save-data-database

https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a


--%>
