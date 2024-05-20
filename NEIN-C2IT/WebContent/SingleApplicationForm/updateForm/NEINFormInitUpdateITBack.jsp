<%@page import="CON2.DbUtil"%>
<%@page import="CON2.MailMessageApplicationFormUser"%>
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
MailMessageApplicationFormUser mailMessage = new MailMessageApplicationFormUser();
String message = null;
Connection conn=null,cn2=null; 
PreparedStatement psmt=null,psmt10=null,psmt2=null,psmt3=null,psmt4=null,psmtt=null;
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

//response page....
String pageName = request.getParameter("pageName")==null?"../../HOME.jsp":request.getParameter("pageName");

//main radio buttons
String mmdradio = request.getParameter("mmdradio")==null?"":request.getParameter("mmdradio");

//Main Update parameters of employee
String formNum = request.getParameter("formNum")==null?"":request.getParameter("formNum");
String scopeOfWork = request.getParameter("group")==null?"":request.getParameter("group");
String employeeOption = request.getParameter("employeeOption")==null?"":request.getParameter("employeeOption");
String employeeOption1 = request.getParameter("employeeOption1")==null?"":request.getParameter("employeeOption1");
String requestOption = request.getParameter("requestOption")==null?"":request.getParameter("requestOption");
//ends....

//request for starts....
String reqFor[] = request.getParameterValues("requestForCheck");
String reqFor111 = request.getParameter("reqFor111")==null?"":request.getParameter("reqFor111");
String requestFor="";
for(int i=0;i<reqFor.length;i++){
	requestFor += reqFor[i]+", ";
}
reqFor111 += requestFor;
requestFor = requestFor.substring(0,requestFor.length()-2);
//ends....

//if checked Email-ID starts....
String emaildomain = request.getParameter("emaildomain")==null?request.getParameter("emaildomain1"):request.getParameter("emaildomain");
String emptype = request.getParameter("emptype")==null?request.getParameter("emptype1"):request.getParameter("emptype");
String email = request.getParameter("reqEmail")==null?request.getParameter("reqEmail1"):request.getParameter("reqEmail");
String mobileOption = request.getParameter("mobileOption")==null?request.getParameter("mobileOption1"):request.getParameter("mobileOption");
String makeModel = request.getParameter("makeModel")==null?request.getParameter("makeModel1"):request.getParameter("makeModel");
String simOption = request.getParameter("simOption")==null?request.getParameter("simOption1"):request.getParameter("simOption");
String simNo = request.getParameter("simNo")==null?request.getParameter("simNo1"):request.getParameter("simNo");
String intune = request.getParameter("intune")==null?request.getParameter("intune1"):request.getParameter("intune");
String mobile = request.getParameter("mobile")==null?request.getParameter("mobile1"):request.getParameter("mobile");
String imei1 = request.getParameter("imei1")==null?request.getParameter("imei11"):request.getParameter("imei1");
String imei2 = request.getParameter("imei2")==null?request.getParameter("imei21"):request.getParameter("imei2");
String group = request.getParameter("group")==null?request.getParameter("group"):request.getParameter("group");
String remarksEmail = request.getParameter("remarksEmail")==null?request.getParameter("remarksEmail1"):request.getParameter("remarksEmail");
//ends....

//if checked Domain Account starts....
String passChan	  = request.getParameter("passChan")==null?request.getParameter("passChan1"):request.getParameter("passChan");
String remarksDom = request.getParameter("remarksDom")==null?request.getParameter("remarksDom1"):request.getParameter("remarksDom");
//ends....

//if checked Biometric / Access Card starts....
String changeBio = request.getParameter("changeBio")==null?request.getParameter("changeBio1"):request.getParameter("changeBio");
String[] selBranch = request.getParameterValues("selBranch");
String bioRemarks = request.getParameter("bioRemarks")==null?request.getParameter("bioRemarks1"):request.getParameter("bioRemarks");
String selBranch1 = "";
if(selBranch!=null){	
for(int ii=0;ii<selBranch.length;ii++){
	selBranch1 += selBranch[ii]+",";
}
}else{
	selBranch1 = request.getParameter("selBranch1");
}
if(selBranch1!=""){
	selBranch1 = selBranch1.substring(0,selBranch1.length()-1);
}
//ends....

//if checked Shared Folder Access starts....
String sharedRemarks = request.getParameter("sharedRemarks")==null?request.getParameter("sharedRemarks1"):request.getParameter("sharedRemarks");
//ends....

