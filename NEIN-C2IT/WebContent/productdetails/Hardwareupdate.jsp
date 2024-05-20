<%@page import="java.sql.*"%>
<%@ page import = "java.util.ResourceBundle" %>

<%
String id1=request.getParameter("hid");
String name=request.getParameter("hname");

int i=0;
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");

try
{
	Connection conn = null;
	Class.forName(driver).newInstance();
	conn= DriverManager.getConnection(url+dbName,userName,password);
	Statement st=null,st1=null;
	ResultSet rs=null;
	/* String query = "select id from asset_type where item_name='"+num+"'";
	st = conn.createStatement();
	rs = st.executeQuery(query);
	while(rs.next())
	     {
	 	 id= rs.getString(1);
	     }
	System.out.println(id);
 */	
 st1=conn.createStatement();
	 i=st1.executeUpdate("update hardware_master set hardware_name='"+name+"' where id='"+id1+"'");
	 response.sendRedirect("DisplayHardware.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}%>

