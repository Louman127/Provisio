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

<title>Map of Locations</title>
</head>
<body>

<h1 class="pageTitle">Locations</h1>

<div id="locationPageBody">
<%
    String orlandoMsg = "Take in the Orlando experience by visiting the Kennedy Space Center complex, or see " + "<br>" 
                    + "how motion pictures are made on a tour of " + "<br>" 
                    + "Universal Studios.  And it just wouldn't be" + "<br>"
                    + "an official Orlando visit without going to Sea World! " + "<br>";
%>
<%
    String omahaMsg = "Visit the world-famous Omaha Henry Doorly Zoo and checkout the Lied Jungle, " + "<br>"
                  + "the African Safari Exhibit, or the new Aquarium.  Other attractios include the " + "<br>"
                  + "historic Old Market and the new Capital District which is host to downtown night life, " 
                  + "or visit the beautiful Lauritzen Gardens.";
%>
<%
    String grandMsg = "Grand Canyon Village offers plenty of tour " + "<br>"
                  + "activities to make your visit exciting.  Take a " + "<br>"
                  + "45 minute helicopter flight over the entire " + "<br>"
                  + "Canyon, a 3-hour off-road safari into the " + "<br>"
                  + "canyon's sourthern rim, or take a full day tour "
                  + "of the Grand Canyon by ground transportation "
                  + "and motorized river float!";
%>
<%
    String amenities = "Amenities Offered:" + "<br>"
                     + "Wifi: $12.99(flat rate)" + "<br>"
                     + "Breakfast: $8.99(per night)" + "<br>"
                     + "Preferred Parking: $19.99(per night)";
    
%>
<%try{%>
    <%
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/provisio_db", 
                                                          "prov_user", "provisio");
      
      String sql = "select * from hotel where hotel_id = 1";
      PreparedStatement ps = conn.prepareStatement(sql);
      ResultSet rs = ps.executeQuery();
    %>
    <%
        while(rs.next()) {
            String id = rs.getString("hotel_id");
            String hotel = rs.getString("hotel_name");
            String hCountry = rs.getString("country");
            String strAddress = rs.getString("street_address");
            String stLocation = rs.getString("state_location");
            String hCity = rs.getString("city");
            String hZip = rs.getString("zip");
            String hPhone = rs.getString("phone");
    %>
    <%
            List<String> locations = new ArrayList<>();
            locations.add(id);
            locations.add(hotel);
            locations.add(hCountry);
            locations.add(strAddress);
            locations.add(stLocation);
            locations.add(hCity);
            locations.add(hZip);
            locations.add(hPhone);
    %>
    <div id='florida_div'>
        <div id='florida_div_image'>
            <img id='florida_pic' src='PageStructure/florida_hotel_300.gif'>
        </div>
        <div id='florida_content_div'>
            <h3>Provisio Florida (Orlando)</h3>
            <%=locations.get(1)%><br>
            <%=locations.get(3)%><br>
            <%=locations.get(5)%>, <%=locations.get(4)%>  <%=locations.get(6)%><br>
            <%=locations.get(7)%><br><br>
            <%=amenities%><br><br>
            <%=orlandoMsg%><br>
            <div id="loc_link">
                <a href="index.jsp">Make a reservation</a><br>
                <!--<a href="signin.jsp">Log in</a> or <a href="register.jsp">Create an account</a><br>-->
                to book this location.
            </div>
        </div>
    </div>
      <%}%>
<%}catch(SQLException e){%>
       out.println(e);
<%}%>

<!--process and display nebraska provisio location-->
<%try{%>
      <%
          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/provisio_db", 
                                                          "prov_user", "provisio");
      
          String sql = "select * from hotel where hotel_id = 2";
          PreparedStatement ps = conn.prepareStatement(sql);
          ResultSet rs = ps.executeQuery();
      %>
      <%
        while(rs.next()) {
            String id = rs.getString("hotel_id");
            String hotel = rs.getString("hotel_name");
            String hCountry = rs.getString("country");
            String strAddress = rs.getString("street_address");
            String stLocation = rs.getString("state_location");
            String hCity = rs.getString("city");
            String hZip = rs.getString("zip");
            String hPhone = rs.getString("phone");
    %>
    <%
            List<String> locations = new ArrayList<>();
            locations.add(id);
            locations.add(hotel);
            locations.add(hCountry);
            locations.add(strAddress);
            locations.add(stLocation);
            locations.add(hCity);
            locations.add(hZip);
            locations.add(hPhone);
    %>
    <div id='omaha_div'>
        <div id='omaha_div_image'>
            <img id='omaha_pic' src='PageStructure/omaha_hotel_300.gif'>
        </div>
        <div id='omaha_content_div'>
            <h3>Provisio Nebraska (Omaha)</h3>
            <%=locations.get(1)%><br>
            <%=locations.get(3)%><br>
            <%=locations.get(5)%>, <%=locations.get(4)%>  <%=locations.get(6)%><br>
            <%=locations.get(7)%><br><br>
            <%=amenities%><br><br>
            <%=omahaMsg%><br><br>
            <div id="loc_link">
                <a href="index.jsp">Make a reservation</a><br>
                <!--<a href="signin.jsp">Log in</a> or <a href="register.jsp">Create an account</a><br>-->
                to book this location.
            </div>
        </div>
    </div>
    <%}%>
<%}catch(SQLException e) {%>
       out.println(e);
 <%}%>
 
 <!--process and display arizona provisio location-->
 <%try{%>
      <%
          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/provisio_db", 
                                                          "prov_user", "provisio");
      
          String sql = "select * from hotel where hotel_id = 3";
          PreparedStatement ps = conn.prepareStatement(sql);
          ResultSet rs = ps.executeQuery();
      %>
      <%
        while(rs.next()) {
            String id = rs.getString("hotel_id");
            String hotel = rs.getString("hotel_name");
            String hCountry = rs.getString("country");
            String strAddress = rs.getString("street_address");
            String stLocation = rs.getString("state_location");
            String hCity = rs.getString("city");
            String hZip = rs.getString("zip");
            String hPhone = rs.getString("phone");
    %>
    <%
            List<String> locations = new ArrayList<>();
            locations.add(id);
            locations.add(hotel);
            locations.add(hCountry);
            locations.add(strAddress);
            locations.add(stLocation);
            locations.add(hCity);
            locations.add(hZip);
            locations.add(hPhone);
    %>
    <div id='arizona_div'>
        <div id='arizona_div_image'>
            <img id='arizona_pic' src='PageStructure/arizona_hotel_300.gif'>
        </div>
        <div id='arizona_content_div'>
            <h3>Provisio Arizona (Grand Canyon)</h3>
            <%=locations.get(1)%><br>
            <%=locations.get(3)%><br>
            <%=locations.get(5)%>, <%=locations.get(4)%>  <%=locations.get(6)%><br>
            <%=locations.get(7)%><br><br>
            <%=amenities%><br><br>
            <%=grandMsg%><br><br>
            <div id="loc_link">
                <a href="index.jsp">Make a reservation</a><br>
                <!--<a href="signin.jsp">Log in</a> or <a href="register.jsp">Create an account</a><br>-->
                to book this location.
            </div>
        </div>
    </div>
    <%}%>
<%}catch(SQLException e) {%>
       out.println(e);
 <%}%>
 </div>


	<!--<footer style="display: block; width: 100%; padding-top:1000px; margin-bottom: -100%;   position: absolute; box-sizing: border-box; bottom: 0; text-align: center; left: 0; right: 0; color: white; font-size: 10pt; z-index: -10;  ">
	   &copy Copyright Charlie Team 2023
	</footer>-->
</body>
</html>