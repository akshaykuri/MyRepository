<%@page import="java.sql.*"%>
<%
String id1=request.getParameter("aid");
String num=request.getParameter("assetname");

int i=0;
try
{
	Connection conn = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb","root", "");
	Statement st=null,st1=null;
	ResultSet rs=null;
	st1=conn.createStatement();
	i=st1.executeUpdate("update datacard_type set type='"+num+"' where id='"+id1+"'");
	response.sendRedirect("DisplayDCType.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}%>

