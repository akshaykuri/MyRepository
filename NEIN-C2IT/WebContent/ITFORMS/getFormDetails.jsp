<%@ page import="java.sql.*"%>
<%@ page import="java.util.ResourceBundle"%>
<%
String name=null,ro=null,ro1=null,desg=null;
Connection conn = null;
ResourceBundle dbPropertiesl = ResourceBundle.getBundle("csdb");
String userNamel = dbPropertiesl.getString("csdb.username");
String passwordl = dbPropertiesl.getString("csdb.password");
String urll = dbPropertiesl.getString("csdb.url");
String driverl = dbPropertiesl.getString("csdb.driverName");
String dbNamel = dbPropertiesl.getString("csdb.dbName");

boolean flag = false;
String s=request.getParameter("EMP_NO");
int length = String.valueOf(s).length();
String buffer="<div id='resultFromAjax22' style='display:none;'>";
if(length<=7){
if(s==null || s.trim().equals(""))
{
	out.print("Please enter id");  
}
else
{
try
{  
Class.forName(driverl).newInstance();
conn = DriverManager.getConnection(urll+dbNamel,userNamel,passwordl); 
Statement stmt = conn.createStatement();
Statement st66 = conn.createStatement();

ResultSet rs1 = stmt.executeQuery("select a.emp_code from form1_it_clearance a left outer join form1_it_clearance_item b on a.form1_no=b.form1_no where b.presence='now' and a.emp_code='"+s+"'");
while(rs1.next()){
	flag=true;
}

rs1 = stmt.executeQuery("select a.emp_code from form1_it_clearance a left outer join form1_it_clearance_item b on a.form1_no=b.form1_no where b.status in ('Approved','Pending') and a.emp_code='"+s+"'");
while(rs1.next()){
	flag=true;
}

out.println(flag);

if(flag!=true){
ResultSet rs = stmt.executeQuery("select ifnull(mailIDCreated,'') as mailIDCreated,ifnull(makeAndModel,'') as makeAndModel,ifnull(mobileNo,'') as mobileNo,ifnull(comProvimNumber,'') as comProvimNumber,ifnull(domainAccount,'') as domainAccount,ifnull(selBioBranches,emplreqBranch) as selBioBranches,ifnull(sharedAppRemarks,'') as sharedAppRemarks,ifnull(internetReqType,'') as internetReqType,ifnull(newinsOPAppCode,'') as newinsOPAppCode,ifnull(nexasID,'') as nexasID,ifnull(gsnetCode,'') as gsnetCode,ifnull(internalID,'') as internalID,ifnull(usbAccessFor,'')+' - '+ifnull(usbDetails,'') as usbDetails,ifnull(vpnFortiToken,'') as vpnFortiToken,ifnull(hardPenAppRemarks,'') as hardPenAppRemarks,ifnull(otherAssetAppRemarks,'') as otherAssetAppRemarks,ifnull(glowID,'') as glowID from neinapplicationformmain where emplCode='"+s+"'");
while(rs.next())
{
	buffer = buffer + "<input type='text' id='r1' value='"+rs.getString("mailIDCreated")+"'>";
	buffer = buffer + "<input type='text' id='r2' value='"+rs.getString("makeAndModel")+"'>";
	buffer = buffer + "<input type='text' id='r3' value='"+rs.getString("mobileNo")+"'>";
	buffer = buffer + "<input type='text' id='r4' value='"+rs.getString("comProvimNumber")+"'>";	
	buffer = buffer + "<input type='text' id='r5' value='"+rs.getString("domainAccount")+"'>";
	buffer = buffer + "<input type='text' id='r6' value='"+rs.getString("selBioBranches")+"'>";	
	buffer = buffer + "<input type='text' id='r7' value='"+rs.getString("sharedAppRemarks")+"'>";	
	buffer = buffer + "<input type='text' id='r8' value='"+rs.getString("internetReqType")+"'>";
	buffer = buffer + "<input type='text' id='r9' value='"+rs.getString("newinsOPAppCode")+"'>";
	buffer = buffer + "<input type='text' id='r10' value='"+rs.getString("nexasID")+"'>";
	buffer = buffer + "<input type='text' id='r11' value='"+rs.getString("gsnetCode")+"'>";
	buffer = buffer + "<input type='text' id='r12' value='"+rs.getString("internalID")+"'>";
	buffer = buffer + "<input type='text' id='r13' value='"+rs.getString("usbDetails")+"'>";
	buffer = buffer + "<input type='text' id='r14' value='"+rs.getString("vpnFortiToken")+"'>";	
	buffer = buffer + "<input type='text' id='r15' value='"+rs.getString("hardPenAppRemarks")+"'>";
	buffer = buffer + "<input type='text' id='r16' value='"+rs.getString("otherAssetAppRemarks")+"'>";
	buffer = buffer + "<input type='text' id='r17' value='"+rs.getString("glowID")+"'>";
}
}
buffer = buffer + "</div>";
response.getWriter().print(buffer);
}catch(Exception e)
{   
System.out.println(e);
} 
finally
{
conn.close();
}
}
}
%>  