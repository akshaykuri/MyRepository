<%@ page import="java.sql.*" %> 
<%@page import="java.util.ResourceBundle"%>
<%
String name = request.getParameter("EMP_NO").toString();
System.out.println(name);
String data ="";
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");
try{
	 Class.forName(driver).newInstance();
  Connection  con = DriverManager.getConnection(url+dbName,userName,password); 
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select EMP_NO from emp where EMP_NO = '"+name+"'");
int count=0;
while(rs.next())
{
count++;
}

if(count>0)
{
data="Duplicate EMP NO!";
}
else
{
data="";
}
out.println(data);
System.out.println(data);
}
catch (Exception e) {
System.out.println(e);
}
%>