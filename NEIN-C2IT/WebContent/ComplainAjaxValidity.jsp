<%@ page import="java.sql.*" %> 
<%@page import="java.util.ResourceBundle"%>
<%
String name = request.getParameter("aabbcc").toString();
System.out.println("aabbcc value "+name);
String data ="";
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");
try{
	Class.forName(driver).newInstance();
    Connection con = DriverManager.getConnection(url+dbName,userName,password); 
    Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select complain_id from complain_master_item where complain_id = '"+name+"'");
int count=0;
while(rs.next())
{
count++;
}

if(count>0)
{
data="Valid complain Order Number!";
}
else
{
data="Invalid complain Order Number!";
}
out.println(data);
System.out.println(data);
}
catch (Exception e) {
System.out.println(e);
}
%>