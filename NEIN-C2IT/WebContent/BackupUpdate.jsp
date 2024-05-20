<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<%
String num=request.getParameter("id");

//int num=Integer.parseInt(ide);
String backup_name=request.getParameter("backup_name");
String backup_detail=request.getParameter("backup_detail");
String bkLocation=request.getParameter("bkLocation");
Connection conn = null;
Statement st=null;
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");

try
{
	

	Class.forName(driver).newInstance();
    conn = DriverManager.getConnection(url+dbName,userName,password); 
  
	st=conn.createStatement();
	st.executeUpdate("update backup_master set backup_name='"+backup_name+"',backup_detail='"+backup_detail+"',bkLocation='"+bkLocation+"' where id='"+num+"'");
	response.sendRedirect("DisplayBackup.jsp");
}
catch (Exception e) {
	 System.out.println(e);
}
finally{
	DbUtil.closeDBResources(null,st,conn);

	}	%>

