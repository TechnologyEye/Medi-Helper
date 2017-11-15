<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@include file="db.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
  <% 
     HttpSession id=request.getSession();
  ResultSet rs=(ResultSet)id.getAttribute("email");
  
     String psw1=request.getParameter("new_pass"); 
     String psw2=request.getParameter("con_pass"); 
     
     if(psw1.equals(psw2))
     {
    	 String psw=psw1;
    	 ps=con.prepareStatement("update user set user_password=? where user_email=?");
    	ps.setString(1, psw);
    	ps.setString(2,rs.getString(5));
      	int i=ps.executeUpdate();
        if(i!=0)
        {
        	response.sendRedirect("index.jsp"); 
        }
        else
        {
        	response.sendRedirect("forget_pass.jsp");
        }
     }
     else
     {
    	 HttpSession s=request.getSession();
    	 s.setAttribute("not", "Please Enter Correct Password");
    	 response.sendRedirect("new_pass.jsp");
    	 
     }
  %>
</body>
</html>