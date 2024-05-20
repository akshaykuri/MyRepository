<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*" %>
<%@page import = "java.io.*" %>
<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%@ page import = "java.util.ResourceBundle" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<%
response.setContentType("text/html;charset=UTF-8");

String assetno=request.getParameter("assetno");

 int i=0;
 
 Connection con = null;
 ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
 String userName = dbProperties.getString("csdb.username");
 String password = dbProperties.getString("csdb.password");
 String url = dbProperties.getString("csdb.url");
 String driver = dbProperties.getString("csdb.driverName");
 String dbName = dbProperties.getString("csdb.dbName");

 Statement st=null,st1=null;
 String msg=null;
 ResultSet rs=null,rs1=null;

 PreparedStatement prds=null;
 //String new_id = null;
Class.forName(driver).newInstance();
con= DriverManager.getConnection(url+dbName,userName,password);
	//String query = "select max(id),asset_code from asset_type";
	//st = con.createStatement();
	//rs = st.executeQuery(query);
	int id=0;
	
	String query1 = "select * from hardware_details where Asset_no='"+assetno+"' AND status='Active'";
	st1 = con.createStatement();
	rs1 = st1.executeQuery(query1);
 if(rs1.next())
     {
 	msg = " ASSET - \b ENTERED - \b IS - \b ALLREADY - \b EXITS ";
		response.sendRedirect("HardwareCreation.jsp?msg=" +msg);
		
     }
 else
 {
	 response.sendRedirect("Hardware.jsp?assetno=" +assetno);
 }
 
%>
</body>
</html>  
