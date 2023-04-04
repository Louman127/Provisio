<%@page import="java.io.*"%>
<%@page import="ehotel.ConnectDatabase"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="PageStructure/style.css">
<%@include file="PageStructure/topPage.jsp" %>
<%@include file="PageStructure/bottomPage.jsp" %>


<%

ConnectDatabase myConnectDatabase = new ConnectDatabase();

myConnectDatabase.closer();

%>

<title>Insert title here</title>
</head>
<body>

<h1 class="pageTitle">Example testing connection page</h1>

<p>This is to test the connection of the provisio database and I will delete this file after everyone has tested the connection</p>
<p>After running this file please check your console output in eclipse to see if you see both of the following:</p>
<p>Connection Established</p>
<p>Connection Closed</p>
<p>Please advise in discord if the test shows to be successful</p>



</body>
</html>