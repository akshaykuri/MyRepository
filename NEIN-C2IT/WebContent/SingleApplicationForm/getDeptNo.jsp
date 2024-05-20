<%@page import="java.sql.*,java.util.ResourceBundle"%> 
<%
Connection cn5 = null;
ResourceBundle dbProperties = ResourceBundle.getBundle("leavemanagement");
String userName = dbProperties.getString("leavemanagement.username");
String password = dbProperties.getString("leavemanagement.password");
String url = dbProperties.getString("leavemanagement.url");
String driver = dbProperties.getString("leavemanagement.driverName");
String dbName = dbProperties.getString("leavemanagement.dbName");
Class.forName(driver).newInstance();
cn5 = DriverManager.getConnection(url+dbName,userName,password);
Statement stcsdb = cn5.createStatement();
Statement stcsout = cn5.createStatement();
String s=request.getParameter("depcode").trim();
System.out.println("s====>"+s);
String buffer="<div id='resultFromAjax2' style='display:inline;'>";
try{
ResultSet rscsdb = stcsdb.executeQuery("select distinct department_id from department where department_name like '%"+s+"%'");
while(rscsdb.next()){
buffer = buffer + "<input type='text' id='d1' value='"+rscsdb.getString("department_id")+"'>";
}
buffer=buffer+"</div>";
response.getWriter().print(buffer);
}catch(Exception e){
System.out.println(e);
}
finally{
cn5.close();
}
%>  