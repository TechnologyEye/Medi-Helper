<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@include file="db.jsp"%>
<%
int sno=Integer.parseInt(request.getParameter("srno"));
	//int srno=Integer.parseInt("sno");
	HttpSession dr=request.getSession();
	String id1=(String)dr.getAttribute("userId");
int id2=Integer.parseInt(id1);								

try
{
	int i=0;
           ps=con.prepareStatement("update appointments set appt_status=2 where appt_id=?");
			ps.setInt(1,sno);
			
			i=ps.executeUpdate();
			if(i!=0)
			{
				response.sendRedirect("appointments_doctor.jsp");
			}
			else
				System.out.println("Delete nhi hua");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	%>    