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
String num=request.getParameter("id");

//int num=Integer.parseInt(ide);
String printer_name=request.getParameter("remarks");

Connection conn=null;
Statement st=null;
try
{
	Class.forName(driver).newInstance();
    conn = DriverManager.getConnection(url+dbName,userName,password); 

	st=conn.createStatement();
	st.executeUpdate("update availability set feedback='"+printer_name+"' where id='"+num+"'");
	response.sendRedirect("DisplayAvailability.jsp");
%>


<%} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			DbUtil.closeDBResources(null,st,conn);

			}%>