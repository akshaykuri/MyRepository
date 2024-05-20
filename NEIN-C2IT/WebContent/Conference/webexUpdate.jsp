<%@page import="java.sql.*"%>
<%@ page import = "java.util.ResourceBundle" %>
<%

String id=request.getParameter("id1");
String bookingno=request.getParameter("formno");
String name=request.getParameter("name");
String email=request.getParameter("email");
String type=request.getParameter("type");

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
	 i=st1.executeUpdate("update webex_meeting set name='"+name+"',email='"+email+"',type='"+type+"' where id='"+id+"'");
	 response.sendRedirect("Displaywebex.jsp?id="+bookingno);
}
catch(Exception e)
{
	System.out.println(e);
}%>

