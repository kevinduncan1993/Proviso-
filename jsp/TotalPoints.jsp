<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
try
{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection(pageContext.getServletContext().getInitParameter("dbURL"),pageContext.getServletContext().getInitParameter("dbUser"),pageContext.getServletContext().getInitParameter("dbPass"));     
	Statement st=con.createStatement();
	String strQuery = "select SUM(earned_points) from reservations inner join customers on reservations.customer_id = customers.customer_id where customers.email = '";
	strQuery += request.getSession().getAttribute("user");
	strQuery += "' AND reservations.check_out > DATE_ADD(CURDATE(),INTERVAL- 1 YEAR) AND reservations.check_out < CURDATE()";
	System.out.println(strQuery);
	ResultSet rs = st.executeQuery(strQuery);
	
					
	int countPoints;
		while(rs.next()){
			countPoints = rs.getInt(1);
			out.print(countPoints);
		} 
}
catch (Exception e){
	e.printStackTrace();
}
%>