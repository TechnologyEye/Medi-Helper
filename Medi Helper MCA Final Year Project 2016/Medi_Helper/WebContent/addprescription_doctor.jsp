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
	    	String prescription_from_date=request.getParameter("f_dat");
			String prescription_to_date=request.getParameter("t_dat");
			String prescription_insulin=request.getParameter("ins");
			String prescription_tablet=request.getParameter("tab");
			String prescription_number_of_dose=request.getParameter("nod");
  		    String prescription_time=request.getParameter("t");
			String prescription_time1=request.getParameter("t1");
 			String prescription_time2=request.getParameter("t2");
			String prescription_time3=request.getParameter("t3");
			String prescription_time4=request.getParameter("t4");
			//String rept_doctor_id1=request.getParameter("rept_doctor_i");
			//System.out.println(rept_doctor_id1);
			//int rept_doctor_id=Integer.parseInt("rept_doctor_id1");
			
			
			
			HttpSession dr=request.getSession();
			String id1=(String)dr.getAttribute("userId");
			int id=Integer.parseInt(id1);
			
			//int rept_user_id=s.parseInt(getAttribute(userid));
 		
	%>

	<% 
try
{
	
	ps=con.prepareStatement("insert into prescription(prescription_from_date,prescription_to_date,prescription_insulin,prescription_tablet,prescription_number_of_close,prescription_time,prescription_patient_id,prescription_doctore_id,prescription_time1,prescription_time2,prescription_time3,prescription_time4)values(?,?,?,?,?,?,?,?,?,?,?,?)");
    ps.setString(1, prescription_from_date);
	ps.setString(2, prescription_to_date);
	ps.setString(3, prescription_insulin);
	ps.setString(4, prescription_tablet);
	ps.setString(5, prescription_number_of_dose);
	ps.setString(6, prescription_time);
	ps.setInt(7, p_id);
	ps.setInt(8, id);
	ps.setString(9, prescription_time1);
	ps.setString(10, prescription_time2);
	ps.setString(11, prescription_time3);
	ps.setString(12, prescription_time4);
	int i=0;
	i=ps.executeUpdate();
	if(i==0)
	{
		%>

	<jsp:forward page="prescription_doctor.jsp"></jsp:forward>

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