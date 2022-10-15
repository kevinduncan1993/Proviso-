<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dataManager" scope="application" class="model.DataManager"/>
<%@ page import="model.ReservationLookup" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <style><%@include file="../WEB-INF/css/ReservationDisplay.css"%></style>
    	<style>
        	* {
          	  font-family: Glacial;
       		}
    	</style>
<title>Reservation</title>
</head>

<body>
<c:import url="header.jsp" />
<%
	ReservationLookup reservation = dataManager.getReservationLookup(Integer.valueOf(request.getParameter("reservationID")));
	if (!reservation.isValid()) { %>
	<jsp:forward page="ReservationInvalid.jsp"/> <%
	}
	if (!reservation.getEmail().equals(session.getAttribute("user"))) { %>
		<jsp:forward page="ReservationLookup.jsp"/> <%
	}
	%>

<main>

	<div class="main-container">
	
		<div class="main-top">
		
			<div class="main-top-left">
				<h1>Reservation:</h1>
			</div>
			
			<div class="main-top-right">
				<p><%out.print(request.getParameter("reservationID")); %></p>
			</div>
			
		</div>
		
		<div class="main-bottom">
		
			<div class="bottom-left">
				<div class="Hotel">
					<h2><%out.print(reservation.getHotel()); %></h2>
					<ul class="address">
						<li><%out.print(reservation.getAddress()); %></li>
						<li><%out.print(reservation.getCityStateZip()); %></li>
						<li>USA</li>
						<li><%out.print(reservation.getPhoneNumber()); %></li>
					</ul>
				</div>
			</div>
			
			<div class="bottom-middle">
				<div class="stay">
					<h2>Your Stay</h2>
					<div class="info">
						<div class="info-template">
							<ul>
								<li>Guest Name:</li>
								<li>Check-in:</li>
								<li>Check-out:</li>
								<li>Number of guests:</li>
								<li>Number of rooms:</li>
							</ul>
						</div>
						<div class="info-insert">
							<ul>
								<li><%out.print(reservation.getName()); %></li>
								<li><%out.print(reservation.getCheckIn()); %></li>
								<li><%out.print(reservation.getCheckOut()); %></li>
								<li><%out.print(reservation.getGuests()); %></li>
								<li>1</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			
			<div class="bottom-right">
				<div class="room">
					<h2>Room & Amenities</h2>
					<div class="info">
						<div class="info-template">
							<ul>
								<li>Room:</li>
								<li>Wifi:</li>
								<li>Breakfast:</li>
								<li>Parking:</li>
							</ul>
						</div>
						<div class="info-insert">
							<ul>
								<li><%out.print(reservation.getRoom()); %></li>
								<li><%out.print(reservation.getWifi()); %></li>
								<li><%out.print(reservation.getBreakfast()); %></li>
								<li><%out.print(reservation.getParking()); %></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			
		</div>
		
	</div>
	
</main>

<footer>
<jsp:include page="footer.jsp" />
</footer>

</body>

</html>