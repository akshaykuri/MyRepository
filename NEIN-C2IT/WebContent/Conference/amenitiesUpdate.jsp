<%@page import="java.sql.*"%>
<%@ page import = "java.util.ResourceBundle" %>
<%

String id=request.getParameter("aid");
String bookingno=request.getParameter("formno");
String item=request.getParameter("ament");
String quantity=request.getParameter("quantity");
String remarks=request.getParameter("remarks");

int i=0;
try
{
	Connection conn = null;
	
	ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
	String userName = dbProperties.getString("csdb.username");
	String password = dbProperties.getString("csdb.password");
	String url = dbProperties.getString("csdb.url");
	String driver = dbProperties.getString("csdb.driverName");
	String dbName = dbProperties.getString("csdb.dbName");

	
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
	 i=st1.executeUpdate("update amenities_add set items='"+item+"',quantity='"+quantity+"',remarks='"+remarks+"' where aid='"+id+"'");
	 response.sendRedirect("DisplayAmenities.jsp?id="+bookingno);
}
catch(Exception e)
{
	System.out.println(e);
}%>

