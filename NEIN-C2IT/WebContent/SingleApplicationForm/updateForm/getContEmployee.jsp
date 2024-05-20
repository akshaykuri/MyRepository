<%@ page import="java.sql.*,java.util.ResourceBundle"%>
<%
Connection cn5 = null;
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username"),password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url"),driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");
Class.forName(driver).newInstance();
cn5 = DriverManager.getConnection(url+dbName,userName,password);
Statement stcsdb = cn5.createStatement(),stcsout = cn5.createStatement();
System.out.println("here");
String s=request.getParameter("EMP_NAME");
System.out.println("s=="+s);
try{
if(!s.equalsIgnoreCase("")){
ResultSet rscsdb = stcsdb.executeQuery("select distinct emplName from neinapplicationformmain where emplName like '%"+s+"%' and emplConType='Contract'");
while(rscsdb.next()){
%>
<li onClick="selectCountry('<%=rscsdb.getString("emplName")%>','<%=rscsdb.getString("emplName")%>');"><%=rscsdb.getString("emplName")%></li>
<%
}
}
}catch(Exception e){
System.out.println(e);
}finally{
cn5.close();
}
%>