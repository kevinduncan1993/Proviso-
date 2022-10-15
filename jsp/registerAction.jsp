<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dataManager" scope="application" class="model.DataManager"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		boolean success = dataManager.insertCustomer(request.getParameter("firstname"), request.getParameter("lastname"), request.getParameter("email"), request.getParameter("psw"), request.getParameter("phone"));
		if (success) {
			session.setAttribute("user",request.getParameter("email"));}
	%>
	
	
	<c:choose>
		<c:when test="${empty user}">
	  		<jsp:forward page="/jsp/Register.jsp"></jsp:forward>				
		</c:when>
		<c:otherwise>
			<jsp:forward page="/jsp/LandingPage.jsp"></jsp:forward>			
		</c:otherwise>
		</c:choose>

</body>
</html>