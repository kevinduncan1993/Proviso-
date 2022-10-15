<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--Use the dataManager set up by the servlet. Use this next line on any page that uses DataManager --%>
<jsp:useBean id="dataManager" scope="application" class="model.DataManager"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--This page will insert a new hotel to hotels. Use select * from hotels to view the table and verify that it worked. --%>
	<%
		dataManager.insertHotel("Name", "test", "test", "NE", "test", "5155551234", 1, 1, 1, 1);
	%>
</body>
</html>