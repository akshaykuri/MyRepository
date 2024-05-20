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
String printer_name=request.getParameter("printer_name");
String printer_detail=request.getParameter("printer_detail");
String bkLocation=request.getParameter("bkLocation");
Connection conn=null;
Statement st=null;
try
{
	 Class.forName(driver).newInstance();
     conn = DriverManager.getConnection(url+dbName,userName,password); 
    
	st=conn.createStatement();
	st.executeUpdate("update printer_master set printer_name='"+printer_name+"',printer_detail='"+printer_detail+"',bkLocation='"+bkLocation+"' where id='"+num+"'");
	response.sendRedirect("DisplayPrinter.jsp");
%>


<%} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			DbUtil.closeDBResources(null,st,conn);

			}%>