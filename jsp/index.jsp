<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dataManager" scope="application" class="model.DataManager"/>
<%@ page import="model.ReservationSummaryObject" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Home Page</h1>
	
	<%--Example link--%>
	<a href="/Proviso?action=about">About Us</a>
	
	<%--Example Button --%>
	<form>
		<input type="hidden" name="action" value="locations"/>
		<input id="submit" type="submit" value="locations"/>
	</form>
	
	<%--Page to test inserting data to the DB. --%>
	<a href="/Proviso?action=DataTest">DBTest</a>
	
	<br>
	<%--If the user is logged in show them a welcome message and a logout button, otherwise show a link to the login page --%>
	<% 
		if (session.getAttribute("user") != null) {
			out.println("Welcome " + session.getAttribute("user"));
			%>
		<form>
			<input type="hidden" name="action" value="logout"/>
			<input id="submit" type="submit" value="logout"/>
		</form>
		
		<%}
		else {%>
		<a href="/Proviso?action=LoginTest">Log In</a>
		<br>
		<%--Link to Registration page --%>
		<a href="/Proviso?action=Register">Register</a>
		<%} %>
	
	<br>	
	<%--Link to landing page --%>
	<a href="/Proviso?action=LandingPage">Landing Page</a>
	<br>	
	<%--Link to Date Selection page --%>
	<a href="/Proviso?action=DateSelection">Date Selection Page</a>
	<br>	
	<%--Link to Room Choice page --%>
	<a href="/Proviso?action=RoomChoice">Room Choice Page</a>
	<br>	
	<%--Link to Reservation Summary --%>
	<a href="/Proviso?action=ReservationSummary">Reservation Summary Page</a>
	<br>
	<%--Link to Reservation Confirmation --%>
	<a href="/Proviso?action=ReservationConfirmation">Reservation confirmation Page</a>
	<br>
	<%--Link to Reservation Summary --%>
	<a href="/Proviso?action=ReservationSummary">Reservation Summary Page</a>
	<br>
	<%--Link to Reservation Confirmation --%>
	<a href="/Proviso?action=ReservationConfirmation">Reservation confirmation Page</a>
	<br>
	<%--Link to Reservation Lookup --%>
	<a href="/Proviso?action=ReservationLookup">Reservation Lookup Page</a>
	<br>
	<%--Link to Reservation Lookup->Display --%>
	<a href="/Proviso?action=ReservationDisplay">Reservation Lookup->Display Page</a>
	<br>
	<h4>example usage of ReservationSummaryObject</h4>
	<%
	//Must use Datamanager bean, and import model.ReservationSummaryObject (see lines 3 and 4).
	ReservationSummaryObject myReservation = dataManager.getReservationSummary(1);	//Create the object. Input is the reservation ID you are looking for.
	out.println(myReservation.getCheckIn().getDate()); //See date of check-in
	out.println(myReservation.getCheckIn().getMonth() + 1); //see month of check-in
	out.println(myReservation.getCheckIn().getYear() + 1900); // see year of check-in
	out.println(myReservation.getFirstName()); //See First name
	out.println(myReservation.getLastName()); //See Last name
	out.println(myReservation.getReservationID()); //See reservation ID
	out.println(myReservation.getEarnedPoints()); //see earned points
	out.println(myReservation.getRoomType()); // see room type
	out.println(myReservation.getAmount()); //see amount in cents
	out.println(myReservation.getNumberOfNights()); //Get number of nights
	%>
	
</body>
</html>