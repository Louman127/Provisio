<%@page import="com.mysql.cj.x.protobuf.MysqlxSql.StmtExecute"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*"%>
<%@page import="java.lang.Double"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Confirmation</title>

<link rel="stylesheet" href="PageStructure/style.css" media="screen">
<%@include file="PageStructure/topPage.jsp"%>


</head>
<body>
<h1 class="pageTitle">Confirmation</h1>
	<%
	
	HttpSession session1 = request.getSession(false);
	con = (Connection) session1.getAttribute("Loggedin");
	Statement stmt = con.createStatement();
	
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
	
	String wifiCheckBox = (String) session1.getAttribute("wifi");
	String breakfastCheckBox = (String) session1.getAttribute("breakfast");
	String parkingCheckBox = (String) session1.getAttribute("parking");

	int wifiForSQL = 0; //Integer.valueOf(wifiCheckBox);
	int breakfastForSQL = 0; //Integer.valueOf(breakfastCheckBox);
	int parkingForSQL = 0; //Integer.valueOf(parkingCheckBox);
	
	if(wifiCheckBox != null){
		wifiForSQL = 1;
	}
	if(breakfastCheckBox != null){
		breakfastForSQL = 1;
	}
	if(parkingCheckBox != null){
		parkingForSQL = 1;
	}
	
	String destination = (String) session1.getAttribute("properties");
	String select = (String) session1.getAttribute("selection");
	String orlando = (String) session1.getAttribute("orlando");
	String omaha = (String) session1.getAttribute("omaha");
	String grand = (String) session1.getAttribute("grand");
	String arrive = (String) session1.getAttribute("start");
	String depart = (String) session1.getAttribute("finish");
	String adults = (String) session1.getAttribute("grown");
	String kids = (String) session1.getAttribute("babies");
	String rm_size = (String) session1.getAttribute("rm_size");
	
	int room_sizeInt = Integer.valueOf(rm_size);
	String roomSizeDisplay = "";
	if(room_sizeInt == 4){
		roomSizeDisplay = "Double";
		
	}
	if(room_sizeInt == 3){
		roomSizeDisplay = "Queen";
		
	}
	if(room_sizeInt == 2){
		roomSizeDisplay = "Double Queen";
		
	}
	if(room_sizeInt == 1){
		roomSizeDisplay = "King";
		
	}
	
	
	// For SQL insertion
	int numberOfGuests = Integer.valueOf(adults) +  Integer.valueOf(kids);
	
	//int roomSizer = Integer.parseInt(rm_size);
	String email = (String) session1.getAttribute("email");
	
	int user_id = 0;
	Double roomAmt = (Double)session1.getAttribute("roomAmt");
	
	//int departInt = Integer.valueOf(depart);
	//int arriveInt = Integer.valueOf(arrive);
	//DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("MM/dd/yyyy");
	LocalDate dateIn = LocalDate.parse(arrive);
	LocalDate dateOut = LocalDate.parse(depart);
	
	int nightsStaying = (int) (dateOut.toEpochDay() - dateIn.toEpochDay());
	
	
	// ResultSet rs = stmt.executeQuery("SELECT users.email, users.user_id FROM users WHERE email = users.email;");
	
	try{
		ResultSet rs = stmt.executeQuery("SELECT users.email, users.user_id FROM users WHERE '" + email + "' = users.email;");
		if(rs.next()){
			user_id = rs.getInt(2);	
		}
		
		System.out.println("user_id is " + user_id);
	
	}
	catch (Exception e){
		System.out.println(e);
	}
	
	/*
	try{
		ResultSet rs = stmt.executeQuery("SELECT rooms.room_amount FROM rooms WHERE room_id = " + room_sizeInt);
		if(rs.next()){
			roomAmt = rs.getDouble(1);	
		}
		
		System.out.println("room amount is " + roomAmt);
	
	}
	catch (Exception e){
		System.out.println(e);
	}*/
	
	%>
	
		<div id="posterIndex">
		
		<%
		if (destination.equalsIgnoreCase("orlando")) {	
		%>
							<style>
								#posterIndex{
									display: inline-block;
									padding: 40px;
									margin-top: -30px;
									margin-left: 30%;
									background-color: rgba(145, 145, 145, 0.8);
									/*background-color:rgba(21, 70, 153, .8);*/
									margin-bottom: 40px;
									border-radius: 10px 10px 10px 10px;
    								box-shadow: 5px 5px 5px 5px rgba(0, 0, 0, 0.2);
								}
		
							</style>

				<!-- <h2>Here's Your Results!</h2> -->
				
				<%
				try{
					
					ResultSet rs = stmt.executeQuery("SELECT users.email, reservation.reservation_id from users join reservation where users.user_id = " + user_id);
					int counter = 0;
					while(rs.next()){
						counter = counter + 1;
						//int rowCount = rs.getRow();
						//System.out.println("size is " + rowCount);
					}
					out.println("<h2> Reservation ID #: " + counter + "</h2>");
				}
				catch (Exception e){
					System.out.println(e);
				}
				
				%>
				<B>Available Property: <%out.println(hotelFL); %></B>
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
				<br>
				<%-- <B>Number of Rooms: <%out.println(rooms); %></B> --%>
				
				<B>Room Size: <%out.println(roomSizeDisplay); %></B>
				<br><br>
				<B>Amenities:</B>
				<br>
				<%
				
				if (wifiCheckBox != "" || wifiCheckBox != null) {
					out.println(" ");
					if(wifiCheckBox != null){
						out.println(wifiCheckBox);
					}			
				}
				if (breakfastCheckBox != "" || breakfastCheckBox != null) {
					out.println(" ");
					if(breakfastCheckBox != null){
						out.println(breakfastCheckBox);
					}
				}
				
				if (parkingCheckBox != "" || parkingCheckBox != null) {
					out.println(" ");
					if(parkingCheckBox != null){
						out.println(parkingCheckBox);
					}
				}
				
				//roomAmt = roomAmt * nightsStaying;
				int loyalty_points_earned = 150;
				loyalty_points_earned = loyalty_points_earned * nightsStaying;
				//stmt.executeUpdate("UPDATE users SET loyalty_points = loyalty_points + " + loyalty_points_earned + " WHERE user_id = " + user_id);
			
				
				System.out.println(roomAmt);
				String roomAmtCurrency = java.text.NumberFormat.getCurrencyInstance(java.util.Locale.US).format(roomAmt);
				
				out.println("<br /> <br /><B>Summary:</B> ");
				out.println("<br />The loyalty points you earned: " + loyalty_points_earned);
				out.println("<br />The total is: " + roomAmtCurrency);
				
				//stmt.executeUpdate("INSERT INTO reservation(user_id, check_in, check_out, hotel_id, amenity_wifi, amenity_breakfast, amenity_parking, number_of_guests, room_id, price_total)" 
				//+ " VALUES('" + user_id + "', '" + arrive + "', '" + depart + "', '" + 1 +"', '" + wifiForSQL + "', '" + breakfastForSQL + "', '" + parkingForSQL + "', '" + numberOfGuests + "', '" + room_sizeInt + "', '" + roomAmtCurrency + "')");
				
				%>
				<br><br>
				
				<B>Local Attractions:</B>
				<p>Take in the Orlando experience by visiting the Kennedy Space Center<br>
				   complex, or see how motion pictures are made on a tour of Universal<br>
				   Studios.  And it just wouldn't be an official Orlando visit without<br>
				   going to Sea World!</p>
				   
				   <p> Reservation Booked<br></p>
				  <%
					
					out.println("<br />The total is: " + roomAmtCurrency);
				  
				  %>
													