//if checked Internet Access / FTP Access starts....
String requestTypeOption = request.getParameter("requestTypeOption")==null?request.getParameter("requestTypeOption1"):request.getParameter("requestTypeOption");
String internetRem = request.getParameter("internetRem")==null?request.getParameter("internetRem1"):request.getParameter("internetRem");
//ends....

//if checked NEWINS starts....
String changeNew = request.getParameter("changeNew")==null?request.getParameter("changeNew1"):request.getParameter("changeNew");
String prevNewinBr = request.getParameter("prevNewinBr")==null?request.getParameter("prevNewinBr1"):request.getParameter("prevNewinBr");
String reqBrCode = request.getParameter("reqBrCode")==null?request.getParameter("reqBrCode1"):request.getParameter("reqBrCode");
String newinCode = request.getParameter("newinCode")==null?request.getParameter("newinCode1"):request.getParameter("newinCode");
String reqNew = request.getParameter("reqNew")==null?request.getParameter("reqNew1"):request.getParameter("reqNew");
String newRem = request.getParameter("newRem")==null?request.getParameter("newRem1"):request.getParameter("newRem");
//ends....

//if checked NExAS starts....
String compCode = request.getParameter("compCode")==null?request.getParameter("compCode1"):request.getParameter("compCode");
String costCName = request.getParameter("costCName")==null?request.getParameter("costCName1"):request.getParameter("costCName");
String costCCode = request.getParameter("costCCode")==null?request.getParameter("costCCode1"):request.getParameter("costCCode");
String costOPRange = request.getParameter("costOPRange")==null?request.getParameter("costOPRange1"):request.getParameter("costOPRange1");
String userKind = request.getParameter("userKind")==null?request.getParameter("userKind1"):request.getParameter("userKind");
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

String nexasRem = request.getParameter("nexasRem")==null?request.getParameter("nexasRem1"):request.getParameter("nexasRem");
//ends....

//if checked GS-NET starts....
String changeGS = request.getParameter("changeGS")==null?request.getParameter("changeGS1"):request.getParameter("changeGS");
String prevGSBr = request.getParameter("changesGSNet")==null?request.getParameter("changesGSNet1"):request.getParameter("changesGSNet");
String prevGSdiv = request.getParameter("prevDivGSNet")==null?request.getParameter("prevDivGSNet1"):request.getParameter("prevDivGSNet");
String prevGSPdiv = request.getParameter("prevPDivGSNet")==null?request.getParameter("prevPDivGSNet1"):request.getParameter("prevPDivGSNet");
String prevGSrole = request.getParameter("prevRoleGSNet")==null?request.getParameter("prevRoleGSNet1"):request.getParameter("prevRoleGSNet");
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
	gsbrcod=request.getParameter("gsnetBrCode1");
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
	gsdiv=request.getParameter("gsnetDiv1");
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
	gspdiv=request.getParameter("gsnetPdiv1");
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
	rl=request.getParameter("role1");
}

String gsNetremarks = request.getParameter("gsNetremarks")==null?request.getParameter("gsNetremarks1"):request.getParameter("gsNetremarks");
//ends....

//if checked Internal Application starts....
String Software = request.getParameter("Software")==null?request.getParameter("Software1"):request.getParameter("Software");
String internalRem = request.getParameter("internalRem")==null?request.getParameter("internalRem1"):request.getParameter("internalRem");
//ends....

//if checked USB Access starts....
String accessFor = request.getParameter("accessFor")==null?request.getParameter("accessFor1"):request.getParameter("accessFor");
String dscNo = request.getParameter("dscNo")==null?request.getParameter("dscNo1"):request.getParameter("dscNo");
String usbRem = request.getParameter("usbRem")==null?request.getParameter("usbRem1"):request.getParameter("usbRem");
//ends....

//if checked VPN Access starts....
String domID = request.getParameter("domID")==null?request.getParameter("domID1"):request.getParameter("domID");
String vpnEmail = request.getParameter("vpnEmail")==null?request.getParameter("vpnEmail1"):request.getParameter("vpnEmail");
String mlps = request.getParameter("mlps")==null?request.getParameter("mlps1"):request.getParameter("mlps");
//ends....

//if checked HardDisk / PenDrive starts....
String hardRemarks = request.getParameter("hardRemarks")==null?request.getParameter("hardRemarks1"):request.getParameter("hardRemarks");
//ends....

//if checked Any other Assets starts....
String assetRemarks = request.getParameter("assetRemarks")==null?request.getParameter("assetRemarks1"):request.getParameter("assetRemarks");
//ends....

