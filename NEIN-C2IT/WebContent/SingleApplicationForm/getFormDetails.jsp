<%@ page import="java.sql.*"%> 
<%@page import="java.util.ResourceBundle"%> 

<%
String name=null,ro=null,ro1=null,desg=null;

Connection cn5 = null;
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");
Class.forName(driver).newInstance();
cn5 = DriverManager.getConnection(url+dbName,userName,password);
Statement stcsdb = cn5.createStatement();
Statement stcsout = cn5.createStatement();
	
boolean flag = false;
String s=request.getParameter("EMP_NO");  
String nexType="",newReq="",internetType="",reqForChange="";
int length = String.valueOf(s).length();
String buffer="<div id='resultFromAjax22' style='display:inline;'>";

if(length<=7){
if(s==null || s.trim().equals(""))
{  
out.print("Please enter id");  
}
else
{  
try
{

ResultSet rscsout = stcsout.executeQuery("select employee_code from neinapplicationform where Approval_sttatuss in ('Pending') and employee_code='"+s+"'");
while(rscsout.next()){
	flag=true;
}

ResultSet rscsout1 = stcsout.executeQuery("select emplCode from neinapplicationformmain where emplCode='"+s+"' and (emplreqFor like '%Email ID%' and emplreqFor like '%Domain Account%' and emplreqFor like '%Biometric / Access Card%' and emplreqFor like '%Shared Folder%' and emplreqFor like '%Internet Access / FTP Access%' and emplreqFor like '%NEWINS%' and emplreqFor like '%NExAS%' and emplreqFor like '%GS-NET%' and emplreqFor like '%Internal Application%' and emplreqFor like '%USB Access%' and emplreqFor like '%VPN Access%' and emplreqFor like '%HardDisk / PenDrive%' and emplreqFor like '%Any Other Asset%' and emplreqFor like '%NEx-GLOW%')");
while(rscsout1.next()){
	flag=true;
}

if(flag!=true){
ResultSet rscsdb = stcsdb.executeQuery("select * from neinapplicationform nein left OUTER join neinapplicationform_item nein_item on nein.applicationNo=nein_item.form2_no left outer join neinapplicationform_requestfor nein_for on nein.applicationNo=nein_for.app_no where Approval_sttatuss in ('Closed') and employee_code='"+s+"' and nein_item.presence='over' order by nein.form_id DESC LIMIT 0,1");
while(rscsdb.next()){
nexType = rscsdb.getString("nexasReqType")==null?"":rscsdb.getString("nexasReqType");
newReq = rscsdb.getString("newinsRequest")==null?"":rscsdb.getString("newinsRequest");
internetType = rscsdb.getString("internetReqType")==null?"":rscsdb.getString("internetReqType");
reqForChange = rscsdb.getString("requestFor_change")==null?"":rscsdb.getString("requestFor_change");
	
buffer = buffer + "<input type='text' id='r1' value='"+rscsdb.getString("scope_of_work")+"'>";
buffer = buffer + "<input type='text' id='r2' value='"+rscsdb.getString("emp_type")+"'>";
buffer = buffer + "<input type='text' id='r3' value='"+rscsdb.getString("emp_contract_type")+"'>";
buffer = buffer + "<input type='text' id='r4' value='"+rscsdb.getString("request_type")+"'>";
buffer = buffer + "<input type='text' id='r5' value='"+rscsdb.getString("requested_branch")+"'>";
buffer = buffer + "<input type='text' id='r6' value='"+rscsdb.getString("requestFor")+"'>";
buffer = buffer + "<input type='text' id='r7' value='"+rscsdb.getString("emailDomain")+"'>";
buffer = buffer + "<input type='text' id='r8' value='"+rscsdb.getString("group_name")+"'>";
buffer = buffer + "<input type='text' id='r9' value='"+rscsdb.getString("employeeType")+"'>";
buffer = buffer + "<input type='text' id='r10' value='"+rscsdb.getString("mailIDCreated")+"'>";
buffer = buffer + "<input type='text' id='r11' value='"+rscsdb.getString("reqMailID")+"'>";
buffer = buffer + "<input type='text' id='r12' value='"+rscsdb.getString("intuneAccessProvided")+"'>";
buffer = buffer + "<input type='text' id='r13' value='"+rscsdb.getString("mobIntune")+"'>";
buffer = buffer + "<input type='text' id='r14' value='"+rscsdb.getString("mobileNo")+"'>";
buffer = buffer + "<input type='text' id='r15' value='"+rscsdb.getString("imei1")+"'>";
buffer = buffer + "<input type='text' id='r16' value='"+rscsdb.getString("imei2")+"'>";
buffer = buffer + "<input type='text' id='r17' value='"+rscsdb.getString("emailRemarks")+"'>";
buffer = buffer + "<input type='text' id='r18' value='"+rscsdb.getString("domainRemarks")+"'>";
buffer = buffer + "<input type='text' id='r19' value='"+rscsdb.getString("bioRemarks")+"'>";
buffer = buffer + "<input type='text' id='r20' value='"+rscsdb.getString("folderRemarks")+"'>";
buffer = buffer + "<input type='text' id='r21' value='"+internetType+"'>";
buffer = buffer + "<input type='text' id='r22' value='"+rscsdb.getString("internetRemarks")+"'>";
buffer = buffer + "<input type='text' id='r23' value='"+rscsdb.getString("newinsBranchCode")+"'>";
buffer = buffer + "<input type='text' id='r24' value='"+rscsdb.getString("newinsOpCode")+"'>";
buffer = buffer + "<input type='text' id='r25' value='"+newReq+"'>";
buffer = buffer + "<input type='text' id='r26' value='"+rscsdb.getString("newinsRemarks")+"'>";
buffer = buffer + "<input type='text' id='r27' value='"+rscsdb.getString("nexasCompCode")+"'>";
buffer = buffer + "<input type='text' id='r28' value='"+rscsdb.getString("nexasCCName")+"'>";
buffer = buffer + "<input type='text' id='r29' value='"+rscsdb.getString("nexasCCCode")+"'>";
buffer = buffer + "<input type='text' id='r30' value='"+rscsdb.getString("nexasOPRange")+"'>";
buffer = buffer + "<input type='text' id='r31' value='"+nexType+"'>";
buffer = buffer + "<input type='text' id='r32' value='"+rscsdb.getString("nexasOptionalMenu")+"'>";
buffer = buffer + "<input type='text' id='r33' value='"+rscsdb.getString("nexasRemarks")+"'>";
buffer = buffer + "<input type='text' id='r34' value='"+rscsdb.getString("assignedGsnetBranch")+"'>";
buffer = buffer + "<input type='text' id='r35' value='"+rscsdb.getString("assignedGsnetDivName")+"'>";
buffer = buffer + "<input type='text' id='r36' value='"+rscsdb.getString("assignedGsnetPriDiv")+"'>";
buffer = buffer + "<input type='text' id='r37' value='"+rscsdb.getString("assignedGsnetUserRole")+"'>";
buffer = buffer + "<input type='text' id='r38' value='"+rscsdb.getString("gsnetRemarks")+"'>";
buffer = buffer + "<input type='text' id='r39' value='"+rscsdb.getString("internalApplication")+"'>";
buffer = buffer + "<input type='text' id='r40' value='"+rscsdb.getString("internalRemarks")+"'>";
buffer = buffer + "<input type='text' id='r41' value='"+rscsdb.getString("usbAccessFor")+"'>";
buffer = buffer + "<input type='text' id='r42' value='"+rscsdb.getString("usbDetails")+"'>";
buffer = buffer + "<input type='text' id='r43' value='"+rscsdb.getString("usbRemarks")+"'>";
buffer = buffer + "<input type='text' id='r44' value='"+rscsdb.getString("vpnDomainID")+"'>";
buffer = buffer + "<input type='text' id='r45' value='"+rscsdb.getString("vpnEmailID")+"'>";
buffer = buffer + "<input type='text' id='r46' value='"+rscsdb.getString("vpnMPLS")+"'>";
buffer = buffer + "<input type='text' id='r47' value='"+rscsdb.getString("hardPenRemarks")+"'>";
buffer = buffer + "<input type='text' id='r48' value='"+rscsdb.getString("otherAssetRemarks")+"'>";
buffer = buffer + "<input type='text' id='r49' value='"+rscsdb.getString("CompanyProvMobile")+"'>";
buffer = buffer + "<input type='text' id='r50' value='"+rscsdb.getString("makeAndModel")+"'>";
buffer = buffer + "<input type='text' id='r51' value='"+reqForChange+"'>";
buffer = buffer + "<input type='text' id='r52' value='"+rscsdb.getString("compProvSimCard")+"'>";
buffer = buffer + "<input type='text' id='r53' value='"+rscsdb.getString("compProvSimNumber")+"'>";
buffer = buffer + "<input type='text' id='r54' value='"+(rscsdb.getString("selBioBranches")==null?"":rscsdb.getString("selBioBranches"))+"'>";
buffer = buffer + "<input type='text' id='r55' value='"+(rscsdb.getString("glowProject")==null?"":rscsdb.getString("glowProject"))+"'>";
buffer = buffer + "<input type='text' id='r56' value='"+(rscsdb.getString("glowWarehouse")==null?"":rscsdb.getString("glowWarehouse"))+"'>";
buffer = buffer + "<input type='text' id='r57' value='"+(rscsdb.getString("glowRemarks")==null?"":rscsdb.getString("glowRemarks"))+"'>";
}
}

buffer=buffer+"</div>";

response.getWriter().print(buffer);
}catch(Exception e)
{   
System.out.println(e);
} 
finally
{
cn5.close();
}
}
}
%>  