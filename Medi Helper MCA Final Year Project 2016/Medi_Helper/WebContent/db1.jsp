<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%
 Connection con1=null;
 PreparedStatement ps1=null;
 try
 {
    Class.forName("com.mysql.jdbc.Driver");	
    con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/ithemcwx_diabeties", "root", "root");
 }
 catch(Exception e)
 {
 	
 	e.printStackTrace();

 }

%>
    