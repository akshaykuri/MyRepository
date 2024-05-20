<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<%
String id = request.getParameter("id");
Connection con =null;
Statement st=null;
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName 	= dbProperties.getString("csdb.username");
String password 	= dbProperties.getString("csdb.password");
String url 			= dbProperties.getString("csdb.url");
String driver 		= dbProperties.getString("csdb.driverName");
String dbName 		= dbProperties.getString("csdb.dbName");
String empNo		= (String) session.getAttribute("EmpNo");
try{
	Class.forName(driver).newInstance();
	con = DriverManager.getConnection(url+dbName,userName,password);
	st=con.createStatement();
	int i=st.executeUpdate("update listofapplications set deleteStatus='1',addedBy='"+empNo+"',addedOn=current_timestamp() where id="+id+"");
	response.sendRedirect("DisplayApps.jsp");
}catch(SQLException ex){
	ex.printStackTrace();
}finally{
	DbUtil.closeDBResources(null,st,con);
}
%>