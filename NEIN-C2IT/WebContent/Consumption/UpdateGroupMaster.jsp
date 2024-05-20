<%@page import="java.sql.*"%>
<%@page import="CON2.Connection2"%>
<%
String relationnumber=request.getParameter("relationnumber");
String group_name=request.getParameter("group_name");

int i=0;
try
{
	Connection conn = null;
	Connection2 dbConn = new Connection2();
	conn = dbConn.getConnection2();
	Statement st=null;
	ResultSet rs=null; 
		
     st=conn.createStatement();
	 i=st.executeUpdate("UPDATE `consumptionreportmaster` SET `group_name`='"+group_name+"' WHERE `relationnumber`='"+relationnumber+"'");
	 response.sendRedirect("DisplayConsumptionGroupMaster.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}%>