//if checked NEx-GLOW starts....
String project 		= request.getParameter("project")==null?request.getParameter("project1"):request.getParameter("project");
String warehouse 	= request.getParameter("warehouse")==null?request.getParameter("warehouse1"):request.getParameter("warehouse");
String glowRemarks 	= request.getParameter("glowRemarks")==null?request.getParameter("glowRemarks1"):request.getParameter("glowRemarks");
//ends....

//final remarks....
String remarks = request.getParameter("remarks")==null?"":request.getParameter("remarks");
//end....

//required things
String i_name= request.getParameter("i_name")==null?"":request.getParameter("i_name");
String i_desg= request.getParameter("i_desg")==null?"":request.getParameter("i_desg");
String i_city= request.getParameter("i_city")==null?"":request.getParameter("i_city");
String i_b_no= request.getParameter("i_b_no")==null?"":request.getParameter("i_b_no");
String i_admin= request.getParameter("i_admin")==null?"":request.getParameter("i_admin");
String i_email_id= request.getParameter("i_email_id")==null?"":request.getParameter("i_email_id");
String form_no = request.getParameter("formNum")==null?"":request.getParameter("formNum");
String desg = request.getParameter("desg")==null?"":request.getParameter("desg");
String emp = request.getParameter("emp")==null?"":request.getParameter("emp");
String mail = request.getParameter("mail1")==null?"":request.getParameter("mail1");
String empid = request.getParameter("empid1")==null?"":request.getParameter("empid1");
String levelno = request.getParameter("levelno")==null?"":request.getParameter("levelno");
String senddirect = request.getParameter("senddirect")==null?"":request.getParameter("senddirect");

String f_date = request.getParameter("f_date")==null?"01/01/1900":request.getParameter("f_date");

String msg=null;
Date form_date=null;
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
form_date = new Date(sdf.parse(f_date).getTime());

