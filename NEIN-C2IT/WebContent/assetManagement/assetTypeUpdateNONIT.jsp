<%@page import="java.sql.*"%>
<%
String id1=request.getParameter("aid");
String num=request.getParameter("assetname");
//int num=Integer.parseInt(ide);
String conf=request.getParameter("config");
//String bkLocation=request.getParameter("bkLocation");
String confd = request.getParameter("configdig");
int i=0;
try
{
	Connection conn = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb","root", "");
	Statement st=null,st1=null;
	ResultSet rs=null;
	st1=conn.createStatement();
	i=st1.executeUpdate("update asset_type set item_name='"+num+"',item_desc='"+conf+"',it_nonit='"+confd+"' where id='"+id1+"'");
	response.sendRedirect("DisplayAsset.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}%>