<%
					
}

%>
		<%
		if (destination.equalsIgnoreCase("omaha")) {
		%>
							<style>
								#posterIndex{
									display: inline-block;
									padding: 40px;
									margin-top: -30px;
									margin-left: 30%;
									background-color: rgba(145, 145, 145, 0.8);
									/*background-color:rgba(21, 70, 153, .8);*/
									margin-bottom: 40px;
									border-radius: 10px 10px 10px 10px;
    								box-shadow: 5px 5px 5px 5px rgba(0, 0, 0, 0.2);
								}
							</style>

				<!-- <h2>Here's Your Results!</h2>-->
				
				<%
				try{
					
					ResultSet rs = stmt.executeQuery("SELECT users.email, reservation.reservation_id from users join reservation where users.user_id = " + user_id);
					int counter = 0;
					while(rs.next()){
						counter = counter + 1;
						//int rowCount = rs.getRow();
						//System.out.println("size is " + rowCount);
					}
					out.println("<h2> Reservation ID #: " + counter + "</h2>");
				}
				catch (Exception e){
					System.out.println(e);
				}
				
				%>
				
				<B>Available Property: <%out.println(hotelNE); %></B>
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
				if (wifiCheckBox != "" || wifiCheckBox != null) {
					out.println(" ");
					if(wifiCheckBox != null){
						out.println(wifiCheckBox);
					}			
				}
				if (breakfastCheckBox != "" || breakfastCheckBox != null) {
					out.println(" ");
					if(breakfastCheckBox != null){
						out.println(breakfastCheckBox);
					}
				}
				
				if (parkingCheckBox != "" || parkingCheckBox != null) {
					out.println(" ");
					if(parkingCheckBox != null){
						out.println(parkingCheckBox);
					}
				}
				
				int loyalty_points_earned = 150;
				loyalty_points_earned = loyalty_points_earned * nightsStaying;
				//stmt.executeUpdate("UPDATE users SET loyalty_points = loyalty_points + " + loyalty_points_earned + " WHERE user_id = " + user_id);
				

				System.out.println(roomAmt);
				String roomAmtCurrency = java.text.NumberFormat.getCurrencyInstance(java.util.Locale.US).format(roomAmt);
				
				out.println("<br /> <br /><B>Summary:</B> ");
				out.println("<br />The loyalty points you earned: " + loyalty_points_earned);
				out.println("<br />The total is: " + roomAmtCurrency);
				
				//stmt.executeUpdate("INSERT INTO reservation(user_id, check_in, check_out, hotel_id, amenity_wifi, amenity_breakfast, amenity_parking, number_of_guests, room_id, price_total)" 
				//+ " VALUES('" + user_id + "', '" + arrive + "', '" + depart + "', '" + 2 +"', '" + wifiForSQL + "', '" + breakfastForSQL + "', '" + parkingForSQL + "', '" + numberOfGuests + "', '" + room_sizeInt + "', '" + roomAmtCurrency + "')");
				
				%>
				<br><br>
				
				<B>Local Attractions:</B>

				  <p> 
				   Visit the world-famous Omaha Henry Doorly Zoo and checkout<br>
				   the Lied Jungle, the African Safari Exhibit, or the new Aquarium.<br>
				   Other attractions include the historic Old Market and the new Capital<br>
				   District which is host to downtown night life, or visit the beautiful<br>
				   Lauritzen Gardens.</p>
				      
				  <p> Reservation Booked<br></p>
				   
