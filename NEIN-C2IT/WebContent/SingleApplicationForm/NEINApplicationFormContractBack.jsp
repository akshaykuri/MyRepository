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
MailMessageApplicationFormUser mailMessage = new MailMessageApplicationFormUser();

Connection cn2=null;
Statement st5=null,st6=null,st7=null,st8=null,st9=null,st11=null;
String message = null;
%>
<%
session.setMaxInactiveInterval(20*60);
if(session==null||session.getAttribute("Nname")==null||session.getAttribute("city")==null||session.getAttribute("admin")==null||session.getAttribute("b_no")==null||session.getAttribute("b_no")=="null")
{	
	String msg2=null;
	msg2="Session__Time__Out \\n __ __ Login__Again";
	response.sendRedirect("../adminlinkHR.jsp?msg="+msg2);
}else{

cn2 = con.getConnection2();

//Domain user old getParameters similar to new form First table fields starts....
String emp_code = request.getParameter("emp_code")==null?"0":request.getParameter("emp_code");
String Nname = request.getParameter("fullname");
String full_name= Nname.toUpperCase();
String branch = request.getParameter("branch")==null?request.getParameter("branch1"):request.getParameter("branch");
String depart = request.getParameter("depart")==null?request.getParameter("depart1"):request.getParameter("depart");
String designation = request.getParameter("designation")==null?request.getParameter("designation1"):request.getParameter("designation");
String r_officer = request.getParameter("reporting_officer")==null?request.getParameter("emp"):request.getParameter("reporting_officer");
r_officer = r_officer.toUpperCase();
String scopeOfWork = request.getParameter("group")==null?request.getParameter("group1"):request.getParameter("group");
String requestBy = request.getParameter("requestBy");
String employeeOption = request.getParameter("employeeOption");
String employeeOption1 = request.getParameter("employeeOption1");
String requestOption = request.getParameter("requestOption");
String req_Branch = request.getParameter("i_b_no")==null?request.getParameter("i_b_no"):request.getParameter("i_b_no");
//ends....
//request for new option provided starts....
String[] requestForCheck = request.getParameterValues("requestForCheck");
String reqFor111 = request.getParameter("reqFor111");
String requestFor = "";
for(int i=0;i<requestForCheck.length;i++){
	requestFor += requestForCheck[i]+", ";
}
reqFor111 += requestFor;

requestFor = requestFor.substring(0,requestFor.length()-2);

//ends....
//if checked Email-ID starts....
String emaildomain = request.getParameter("emaildomain")==null?request.getParameter("emaildomain1"):request.getParameter("emaildomain");
String emptype = request.getParameter("emptype")==null?request.getParameter("emptype1"):request.getParameter("emptype");
String email = request.getParameter("email");
String intune = request.getParameter("intune")==null?request.getParameter("intune1"):request.getParameter("intune");
String mobile = request.getParameter("mobile");
String imei1 = request.getParameter("imei1");
String imei2 = request.getParameter("imei2");
String group = request.getParameter("group")==null?request.getParameter("group1"):request.getParameter("group");
String emailCreated = request.getParameter("emailCreated");
String intuneProv = request.getParameter("intuneProv");
String remarksEmail = request.getParameter("remarksEmail");
String mobileOption = request.getParameter("mobileOption")==null?request.getParameter("mobileOption1"):request.getParameter("mobileOption");
String makeModel = request.getParameter("makeModel");
String simOption = request.getParameter("simOption")==null?request.getParameter("simOption1"):request.getParameter("simOption");
String simNo = request.getParameter("simNo");
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
String requestTypeOption = request.getParameter("requestTypeOption")==null?request.getParameter("requestTypeOption1"):request.getParameter("requestTypeOption");
String internetRem = request.getParameter("internetRem");
//ends....
//if checked NEWINS starts....
String reqBrCode = request.getParameter("reqBrCode")==null?request.getParameter("reqBranch1"):request.getParameter("reqBrCode");
String reqNew = request.getParameter("reqNew")==null?request.getParameter("reqNew1"):request.getParameter("reqNew");
String newinCode = request.getParameter("newinCode");
String newRem = request.getParameter("newRem");
String changeNew = request.getParameter("changeNew");
String prevNewinBr = request.getParameter("prevNewinBr");

//ends....
//if checked NExAS starts....
String compCode = request.getParameter("compCode")==null?request.getParameter("compCode1"):request.getParameter("compCode");
String costCName = request.getParameter("costCName")==null?request.getParameter("costCName1"):request.getParameter("costCName");
String costCCode = request.getParameter("costCCode");
String costOPRange = request.getParameter("costOPRange");
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

String nexasRem = request.getParameter("nexasRem");
//ends....
//if checked GS-NET starts....
String changeGS = request.getParameter("changeGS");
String prevGSBr = request.getParameter("prevGSBr");
String prevGSdiv = request.getParameter("prevGSdiv");
String prevGSPdiv = request.getParameter("prevGSPdiv");
String prevGSrole = request.getParameter("prevGSrole");
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
String Software = request.getParameter("Software")==null?request.getParameter("Software1"):request.getParameter("Software");
String internalRem = request.getParameter("internalRem");
//ends....
//if checked USB Access starts....
String accessFor = request.getParameter("accessFor")==null?request.getParameter("accessFor1"):request.getParameter("accessFor");
String dscNo = request.getParameter("dscNo");
String usbRem = request.getParameter("usbRem");
//ends....
//if checked VPN Access starts....
String domID = request.getParameter("domID");
String vpnEmail = request.getParameter("vpnEmail");
String mlps = request.getParameter("mlps")==null?request.getParameter("Mlps1"):request.getParameter("mlps");
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
String i_name = request.getParameter("i_name");
String i_desg = request.getParameter("i_desg");
String i_city = request.getParameter("i_city");
String i_b_no = request.getParameter("i_b_no");
String i_admin = request.getParameter("i_admin");
String i_email_id = request.getParameter("i_email_id");
String desg = request.getParameter("desg").trim();
String emp = request.getParameter("emp").trim();
String mail = request.getParameter("mail").trim();
String empid = request.getParameter("empid1").trim();
String levelno = request.getParameter("levelno").trim();

String EmpNo = (String) session.getAttribute("EmpNo");

String msg=null;
Date form_date=null;
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

try{
	form_date = new Date(sdf.parse(f_date).getTime());
}
catch (Exception e){
	e.printStackTrace();
}

String new_id = null;
int id=0;
String id2=null;
Connection cn_id = null; 
Statement st_id = null; 
ResultSet rs_id = null; 
PreparedStatement psmt1001=null;
PreparedStatement psmt=null,psmt2=null,psmt3=null;
try{
psmt1001 = cn2.prepareStatement("SELECT (max(idextend)) FROM neinapplicationform WHERE applicationNo IN(SELECT applicationNo FROM neinapplicationform LEFT JOIN branch_master b ON(substr(applicationNo,18,2)=b.b_no) WHERE b.b_no=? GROUP BY applicationNo)");
psmt1001.setString(1,req_Branch);
rs_id = psmt1001.executeQuery();
if(rs_id.next()){
try
{
id=rs_id.getInt(1);
if(id2==null)
id2="NEIN/CS/APP-FORM/"+req_Branch+"-";
id++;   
new_id = id2+String.valueOf(id);
}
catch(SQLException ex)
{
System.out.println("WXCEPTION : "+ex.toString());
new_id = "NEIN/CS/APP-FORM/"+req_Branch+"-1";
}
}

int idextend = id;

psmt = cn2.prepareStatement("INSERT INTO neinapplicationform(applicationNo,applicationDate,employee_code,full_name,branch,department,designation,report_officer,scope_of_work,requested_by,emp_type,emp_contract_type,request_type,requested_branch,requestFor,i_name,i_desg,i_city,i_b_no,i_admin,i_email_id,desg,emp,mail,form_name,neinRemarks,idextend,requestFor_change) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
psmt.setString(1,new_id);
psmt.setDate(2,form_date);
psmt.setString(3,emp_code);
psmt.setString(4,full_name);
psmt.setString(5,branch);
psmt.setString(6,depart);
psmt.setString(7,designation);
psmt.setString(8,r_officer);
psmt.setString(9,scopeOfWork);
psmt.setString(10,requestBy);
psmt.setString(11,employeeOption);
psmt.setString(12,employeeOption1);
psmt.setString(13,requestOption);
psmt.setString(14,req_Branch);
psmt.setString(15,requestFor);
psmt.setString(16,i_name);
psmt.setString(17,i_desg);
psmt.setString(18,i_city);
psmt.setString(19,i_b_no);
psmt.setString(20,i_admin);
psmt.setString(21,i_email_id);
psmt.setString(22,desg);
psmt.setString(23,emp);
psmt.setString(24,mail);
psmt.setString(25,"NEIN APPLICATION FORM");
psmt.setString(26,remarks);
psmt.setInt(27,idextend);
psmt.setString(28,reqFor111);
	int i = psmt.executeUpdate();

PreparedStatement psmt10=null;
psmt10 =cn2.prepareStatement("insert into neinapplicationform_requestfor (app_no,emailDomain,employeeType,reqMailID,mobIntune,mobileNo,imei1,imei2,domainRemarks,bioRemarks,folderRemarks,internetReqType,internetRemarks,newinsBranchCode,newinsOpCode,newinsRequest,newinsRemarks,nexasCompCode,nexasCCName,nexasCCCode,nexasOPRange,nexasReqType,nexasOptionalMenu,nexasRemarks,gsnetBranchCode,gsnetDivName,gsnetPrimaryDiv,gsnetUserRole,gsnetRemarks,internalApplication,internalRemarks,usbAccessFor,usbDetails,usbRemarks,vpnDomainID,vpnEmailID,vpnMPLS,group_name,mailIDCreated,intuneAccessProvided,emailRemarks,hardPenRemarks,otherAssetRemarks,CompanyProvMobile,makeAndModel,compProvSimCard,compProvSimNumber,passReset,chanReqBio,selBioBranches,glowProject,glowWarehouse,glowRemarks,changesNewins,previousBranchesNewins,changesGSNet,prevBRCodesGSNet,prevDivGSNet,prevPDivGSNet,prevRoleGSNet) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
psmt10.setString(1,new_id);
psmt10.setString(2,emaildomain);
psmt10.setString(3,emptype);
psmt10.setString(4,email);
psmt10.setString(5,intune);
psmt10.setString(6,mobile);
psmt10.setString(7,imei1);
psmt10.setString(8,imei2);
psmt10.setString(9,remarksDom);
psmt10.setString(10,bioRemarks);
psmt10.setString(11,sharedRemarks);
psmt10.setString(12,requestTypeOption);
psmt10.setString(13,internetRem);
psmt10.setString(14,reqBrCode);
psmt10.setString(15,newinCode);
psmt10.setString(16,reqNew);
psmt10.setString(17,newRem);
psmt10.setString(18,compCode);
psmt10.setString(19,costCName);
psmt10.setString(20,costCCode);
psmt10.setString(21,costOPRange);
psmt10.setString(22,userKind);
psmt10.setString(23,opval);
psmt10.setString(24,nexasRem);
psmt10.setString(25,gsbrcod);
psmt10.setString(26,gsdiv);
psmt10.setString(27,gspdiv);
psmt10.setString(28,rl);
psmt10.setString(29,gsNetremarks);
psmt10.setString(30,Software);
psmt10.setString(31,internalRem);
psmt10.setString(32,accessFor);
psmt10.setString(33,dscNo);
psmt10.setString(34,usbRem);
psmt10.setString(35,domID);
psmt10.setString(36,vpnEmail);
psmt10.setString(37,mlps);
psmt10.setString(38,group);
psmt10.setString(39,emailCreated);
psmt10.setString(40,intuneProv);
psmt10.setString(41,remarksEmail);
psmt10.setString(42,hardRemarks);
psmt10.setString(43,assetRemarks);
psmt10.setString(44,mobileOption);
psmt10.setString(45,makeModel);
psmt10.setString(46,simOption);
psmt10.setString(47,simNo);
psmt10.setString(48,passChan);
psmt10.setString(49,changeBio);
psmt10.setString(50,selBranch1);
psmt10.setString(51,project);
psmt10.setString(52,warehouse);
psmt10.setString(53,glowRemarks);
psmt10.setString(54,changeNew);
psmt10.setString(55,prevNewinBr);
psmt10.setString(56,changeGS);
psmt10.setString(57,prevGSBr);
psmt10.setString(58,prevGSdiv);
psmt10.setString(59,prevGSPdiv);
psmt10.setString(60,prevGSrole);
	int b = psmt10.executeUpdate(); 

PreparedStatement psmt11=null;
psmt11=cn2.prepareStatement("UPDATE neinapplicationform SET Approval_status=?,Approval_sttatuss=?,Approval_remarks=?,Approval_f_date=?,Approval_emp=?,Approval_desg=?,Approval_empp=?,Approval_desgg=? WHERE applicationNo=?");
psmt11.setString(1,"Pending");
psmt11.setString(2,"Pending");
psmt11.setString(3,remarks);
psmt11.setDate(4,form_date);
psmt11.setString(5,emp);
psmt11.setString(6,desg);
psmt11.setString(7,i_name);
psmt11.setString(8,i_desg);
psmt11.setString(9,new_id);
	int c = psmt11.executeUpdate(); 

psmt2 = cn2.prepareStatement("INSERT INTO neinapplicationform_item(form2_no,desg,emp,status,remarks,f_date,mail,empid,levelno,presence) VALUES(?,?,?,?,?,?,?,?,?,?)");
psmt2.setString(1,new_id);
psmt2.setString(2,i_desg);
psmt2.setString(3,i_name);
psmt2.setString(4,"Initiator");
psmt2.setString(5,remarks);
psmt2.setDate(6,form_date);
psmt2.setString(7,i_email_id);
psmt2.setString(8,EmpNo);
psmt2.setString(9,"00");
psmt2.setString(10,"over");
	int j = psmt2.executeUpdate();


psmt3 = cn2.prepareStatement("INSERT INTO neinapplicationform_item(form2_no,desg,emp,status,remarks,f_date,mail,empid,levelno,presence) VALUES (?,?,?,?,?,?,?,?,?,?)");
psmt3.setString(1,new_id);
psmt3.setString(2,desg);
psmt3.setString(3,emp);
psmt3.setString(4,"Pending");
psmt3.setString(5,"Pending");
psmt3.setDate(6,form_date);
psmt3.setString(7,mail);
psmt3.setString(8,empid);
psmt3.setString(9,levelno);
psmt3.setString(10,"now");
	int k = psmt3.executeUpdate();

System.out.println("i_email_id 222222222222 :"+i_email_id);
System.out.println("mail 22222222222222 :"+mail);

message = mailMessage.getMailMessageAppForm(new_id.trim());
postMail.postMail(i_email_id,i_name,"pass1234",mail," APPLICATION FORM :  " +new_id+ " ",i_name+  " "+  "request you to approve - Application form - " +new_id+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);              

message = null;
msg = "APPLICATION__FORM__SAVED__AND__SENT__SUCCESSFULLY......";
	response.sendRedirect("../adminHR.jsp?msg=" +msg);
}
catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(rs_id,st_id,cn_id);
	DbUtil.closeDBResources(null,psmt,cn2);
	DbUtil.closeDBResources(null,psmt1001,null);
	DbUtil.closeDBResources(null,psmt2,null);
	DbUtil.closeDBResources(null,psmt3,null);
}
}
%>	              