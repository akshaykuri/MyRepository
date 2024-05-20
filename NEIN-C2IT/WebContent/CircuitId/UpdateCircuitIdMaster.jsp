<%@page import="java.sql.*"%>
<%@ page import="CON2.Connection2" %>

<%
String cid=request.getParameter("cid");
String circuitId=request.getParameter("circuitId");

Connection conn = null;
Connection2 dbConn = new Connection2();
conn = dbConn.getConnection2();

int i=0;
try
{
	
	 
	Statement st=null,st1=null;
	ResultSet rs=null;
	
 st1=conn.createStatement();
	 i=st1.executeUpdate("update circuitidmaster set circuit_Id='"+circuitId+"' where c_id='"+cid+"'");
	 response.sendRedirect("DisplayCircuitid.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}%>

