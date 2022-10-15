<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dataManager" scope="application" class="model.DataManager"/>
<%@ page import="model.ReservationSummaryObject" %>
<jsp:useBean id="reservation" scope="session" class="model.Reservation"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <style><%@include file="../WEB-INF/css/ReservationSummary.css"%></style>
    	<style>
        	* {
          	  font-family: Glacial;
       		}
    	</style>
<title>Reservation Summary</title>

</head>
	<%
	//Save data from confirmation
	String nameOnCard = (String) request.getParameter("NameOnCard");
    reservation.setNameOnCard(nameOnCard);
    String cardNumber = (String) request.getParameter("CardNumber");
    reservation.setCardNumber(cardNumber);
    String exp = (String) request.getParameter("exp");
    reservation.setExp(exp);
    
    
    dataManager.setReservation(reservation);
    
	
	// Read back reservation information
	ReservationSummaryObject myReservation = dataManager.getReservationSummary(reservation.getReservationID());
	%>
<body>

	<c:import url="header.jsp" />
	
	<main>
		<div class="main-container">
		
			<div class="box-1">
				<h1>Thank you for reserving!</h1>
			</div>
			
			<div class="box-2">
				<div class="inner-left">
					<h2>Guest Name</h2>
					<p>
					<%
					out.println(myReservation.getFirstName()); //See First name
					out.println(myReservation.getLastName()); //See Last name
					%>
					</p>
				</div>
				<div class="inner-right">
					<h2>Reservation ID</h2>
					<p>
					<%
					out.println(myReservation.getReservationID()); //See reservation ID
					%>
					</p>
				</div>
			</div>
			
			<div class="box-3">
				<h2>Stay Dates</h2>
				<p>
				<% 
				out.println(myReservation.getStayDatesString());
				out.println("<br/><br/>");
				out.println("Proviso " + reservation.getLocation());
				%> 
				</p>
			</div>
			
			<div class="box-4">
				<div class="inner-left">
					<h2>Check-In</h2>
					<p>4:00 PM</p>
				</div>
				<div class="inner-right">
					<h2>Check-Out</h2>
					<p>11:00 AM</p>
				</div>
			</div>
			
			<div class="box-5">
				<div class="inner-left">
					<h2># of Guests</h2>
					<p><%out.print(reservation.getGuests()); %></p>
				</div>
				<div class="inner-right">
					<h2>Room Type</h2>
					<p>
					<%
					out.println(myReservation.getRoomType()); // see room type
					%>
					</p>
				</div>
			</div>
			
			<div class="box-6">
				<div class="inner-left">
					<h2>Number of Nights</h2>
					<p>
					<%
					out.println(myReservation.getNumberOfNights());
					%>
					</p>
				</div>
				<div class="inner-right">
					<h2>Amenities</h2>
					<table class="amenities">
						<tr>
							<th>WiFi</th>
							<th>Breakfast</th>
							<th>Parking</th>
						</tr>
			       		<tr>
			       			<td>
			       				<%
			       					if (reservation.getWifi() == true) {
			       						out.print("YES");
			       					} else {
			       						out.print("NO");
			       					}
			       				%>
			       			</td>
			       			<td>
			       				<%
			       					if (reservation.getBreakfast() == true) {
			       						out.print("YES");
			       					} else {
			       						out.print("NO");
			       					}
			       				%>
			       			</td>
			       			<td>
			       				<%
			       					if (reservation.getParking() == true) {
			       						out.print("YES");
			       					} else {
			       						out.print("NO");
			       					}
			       				%>
			       			</td>
			       		</tr>
			       </table>
				</div>
			</div>
			<div class="box-7">
				<h2>Estimated Total</h2>
					<p>
					<%
					out.println(myReservation.getAmountString());
					%>
					</p>
			</div>
			
		</div>
	</main>
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
</body>
</html>