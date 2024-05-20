<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<%
String num=request.getParameter("id");

//int num=Integer.parseInt(ide);
String barcode_name=request.getParameter("barcode_name");
String barcode_detail=request.getParameter("barcode_detail");
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
	st.executeUpdate("update barcode_master set barcode_name='"+barcode_name+"',barcode_detail='"+barcode_detail+"',brLocation='"+bkLocation+"' where id='"+num+"'");
	response.sendRedirect("DisplayBarcode.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}finally{
	DbUtil.closeDBResources(null,st,conn);

	}	%>

