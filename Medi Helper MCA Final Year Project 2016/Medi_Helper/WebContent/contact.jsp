<%@page import="java.util.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
 <%@include file="db.jsp" %>
	   
 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%
 	Date date = new Date();
	 String dt= date.toString();

    String contact_name=request.getParameter("name");
	String contact_email=request.getParameter("email");
	String contact_message=request.getParameter("message");
	
	%>
	
	
	
	<% 
try
{
	
	ps=con.prepareStatement("insert into contact(contact_name, contact_email, contact_message, contact_createdone) values(?,?,?,?)");
    ps.setString(1, contact_name);
	ps.setString(2, contact_email);
	ps.setString(3, contact_message);
	ps.setString(4, dt);
	
	int i=0;
	i=ps.executeUpdate();
	if(i==0)
	{
		%>
		
		 <jsp:forward page="index.jsp"></jsp:forward>
	  
	   <%
	}
	else
	{
		 %>
		 
		 <jsp:forward page="index.jsp"></jsp:forward>
		 
		<% 
	}

}
catch(Exception e)
{
e.printStackTrace();
}

%>


</body>
</html>