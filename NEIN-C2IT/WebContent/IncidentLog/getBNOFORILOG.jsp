<%@ page import="java.sql.*"%>  
<%
String name=null;
Connection conn = null;
String url = "jdbc:mysql://localhost:3306/";
String dbName = "csdb";
String driver = "com.mysql.jdbc.Driver";
String userName = "root"; 
String password = "";
String s=request.getParameter("id");  

int length = String.valueOf(s).length();
 
try
{  
Class.forName("com.mysql.jdbc.Driver").newInstance();  
conn = DriverManager.getConnection(url+dbName,userName,password);
Statement stmt = conn.createStatement();  

ResultSet rs = stmt.executeQuery("select distinct b_no from branch_master where b_name='"+s+"' ");
while(rs.next())
{
	out.println(rs.getString("b_no")+"|"+rs.getString("b_no")+"@");
}  

} catch(Exception e)
{   
System.out.println(e);
} 
finally
{
conn.close();
}
%>  