try{
	
String allMails=null,initiatorNameIfNotApproved=null;
psmt4 = cn2.prepareStatement("SELECT mail,emp FROM neinapplicationform_item WHERE form2_no=? AND status=?");
psmt4.setString(1,form_no);
psmt4.setString(2,"Initiator");
ResultSet rs = psmt4.executeQuery();
while(rs.next())
{
allMails = rs.getString(1); 
initiatorNameIfNotApproved =rs.getString(2);
}

String ToMail="";
psmtt = cn2.prepareStatement("SELECT mail,emp FROM neinapplicationform_item WHERE form2_no=? AND status!='Initiator'");
psmtt.setString(1,form_no);
ResultSet rstt = psmtt.executeQuery();
while(rstt.next())
{
ToMail = ToMail+","+rstt.getString(1); 
}
System.out.println("ToMail %%%%%%%%%%%%%%%%%%%%%%%%%%%%5:"+ToMail);

String empnoSession = (String) session.getAttribute("EmpNo");
	
///////////////////////////////////////////////////////////////////COMMON UPDATE STARTS///////////////////////////////////////////////////////////////////

psmt = cn2.prepareStatement("UPDATE neinapplicationform_item SET status=?,remarks=?,presence=? WHERE form2_no=? and presence='now'");
psmt.setString(1,mmdradio);
psmt.setString(2,remarks);
psmt.setString(3,"over");
psmt.setString(4,form_no);
int i = psmt.executeUpdate();

psmt = cn2.prepareStatement("UPDATE neinapplicationform_item SET clarifyCol=? WHERE form2_no=?");
psmt.setString(1,"0");
psmt.setString(2,form_no);
int ii = psmt.executeUpdate();

///////////////////////////////////////////////////////////////////COMMON UPDATE ENDS///////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////NOT APPROVED STARTS///////////////////////////////////////////////////////////////////
if(mmdradio.equalsIgnoreCase("Not Approved")){
mail =allMails;
	
psmt2 = cn2.prepareStatement("UPDATE neinapplicationform SET Approval_remarks=?,Approval_sttatuss=?,Approval_f_date=? WHERE applicationNo=?");
psmt2.setString(1,remarks);
psmt2.setString(2,"Not Appproved");
psmt2.setDate(3,form_date);
psmt2.setString(4,form_no);
int z = psmt2.executeUpdate();

String allMails1=null;
psmt4 = cn2.prepareStatement("SELECT mail,emp FROM neinapplicationform_item WHERE form2_no=?");
psmt4.setString(1,form_no);
message = mailMessage.getMailMessageAppForm(form_no.trim());
ResultSet rs1 = psmt4.executeQuery();
while(rs1.next())
{
allMails1 = rs1.getString(1); 
   
postMail.postMail(i_email_id,i_name,"pass1234",allMails1," APPLICATION FORM :  " +form_no+ " ", "Your request for APPLICATION FORM "+form_no+" Is NOT Approved by " +i_name+ " <br>Remarks : "+remarks+"<br><b><u> Open the following URL</u> </b><br>C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
}
///////////////////////////////////////////////////////////////////NOT APPROVED ENDS///////////////////////////////////////////////////////////////////
}else if(mmdradio.equals("Clarification Required")){
///////////////////////////////////////////////////////////////////Clarification Required///////////////////////////////////////////////////////////////////
	psmt2 = cn2.prepareStatement("UPDATE neinapplicationform_item SET clarifyCol=? WHERE form2_no=? and empid=?");
	psmt2.setString(1,"1");
	psmt2.setString(2,form_no);
	psmt2.setString(3,empnoSession);
	ii = psmt2.executeUpdate();
	
	psmt4 = cn2.prepareStatement("INSERT INTO neinapplicationform_item(form2_no,desg,emp,status,remarks,f_date,mail,presence,empid,levelno,clarifyCol) VALUES(?,?,?,?,?,?,?,?,?,?,?)");
	psmt4.setString(1,form_no);
	psmt4.setString(2,desg);
	psmt4.setString(3,emp);
	psmt4.setString(4,"Pending");
	psmt4.setString(5,"Pending");
	psmt4.setDate(6,form_date);
	psmt4.setString(7,mail);
	psmt4.setString(8,"now");
	psmt4.setString(9,empid);
	psmt4.setString(10,levelno);
	psmt4.setString(11,"2");
	int j = psmt4.executeUpdate();

	message = mailMessage.getMailMessageAppForm(form_no.trim());
	postMail.postMail(i_email_id,i_name,"pass1234",mail," APPLICATION FORM :  " +form_no+ " ",i_name+  " "+  "requests you to provide clarification for APPLICATION FORM with number - " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br>C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
///////////////////////////////////////////////////////////////////Clarification Required///////////////////////////////////////////////////////////////////
}else{
///////////////////////////////////////////////////////////////////APPROVED STARTS/////////////////////////////////////////////////////////////////////

psmt10 = cn2.prepareStatement("UPDATE neinapplicationform SET Approval_status=?,Approval_sttatuss=?,Approval_remarks=?,Approval_f_date=?,Approval_emp=?,Approval_desg=?,Approval_empp=?,Approval_desgg=? WHERE applicationNo=?");
psmt10.setString(1,mmdradio);
psmt10.setString(2,"Pending");
psmt10.setString(3,remarks);
psmt10.setDate(4,form_date);
psmt10.setString(5,emp);
psmt10.setString(6,desg);
psmt10.setString(7,i_name);
psmt10.setString(8,i_desg);
psmt10.setString(9,form_no);
int bb = psmt10.executeUpdate(); 

psmt2 = cn2.prepareStatement("INSERT INTO neinapplicationform_item(form2_no,desg,emp,status,remarks,f_date,mail,presence,empid,levelno) VALUES(?,?,?,?,?,?,?,?,?,?)");
psmt2.setString(1,form_no);
psmt2.setString(2,desg);
psmt2.setString(3,emp);
psmt2.setString(4,"Pending");
psmt2.setString(5,"Pending");
psmt2.setDate(6,form_date);
psmt2.setString(7,mail);
psmt2.setString(8,"now");
psmt2.setString(9,empid);
psmt2.setString(10,levelno);
int j = psmt2.executeUpdate();

psmt =  conn.prepareStatement("update neinapplicationform set scope_of_work=?,emp_type=?,emp_contract_type=?,request_type=?,requestFor=?,requestFor_change=? where applicationNo=?");
psmt.setString(1,scopeOfWork);
psmt.setString(2,employeeOption);
psmt.setString(3,employeeOption1);
psmt.setString(4,requestOption);
psmt.setString(5,requestFor);
psmt.setString(6,reqFor111);
psmt.setString(7,formNum);
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

message = mailMessage.getMailMessageAppForm(form_no.trim());

	postMail.postMail(i_email_id,i_name,"pass1234",mail," APPLICATION FORM :  " +form_no+ " ",i_name+  " "+  "request you to Approve - APPLICATION FORM " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br>C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);

///////////////////////////////////////////////////////////////////APPROVED ENDS///////////////////////////////////////////////////////////////////
}
msg = "APPLICATION__FORM__SAVED__AND__SENT__SUCCESSFULLY......";
	response.sendRedirect(pageName+"?msg=" +msg);
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