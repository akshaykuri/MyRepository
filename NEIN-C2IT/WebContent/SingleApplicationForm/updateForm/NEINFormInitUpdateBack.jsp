<%@page import="CON2.DbUtil"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.text.resources.FormatData"%>
<%@page import="CON2.MailMessageApplicationFormUser" %>
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
Connection conn=null,cn2=null; 
PreparedStatement psmt=null;
PreparedStatement psmt10=null;
%>
<%
session.setMaxInactiveInterval(20*60);
if(session==null||session.getAttribute("Nname")==null||session.getAttribute("city")==null||session.getAttribute("admin")==null||session.getAttribute("b_no")==null||session.getAttribute("b_no")=="null")
{	
	String msg2=null;
	msg2="Session__Time__Out \\n __ __ Login__Again";
	response.sendRedirect("../../adminlinkHR.jsp?msg="+msg2);
}else{

cn2  = con.getConnection2();
conn = con.getConnection2();

//Main Update parameters of employee
String formNum = request.getParameter("formNum");
String scopeOfWork = request.getParameter("group");
String employeeOption = request.getParameter("employeeOption");
String employeeOption1 = request.getParameter("employeeOption1");
String requestOption = request.getParameter("requestOption");
//ends....

//requestFor starts....
String requestFor = request.getParameter("reqFor111");
String reqFor111 = request.getParameter("reqForOld");

reqFor111 += requestFor+", ";
//ends....
System.out.println("reqFor111====>"+reqFor111);

//if checked Email-ID starts....
String emaildomain = request.getParameter("emaildomain");
String emptype = request.getParameter("emptype");
String email = request.getParameter("reqEmail");
String mobileOption = request.getParameter("mobileOption");
String makeModel = request.getParameter("makeModel");
String simOption = request.getParameter("simOption");
String simNo = request.getParameter("simNo");
String intune = request.getParameter("intune");
String mobile = request.getParameter("mobile");
String imei1 = request.getParameter("imei1");
String imei2 = request.getParameter("imei2");
String group = request.getParameter("group");
String remarksEmail = request.getParameter("remarksEmail");
//ends....

//if checked Domain Account starts....
String passChan	  = request.getParameter("passChan")==null?"":request.getParameter("passChan");
String remarksDom = request.getParameter("remarksDom");
//ends....

//if checked Biometric / Access Card starts....
String changeBio = request.getParameter("changeBio")==null?"":request.getParameter("changeBio");
String[] selBranch = request.getParameterValues("selBranch");
String bioRemarks = request.getParameter("bioRemarks");
String selBranch1 = "";
if(selBranch!=null){	
for(int ii=0;ii<selBranch.length;ii++){
	selBranch1 += selBranch[ii]+",";
}
}
if(selBranch1!=""){
	selBranch1 = selBranch1.substring(0,selBranch1.length()-1);
}
//ends....

//if checked Shared Folder Access starts....
String sharedRemarks = request.getParameter("sharedRemarks");
//ends....

//if checked Internet Access / FTP Access starts....
String requestTypeOption = request.getParameter("requestTypeOption");
String internetRem = request.getParameter("internetRem");
//ends....

//if checked NEWINS starts....
String changeNew = request.getParameter("changeNew");
String prevNewinBr = request.getParameter("prevNewinBr");
String reqBrCode = request.getParameter("reqBrCode");
String newinCode = request.getParameter("newinCode");
String reqNew = request.getParameter("reqNew");
String newRem = request.getParameter("newRem");
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
//ends....

//if checked GS-NET starts....
String changeGS = request.getParameter("changeGS");
String prevGSBr = request.getParameter("changesGSNet");
String prevGSdiv = request.getParameter("prevDivGSNet");
String prevGSPdiv = request.getParameter("prevPDivGSNet");
String prevGSrole = request.getParameter("prevRoleGSNet");
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
}else{
	gsbrcod=request.getParameter("gsnetBrCode1111");
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
}else{
	gsdiv=request.getParameter("gsnetDiv11");
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
}else{
	gspdiv=request.getParameter("gsnetPdiv11");
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
}else{
	rl=request.getParameter("roleCH");
}

String gsNetremarks = request.getParameter("gsNetremarks");
//ends....

//if checked Internal Application starts....
String Software = request.getParameter("Software");
String internalRem = request.getParameter("internalRem");
//ends....

//if checked USB Access starts....
String accessFor = request.getParameter("accessFor");
String dscNo = request.getParameter("dscNo");
String usbRem = request.getParameter("usbRem");
//ends....

//if checked VPN Access starts....
String domID = request.getParameter("domID");
String vpnEmail = request.getParameter("vpnEmail");
String mlps = request.getParameter("mlps");
//ends....

//if checked HardDisk / PenDrive starts....
String hardRemarks = request.getParameter("hardRemarks");
//ends....

//if checked Any other Assets starts....
String assetRemarks = request.getParameter("assetRemarks");
//ends....

//if checked NEx-GLOW starts....
String project 		= request.getParameter("project");
String warehouse 	= request.getParameter("warehouse");
String glowRemarks 	= request.getParameter("glowRemarks");
//ends....

