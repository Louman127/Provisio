<%@page import="com.mysql.cj.x.protobuf.MysqlxSql.StmtExecute"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="PageStructure/style.css">
<%@include file="PageStructure/topPage.jsp" %>

<title>Loyalty Points</title>
</head>
<body>

<h1 class="pageTitle">Loyalty Points</h1>





		<%
		int i = 0;
		
		HttpSession session1 = request.getSession(false);
		String email = (String)session1.getAttribute("email");
		String sqlQuery1 = "select users.email, users.loyalty_points from users where users.email = '" + email +"'";
		//String sqlQuery2 = "select users.user_id, users.first_name, users.last_name, users.email, users.loyalty_points, hotel.hotel_name, hotel.state_location, reservation.reservation_id, reservation.hotel_id from users, hotel join reservation where reservation.user_id = users.user_id and reservation.hotel_id = hotel.hotel_id and email = '" + email + "'";
		//String sqlQuery2 = "select users.user_id, users.first_name, users.last_name, users.email, reservation.points_earned, hotel.hotel_name, hotel.state_location, reservation.reservation_id, reservation.hotel_id from users, hotel join reservation where reservation.user_id = users.user_id and reservation.hotel_id = hotel.hotel_id and email = '" + email + "'";
		String sqlQuery2 = "select users.user_id, users.first_name, users.last_name, users.email, users.loyalty_points, reservation.points_earned, hotel.hotel_name, hotel.state_location, reservation.reservation_id, reservation.hotel_id from users, hotel join reservation where reservation.user_id = users.user_id and reservation.hotel_id = hotel.hotel_id and email = '" + email + "'";
		
		String sqlQuery3 = "select users.user_id, users.first_name, users.last_name, users.email, users.loyalty_points, reservation.points_earned, hotel.hotel_name, hotel.state_location, reservation.reservation_id, reservation.hotel_id, reservation.check_in, reservation.check_out from users, hotel join reservation where reservation.user_id = users.user_id and reservation.hotel_id = hotel.hotel_id and email = '" + email + "'  ORDER BY IF(reservation_id RLIKE '^[\\d]', 1, 2), reservation_id DESC;";
		
		//System.out.println(sql);
		try{
			con = (Connection) session1.getAttribute("Loggedin");
			if (con != null){
				%>
				<div id="loyaltyPage">
				<%
				//System.out.print(session1);
				Statement stmt = con.createStatement();
				//ResultSet resultSet = stmt.executeQuery(sqlQuery1);
				ResultSet resultSet2 = stmt.executeQuery(sqlQuery3);
				
				String loyaltyTable = "loyaltyTable1";
				String display5 = "";
				out.println("<table id='" + loyaltyTable + "' style='padding:5px;'>");
				out.println("<tr id='loyaltyTable2'> <td> User ID: </td> <td> First Name: </td> <td> Last Name: </td> <td> Email: </td> <td> Loyalty Points Earned </td> <td> Hotel name </td>"
						+ " <td> Location </td> <td> Reservation ID: </td>  <td> Check In: </td> <td> Check out: </td> </tr>");
				while(resultSet2.next()){
					i = i + 1;
					String display = resultSet2.getString(1); // user id
					String display2 = resultSet2.getString(2); // first name
					String display3 = resultSet2.getString(3); // last name
					String display4 = resultSet2.getString(4); // email
					display5 = resultSet2.getString(5); // total loyalty points
					String display6 = resultSet2.getString(6); // loyalty points earned
					String display7 = resultSet2.getString(7); // Hotel Name
					String display8 = resultSet2.getString(8); // state Location
					String display9 = resultSet2.getString(9); // Reservation ID
					String display11 = resultSet2.getString(11); // Check In
					String display12 = resultSet2.getString(12); // Check Out
					
					// *** Formula to display checkin and out dates as MM-dd-yyyy ***
					int displayLength = display11.length();
					int j = 5;
					int k = 0;					
					StringBuilder builder1 = new StringBuilder();
					StringBuilder builder2 = new StringBuilder();
					while (j < displayLength){
						
						char ch = display11.charAt(j);
						char ch2 = display12.charAt(j);
						
						j = j + 1;
						
						String firstAppend = String.valueOf(ch);
						String firstAppendChar2 = String.valueOf(ch2);
						
						builder1.append(firstAppend);
						builder2.append(firstAppendChar2);
						
						while(k < 4 && j > 9){
							if(k == 0){
								builder1.append("-");
								builder2.append("-");
							}
							ch = display11.charAt(k);
							ch2 = display12.charAt(k);
							
							String secondAppend = String.valueOf(ch);
							String secondAppendChar2 = String.valueOf(ch2);
							
							builder1.append(secondAppend);
							builder2.append(secondAppend);
							k = k + 1;
							
						}
					}
					// *** End of Formula ***
					
					//System.out.println(builder1);
					//out.println(display + display2 + "<br />" );
			        out.println( "<tr id= '" + loyaltyTable + "'>");
			        out.println("<td style='padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;'>" + display 
			        		+ "</td><td style='padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;'>" + display2 
			        		+ "</td><td style='padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;'>" + display3 + "</td>"
			        		+ "<td style='padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px; width: 10000px;'>" + display4 + "</td>"  
			        		+ "<td style='padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;'>" + display6 + "</td>" 
			        		+ "<td style='padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px; width: 10000px;'>" + display7 
			        		+ "</td>" + "<td style='padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;'>" + display8 
			        		+ "</td><td style='padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;'>" + display9 
			        		+ "</td><td style='padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px; width: 10000px;'>" + builder1 
			        		+  "</td><td style='padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px; width: 10000px;'>" + builder2 + "</td> </tr>");
			        
			        if (i % 2 == 0){
			        	loyaltyTable = "loyaltyTable1"; 
			        }
			        
			        else{
			        	loyaltyTable = "loyaltyTable2"; 
			        }
			           
				}
				out.println("</table>");
				out.println("<br /><p style='text-align: center;'>Total Loyalty Points: " + display5 +"</p>");
				%>
				</div>
					<footer style="margin-top: 30%;position: relative; box-sizing: border-box; bottom: 0px; text-align: center; left: 0; right: 0; color: white; font-size: 10pt;">
					   &copy Copyright Charlie Team 2023
					</footer>
				<%

		        
				
			}
			else{
				%>
				<div id="loyaltyPage" style="margin-left: 44%;">
				<%
				System.out.println("No connection to DB");
				out.println("Please Login to see points!");
				%>
				
				</div>
					<footer style="margin-top: 50px;position: fixed; box-sizing: border-box; bottom: 0px; text-align: center; left: 0; right: 0; color: white; font-size: 10pt;">
					   &copy Copyright Charlie Team 2023
					</footer>
				<%
			}
			
			Statement stmt = con.createStatement();
		}
		catch (Exception e){
			System.out.println(e);
		}
		
		
		%>
		
		

		
		
		
		





</body>
</html>