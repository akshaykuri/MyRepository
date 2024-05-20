<%@page import="java.sql.*"%>
<%
String num=request.getParameter("id");

//int num=Integer.parseInt(ide);
String p_type=request.getParameter("sname");
try
{
	
	Connection conn = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb","root", "");
	Statement st=null;
	st=conn.createStatement();
	st.executeUpdate("update systemuserbackupswlist set sname='"+p_type+"' where id='"+num+"'");
	response.sendRedirect("softwarebackupdisp.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}%>

