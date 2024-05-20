<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<%
String num=request.getParameter("id");
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");

//int num=Integer.parseInt(ide);
String backup_name=request.getParameter("backup_name");
String backup_detail=request.getParameter("backup_detail");
String bkLocation=request.getParameter("bkLocation");
String newsname=request.getParameter("sname");
Connection conn = null;
Statement st=null,st1=null;
try
{
	

	Class.forName(driver).newInstance();
    conn = DriverManager.getConnection(url+dbName,userName,password); 

	st=conn.createStatement();
	st1=conn.createStatement();
	st.executeUpdate("update servername set sname='"+backup_name+"',sdetail='"+backup_detail+"',bkLocation='"+bkLocation+"' where id='"+num+"'");
	
	st1.executeUpdate("update server_details_master set server_name='"+backup_name+"' where server_name='"+newsname+"'");

	response.sendRedirect("DisplayServer.jsp");
}
catch (Exception e) {
	 System.out.println(e);
}
finally{
	DbUtil.closeDBResources(null,st,conn);

	}	%>

