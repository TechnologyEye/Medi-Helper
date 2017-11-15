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
    String user_username=request.getParameter("name");
	String user_email=request.getParameter("email");
	String user_mobile=request.getParameter("cont");
	String user_address=request.getParameter("addres");
	

    HttpSession s=request.getSession();
	String id1=(String)s.getAttribute("userId");
	int id=Integer.parseInt(id1);
	
	%>
	 <%@include file="db.jsp" %>
	   
	<% 
try
{
	
	ps=con.prepareStatement("update user set user_username=?,user_email=?,user_mobile=?,user_address=? where user_id=?");
    
	ps.setString(1, user_username);
	ps.setString(2, user_email);
	ps.setString(3, user_mobile);
	ps.setString(4, user_address);
	ps.setInt(5, id);
	int i=0;
	i=ps.executeUpdate();
	if(i==0)
	{
		%>

	<jsp:forward page="profile_patient.jsp"></jsp:forward>

	<%
	}
	else
	{
		 %>

	<jsp:forward page="post_patient.jsp"></jsp:forward>

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