<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<%
String num=request.getParameter("id");

//int num=Integer.parseInt(ide);
String b_name=request.getParameter("m_b_name");
String b_no=request.getParameter("m_b_no");
String b_location=request.getParameter("m_b_location");
Connection conn=null;
Statement st=null;
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");
try
{
	

	Class.forName(driver).newInstance();
    conn = DriverManager.getConnection(url+dbName,userName,password); 

	st=conn.createStatement();
	st.executeUpdate("update branch_master_main set m_b_name='"+b_name+"',m_b_no='"+b_no+"',m_b_location='"+b_location+"' where id='"+num+"'");
	response.sendRedirect("DisplayHomeBranch.jsp");
}
catch (Exception e) {
	 System.out.println(e);
}

finally{
DbUtil.closeDBResources(null,st,conn);

}%>

