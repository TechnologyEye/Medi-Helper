<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Medi_Helper</title>
</head>
<body>
               
  <%@include file="db1.jsp" %>
	
	<%
		  ResultSet rs=null;
		try
		{
		    ps1=con1.prepareStatement("select * from user");
			
		    rs=ps1.executeQuery();
		    if(rs.next()){
				 do
				 
		         {
  %>
			 
				<li><i class="fa fa-circle"><%=rs.getString(3)%>   
		         </i></li>
   <%			
       }				 
		         while(rs.next());
				  }		   
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		 
%>   

</body>
</html>