<%
}			
%>
		<%
		if (destination.equalsIgnoreCase("grand")) {
		%>
							<style>
								#posterIndex{
									display: inline-block;
									padding: 40px;
									margin-top: -30px;
									margin-left: 30%;
									background-color: rgba(145, 145, 145, 0.8);
									/*background-color:rgba(21, 70, 153, .8);*/
									margin-bottom: 40px;
									border-radius: 10px 10px 10px 10px;
    								box-shadow: 5px 5px 5px 5px rgba(0, 0, 0, 0.2);
								}
							</style>

				<!-- <h2>Here's Your Results!</h2>-->
				
				<%
				try{
					
					ResultSet rs = stmt.executeQuery("SELECT users.email, reservation.reservation_id from users join reservation where users.user_id = " + user_id);
					int counter = 0;
					while(rs.next()){
						counter = counter + 1;
						//int rowCount = rs.getRow();
						//System.out.println("size is " + rowCount);
					}
					out.println("<h2> Reservation ID #: " + counter + "</h2>");
				}
				catch (Exception e){
					System.out.println(e);
				}
				
				%>
				
				<B>Available Property: <%out.println(hotelAZ); %></B>
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
				<br>
				<%-- <B>Number of Rooms: <%out.println(rooms); %></B> --%>
				
				<B>Room Size: <%out.println(roomSizeDisplay); %></B>
				<br><br>
				<B>Amenities:</B>
				<br>
				<%
				
				if (wifiCheckBox != "" || wifiCheckBox != null) {
					out.println(" ");
					if(wifiCheckBox != null){
						out.println(wifiCheckBox);
					}			
				}
				if (breakfastCheckBox != "" || breakfastCheckBox != null) {
					out.println(" ");
					if(breakfastCheckBox != null){
						out.println(breakfastCheckBox);
					}
				}
				
				if (parkingCheckBox != "" || parkingCheckBox != null) {
					out.println(" ");
					if(parkingCheckBox != null){
						out.println(parkingCheckBox);
					}
				}
				
				int loyalty_points_earned = 150;
				loyalty_points_earned = loyalty_points_earned * nightsStaying;
				//stmt.executeUpdate("UPDATE users SET loyalty_points = loyalty_points + " + loyalty_points_earned + " WHERE user_id = " + user_id);
				
				System.out.println(roomAmt);
				String roomAmtCurrency = java.text.NumberFormat.getCurrencyInstance(java.util.Locale.US).format(roomAmt);
				
				out.println("<br /> <br /><B>Summary:</B> ");
				out.println("<br />The loyalty points you earned: " + loyalty_points_earned);
				out.println("<br />The total is: " + roomAmtCurrency);
				
				//stmt.executeUpdate("INSERT INTO reservation(user_id, check_in, check_out, hotel_id, amenity_wifi, amenity_breakfast, amenity_parking, number_of_guests, room_id, price_total)" 
				//+ " VALUES('" + user_id + "', '" + arrive + "', '" + depart + "', '" + 3 +"', '" + wifiForSQL + "', '" + breakfastForSQL + "', '" + parkingForSQL + "', '" + numberOfGuests + "', '" + room_sizeInt + "', '" + roomAmtCurrency + "')");
				
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
				    
				   <p> Reservation Booked<br></p>

	
<%
}			
%>

	</div>
	<footer style="position: absolute; box-sizing: border-box; bottom: -100px; text-align: center; left: 0; right: 0; color: white; font-size: 10pt;">
	   &copy Copyright Charlie Team 2023
	</footer>
</body>
</html>


