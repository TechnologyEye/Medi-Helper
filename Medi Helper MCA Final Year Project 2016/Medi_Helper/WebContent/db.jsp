
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
Connection con=null;
PreparedStatement ps=null;
try
{
   Class.forName("com.mysql.jdbc.Driver");	
   con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ithemcwx_diabeties", "root", "root");
}
catch(Exception e)
{
	
	e.printStackTrace();

}

%>
