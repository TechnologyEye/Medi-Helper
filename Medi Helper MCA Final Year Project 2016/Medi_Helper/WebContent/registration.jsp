<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

 
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

    String user_username=request.getParameter("name");
	String user_password=request.getParameter("pass");
	String user_email=request.getParameter("email");
	String user_mobile=request.getParameter("phon");
	String user_address=request.getParameter("message");
	int user_type=Integer.parseInt(request.getParameter("user_ty"));
	String security_question=request.getParameter("security_que");
	String security_answer=request.getParameter("security_ans");
	%><%
	out.println(user_username);
	out.println(user_password);
	out.println(user_email);
	out.println(user_mobile);
	out.println(user_address);
	out.println(user_type);
	
	%>
	
	 <%@include file="db.jsp" %>
	   
	<% 
try
{
	
	ps=con.prepareStatement("insert into user(user_type, user_username, user_password, user_email, user_mobile, user_address,user_res_datetime,security_questions,security_answers) values(?,?,?,?,?,?,?,?)");
    ps.setInt(1, user_type);
	ps.setString(2, user_username);
	ps.setString(3, user_password);
	ps.setString(4, user_email);
	ps.setString(5, user_mobile);
	ps.setString(6, user_address);
	ps.setString(7, dt);
	ps.setString(8, security_question);
	ps.setString(9, security_answer);
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