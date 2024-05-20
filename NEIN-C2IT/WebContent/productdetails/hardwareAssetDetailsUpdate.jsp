<%@page import="java.sql.*"%>
<%@ page import = "java.util.ResourceBundle" %>
<%
String id=request.getParameter("id");

String AssteNo=request.getParameter("assetno");
String AssetType=request.getParameter("assettype");
String SerialNo=request.getParameter("sno");
String Model=request.getParameter("model");
String Brand=request.getParameter("brand");
String Config=request.getParameter("config");
int i=0;
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");

try
{
	Connection conn = null;
	Class.forName(driver).newInstance();
	conn= DriverManager.getConnection(url+dbName,userName,password);
	Statement st=null,st1=null;
	ResultSet rs=null;
	 st1=conn.createStatement();
    i=st1.executeUpdate("update hardware_details_multiple set Asset_type='"+AssetType+"',serial_no='"+SerialNo+"',brand='"+Brand+"',model='"+Model+"',configuration='"+Config+"' where hwp_id='"+id+"'");
	 
	
	 response.sendRedirect("DisplayHardwareAssetDetails.jsp?id="+AssteNo);
}
catch(Exception e)
{
	System.out.println(e);
}%>

