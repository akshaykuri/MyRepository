<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<%
String num=request.getParameter("id");

//int num=Integer.parseInt(ide);
String DESIGNATION=request.getParameter("DESIGNATION");
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
	 st=null;
	st=conn.createStatement();
	st.executeUpdate("update  prob_type_master_main set NAME='"+DESIGNATION+"' where id='"+num+"'");
	response.sendRedirect("DisplayTypes.jsp");
} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			DbUtil.closeDBResources(null,st,conn);

			}
%>

