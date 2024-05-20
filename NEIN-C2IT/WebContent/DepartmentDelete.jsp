<%@page import="CON2.DbUtil"%>
<%@ page import="java.sql.*" %>
<%@page import="java.util.ResourceBundle"%>
 <%
 //int id = Integer.parseInt(request.getParameter("id"));
 Connection con=null;
 Statement st=null;
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
     con = DriverManager.getConnection(url+dbName,userName,password); 
	  st=con.createStatement();           
	 int i=st.executeUpdate("delete from department_master where id="+id+"");           
	 response.sendRedirect("DisplayDepartment.jsp");} catch (SQLException ex) {
		    ex.printStackTrace();
	 }	


	 finally{
	 			DbUtil.closeDBResources(null,st,con);

	 			}
 %>