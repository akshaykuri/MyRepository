<%@ page import="java.sql.*" %>
<%@page import="java.util.ResourceBundle"%>
 <%
 //int id = Integer.parseInt(request.getParameter("id"));
 String id = request.getParameter("id");
 ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
	String userName = dbProperties.getString("csdb.username");
	String password = dbProperties.getString("csdb.password");
	String url = dbProperties.getString("csdb.url");
	String driver = dbProperties.getString("csdb.driverName");
	String dbName = dbProperties.getString("csdb.dbName");
 try
 {          
	 Class.forName(driver).newInstance();
     Connection con = DriverManager.getConnection(url+dbName,userName,password); 
	 Statement st=con.createStatement();           
	 int i=st.executeUpdate("delete from branch_master where id="+id+"");           
	 response.sendRedirect("DisplayBranch.jsp");}catch (Exception e){System.out.println(e);
 }
 %>