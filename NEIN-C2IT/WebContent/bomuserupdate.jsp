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
	st.executeUpdate("update nentrybom set idd='"+idb+"',Nname='"+Nnameb+"',Npwd='"+Npwdb+"',Naddr='"+Naddrb+"',Ncontact='"+Ncontactb+"',Npost='"+Npostb+"',NpostingCo='"+NpostingCo+"',Nmail='"+Nmail+"' where id='"+num+"'");
	response.sendRedirect("displaydelbom.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}%>

