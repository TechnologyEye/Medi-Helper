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
 <%@ include file="db.jsp" %>
  <% 
       int sno=Integer.parseInt(request.getParameter("srno"));
		   				
    //  HttpSession s1=request.getSession();
		String id1=(String)session.getAttribute("userId");
		int id2=Integer.parseInt(id1);								

	try {

	    ps = con.prepareStatement("select * from report where rept_id=?");	

	    ps.setInt(1, sno);				

		ResultSet rs = ps.executeQuery();
		 ResultSet rs3=null;
		if(rs.next())
		{
			do
			{
				ps=con.prepareStatement("select user_username from user where user_id=?");
				ps.setInt(1, rs.getInt(3));
				rs3=ps.executeQuery();
				rs3.next();	
				
			 }while(rs.next());	
		 }
	}
	catch (Exception ref) {
								ref.printStackTrace();
							}
		
	%>
						
</body>
</html>