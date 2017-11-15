<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
    String appt_doctor_id=request.getParameter("name");
	String appt_treatement_id=request.getParameter("email");
	String appt_booked_datetime=request.getParameter("cont");
	
  HttpSession s=request.getSession();
	String id1=(String)s.getAttribute("userId");
	int id=Integer.parseInt(id1);
%>
 <%@include file="db.jsp"%>
<%
	try
{
	
	ps=con.prepareStatement("update appointments set appt_doctor_id=?,appt_treatement_id=?,appt_booked_datetime=? user_id=?");
    
	    ps.setString(1, appt_doctor_id);
		ps.setString(2, appt_treatement_id);
		ps.setString(3, appt_booked_datetime);

		int i = 0;
		i = ps.executeUpdate();
		if (i == 0) {
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



