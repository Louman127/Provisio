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

	<%
	
	

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
	
	HttpSession session1 = request.getSession(false);
	
	String destination = (String) session1.getAttribute("properties");
	
	//String prop = (String) session1.getAttribute("properties");
	
	String select = (String) session1.getAttribute("selection");
	
	String orlando = (String) session1.getAttribute("orlando");
	
	String omaha = (String) session1.getAttribute("omaha");
	
	String grand = (String) session1.getAttribute("grand");
	
	arrive = (String) session1.getAttribute("start");
	
	depart = (String) session1.getAttribute("finish");
	
	adults = (String) session1.getAttribute("grown");
	
	kids = (String) session1.getAttribute("babies");
	
	rooms = (String) session1.getAttribute("rooms");
	
	rm_size = (String) session1.getAttribute("rm_size");
	
	/*
	out.println(destination);
	out.println(select);
	out.println(orlando);
	out.println(omaha);
	out.println(grand);
	out.println(arrive);
	out.println(depart);
	out.println(adults);
	out.println(kids);
	out.println(rooms);
	out.println(rm_size);*/

	%>
	



		<div id="posterIndex">
		
		<%
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
				<B>Number of Rooms: <%out.println(rooms); %></B>
				<br>
				<B>Room Size: <%out.println(rm_size); %></B>
				<br>
				<B>Amenities:</B><br>
				<br>
				<%
				
				wifiCheckBox = request.getParameter("wifi");
				breakfastCheckBox = request.getParameter("breakfast");
				parkingCheckBox = request.getParameter("parking");
				
				if (wifiCheckBox != null) {
					 
					out.println(wifiCheckBox);
				}
		
				if (breakfastCheckBox != null) {
					
					out.println(breakfastCheckBox);
				}
		
				if (parkingCheckBox != null) {
					
					out.println(parkingCheckBox);
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
					    
					    <form action="signin.jsp" method="get">
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
				<B>Number of Rooms: <%out.println(rooms); %></B>
				<br>
				<B>Room Size: <%out.println(rm_size); %></B>
				<br>
				<B>Amenities:</B><br>
				<br>
				<%
				
				wifiCheckBox = request.getParameter("wifi");
				breakfastCheckBox = request.getParameter("breakfast");
				parkingCheckBox = request.getParameter("parking");
				
				if (wifiCheckBox != null) {
					 
					out.println(wifiCheckBox);
				}
		
				if (breakfastCheckBox != null) {
					
					out.println(breakfastCheckBox);
				}
		
				if (parkingCheckBox != null) {
					
					out.println(parkingCheckBox);
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
					       
					    <form action="signin.jsp" method="get">
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
				<B>Number of Rooms: <%out.println(rooms); %></B>
				<br>
				<B>Room Size: <%out.println(rm_size); %></B>
				<br>
				<B>Amenities:</B><br>
				<br>
				<%
				
				wifiCheckBox = request.getParameter("wifi");
				breakfastCheckBox = request.getParameter("breakfast");
				parkingCheckBox = request.getParameter("parking");
				
				if (wifiCheckBox != null) {
					 
					out.println(wifiCheckBox);
				}
		
				if (breakfastCheckBox != null) {
					
					out.println(breakfastCheckBox);
				}
		
				if (parkingCheckBox != null) {
					
					out.println(parkingCheckBox);
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
					    
					    <form action="signin.jsp" method="get">
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

	</div>

</body>
</html>


