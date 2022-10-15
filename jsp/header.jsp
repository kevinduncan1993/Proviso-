<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <style><%@include file="../WEB-INF/css/header_footer.css"%></style>
    <style>
        * {
            font-family: Glacial;
        }
    </style>
    <title>header</title>
</head>
<body>
    <header>
    	<div class="header-content">
	    	<div class="header-left">
	    		<div class="logo">
	    			<a href="/Proviso?action=LandingPage">
	    				<img class='logo-picture' alt='logo' src="${pageContext.request.contextPath}/img/proviso_logo.png">
	    			</a>
	        	</div>
	    	</div>
			<div class="header-middle">
				<div class=header-nav>
					<ul>
	  					<li id="left"><a href="/Proviso?action=DateSelection" style="color: black;">Book Now</a></li>
						<li id="middle"><a href="/Proviso?action=locations" style="color: black;">Locations</a></li>
						<li id="right"><a href="/Proviso?action=ReservationLookup" style="color: black;">My Reservations</a></li>
					</ul>
				</div>
			</div>
			<div class="header-right">
				<div class='sign-in-nav'>
					<ul>
						<c:choose>
						<c:when test="${empty user}">
	  						<li id="li-left"><a href="/Proviso?action=LoginTest" id="left">Sign In</a></li>
							<li><a href="/Proviso?action=Register" id="right">Register</a></li>
						</c:when>
						<c:otherwise>
							<li id="li-left">
								<a href="/Proviso?action=LoyaltyPoints" id="left">
									Loyalty Points:&nbsp;<jsp:include page="TotalPoints.jsp" />
								</a>
							</li>
							<li><a href="/Proviso?action=logout" id="right">Sign Out</a></li>
						</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
    </header>
</body>
</html>