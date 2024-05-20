<%@page import="java.sql.*"%>
<%@page import="CON2.Connection2" %>
<%
String id=request.getParameter("cid");
String ispname=request.getParameter("ispname");

int i=0;
try
{
		Connection conn = null;
		Connection2 dbConn = new Connection2();
		conn = dbConn.getConnection2(); 
		Statement st=null,st1=null;
		ResultSet rs=null;
	
        st1=conn.createStatement();
	    i=st1.executeUpdate("update isp_master set isp_name='"+ispname+"' where id='"+id+"'");
	    response.sendRedirect("DisplayIsp.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}%>

