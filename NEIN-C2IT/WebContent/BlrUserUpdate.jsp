<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<%
String num=request.getParameter("id");

//int num=Integer.parseInt(ide);
String idb=request.getParameter("idd");
String Nnameb=request.getParameter("Nname");
String Npwdb=request.getParameter("Npwd");
String Naddrb=request.getParameter("Naddr");
String Ncontactb=request.getParameter("Ncontact");
String Npostb=request.getParameter("Npost");
String NpostingCo=request.getParameter("NpostingCo");
String Nmail=request.getParameter("Nmail");
Connection conn = null;Statement st=null;
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
	st.executeUpdate("update nentryblr set idd='"+idb+"',Nname='"+Nnameb+"',Npwd='"+Npwdb+"',Naddr='"+Naddrb+"',Ncontact='"+Ncontactb+"',Npost='"+Npostb+"',NpostingCo='"+NpostingCo+"',Nmail='"+Nmail+"' where id='"+num+"'");
	response.sendRedirect("DisplayDelBlr.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}finally{
			DbUtil.closeDBResources(null,st,conn);

			}%>

