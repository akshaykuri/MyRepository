<%@page import="java.sql.*"%>
<%@page import="CON2.Connection2" %>
<%
String cid=request.getParameter("cid");
String serviceType=request.getParameter("serviceType");

int i=0;
try
{
	Connection conn = null;
	Connection2 dbConn = new Connection2();
	conn = dbConn.getConnection2(); 
	Statement st=null,st1=null;
	ResultSet rs=null;
	
     st1=conn.createStatement();
	 i=st1.executeUpdate("update servicetype_master set serviceType='"+serviceType+"' where id='"+cid+"'");
	 response.sendRedirect("DisplayServiceType.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}%>

