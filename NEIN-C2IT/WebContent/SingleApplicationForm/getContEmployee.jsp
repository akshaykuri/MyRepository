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
boolean flag = false;
String s=request.getParameter("EMP_NO");
try{
ResultSet rscsout = stcsout.executeQuery("select employee_code from neinapplicationform where Approval_sttatuss in ('Pending') and full_name like '%"+s+"%' and emp_contract_type='Contract'");
while(rscsout.next()){
	flag=true;
}
ResultSet rscsout1 = stcsout.executeQuery("select emplCode from neinapplicationformmain where emplName like '%"+s+"%' and (emplreqFor like '%Email ID%' and emplreqFor like '%Domain Account%' and emplreqFor like '%Biometric / Access Card%' and emplreqFor like '%Shared Folder%' and emplreqFor like '%Internet Access / FTP Access%' and emplreqFor like '%NEWINS%' and emplreqFor like '%NExAS%' and emplreqFor like '%GS-NET%' and emplreqFor like '%Internal Application%' and emplreqFor like '%USB Access%' and emplreqFor like '%VPN Access%' and emplreqFor like '%HardDisk / PenDrive%' and emplreqFor like '%Any Other Asset%' and emplreqFor like '%NEx-GLOW%') and emplConType='Contract'");
while(rscsout1.next()){
	flag=true;
}

if(flag==false){
if(!s.equalsIgnoreCase("")){
	System.out.println("s====>"+s);
ResultSet rscsdb = stcsdb.executeQuery("select distinct full_name from neinapplicationform where full_name like '%"+s+"%' and emp_contract_type='Contract' ");
while(rscsdb.next()){
%>
<li onClick="selectCountry('<%=rscsdb.getString("full_name")%>','<%=rscsdb.getString("full_name")%>');getFormDetails('<%=rscsdb.getString("full_name")%>')"><%=rscsdb.getString("full_name")%></li>
<%
}
}
}
}catch(Exception e){
System.out.println(e);
}finally{
cn5.close();
}
%>