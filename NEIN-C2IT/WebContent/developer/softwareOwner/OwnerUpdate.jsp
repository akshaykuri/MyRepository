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
String developer_name=request.getParameter("developer_name");
String remarks=request.getParameter("remarks");

Connection conn=null;
Statement st=null;
try
{
	Class.forName(driver).newInstance();
    conn = DriverManager.getConnection(url+dbName,userName,password); 

	st=conn.createStatement();
	st.executeUpdate("update software_owner_master set developer_name='"+developer_name+"',remarks='"+remarks+"' where id='"+num+"'");
	response.sendRedirect("DisplayOwner.jsp");
%>


<%} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			DbUtil.closeDBResources(null,st,conn);

			}%>