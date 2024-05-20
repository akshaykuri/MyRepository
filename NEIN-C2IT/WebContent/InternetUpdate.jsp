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
String internet_name=request.getParameter("internet_name");
String internet_add=request.getParameter("internet_add");
String bkLocation=request.getParameter("bkLocation");
//System.out.println("Location :"+bkLocation);
	Connection conn = null;Statement st=null;
try
{
	

	Class.forName(driver).newInstance();
    conn = DriverManager.getConnection(url+dbName,userName,password); 
	
	st=conn.createStatement();
	st.executeUpdate("update internet_master set internet_name='"+internet_name+"',internet_add='"+internet_add+"',bkLocation='"+bkLocation+"' where id='"+num+"'");
	response.sendRedirect("DisplayInternet.jsp");
%>       	<%
}
catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(null,st,conn);

	
	
  }
	%>

