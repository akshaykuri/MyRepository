<%@ page import="java.sql.*" %> 
<%@page import="java.util.ResourceBundle"%>
<%
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");
String emp_no = request.getParameter("idemp_no").toString();
System.out.println(emp_no);
String data ="";
try{
	 Class.forName(driver).newInstance();
     Connection con = DriverManager.getConnection(url+dbName,userName,password); 
  Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select Nname from formuser_master where EMP_NO LIKE '%"+emp_no+"%'");
//ResultSet rs=st.executeQuery("select DeliveryPO_No from delivery_master where DeliveryPO_No = '"+name+"' AND DeliveryPO_No like 'NEIN/90%'");
//ResultSet rs=st.executeQuery("SELECT pordernon,mr_idpo FROM `delivery_master` , po WHERE DeliveryPO_No = '"+name+"' AND pordernon = DeliveryPO_No AND mr_idpo=MrId AND DeliveryPO_No like 'NEIN/90%'");
int count=0;
while(rs.next())
{
count++;
}

if(count>0)
{
data="Employee ID is already exist! \n Please click on forgot password to get the login details.";
}
else
{
data="New Employee Number";
}
out.println(data);
System.out.println(data);
}
catch (Exception e) {
System.out.println(e);
}
%>