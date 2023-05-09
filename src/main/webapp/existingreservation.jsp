<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="PageStructure/style.css">
<%@include file="PageStructure/topPage.jsp" %>

<title>Insert title here</title>
</head>
<body>

<h1 class="pageTitle">Existing Reservation Search</h1>

<div id="searchreserve">
    <form action="existingreservationresults.jsp" method="post">
        <label><b>*</b>Enter Reservation ID:</label> <input type="number" name="reserv_id"> 
        <br>
        <br>
        <div id="buttondiv">
            <input type="submit" value="Submit">
            <input type="reset" value="Clear">
        </div>
    </form>
</div>

	<footer style="position: absolute; box-sizing: border-box; bottom: 0px; text-align: center; left: 0; right: 0; color: white; font-size: 10pt;">
	   &copy Copyright Charlie Team 2023
	</footer>
</body>
</html>