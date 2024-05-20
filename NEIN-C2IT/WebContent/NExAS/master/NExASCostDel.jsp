<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="banner.jsp" %>
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
 Connection con=null;
 Statement st=null;
 ResultSet rs=null;
 String msg="";
 try
     {          
	 Class.forName(driver).newInstance();
     con = DriverManager.getConnection(url+dbName,userName,password);        
	 st=con.createStatement();  
	 int i=st.executeUpdate("delete from nexascostmaster where costname='"+id+"'");           
	 response.sendRedirect("costCodeDisp.jsp?msg=1");}catch (Exception e){System.out.println(e);
     }
	 finally{
			//DbUtil.closeDBResources(rs,st,con);
       	    }
 %>