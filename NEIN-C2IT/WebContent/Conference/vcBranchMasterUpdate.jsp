<%@page import="java.sql.*"%>
<%@ page import = "java.util.ResourceBundle" %>
<%

String id=request.getParameter("id");
String bid=request.getParameter("bid");
String bname=request.getParameter("bname");

System.out.println("bid-----"+bid);
System.out.println("bname-----"+bname);

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
	 i=st1.executeUpdate("update vc_branchmaster set branch_name='"+bname+"',branch_id='"+bid+"' where id='"+id+"'");
	 response.sendRedirect("DisplayvcBranchMaster.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}%>

