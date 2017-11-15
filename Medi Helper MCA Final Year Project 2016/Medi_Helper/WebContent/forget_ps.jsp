<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file=db.jsp %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h3>your password is</h3>
 <%

 String user_username=request.getParameter("u_nm");
ResultSet rs2 =null;
try{
	
	 ps = con.prepareStatement("select user_passsword from user where user_username=?");	

	    ps.setString(1, user_username);				

		 rs2 = ps.executeQuery();

}
catch(Exception e){
	
	e.printStackTrace();
}
if(rs2.next())
{
out.print(rs2.getString(4));

}  
 %>
 
</body>
</html>