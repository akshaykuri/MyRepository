<%@page import="java.sql.*"%>
<%@page import="CON2.Connection2"%>
<%
String mobile_network_name=request.getParameter("mobile_network_name");
String id=request.getParameter("mobile_network_id");

int i=0;
try
{
	Connection conn = null;
	Connection2 dbConn = new Connection2();
	conn = dbConn.getConnection2();
	Statement st=null;
	ResultSet rs=null; 
		
     st=conn.createStatement();
	 i=st.executeUpdate("UPDATE `mobile_network` SET `mobile_network_name`='"+mobile_network_name+"' WHERE `mobile_network_id`='"+id+"'");
	 response.sendRedirect("DisplayISPNetworkType.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}%>

