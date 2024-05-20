<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<%
String num=request.getParameter("id");

//int num=Integer.parseInt(ide);
String EMP_NO=request.getParameter("EMP_NO");
String EMP_NAME=request.getParameter("EMP_NAME");
String DESIGNATION=request.getParameter("DESIGNATION");
String DESG_NO=request.getParameter("DESG_NO");
String DEPT_NAME=request.getParameter("DEPT_NAME");
String MAIL_ID=request.getParameter("MAIL_ID");
Connection conn=null;
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
	st.executeUpdate("update emp set EMP_NO='"+EMP_NO+"',EMP_NAME='"+EMP_NAME+"',DESIGNATION='"+DESIGNATION+"',DESG_NO='"+DESG_NO+"',DEPT_NAME='"+DEPT_NAME+"',MAIL_ID='"+MAIL_ID+"' where id='"+num+"'");
	response.sendRedirect("displayAuthorbom.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}finally{
			DbUtil.closeDBResources(null,st,conn);

			}%>

