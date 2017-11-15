<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Medi_Helper</title>
</head>
<body>

	<%
	  Date date = new Date();
	 String dt= date.toString();
	
	
    String post_desc=request.getParameter("post");
	
    HttpSession dr=request.getSession();
	String id1=(String)dr.getAttribute("userId");
	int id=Integer.parseInt(id1);
	
	%>
	 <%@include file="db.jsp" %>
	   
	<% 
try
{
	
	ps=con.prepareStatement("insert into post (post_user_id, post_desc,post_create_datetime)values(?,?,?)");
	ps.setInt(1, id);
	ps.setString(2, post_desc);
	ps.setString(3, dt);

	int i=0;
	i=ps.executeUpdate();
	if(i==0)
	{
		%>

	<jsp:forward page="post_doctor.jsp"></jsp:forward>

	<%
	}
	else
	{
		 %>

	<jsp:forward page="post_doctor.jsp"></jsp:forward>

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