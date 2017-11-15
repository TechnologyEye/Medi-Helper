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
		    String treatements_name=request.getParameter("treatment_nm");
		   	int treat_id=Integer.parseInt(treatements_name);
			String appointment_date=request.getParameter("date");
			String appointment_notes=request.getParameter("note");
			//String rept_doctor_id1=request.getParameter("rept_doctor_i");
			//System.out.println(rept_doctor_id1);
			//int rept_doctor_id=Integer.parseInt("rept_doctor_id1");
			//String treat_id1=request.getParameter("treat_i");
			
			HttpSession dr=request.getSession();
			String id1=(String)dr.getAttribute("userId");
			int id=Integer.parseInt(id1);
			//int rept_user_id=s.parseInt(getAttribute(userid));
			//out.println(id);
		//	out.println(p_id);
			//out.println(treat_id);
		//	out.println(appointment_date);
			//out.println(appointment_notes);
 		
	%>

	<% 
try
{
	
	ps=con.prepareStatement("insert into appointments(appt_doctor_id,appt_patient_id,appt_treatement_id,appt_booked_datetime,appt_notes)values(?,?,?,?,?)");
    ps.setInt(1, id);
	ps.setInt(2, p_id);
	ps.setInt(3, treat_id);
	ps.setString(4, appointment_date);
	ps.setString(5, appointment_notes);
	
	int i=0;
	i=ps.executeUpdate();
	if(i==0)
	{
		%>

	<jsp:forward page="appointments_doctor.jsp"></jsp:forward>

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