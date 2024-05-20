<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<%
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");

String num			=	request.getParameter("id");
String app_name		=	request.getParameter("app_name");
String app_desc		=	request.getParameter("app_desc");
String empNo		=	(String) session.getAttribute("EmpNo");
Connection conn=null;
Statement st=null;
try{
	Class.forName(driver).newInstance();
	conn = DriverManager.getConnection(url+dbName,userName,password);
	st=conn.createStatement();
	st.executeUpdate("update listofapplications set app_name='"+app_name+"',app_desc='"+app_desc+"',addedBy='"+empNo+"',addedOn=current_timestamp() where id='"+num+"'");
	response.sendRedirect("DisplayApps.jsp");
}catch(SQLException ex){
	ex.printStackTrace();
}finally{
	DbUtil.closeDBResources(null,st,conn);
}
%>