<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<%
String num=request.getParameter("id1");
System.out.println("Group name :"+num);
//int num=Integer.parseInt(ide);
String gname=request.getParameter("gname");
System.out.println("Group name :"+gname);
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
	 st=null;
	st=conn.createStatement();
	st.executeUpdate("update groupmaster set groupName='"+gname+"' where id='"+num+"'");
	response.sendRedirect("groupmasterDisp.jsp");
} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			DbUtil.closeDBResources(null,st,conn);

			}
%>

