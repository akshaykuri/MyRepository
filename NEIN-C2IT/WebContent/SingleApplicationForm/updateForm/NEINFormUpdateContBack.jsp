<%@page import="CON2.DbUtil"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.text.resources.FormatData"%>
<jsp:useBean id="dateFormat" class="CON2.DateFormat"/>
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<jsp:useBean id = "timeDiff" class="CON2.TimeDifferenceForm" />
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id = "postMail" class="CON2.PostMail" /> 
<html>
<head>
</head>
<%!
Connection cn2=null; 
Statement st2=null;
String message = null;
%>

<%
session.setMaxInactiveInterval(20*60);
if(session==null||session.getAttribute("Nname")==null||session.getAttribute("city")==null||session.getAttribute("admin")==null||session.getAttribute("b_no")==null||session.getAttribute("b_no")=="null")
{	
	String msg2=null;
	msg2="Session__Time__Out \\n __ __ Login__Again";
	response.sendRedirect("../../adminHR.jsp?msg="+msg2);
}else{

cn2 = con.getConnection2();
st2 = cn2.createStatement();

//Domain user old getParameters readonly fields similar to new form First table fields starts....
String emp_code = request.getParameter("emp_code")==null?"0":request.getParameter("emp_code");
String Nname = request.getParameter("full_name");
String full_name= Nname.toUpperCase();
String branch = request.getParameter("branch");
String depart = request.getParameter("depart");
String designation = request.getParameter("designation");
String r_officer = request.getParameter("reporting_officer");
String requestBy = request.getParameter("requestBy");
//ends....

//upating details
String scopeOfWork = request.getParameter("scopeOfWork");
String employeeOption = request.getParameter("employeeOption");
String employeeOption1 = request.getParameter("employeeOption1");
String requestOption = request.getParameter("requestOption");
String req_Branch = request.getParameter("req_Branch");

//request for new option provided starts....
String reqFor111 = request.getParameter("reqFor111");

//ends....
//if checked Email-ID starts....
String emaildomain = request.getParameter("emaildomain");
String emptype = request.getParameter("emptype");
String email = request.getParameter("email");
String intune = request.getParameter("intune");
String mobile = request.getParameter("mobile");
String imei1 = request.getParameter("imei1");
String imei2 = request.getParameter("imei2");
String group = request.getParameter("scopeOfWork");
String emailCreated = request.getParameter("emailCreated");
String intuneProv = request.getParameter("intuneProv");
String remarksEmail = request.getParameter("remarksEmail");
String mobileOption = request.getParameter("mobileOption");
String makeModel = request.getParameter("makeModel");
String simOption = request.getParameter("simOption");
String simNum = request.getParameter("simNum");
String ITremarksEmail = request.getParameter("ITremarksEmail");
String emailPass = request.getParameter("emailPass");
//ends....

//if checked Domain Account starts....
String domainAcc = request.getParameter("domainAcc");
String domainPass = request.getParameter("domainPass");
String remarksDom = request.getParameter("remarksDom");
String domainAccRem = request.getParameter("domainAccRem");
//ends....

//if checked Biometric / Access Card starts....
String bioRemarks = request.getParameter("bioRemarks");
String[] selBranch = request.getParameterValues("selBranch");
String selBranch1 = "";
if(selBranch!=null){	
for(int ii=0;ii<selBranch.length;ii++){
	selBranch1 += selBranch[ii]+",";
}
}else{
	selBranch1 = request.getParameter("req_Branch");
}
if(selBranch1!=""){
	selBranch1 = selBranch1.substring(0,selBranch1.length()-1);
}
String bioAppRem = request.getParameter("bioAppRem");
//ends....

//if checked Shared Folder Access starts....
String sharedRemarks = request.getParameter("sharedRemarks");
String shareAppRemarks = request.getParameter("shareAppRemarks");
//ends....

//if checked Internet Access / FTP Access starts....
String requestTypeOption = request.getParameter("requestTypeOption");
String internetRem = request.getParameter("internetRem");
String internetAppRem = request.getParameter("internetAppRem");
//ends....

//if checked NEWINS starts....
String reqBrCode = request.getParameter("reqBrCode");
String newinCode = request.getParameter("newinCode");
String reqNew = request.getParameter("reqNew");
String newRem = request.getParameter("newRem");
String opcCode = request.getParameter("opcCode");
String opcPass = request.getParameter("opcPass");
String opcLevel = request.getParameter("opcLevel");
String opcGroup = request.getParameter("scopeOfWork");
String opcAccess = request.getParameter("opcAccess");
String opcRem = request.getParameter("opcRem");
String[] progBlocked = request.getParameterValues("progBlocked[]");
String[] progAllowed = request.getParameterValues("progAllowed[]");
String progBlok="",progAll="";
if(progBlocked!=null){
for(int ii=0;ii<progBlocked.length;ii++){
	progBlok += progBlocked[ii]+",";
}
}
if(progAllowed!=null){
for(int jj=0;jj<progAllowed.length;jj++){
	progAll += progAllowed[jj]+",";
}
}
System.out.println("progBlok====>"+progBlok);
if(progBlok!=null && progBlok!=""){
	progBlok = progBlok.substring(0, progBlok.length()-1);
}
if(progAll!=null && progAll!=""){
	progAll = progAll.substring(0, progAll.length()-1);	
}
//ends....

//if checked NExAS starts....
String compCode = request.getParameter("compCode");
String costCName = request.getParameter("costCName");
String costCCode = request.getParameter("costCCode");
String costOPRange = request.getParameter("costOPRange");
String userKind = request.getParameter("userKind");
String[] OptionalMenu = request.getParameterValues("OptionalMenu[]");
String opval="";
if(OptionalMenu!=null){
for(int p=0;p<OptionalMenu.length;p++)
{
if(p==0)
opval=OptionalMenu[p];
else
opval=opval+", "+OptionalMenu[p];
}
}else{
opval=request.getParameter("OptionalMenu1");
}
String nexasRem = request.getParameter("nexasRem");
String nexID = request.getParameter("nexID");
String nexPass = request.getParameter("nexPass");
String nexRem = request.getParameter("nexRem");
//ends....

//if checked GS-NET starts....
String gsnetCode = request.getParameter("gsnetCode");
String gsnetPass = request.getParameter("gsnetPass");
String[] gsnetBrCode = request.getParameterValues("gsnetBrCode[]");
String gsbrcod="";
if(gsnetBrCode!=null){
for(int p=0;p<gsnetBrCode.length;p++)
{
if(p==0)
gsbrcod=gsnetBrCode[p];
else
gsbrcod=gsbrcod+", "+gsnetBrCode[p];
}
}

String[] gsnetDiv = request.getParameterValues("gsnetDiv[]");
String gsdiv="";
if(gsnetDiv!=null){
for(int p=0;p<gsnetDiv.length;p++)
{
if(p==0)
gsdiv=gsnetDiv[p];
else
gsdiv=gsdiv+", "+gsnetDiv[p];
}
}

String[] gsnetPdiv = request.getParameterValues("gsnetPdiv[]");
String gspdiv="";
if(gsnetPdiv!=null){
for(int p=0;p<gsnetPdiv.length;p++)
{
if(p==0)
gspdiv=gsnetPdiv[p];
else
gspdiv=gspdiv+", "+gsnetPdiv[p];
}
}

String[] role = request.getParameterValues("role[]");
String rl="";
if(role!=null){
for(int p=0;p<role.length;p++)
{
if(p==0)
rl=role[p];
else
rl=rl+", "+role[p];
}
}

String gsNetremarks = request.getParameter("gsNetremarks");
String gsnetRem = request.getParameter("gsnetRem");
//ends....

//if checked Internal Application starts....
String Software = request.getParameter("Software");
String intUSERID = request.getParameter("intUSERID");
String intPass = request.getParameter("intPass");
String internalRem = request.getParameter("internalRem");
String intRem = request.getParameter("intRem");
//ends....

//if checked USB Access starts....
String accessFor = request.getParameter("accessFor");
String dscNo = request.getParameter("dscNo");
String usbRem = request.getParameter("usbRem");
String usbAppRem = request.getParameter("usbAppRem");
//ends....

//if checked VPN Access starts....
String domID = request.getParameter("domID");
String vpnEmail = request.getParameter("vpnEmail");
String mlps = request.getParameter("mlps");
String vpnForti = request.getParameter("vpnForti");
//ends....

//if checked HardDisk / PenDrive starts....
String hardRemarks = request.getParameter("hardRemarks");
String hardDiscRem = request.getParameter("hardDiscRem");
//ends....

//if checked Any other Assets starts....
String assetRemarks = request.getParameter("assetRemarks");
String anyOtherRem = request.getParameter("anyOtherRem");
//ends....

//if checked nex-glow starts....
String project = request.getParameter("project");
String warehouse = request.getParameter("warehouse");
String glowID = request.getParameter("glowID");
String glowPass = request.getParameter("glowPass");
String glowRemarks = request.getParameter("glowRemarks");
String glowAppRemarks = request.getParameter("glowAppRemarks");
//ends....

//final remarks....
String remarks = request.getParameter("remarks");
//end....

String f_date = request.getParameter("f_date");
String i_name = request.getParameter("i_name");
String i_desg = request.getParameter("i_desg");
String i_city = request.getParameter("i_city");
String i_b_no = request.getParameter("i_b_no");
String i_admin = request.getParameter("i_admin");
String i_email_id = request.getParameter("i_email_id");
String desg = request.getParameter("desg");
String emp = request.getParameter("emp");
String mail = request.getParameter("mail");
String empid = request.getParameter("empid1");
String levelno = request.getParameter("levelno");

String EmpNo = (String) session.getAttribute("EmpNo");

String msg = null;
Date form_date = null;
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
form_date = new Date(sdf.parse(f_date).getTime());

String new_id = null;
PreparedStatement psmt = null;
PreparedStatement psmt10 = null;

try {
psmt10 = cn2.prepareStatement("update neinapplicationformmain set emplCode=?,emplName=?,emplBranch=?,emplDept=?,emplDesg=?,emplRO=?,emplSOW=?,emplReqBy=?,emplType=?,emplConType=?,emplreqBranch=?,emplreqFor=?,emailDomain=?,group_name=?,employeeType=?,mailIDCreated=?,reqMailID=?,intuneAccessProvided=?,CompanyProvMobile=?,makeAndModel=?,mobIntune=?,mobileNo=?,imei1=?,imei2=?,emailRemarks=?,domainRemarks=?,domainAccount=?,domainPassword=?,domainAppRemarks=?,bioRemarks=?,bioAppRemarks=?,folderRemarks=?,sharedAppRemarks=?,internetReqType=?,internetRemarks=?,internetAPPRemarks=?,newinsBranchCode=?,newinsOpCode=?,newinsRequest=?,newinsRemarks=?,newinsOPAppCode=?,newinsPassword=?,newinsLevel=?,newinsGroup=?,newinsAccessedBranches=?,newinProgBlocked=?,newinProgAllowed=?,newinsAppRemarks=?,nexasCompCode=?,nexasCCName=?,nexasCCCode=?,nexasOPRange=?,nexasReqType=?,nexasOptionalMenu=?,nexasRemarks=?,nexasID=?,nexasPassword=?,nexasAppRemarks=?,gsnetBranchCode=?,gsnetDivName=?,gsnetPrimaryDiv=?,gsnetUserRole=?,gsnetRemarks=?,gsnetCode=?,gsnetPassword=?,assignedGsnetBranch=?,assignedGsnetDivName=?,assignedGsnetPriDiv=?,assignedGsnetUserRole=?,gsnetAppRemarks=?,internalApplication=?,internalRemarks=?,internalID=?,internalPassword=?,internalAppRemarks=?,usbAccessFor=?,usbDetails=?,usbRemarks=?,usbAppRemarks=?,vpnDomainID=?,vpnEmailID=?,vpnMPLS=?,vpnFortiToken=?,hardPenRemarks=?,hardPenAppRemarks=?,otherAssetRemarks=?,otherAssetAppRemarks=?,updatedBy=?,updatedOn=?,updatedRemarks=?,emailPassword=?,emailAppRemarks=?,comProvSim=?,comProvimNumber=?,glowProject=?,glowWarehouse=?,glowID=?,glowPass=?,glowRemarks=?,glowAppRemarks=?,selBioBranches=? where emplName=?");
psmt10.setString(1,emp_code);
psmt10.setString(2,full_name);
psmt10.setString(3,branch);
psmt10.setString(4,depart);
psmt10.setString(5,designation);
psmt10.setString(6,r_officer);
psmt10.setString(7,scopeOfWork);
psmt10.setString(8,requestBy);
psmt10.setString(9,employeeOption);
psmt10.setString(10,employeeOption1);
psmt10.setString(11,req_Branch);
psmt10.setString(12,reqFor111);
psmt10.setString(13,emaildomain);
psmt10.setString(14,group);
psmt10.setString(15,emptype);
psmt10.setString(16,emailCreated);
psmt10.setString(17,email);
psmt10.setString(18,intuneProv);
psmt10.setString(19,mobileOption);
psmt10.setString(20,makeModel);
psmt10.setString(21,intune);
psmt10.setString(22,mobile);
psmt10.setString(23,imei1);
psmt10.setString(24,imei2);
psmt10.setString(25,remarksEmail);
psmt10.setString(26,remarksDom);
psmt10.setString(27,domainAcc);
psmt10.setString(28,domainPass);
psmt10.setString(29,domainAccRem);
psmt10.setString(30,bioRemarks);
psmt10.setString(31,bioAppRem);
psmt10.setString(32,sharedRemarks);
psmt10.setString(33,shareAppRemarks);
psmt10.setString(34,requestTypeOption);
psmt10.setString(35,internetRem);
psmt10.setString(36,internetAppRem);
psmt10.setString(37,reqBrCode);
psmt10.setString(38,newinCode);
psmt10.setString(39,reqNew);
psmt10.setString(40,newRem);
psmt10.setString(41,opcCode);
psmt10.setString(42,opcPass);
psmt10.setString(43,opcLevel);
psmt10.setString(44,opcGroup);
psmt10.setString(45,opcAccess);
psmt10.setString(46,progBlok);
psmt10.setString(47,progAll);
psmt10.setString(48,opcRem);
psmt10.setString(49,compCode);
psmt10.setString(50,costCName);
psmt10.setString(51,costCCode);
psmt10.setString(52,costOPRange);
psmt10.setString(53,userKind);
psmt10.setString(54,opval);
psmt10.setString(55,nexasRem);
psmt10.setString(56,nexID);
psmt10.setString(57,nexPass);
psmt10.setString(58,nexRem);
psmt10.setString(59,gsbrcod);
psmt10.setString(60,gsdiv);
psmt10.setString(61,gspdiv);
psmt10.setString(62,rl);
psmt10.setString(63,gsNetremarks);
psmt10.setString(64,gsnetCode);
psmt10.setString(65,gsnetPass);
psmt10.setString(66,gsbrcod);
psmt10.setString(67,gsdiv);
psmt10.setString(68,gspdiv);
psmt10.setString(69,rl);
psmt10.setString(70,gsnetRem);
psmt10.setString(71,Software);
psmt10.setString(72,internalRem);
psmt10.setString(73,intUSERID);
psmt10.setString(74,intPass);
psmt10.setString(75,intRem);
psmt10.setString(76,accessFor);
psmt10.setString(77,dscNo);
psmt10.setString(78,usbRem);
psmt10.setString(79,usbAppRem);
psmt10.setString(80,domID);
psmt10.setString(81,vpnEmail);
psmt10.setString(82,mlps);
psmt10.setString(83,vpnForti);
psmt10.setString(84,hardRemarks);
psmt10.setString(85,hardDiscRem);
psmt10.setString(86,assetRemarks);
psmt10.setString(87,anyOtherRem);
psmt10.setString(88,EmpNo);
psmt10.setDate(89,form_date);
psmt10.setString(90,remarks);
psmt10.setString(91,emailPass);
psmt10.setString(92,ITremarksEmail);
psmt10.setString(93,simOption);
psmt10.setString(94,simNum);
psmt10.setString(95,project);
psmt10.setString(96,warehouse);
psmt10.setString(97,glowID);
psmt10.setString(98,glowPass);
psmt10.setString(99,glowRemarks);
psmt10.setString(100,glowAppRemarks);
psmt10.setString(101,selBranch1);
psmt10.setString(102,full_name);
int b = psmt10.executeUpdate();

msg = "APPLICATION__FORM__SAVED__AND__SENT__SUCCESSFULLY......";
response.sendRedirect("NEINFormUpdateFilterCont.jsp?msg=" +msg);
}catch(Exception e){
System.out.println(e);
}finally{
DbUtil.closeDBResources(null,st2,null);
DbUtil.closeDBResources(null,psmt,cn2);
}

}
%>