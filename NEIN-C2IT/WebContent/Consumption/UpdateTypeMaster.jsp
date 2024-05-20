<%@page import="java.sql.*"%>
<%@page import="CON2.Connection2"%>
<%
String type_name=request.getParameter("type_name");
String id=request.getParameter("type_id");

int i=0;
try
{
	Connection conn = null;
	Connection2 dbConn = new Connection2();
	conn = dbConn.getConnection2();
	Statement st=null;
	ResultSet rs=null; 
		
     st=conn.createStatement();
	 i=st.executeUpdate("UPDATE `type_master` SET `type_name`='"+type_name+"' WHERE `type_id`='"+id+"'");
	 response.sendRedirect("DisplayTypeMaster.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}%>

