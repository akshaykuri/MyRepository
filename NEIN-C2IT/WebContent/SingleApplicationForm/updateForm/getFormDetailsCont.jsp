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
 
try
{
if(flag!=true){
ResultSet rscsdb = stcsdb.executeQuery("select * from neinapplicationformmain where emplName='"+s+"'");
while(rscsdb.next()){
nexType = rscsdb.getString("nexasReqType")==null?"":rscsdb.getString("nexasReqType");
newReq = rscsdb.getString("newinsRequest")==null?"":rscsdb.getString("newinsRequest");
internetType = rscsdb.getString("internetReqType")==null?"":rscsdb.getString("internetReqType");
reqForChange = rscsdb.getString("emplreqFor")==null?"":rscsdb.getString("emplreqFor");

buffer = buffer + "<input type='text' id='r97' value='"+rscsdb.getString("emplBranch")+"'>";
buffer = buffer + "<input type='text' id='r98' value='"+rscsdb.getString("emplDept")+"'>";
buffer = buffer + "<input type='text' id='r99' value='"+rscsdb.getString("emplDesg")+"'>";
buffer = buffer + "<input type='text' id='r100' value='"+rscsdb.getString("emplRO")+"'>";

buffer = buffer + "<input type='text' id='r1' value='"+rscsdb.getString("emplSOW")+"'>";
buffer = buffer + "<input type='text' id='r2' value='"+rscsdb.getString("emplType")+"'>";
buffer = buffer + "<input type='text' id='r3' value='"+rscsdb.getString("emplConType")+"'>";
buffer = buffer + "<input type='text' id='r4' value='Change'>";
buffer = buffer + "<input type='text' id='r5' value='"+rscsdb.getString("emplreqBranch")+"'>";
buffer = buffer + "<input type='text' id='r6' value='"+rscsdb.getString("emplreqFor")+"'>";
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

buffer = buffer + "<input type='text' id='r52' value='"+rscsdb.getString("domainAccount")+"'>";
buffer = buffer + "<input type='text' id='r53' value='"+rscsdb.getString("domainPassword")+"'>";
buffer = buffer + "<input type='text' id='r54' value='"+rscsdb.getString("domainAppRemarks")+"'>";
buffer = buffer + "<input type='text' id='r55' value='"+rscsdb.getString("bioAppRemarks")+"'>";
buffer = buffer + "<input type='text' id='r56' value='"+rscsdb.getString("sharedAppRemarks")+"'>";
buffer = buffer + "<input type='text' id='r57' value='"+rscsdb.getString("internetAPPRemarks")+"'>";
buffer = buffer + "<input type='text' id='r58' value='"+rscsdb.getString("newinsOPAppCode")+"'>";
buffer = buffer + "<input type='text' id='r59' value='"+rscsdb.getString("newinsPassword")+"'>";
buffer = buffer + "<input type='text' id='r60' value='"+rscsdb.getString("newinsLevel")+"'>";
buffer = buffer + "<input type='text' id='r61' value='"+rscsdb.getString("newinsGroup")+"'>";
buffer = buffer + "<input type='text' id='r62' value='"+rscsdb.getString("newinsAccessedBranches")+"'>";
buffer = buffer + "<input type='text' id='r63' value='"+rscsdb.getString("newinProgBlocked")+"'>";
buffer = buffer + "<input type='text' id='r64' value='"+rscsdb.getString("newinProgAllowed")+"'>";
buffer = buffer + "<input type='text' id='r65' value='"+rscsdb.getString("newinsAppRemarks")+"'>";
buffer = buffer + "<input type='text' id='r66' value='"+rscsdb.getString("nexasID")+"'>";
buffer = buffer + "<input type='text' id='r67' value='"+rscsdb.getString("nexasPassword")+"'>";
buffer = buffer + "<input type='text' id='r68' value='"+rscsdb.getString("nexasAppRemarks")+"'>";
buffer = buffer + "<input type='text' id='r69' value='"+rscsdb.getString("gsnetCode")+"'>";
buffer = buffer + "<input type='text' id='r70' value='"+rscsdb.getString("gsnetPassword")+"'>";
buffer = buffer + "<input type='text' id='r71' value='"+rscsdb.getString("assignedGsnetBranch")+"'>";
buffer = buffer + "<input type='text' id='r72' value='"+rscsdb.getString("assignedGsnetDivName")+"'>";
buffer = buffer + "<input type='text' id='r73' value='"+rscsdb.getString("assignedGsnetPriDiv")+"'>";
buffer = buffer + "<input type='text' id='r74' value='"+rscsdb.getString("assignedGsnetUserRole")+"'>";
buffer = buffer + "<input type='text' id='r75' value='"+rscsdb.getString("gsnetAppRemarks")+"'>";
buffer = buffer + "<input type='text' id='r76' value='"+rscsdb.getString("internalID")+"'>";
buffer = buffer + "<input type='text' id='r77' value='"+rscsdb.getString("internalPassword")+"'>";
buffer = buffer + "<input type='text' id='r78' value='"+rscsdb.getString("internalAppRemarks")+"'>";
buffer = buffer + "<input type='text' id='r79' value='"+rscsdb.getString("usbAppRemarks")+"'>";
buffer = buffer + "<input type='text' id='r80' value='"+rscsdb.getString("vpnFortiToken")+"'>";
buffer = buffer + "<input type='text' id='r81' value='"+rscsdb.getString("hardPenAppRemarks")+"'>";
buffer = buffer + "<input type='text' id='r82' value='"+rscsdb.getString("otherAssetAppRemarks")+"'>";
buffer = buffer + "<input type='text' id='r83' value='"+rscsdb.getString("emplReqBy")+"'>";
buffer = buffer + "<input type='text' id='r84' value='"+rscsdb.getString("comProvSim")+"'>";
buffer = buffer + "<input type='text' id='r85' value='"+rscsdb.getString("comProvimNumber")+"'>";
buffer = buffer + "<input type='text' id='r86' value='"+rscsdb.getString("emailPassword")+"'>";
buffer = buffer + "<input type='text' id='r87' value='"+rscsdb.getString("emailAppRemarks")+"'>";
buffer = buffer + "<input type='text' id='r88' value='"+rscsdb.getString("passReset")+"'>";
buffer = buffer + "<input type='text' id='r89' value='"+rscsdb.getString("changeBio")+"'>";
buffer = buffer + "<input type='text' id='r90' value='"+rscsdb.getString("selBioBranches")+"'>";
buffer = buffer + "<input type='text' id='r91' value='"+rscsdb.getString("glowProject")+"'>";
buffer = buffer + "<input type='text' id='r92' value='"+rscsdb.getString("glowWarehouse")+"'>";
buffer = buffer + "<input type='text' id='r93' value='"+rscsdb.getString("glowRemarks")+"'>";
buffer = buffer + "<input type='text' id='r94' value='"+rscsdb.getString("glowID")+"'>";
buffer = buffer + "<input type='text' id='r95' value='"+rscsdb.getString("glowPass")+"'>";
buffer = buffer + "<input type='text' id='r96' value='"+rscsdb.getString("glowAppRemarks")+"'>";
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
%>