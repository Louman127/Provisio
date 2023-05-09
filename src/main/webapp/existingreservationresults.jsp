<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%--@page import="jakarta.servlet.http.HttpServlet"--%>
<%--@page import="jakarta.servlet.http.HttpServletRequest"--%>
<%--@page import="jakarta.servlet.http.HttpServletResponse"--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="PageStructure/style.css">
<%@include file="PageStructure/topPage.jsp" %>

<title>Insert title here</title>
</head>
<body>

<h1 class="pageTitle">Existing Reservation Results</h1>

<%String resId = request.getParameter("reserv_id");%>

<%if(resId == null) {%>
      <%="Please enter a Reservation ID."%>  
<%}else {%>
       <%try{%>
       <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/provisio_db", 
                                                          "prov_user", "provisio");
            
            String sql = "select * from reservation inner join hotel "
                    + "on reservation.hotel_id = hotel.hotel_id "
                    + "inner join users on reservation.user_id = users.user_id "
                    + "inner join rooms on reservation.room_id = rooms.room_id "
                    + "where reservation_id = " + resId;
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
        %>
        <%
            
            while(rs.next()) {
                String reserveId = rs.getString("reservation_id");
                String hotelId = rs.getString("hotel_id");
                String userId = rs.getString("user_id");
                String checkIn = rs.getString("check_in");
                String checkOut = rs.getString("check_out");
                String wifi = rs.getString("amenity_wifi");
                String breakfast = rs.getString("amenity_breakfast");
                String parking = rs.getString("amenity_parking");
                String guests = rs.getString("number_of_guests");
                String roomId = rs.getString("room_id");
                String total = rs.getString("price_total");
                String bHotelId = rs.getString("hotel_id");
                String hotelName = rs.getString("hotel_name");
                String hCountry = rs.getString("country");
                String strAddress = rs.getString("street_address");
                String location = rs.getString("state_location");
                String hCity = rs.getString("city");
                String hZip = rs.getString("zip");
                String hPhone = rs.getString("phone");
                String bUserId = rs.getString("user_id");
                String fName = rs.getString("first_name");
                String lName = rs.getString("last_name");
                String email = rs.getString("email");
                String uPhone = rs.getString("phone");
                String uCountry = rs.getString("country");
                String uZip = rs.getString("zip");
                String passwrd = rs.getString("pass");
                String loyalty = rs.getString("loyalty_points");
                String rmId = rs.getString("room_id");
                String rmSize = rs.getString("room_size");
                String rmAmount = rs.getString("room_amount");
        %>
        <%
                
                List<String> existing = new ArrayList<>();
                existing.add(reserveId);
                existing.add(checkIn);
                existing.add(checkOut);
                existing.add(wifi);
                existing.add(breakfast);
                existing.add(parking);
                existing.add(guests);
                existing.add(total);
                existing.add(hotelName);
                existing.add(hCountry);
                existing.add(strAddress);
                existing.add(location);
                existing.add(hCity);
                existing.add(hZip);
                existing.add(hPhone);
                existing.add(fName);
                existing.add(lName);
                existing.add(email);
                existing.add(uPhone);
                existing.add(uCountry);
                existing.add(uZip);
                existing.add(rmSize);
                existing.add(rmAmount);
                existing.add(loyalty);
        %>
        <div id="results">
            Reservation ID: <%=existing.get(0)%>
            <div id="results_title">
                <h3>Property</h3>
            </div>
            <div id="results_content">
                Hotel: <%=existing.get(8)%><br>
                Address: <%=existing.get(10)%><br> 
                City: <%=existing.get(12)%> State: <%=existing.get(11)%> Zip: <%=existing.get(13)%><br>
                Country: <%=existing.get(9)%><br>
                Phone: <%=existing.get(14)%><br><br>
                 
                Dates of Stay: From: <%=existing.get(1)%> | To: <%=existing.get(2)%><br>
                Number of Guests: <%=existing.get(6)%><br>
                Amenities:<br>
                Wifi: <%=existing.get(3)%> | Breakfast: <%=existing.get(4)%> | Preferred Parking: <%=existing.get(5)%><br>
                Price: <%=existing.get(7)%><br>
                Room Type: <%=existing.get(21)%><br>
                
                <!-- QUICK FIX of price to new prices -->
                Room Price: <% double pricerMan = Double.parseDouble(existing.get(22));
                pricerMan =  pricerMan*1.05;
                out.println(pricerMan);
                %><br>
            </div>
            <div id="results_content2">
                <h3>Name on Reservation</h3>
                Name: <%=existing.get(15)%>   <%=existing.get(16)%><br>
                Email: <%=existing.get(17)%><br>
                Phone: <%=existing.get(18)%><br>
                Country: <%=existing.get(19)%><br>
                Zip Code: <%=existing.get(20)%><br>
                Current Loyalty Points: <%=existing.get(23)%>
            </div>
        </div>
         <%}%>
      <%}catch(SQLException e){%>
             out.println(e);
      <%}%>         
<%}%>
<br>
<br>
<!--
        <footer style="position: absolute; box-sizing: border-box; bottom: 0px; text-align: center; left: 0; right: 0; color: white; font-size: 10pt;">
	   &copy Copyright Charlie Team 2023
	</footer>-->
</body>
</html>