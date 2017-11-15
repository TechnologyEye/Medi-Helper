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


	<%@include file="db.jsp"%>


	<%	
	 		
 		    String patient_name=request.getParameter("p_nm");
			int p_id=Integer.parseInt(patient_name);
	    	String report_name=request.getParameter("report_nm");
			String report_date=request.getParameter("report_dat");
			String report_start_time=request.getParameter("report_st_time");
			String report_end_time=request.getParameter("report_nd_time");
			String report_type=request.getParameter("report_typ");
			System.out.println(report_type);
  		    String blood_sugar=request.getParameter("blood_sug");
			String insulin=request.getParameter("ins");
 			String carb=request.getParameter("crb");
			String physical_activity=request.getParameter("physical_act");
			String notes=request.getParameter("note");
			
			
			
			HttpSession dr=request.getSession();
			String id1=(String)dr.getAttribute("userId");
			int id=Integer.parseInt(id1);
			
			
	%>

	<% 
try
{
	
	ps=con.prepareStatement("insert into report(rept_doctor_id,rept_user_id,rept_name,rept_type,rept_desc,rept_createdon,rept_endtime,rept_blood_sugar,rept_card,rept_physical_activity,insulin,rept_starttime)values(?,?,?,?,?,?,?,?,?,?,?,?)");
    ps.setInt(1, id);
	ps.setInt(2, p_id);
	ps.setString(3, report_name);
	ps.setString(6, report_date);
	ps.setString(12, report_start_time);
	ps.setString(7, report_end_time);
	ps.setString(4, report_type);
	ps.setString(11,insulin);
	ps.setString(9, carb);
	ps.setString(10, physical_activity);
	ps.setString(8, blood_sugar);
	ps.setString(5, notes);
	int i=0;
	i=ps.executeUpdate();
	if(i==0)
	{
		%>

	<jsp:forward page="report_doctor.jsp"></jsp:forward>

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