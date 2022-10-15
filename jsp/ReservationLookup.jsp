<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dataManager" scope="application" class="model.DataManager"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <style><%@include file="../WEB-INF/css/ReservationLookup.css"%></style>
    <style><%@include file="../WEB-INF/css/Main.css"%></style>
    	<style>
        	* {
          	  font-family: Glacial;
       		}
    	</style>
<title>Reservation</title>
</head>

<body>
<c:import url="header.jsp" />

<main>

	<div class="main-container">
	
		<div class="main-top">
			<h1>Reservation Lookup</h1>
		</div>
		
		<div class="main-bottom">
			<div class="form">
			<form>
			<input type="hidden" name="action" value="ReservationDisplay"/>
				<label for="reservationID"><b>Reservation ID:</b></label>
				<input type="number" placeholder="Enter ID" name="reservationID" id="reservationID" min="1" required>
				<div class="button-container">
					<button type="submit" class="registerbtn">Search</button>
				</div>
			</form>
			</div>
		</div>
		
	</div>
	
</main>

<footer>
<jsp:include page="footer.jsp" />
</footer>

</body>

</html>