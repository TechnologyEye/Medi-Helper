<%@page import="java.sql.ResultSet"%>
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
	    String user_id=request.getParameter("u_id");
		String security_questions=request.getParameter("security_que");
		String security_answers=request.getParameter("security_ans");
		%>
		 
		<%
		try
		{
			ResultSet rs=null;
			ps=con.prepareStatement("select * from user where user_email=? and security_questions=? and security_answers=?");
			ps.setString(1, user_id);
			ps.setString(2, security_questions);
			ps.setString(3, security_answers);
		    rs=ps.executeQuery();
		    
		    if(rs.next())
		    {
		    	            
		                	HttpSession id=request.getSession();
		                	id.setAttribute("email",rs);
				    		
				    	 //  ResultSet data=(ResultSet) forPass.getAttribute("email_id");
				    	//System.out.println(rs.getString(5));
				    	
				    	    response.sendRedirect("new_pass.jsp");
				   
		    }
		    else 
		    {    
		    	HttpSession r=request.getSession();
	    		r.setAttribute("enter", "Please Enter the Right Answer..");
		    	response.sendRedirect("forget_pass.jsp");
		    	
		    }
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
 %>

</body>
</html>