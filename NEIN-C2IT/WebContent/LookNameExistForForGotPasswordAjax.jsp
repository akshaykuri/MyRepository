<%@ page import="java.sql.*" %> 
<%@page import="java.util.ResourceBundle"%>
<%
String name = request.getParameter("name").toString();
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
     Connection con = DriverManager.getConnection(url+dbName,userName,password); 
   Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select Nmail from login where Nmail='"+name+"'");
//ResultSet rs=st.executeQuery("select DeliveryPO_No from delivery_master where DeliveryPO_No = '"+name+"' AND DeliveryPO_No like 'NEIN/90%'");
//ResultSet rs=st.executeQuery("SELECT pordernon,mr_idpo FROM `delivery_master` , po WHERE DeliveryPO_No = '"+name+"' AND pordernon = DeliveryPO_No AND mr_idpo=MrId AND DeliveryPO_No like 'NEIN/90%'");
int count=0;
while(rs.next())
{
count++;
}

if(count>0)
{
data="User Id Exists!";
}
else
{
data="User not exists";
}
out.println(data);
System.out.println(data);
}
catch (Exception e) {
System.out.println(e);
}
%>