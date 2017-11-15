<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="db.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 	<%
 	int sno=Integer.parseInt(request.getParameter("srno"));
 	//int srno=Integer.parseInt("sno");
 	String id1=(String)session.getAttribute("userId");
	int id2=Integer.parseInt(id1);								

	try
	{
		int i=0;
	           ps=con.prepareStatement("delete from report where rept_id=?");
				ps.setInt(1,sno);
				
				i=ps.executeUpdate();
				if(i!=0)
				{
					response.sendRedirect("report_doctor.jsp");
				}
				else
					System.out.println("Delete nhi hua");
				
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			 	%>

</body>
</html>