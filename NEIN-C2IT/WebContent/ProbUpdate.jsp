<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<%
String num=request.getParameter("id");

//int num=Integer.parseInt(ide);
String p_type=request.getParameter("p_type");
String bkLocation=request.getParameter("bkLocation");
String department = request.getParameter("department");
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
    conn = DriverManager.getConnection(url+dbName,userName,password); 
	Statement st=null;
	st=conn.createStatement();
	st.executeUpdate("update prob_master set p_type='"+p_type+"',bkLocation='"+bkLocation+"',department='"+department+"' where id='"+num+"'");
	response.sendRedirect("DisplayProb.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}%>

