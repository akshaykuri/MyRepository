<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<%
String num=request.getParameter("id");
Connection conn=null;
Statement st=null;
//int num=Integer.parseInt(ide);
String fax_name=request.getParameter("fax_name");
String fax_detail=request.getParameter("fax_detail");
String bkLocation=request.getParameter("bkLocation");
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");
try
{
	
	 conn = null;
	 Class.forName(driver).newInstance();
     conn = DriverManager.getConnection(url+dbName,userName,password); 
	 st=null;
	st=conn.createStatement();
	st.executeUpdate("update fax_master set fax_name='"+fax_name+"',fax_detail='"+fax_detail+"',fxLocation='"+bkLocation+"' where id='"+num+"'");
	response.sendRedirect("DisplayFax.jsp");

} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			DbUtil.closeDBResources(null,st,conn);

			}%>

