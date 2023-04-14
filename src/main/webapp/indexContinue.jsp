<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.io.PrintWriter"%>
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

		<div id="posterIndex">
		
		<%
		
		
		
		
		
		
		String select;
		String orlando;
		String omaha;
		String grand;
		String destination;
		if(request.getMethod().equals("GET")){
		//destination = request.getParameter("properties");
		
		
		
		
		
		
		// Getting parameters from HTML and setting to session
		
		HttpSession session1 = request.getSession(false);
		
		//con = (Connection) session1.getAttribute("Loggedin");
		
		
		//Statement stmt = con.createStatement();
		/*stmt.executeQuery("");*/
		
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
		
		destination = (String) session1.getAttribute("properties");
		select = (String) session1.getAttribute("selection");
		orlando = (String) session1.getAttribute("orlando");
		omaha = (String) session1.getAttribute("omaha");
		grand = (String) session1.getAttribute("grand");
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
		
		
		
		
		
		
		
		
		/*
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
		
		String wifiCheckBox = request.getParameter("wifi");
		String breakfastCheckBox = request.getParameter("breakfast");
		String parkingCheckBox = request.getParameter("parking");*/
		
		/*
		destination = request.getParameter("properties");
		select = request.getParameter("selection");
		orlando = request.getParameter("orlando");
		omaha = request.getParameter("omaha");
		grand = request.getParameter("grand");*/
		
		/*
		String arrive = request.getParameter("start");
		String depart = request.getParameter("finish");
		String adults = request.getParameter("grown");
		String kids = request.getParameter("babies");		
		String rm_size = request.getParameter("rm_size");
		
		int room_sizeInt = Integer.valueOf(rm_size);
		String roomSizeDisplay = "";*/
		
		
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
		/*
		session1.setAttribute("properties", destination);
		session1.setAttribute("selection", select);
		session1.setAttribute("orlando", orlando);
		session1.setAttribute("omaha", omaha);
		session1.setAttribute("grand", grand);
		session1.setAttribute("start", arrive);
		session1.setAttribute("finish", depart);
		session1.setAttribute("grown", adults);
		session1.setAttribute("babies", kids);
		session1.setAttribute("rm_size", rm_size);*/
		
		if(destination.equalsIgnoreCase("selection")){
			System.out.println("Please make a valid selection.");
			out.println("Please make a selection");
			%>
					<style>
						#posterIndex{
							display: inline-block;
							padding: 50px;
							margin-top: 250px;
							margin-left: 20%;
							background-color:rgba(21, 70, 153, .8);
							border-radius: 10px 10px 10px 10px;
    						box-shadow: 5px 5px 5px 5px rgba(0, 0, 0, 0.2);
						}
					</style>
					<br><br>
					<form action="index.jsp" method="get">
				    	<button type="submit">Go Back</button>
					</form>
							
		<%	
		}

		if (destination.equalsIgnoreCase("orlando")) {
		%>
							<style>
								#posterIndex{
									display: inline-block;
									padding: 40px;
									margin-top: 240px;
									margin-left: 20%;
									background-color:rgba(21, 70, 153, .8);
									margin-bottom: 40px;
									border-radius: 10px 10px 10px 10px;
    								box-shadow: 5px 5px 5px 5px rgba(0, 0, 0, 0.2);
								}
		
							</style>

				<h2>Here's Your Results!</h2>
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
				<br>
				<B>Room Size: <%out.println(roomSizeDisplay); %></B>
				<br>
				<B>Amenities:</B><br>
				<br>
				<%
							
				if (wifiCheckBox != "" || wifiCheckBox != null) {
					session1.setAttribute("wifi", wifiCheckBox);
					out.println(" ");
					
					if(wifiCheckBox != null){
						out.println(wifiCheckBox);
					}
				
				
				}
				if (breakfastCheckBox != "" || breakfastCheckBox != null) {
					session1.setAttribute("breakfast", breakfastCheckBox);
					out.println(" ");
					
					if(breakfastCheckBox != null){
						out.println(breakfastCheckBox);
					}
				}
				
				if (parkingCheckBox != "" || parkingCheckBox != null) {
					session1.setAttribute("parking", parkingCheckBox);
					out.println(" ");
					if(parkingCheckBox != null){
						out.println(parkingCheckBox);
					}
					
				}

				
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
							<style>
								#posterIndex{
									display: inline-block;
									padding: 40px;
									margin-top: 240px;
									margin-left: 20%;
									background-color:rgba(21, 70, 153, .8);
									margin-bottom: 40px;
									border-radius: 10px 10px 10px 10px;
    								box-shadow: 5px 5px 5px 5px rgba(0, 0, 0, 0.2);
								}
							</style>

				<h2>Here's Your Results!</h2>
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
				<br>
				<%-- <B>Number of Rooms: <%out.println(rooms); %></B> --%>
				<br>
				<B>Room Size: <%out.println(roomSizeDisplay); %></B>
				<br>
				<B>Amenities:</B><br>
				<br>
				<%
				
				if (wifiCheckBox != "" || wifiCheckBox != null) {
					session1.setAttribute("wifi", wifiCheckBox);
					out.println(" ");
					
					if(wifiCheckBox != null){
						out.println(wifiCheckBox);
					}
				
				
				}
				if (breakfastCheckBox != "" || breakfastCheckBox != null) {
					session1.setAttribute("breakfast", breakfastCheckBox);
					out.println(" ");
					
					if(breakfastCheckBox != null){
						out.println(breakfastCheckBox);
					}
				}
				
				if (parkingCheckBox != "" || parkingCheckBox != null) {
					session1.setAttribute("parking", parkingCheckBox);
					out.println(" ");
					if(parkingCheckBox != null){
						out.println(parkingCheckBox);
					}
					
				}
				
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
							<style>
								#posterIndex{
									display: inline-block;
									padding: 40px;
									margin-top: 240px;
									margin-left: 20%;
									background-color:rgba(21, 70, 153, .8);
									margin-bottom: 40px;
									border-radius: 10px 10px 10px 10px;
    								box-shadow: 5px 5px 5px 5px rgba(0, 0, 0, 0.2);
								}
							</style>

				<h2>Here's Your Results!</h2>
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
				<br>
				<B>Room Size: <%out.println(roomSizeDisplay); %></B>
				<br>
				<B>Amenities:</B><br>
				<br>
				<%
				
				if (wifiCheckBox != "" || wifiCheckBox != null) {
					session1.setAttribute("wifi", wifiCheckBox);
					out.println(" ");
					
					if(wifiCheckBox != null){
						out.println(wifiCheckBox);
					}
				
				
				}
				if (breakfastCheckBox != "" || breakfastCheckBox != null) {
					session1.setAttribute("breakfast", breakfastCheckBox);
					out.println(" ");
					
					if(breakfastCheckBox != null){
						out.println(breakfastCheckBox);
					}
				}
				
				if (parkingCheckBox != "" || parkingCheckBox != null) {
					session1.setAttribute("parking", parkingCheckBox);
					out.println(" ");
					if(parkingCheckBox != null){
						out.println(parkingCheckBox);
					}
					
				}
				
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

</body>
</html>