//final remarks....
String remarks = request.getParameter("remarks");
//end....

String f_date = request.getParameter("f_date");

String msg=null;
Date form_date=null;
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
form_date = new Date(sdf.parse(f_date).getTime());

try{
	
psmt =  conn.prepareStatement("update neinapplicationform set scope_of_work=?,emp_type=?,emp_contract_type=?,request_type=?,updateOn=?,updateRemarks=?,requestFor=?,requestFor_change=? where applicationNo=?");
psmt.setString(1,scopeOfWork);
psmt.setString(2,employeeOption);
psmt.setString(3,employeeOption1);
psmt.setString(4,requestOption);
psmt.setDate(5,form_date);
psmt.setString(6,remarks);
psmt.setString(7,requestFor);
psmt.setString(8,reqFor111);
psmt.setString(9,formNum);
	int a = psmt.executeUpdate(); 
	
psmt10 = cn2.prepareStatement("update neinapplicationform_requestfor set emailDomain=?,employeeType=?,reqMailID=?,CompanyProvMobile=?,makeAndModel=?,compProvSimCard=?,compProvSimNumber=?,mobIntune=?,group_name=?,mobileNo=?,imei1=?,imei2=?,emailRemarks=?,passReset=?,domainRemarks=?,chanReqBio=?,selBioBranches=?,bioRemarks=?,folderRemarks=?,internetReqType=?,internetRemarks=?,changesNewins=?,previousBranchesNewins=?,newinsBranchCode=?,newinsOpCode=?,newinsRequest=?,newinsRemarks=?,nexasCompCode=?,nexasCCName=?,nexasCCCode=?,nexasOPRange=?,nexasReqType=?,nexasOptionalMenu=?,nexasRemarks=?,changesGSNet=?,prevBRCodesGSNet=?,prevDivGSNet=?,prevPDivGSNet=?,prevRoleGSNet=?,gsnetBranchCode=?,gsnetDivName=?,gsnetPrimaryDiv=?,gsnetUserRole=?,gsnetRemarks=?,internalApplication=?,internalRemarks=?,usbAccessFor=?,usbDetails=?,usbRemarks=?,vpnDomainID=?,vpnEmailID=?,vpnMPLS=?,hardPenRemarks=?,otherAssetRemarks=?,glowProject=?,glowWarehouse=?,glowRemarks=? where app_no=?");
psmt10.setString(1,emaildomain);
psmt10.setString(2,emptype);
psmt10.setString(3,email);
psmt10.setString(4,mobileOption);
psmt10.setString(5,makeModel);
psmt10.setString(6,simOption);
psmt10.setString(7,simNo);
psmt10.setString(8,intune);
psmt10.setString(9,group);
psmt10.setString(10,mobile);
psmt10.setString(11,imei1);
psmt10.setString(12,imei2);
psmt10.setString(13,remarksEmail);
psmt10.setString(14,passChan);
psmt10.setString(15,remarksDom);
psmt10.setString(16,changeBio);
psmt10.setString(17,selBranch1);
psmt10.setString(18,bioRemarks);
psmt10.setString(19,sharedRemarks);
psmt10.setString(20,requestTypeOption);
psmt10.setString(21,internetRem);
psmt10.setString(22,changeNew);
psmt10.setString(23,prevNewinBr);
psmt10.setString(24,reqBrCode);
psmt10.setString(25,newinCode);
psmt10.setString(26,reqNew);
psmt10.setString(27,newRem);
psmt10.setString(28,compCode);
psmt10.setString(29,costCName);
psmt10.setString(30,costCCode);
psmt10.setString(31,costOPRange);
psmt10.setString(32,userKind);
psmt10.setString(33,opval);
psmt10.setString(34,nexasRem);
psmt10.setString(35,changeGS);
psmt10.setString(36,prevGSBr);
psmt10.setString(37,prevGSdiv);
psmt10.setString(38,prevGSPdiv);
psmt10.setString(39,prevGSrole);
psmt10.setString(40,gsbrcod);
psmt10.setString(41,gsdiv);
psmt10.setString(42,gspdiv);
psmt10.setString(43,rl);
psmt10.setString(44,gsNetremarks);
psmt10.setString(45,Software);
psmt10.setString(46,internalRem);
psmt10.setString(47,accessFor);
psmt10.setString(48,dscNo);
psmt10.setString(49,usbRem);
psmt10.setString(50,domID);
psmt10.setString(51,vpnEmail);
psmt10.setString(52,mlps);
psmt10.setString(53,hardRemarks);
psmt10.setString(54,assetRemarks);
psmt10.setString(55,project);
psmt10.setString(56,warehouse);
psmt10.setString(57,glowRemarks);
psmt10.setString(58,formNum);
	int b = psmt10.executeUpdate(); 

msg = "APPLICATION__FORM__UPDATED__AND__SENT__SUCCESSFULLY......";
	response.sendRedirect("NEINFormInitUpdateFilter.jsp?msg=" +msg);
}
catch (Exception e) { 
	System.out.println(e); 
}
finally{
	DbUtil.closeDBResources(null,psmt,conn);
	DbUtil.closeDBResources(null,psmt10,cn2);
}
}
%>