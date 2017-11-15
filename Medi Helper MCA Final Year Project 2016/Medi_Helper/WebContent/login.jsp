<%@page import="java.sql.ResultSet"%>
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
	    String user_email=request.getParameter("email");
		String user_password=request.getParameter("pass");
		
		%>
		  <%@include file="db.jsp" %>
		<%
		try
		{
			
		    ps=con.prepareStatement("select user_type, user_id from user where user_email=? and user_password=?");
			ps.setString(1, user_email);
			ps.setString(2, user_password);
		    ResultSet rs=ps.executeQuery();
		  if(rs.next())
		  {
		   // do
		   // {
		    	if(rs.getInt(1)==1){
		        HttpSession s= request.getSession();   
		        s.setAttribute("email", user_email);
		        s.setAttribute("userId",rs.getString(2));
		        s.setAttribute("user_type", rs.getInt(1));
		        response.sendRedirect("post_patient.jsp");
		    }
		    	else{
		    		HttpSession dr=request.getSession();
		    		dr.setAttribute("email", user_email);
		    		dr.setAttribute("userId",rs.getString(2));
		    		//dr.setAttribute("did",rs.getString(2));
		    		response.sendRedirect("post_doctor.jsp");
		    	}
		    		
		    //	}
		  //  while(rs.next());
		  }
		    else 
		    {
				HttpSession invalidUser=request.getSession();
				invalidUser.setAttribute("Invalid","Invalid User Id or Password");
		    	response.sendRedirect("index.jsp");
		    	
		    }
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
 %>
	

</body>
</html>-