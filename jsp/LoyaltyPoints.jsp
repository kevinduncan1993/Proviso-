<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ page import="java.sql.*" %>
<jsp:useBean id="dataManager" scope="application" class="model.DataManager"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <style><%@include file="../WEB-INF/css/LoyaltyPoints.css"%></style>
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
	<table class="loyalty_top">
		<caption>
			<h1>Customer Loyalty Points</h1>
		</caption>
		<colspan>
			<col span="1" style="width: 20%;">
			<col span="1" style="width: 20%;">
			<col span="1" style="width: 30%;">
			<col span="1" style="width: 20%;">
		</colspan>
			
		<tr>
			<td></td>
			<td id="badge"><a href="/Proviso?action=RewardsProgram"><jsp:include page="LoyaltyTier.jsp" /></a></td>
			<td><h2>CONGRATULATIONS!<br/>You've earned <jsp:include page="TotalPoints.jsp" /> points!</h2></td>
			<td></td>
		</tr>
	</table>
	
	<!-- 
		SQL table creation derived from source:
		https://www.codejava.net/java-ee/jsp/how-to-list-records-in-a-database-table-using-jsp-and-jstl 
	-->
	<sql:setDataSource
		var="myDS"
		driver="com.mysql.jdbc.Driver"
		url="${initParam['dbURL']}"
		user="${initParam['dbUser']}" password="${initParam['dbPass']}"
	/>
	<sql:query var="rewardsSummary" dataSource="${myDS}">
		SELECT reservations.reservation_id, reservations.check_in, reservations.check_out, hotels.name, reservations.earned_points
		FROM reservations
		INNER JOIN hotels ON reservations.hotel_id = hotels.hotel_id
		inner join customers on reservations.customer_id = customers.customer_id
		WHERE customers.email = '${sessionScope['user']}'
		AND reservations.check_out > DATE_ADD(CURDATE(),INTERVAL- 1 YEAR) AND reservations.check_out < CURDATE();
	</sql:query>
	
	<table class="rewards">
		<caption>RESERVATION HISTORY</caption>
		<colgroup>
        	<col span="1" style="width: 15%;">
        	<col span="1" style="width: 15%;">
        	<col span="1" style="width: 15%;">
        	<col span="1" style="width: 40%;">
        	<col span="1" style="width: 15%;">
      </colgroup>
		<tr>
			<th>ReservationID</th>
			<th>Check In Date</th>
			<th>Check Out Date</th>
			<th>Location</th>
			<th>Points Earned</th>
		</tr>
		<c:forEach var="res" items="${rewardsSummary.rows}">
			<tr class="data">
				<td class="data"><c:out value="${res.reservation_id}" /></td>
				<td class="data"><c:out value="${res.check_in}" /></td>
				<td class="data"><c:out value="${res.check_out}" /></td>
				<td class="data"><c:out value="${res.name}" /></td>
				<td class="data"><c:out value="${res.earned_points}" /></td>
			</tr>	
		</c:forEach>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td class="bottom" id="total">Total:&emsp;&emsp;</td>
			<td class="bottom" id="sum"><jsp:include page="TotalPoints.jsp" /></td>
		</tr>	
	</table>
</main>
<footer>
<jsp:include page="footer.jsp" />
</footer>
</body>
</html>