<%@page import="CON2.DbUtil"%>
<%@page import="CON2.MailMessageApplicationFormUser"%>
<%@page import="CON2.MailMessageApplicationFormUserEmail"%>
<%@page import="CON2.MailMessageApplicationFormUserNewins"%>
<%@page import="CON2.MailMessageApplicationFormUserSubmission"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.text.resources.FormatData"%>
<jsp:useBean id ="nonApproveMail" class="CON2.NonApprovMail" /> 
<jsp:useBean id ="successpoSender" class="CON2.ItNonitMailSender" /> 
<jsp:useBean id="dateFormat" class="CON2.DateFormat"/>
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<jsp:useBean id = "pdf" class="com.ck.file.FileAttachment" /> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id = "postMail" class="CON2.PostMail" /> 
<html>
<head>
</head>
<%! 
MailMessageApplicationFormUser mailMessage = new MailMessageApplicationFormUser();
MailMessageApplicationFormUserEmail mailMessageEmail = new MailMessageApplicationFormUserEmail();
MailMessageApplicationFormUserNewins mailMessageNewins = new MailMessageApplicationFormUserNewins();
MailMessageApplicationFormUserSubmission mailMessageSub = new MailMessageApplicationFormUserSubmission();
Connection conn = null, conn1 = null,cn2=null; 
Statement st= null, st1=null,st2=null,st3=null,st4=null,st5=null,st6=null,st7=null,st8=null,st9=null,st11=null;
ResultSet rs = null;
String message = null;
%>
<%	              

session.setMaxInactiveInterval(20*60);
if(session==null||session.getAttribute("Nname")==null||session.getAttribute("city")==null||session.getAttribute("admin")==null||session.getAttribute("b_no")==null||session.getAttribute("b_no")=="null")
{	
	String msg2=null;
	msg2="Session__Time__Out \\n __ __ Login__Again";
	response.sendRedirect("../../adminlinkHR.jsp?msg="+msg2);
}else{

cn2 = con.getConnection2();
st2 = cn2.createStatement();
PreparedStatement psmt=null,psmt2=null,psmt3=null,psmt4=null;
PreparedStatement psmt10=null,psmtt=null;

try{
String i_name= request.getParameter("i_name");
String i_desg= request.getParameter("i_desg");
String i_city= request.getParameter("i_city");
String i_b_no= request.getParameter("i_b_no");
String i_admin= request.getParameter("i_admin");
String i_email_id= request.getParameter("i_email_id");
String form_no = request.getParameter("form1_no");
String f_date = request.getParameter("f_date");
String mmdradio = request.getParameter("mmdradio");
String desg = request.getParameter("desg");
String emp = request.getParameter("emp");
String mail = request.getParameter("mail1");
String empid = request.getParameter("empid1");
String levelno = request.getParameter("levelno");
String senddirect = request.getParameter("senddirect");
String mmdradioBcc = request.getParameter("mmdradioBcc");
String SendExtraMails = request.getParameter("SendBCCmail");
String mmradio = request.getParameter("mmradio");
String higherAuthority = request.getParameter("higherAuthority");

//EMAIL ID
String emailID = request.getParameter("emailID")==null?request.getParameter("mailCreate"):request.getParameter("emailID");
String passEmail = request.getParameter("passEmail")==null?request.getParameter("emPass"):request.getParameter("passEmail");
String intAcc = request.getParameter("intAcc")==null?request.getParameter("intProvided"):request.getParameter("intAcc");
String emailAppRemarks = request.getParameter("emailAppRemarks")==null?request.getParameter("emRemaa"):request.getParameter("emailAppRemarks");
//DOMAIN
String ITusername = request.getParameter("ITusername")==null?request.getParameter("domAcc"):request.getParameter("ITusername");
String ITpassword = request.getParameter("ITpassword")==null?request.getParameter("domPass"):request.getParameter("ITpassword");
String ITremark = request.getParameter("ITremark")==null?request.getParameter("domRemaa"):request.getParameter("ITremark");
//bio metric
String bioRemark = request.getParameter("bioRemark")==null?request.getParameter("bioRemaa"):request.getParameter("bioRemark");
//share
String shaRemark = request.getParameter("shaRemark")==null?request.getParameter("shaRemaa"):request.getParameter("shaRemark");
//internet
String intRemark = request.getParameter("intRemark")==null?request.getParameter("internetRemaa"):request.getParameter("intRemark");
//newins
String changeNew = request.getParameter("changeNew");
String prevNewinBr = request.getParameter("prevNewinBr");
String ITdcode = request.getParameter("ITdcode")==null?request.getParameter("newOPC"):request.getParameter("ITdcode");
String ITdpassword = request.getParameter("ITdpassword")==null?request.getParameter("newPass"):request.getParameter("ITdpassword");
String ITdlevel = request.getParameter("ITdlevel")==null?request.getParameter("newinLev"):request.getParameter("ITdlevel");
String newinsLevel = request.getParameter("newinsLevel")==null?request.getParameter("newinLev"):request.getParameter("newinsLevel");
String gname = request.getParameter("sow")==null?request.getParameter("newGrp"):request.getParameter("sow");
String accessbr = request.getParameter("accessbr")==null?request.getParameter("newAccBr"):request.getParameter("accessbr");
String progBlocked[] = request.getParameterValues("progBlocked");
String progAllowed[] = request.getParameterValues("progAllowed");
String ITdremark = request.getParameter("ITdremark")==null?request.getParameter("newRemaa"):request.getParameter("ITdremark");
//nexas
String nexID = request.getParameter("nexID")==null?request.getParameter("nexUID"):request.getParameter("nexID");
String nexPass = request.getParameter("nexPass")==null?request.getParameter("nexPasswo"):request.getParameter("nexPass");
String nexRem = request.getParameter("nexRem")==null?request.getParameter("nexRemaa"):request.getParameter("nexRem");
//gsnet
String changeGS = request.getParameter("changeGS");
String changesGSNet = request.getParameter("changesGSNet");
String prevDivGSNet = request.getParameter("prevDivGSNet");
String prevPDivGSNet = request.getParameter("prevPDivGSNet");
String prevRoleGSNet = request.getParameter("prevRoleGSNet");
String uCode = request.getParameter("uCode")==null?request.getParameter("gsnetCode"):request.getParameter("uCode");
String uPass = request.getParameter("uPass")==null?request.getParameter("gsnetPass"):request.getParameter("uPass");
String gsBCode[] = request.getParameterValues("gsBCode");
String gsbrcod="";
if(gsBCode!=null){	
for(int p=0;p<gsBCode.length;p++)
{
if(p==0)
gsbrcod=gsBCode[p];
else
gsbrcod=gsbrcod+", "+gsBCode[p];
}
}
String gsDiv[] = request.getParameterValues("gsDiv");
String gsdiv="";
if(gsDiv!=null){
for(int p=0;p<gsDiv.length;p++)
{
if(p==0)
gsdiv=gsDiv[p];
else
gsdiv=gsdiv+", "+gsDiv[p];
}
}
String gsPri[] = request.getParameterValues("gsPri");
String gspdiv="";
if(gsPri!=null){
for(int p=0;p<gsPri.length;p++)
{
if(p==0)
gspdiv=gsPri[p];
else
gspdiv=gspdiv+", "+gsPri[p];
}
}
String gsUser[] = request.getParameterValues("gsUser");
String rl="";
if(gsUser!=null){
for(int p=0;p<gsUser.length;p++)
{
if(p==0)
rl=gsUser[p];
else
rl=rl+", "+gsUser[p];
}
}
String gsRem = request.getParameter("gsRem")==null?request.getParameter("gsnetRemaa"):request.getParameter("gsRem");
//internal
String interName = request.getParameter("interName")==null?request.getParameter("internalID"):request.getParameter("interName");
String interPass = request.getParameter("interPass")==null?request.getParameter("internalPass"):request.getParameter("interPass");
String interRem = request.getParameter("interRem")==null?request.getParameter("internalRemaa"):request.getParameter("interRem");
//usb
String usbRem = request.getParameter("usbRem")==null?request.getParameter("usbRemaa"):request.getParameter("usbRem");
//vpn
String forti = request.getParameter("forti")==null?request.getParameter("vpnFort"):request.getParameter("forti");
//harddisk / pendrive
String hardRem = request.getParameter("hardRem")==null?request.getParameter("hardRemaa"):request.getParameter("hardRem");
//any other asset
String assRem = request.getParameter("assRem")==null?request.getParameter("otherRemaa"):request.getParameter("assRem");
//nex-glow
String glowID = request.getParameter("glowID")==null?request.getParameter("glowID1"):request.getParameter("glowID");
String glowPass = request.getParameter("glowPass")==null?request.getParameter("glowPass1"):request.getParameter("glowPass");
String glowAppRemarks = request.getParameter("glowAppRemarks")==null?request.getParameter("glowAppRemaa"):request.getParameter("glowAppRemarks");
//final remarks
String txtmail_msg = request.getParameter("txtmail_msg");

String mailTrigger = request.getParameter("mailTrigger");

//default values from request
String emp_code = request.getParameter("emp_code")==null?"0":request.getParameter("emp_code");
String full_name = request.getParameter("full_name");
String branch = request.getParameter("branch");
String depart = request.getParameter("depart");
String designation = request.getParameter("designation");
String r_officer = request.getParameter("r_officer");
String sow = request.getParameter("sow");
String reqBy = request.getParameter("reqBy");
String emplType = request.getParameter("emplType");
String emplCont = request.getParameter("emplCont");
String requestBranch = request.getParameter("requestBranch");
String requestFor_change = request.getParameter("requestFor_change");

String emailDom = request.getParameter("emailDom");
String grp = request.getParameter("grp")==null?request.getParameter("sow"):request.getParameter("grp");
String employType = request.getParameter("employType");
String reqMailID = request.getParameter("reqMailID");
String mobileOption = request.getParameter("mobileOption");
String makeModel = request.getParameter("makeModel");
String simOption = request.getParameter("simOption");
String simNo = request.getParameter("simNo");
String onintune = request.getParameter("onintune");
String mobileNo = request.getParameter("mobileNo");
String imei1 = request.getParameter("imei1");
String imei2 = request.getParameter("imei2");
String emailRemarks = request.getParameter("emailRemarks");

String passChan = request.getParameter("passChan");
String remarksDom = request.getParameter("remarksDom");

String changeBio = request.getParameter("changeBio");
String selBranch = request.getParameter("selBranch");
String bioRemarks = request.getParameter("bioRemarks");

String sharedRemarks = request.getParameter("sharedRemarks");

String internetReqType = request.getParameter("internetReqType");
String internetRem = request.getParameter("internetRem");

String reqBrCode = request.getParameter("reqBrCode");
String newinCode = request.getParameter("newinCode");
String newinsRequest = request.getParameter("newinsRequest");
String newRem = request.getParameter("newRem");
String progblok = request.getParameter("progblok")==null?request.getParameter("newBlo"):request.getParameter("progblok");
String progAll = request.getParameter("progAll")==null?request.getParameter("newAll"):request.getParameter("progAll");

String nexasCompCode = request.getParameter("nexasCompCode");
String nexasCCName = request.getParameter("nexasCCName");
String costCCode = request.getParameter("costCCode");
String costOPRange = request.getParameter("costOPRange");
String nexasReqType = request.getParameter("nexasReqType");
String nexasOptionalMenu = request.getParameter("nexasOptionalMenu");
String nexasRem = request.getParameter("nexasRem");

String gsnetBranchCode = request.getParameter("gsnetBranchCode");
String gsnetDivName = request.getParameter("gsnetDivName");
String gsnetPrimaryDiv = request.getParameter("gsnetPrimaryDiv");
String gsnetUserRole = request.getParameter("gsnetUserRole");
String gsNetremarks = request.getParameter("gsNetremarks");
String gsBCode1 = request.getParameter("gsBCode1")==null?request.getParameter("gsnetBRC"):request.getParameter("gsBCode1");
String gsDiv1 = request.getParameter("gsDiv1")==null?request.getParameter("gsnetDiv"):request.getParameter("gsDiv1");
String gsPri1 = request.getParameter("gsPri1")==null?request.getParameter("gsnetPDIV"):request.getParameter("gsPri1");
String gsUser1 = request.getParameter("gsUser1")==null?request.getParameter("gsnetRole"):request.getParameter("gsUser1");

String internalApplication = request.getParameter("internalApplication");
String internalRem = request.getParameter("internalRem");

String usbAccessFor = request.getParameter("usbAccessFor");
String dscNo = request.getParameter("dscNo");
String usbRem1 = request.getParameter("usbRem1");

String domID = request.getParameter("domID");
String vpnEmail = request.getParameter("vpnEmail");
String vpnMPLS = request.getParameter("vpnMPLS");

String hardRemarks = request.getParameter("hardRemarks");

String assetRemarks = request.getParameter("assetRemarks");

String project = request.getParameter("project");
String warehouse = request.getParameter("warehouse");
String glowRemarks = request.getParameter("glowRemarks");

String sendOnlyNewAll="",sendOnlyNewBlk="";
if(progBlocked!=null){
for(int h=0;h<progBlocked.length;h++)
{
	sendOnlyNewBlk += progBlocked[h]+",";
}
}
if(progAllowed!=null){
for(int h=0;h<progAllowed.length;h++)
{
	sendOnlyNewAll += progAllowed[h]+",";	
}
}

if(!sendOnlyNewAll.equalsIgnoreCase("")){
	sendOnlyNewAll = sendOnlyNewAll.substring(0,sendOnlyNewAll.length()-1);	
}
if(!sendOnlyNewBlk.equalsIgnoreCase("")){
	sendOnlyNewBlk = sendOnlyNewBlk.substring(0,sendOnlyNewBlk.length()-1);
}

System.out.println("sendOnlyNewAll=="+sendOnlyNewAll);
System.out.println("sendOnlyNewBlk=="+sendOnlyNewBlk);

String msg=null;
Date form_date=null;

SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
try
{
form_date = new Date(sdf.parse(f_date).getTime());
}
catch (Exception e)
{
e.printStackTrace();
}

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

String pending = "Pending";
if(mmdradio!=null && mmdradio.equals("Not Approved"))
    {
	mail =allMails;
	
psmt2 = cn2.prepareStatement("UPDATE neinapplicationform SET Approval_remarks=?,Approval_sttatuss=?,Approval_f_date=? WHERE applicationNo=?");
	   psmt2.setString(1,txtmail_msg);
	   psmt2.setString(2,"Not Appproved");
	   psmt2.setDate(3,form_date);
	   psmt2.setString(4,form_no);
	   int z = psmt2.executeUpdate();
	
    }

psmt = cn2.prepareStatement("UPDATE neinapplicationform_item SET status=?,remarks=?,presence=? WHERE form2_no=? and presence='now'");
psmt.setString(1,mmdradio);
psmt.setString(2,txtmail_msg);
psmt.setString(3,"over");
psmt.setString(4,form_no);
	int i = psmt.executeUpdate();


if(mmdradio.equals("Approved"))
{
if(senddirect.equals("sendonly"))
{
	
if(progBlocked!=null){
for(int h=0;h<progBlocked.length;h++)
{
psmt4 = cn2.prepareStatement("INSERT INTO neinnewinsblocked(form_no,desg,name,proBlocked) VALUES(?,?,?,?)");
psmt4.setString(1,form_no);
psmt4.setString(2,i_desg);
psmt4.setString(3,i_name);
psmt4.setString(4,progBlocked[h]);
	int gg = psmt4.executeUpdate();
}

psmt10 = cn2.prepareStatement("UPDATE neinapplicationform_requestFor SET newinsLevel=?,newinAllowed=?,newinBlocked=? WHERE app_no=?");
psmt10.setString(1,newinsLevel);
psmt10.setString(2,sendOnlyNewAll);
psmt10.setString(3,sendOnlyNewBlk);
psmt10.setString(4,form_no);
	int bb = psmt10.executeUpdate(); 

}

if(progAllowed!=null){
for(int l=0;l<progAllowed.length;l++)
{
psmt2 = cn2.prepareStatement("INSERT INTO neinnewinsallowed(form_no,desg,name,proAllowed) VALUES(?,?,?,?)");
psmt2.setString(1,form_no);
psmt2.setString(2,i_desg);
psmt2.setString(3,i_name);
psmt2.setString(4,progAllowed[l]);
	int hh = psmt2.executeUpdate();
}
}

psmt10 = cn2.prepareStatement("UPDATE neinapplicationform SET Approval_status=?,Approval_sttatuss=?,Approval_remarks=?,Approval_f_date=?,Approval_emp=?,Approval_desg=?,Approval_empp=?,Approval_desgg=? WHERE applicationNo=?");
psmt10.setString(1,mmdradio);
psmt10.setString(2,"Pending");
psmt10.setString(3,txtmail_msg);
psmt10.setDate(4,form_date);
psmt10.setString(5,emp);
psmt10.setString(6,desg);
psmt10.setString(7,i_name);
psmt10.setString(8,i_desg);
psmt10.setString(9,form_no);
	int b = psmt10.executeUpdate(); 

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

if(mailTrigger.equalsIgnoreCase("emailExpats")){
message = mailMessageEmail.getMailMessageAppFormEmail(form_no.trim());
}else if(mailTrigger.equalsIgnoreCase("newins")){
message = mailMessageNewins.getMailMessageAppFormNewins(form_no.trim());
}else{	
message = mailMessage.getMailMessageAppForm(form_no.trim());
}
 	 postMail.postMail(i_email_id,i_name,"pass1234",mail," APPLICATION FORM :  " +form_no+ " ",i_name+  " "+  "request you to Approve - APPLICATION FORM " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br>C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
}
else if(senddirect.equals("senddirect"))
{
if(higherAuthority.equals("direct"))
{
System.out.println("direct inside");
if(progBlocked!=null){
for(int h=0;h<progBlocked.length;h++)
{
psmt4 = cn2.prepareStatement("INSERT INTO neinnewinsblocked(form_no,desg,name,proBlocked) VALUES(?,?,?,?)");
psmt4.setString(1,form_no);
psmt4.setString(2,i_desg);
psmt4.setString(3,i_name);
psmt4.setString(4,progBlocked[h]);
	int gg = psmt4.executeUpdate();
}
}

if(progAllowed!=null){
for(int l=0;l<progAllowed.length;l++)
{
psmt2 = cn2.prepareStatement("INSERT INTO neinnewinsallowed(form_no,desg,name,proAllowed) VALUES(?,?,?,?)");
psmt2.setString(1,form_no);
psmt2.setString(2,i_desg);
psmt2.setString(3,i_name);
psmt2.setString(4,progAllowed[l]);
	int hh = psmt2.executeUpdate();
}
}
	
psmt2 = cn2.prepareStatement("UPDATE neinapplicationform SET Approval_sttatuss=?,Approval_f_date=? WHERE applicationNo=?");
psmt2.setString(1,"Closed");
psmt2.setDate(2,form_date);
psmt2.setString(3,form_no);
	int j = psmt2.executeUpdate();


try{
psmt2 = cn2.prepareStatement("UPDATE neinapplicationform_requestfor SET domainAccount=?,domainPassword=?,domainAppRemarks=?,bioAppRemarks=?,sharedAppRemarks=?,internetAPPRemarks=?,newinsOPAppCode=?,newinsPassword=?,newinsLevel=?,newinsGroup=?,newinsAccessedBranches=?,newinsAppRemarks=?,nexasID=?,nexasPassword=?,nexasAppRemarks=?,gsnetCode=?,gsnetPassword=?,assignedGsnetBranch=?,assignedGsnetDivName=?,assignedGsnetPriDiv=?,assignedGsnetUserRole=?,gsnetAppRemarks=?,internalID=?,internalPassword=?,internalAppRemarks=?,usbAppRemarks=?,vpnFortiToken=?,hardPenAppRemarks=?,otherAssetAppRemarks=?,newinAllowed=?,newinBlocked=?,compProvSimCard=?,compProvSimNumber=?,emailPassword=?,emailAppRemarks=?,mailIDCreated=?,intuneAccessProvided=?,glowID=?,glowPass=?,glowAppRemarks=? WHERE app_no=?");
psmt2.setString(1,ITusername);
psmt2.setString(2,ITpassword);
psmt2.setString(3,ITremark);
psmt2.setString(4,bioRemark);
psmt2.setString(5,shaRemark);
psmt2.setString(6,intRemark);
psmt2.setString(7,ITdcode);
psmt2.setString(8,ITdpassword);
psmt2.setString(9,ITdlevel);
psmt2.setString(10,gname);
psmt2.setString(11,accessbr);
psmt2.setString(12,ITdremark);
psmt2.setString(13,nexID);
psmt2.setString(14,nexPass);
psmt2.setString(15,nexRem);
psmt2.setString(16,uCode);
psmt2.setString(17,uPass);
psmt2.setString(18,gsBCode1);
psmt2.setString(19,gsDiv1);
psmt2.setString(20,gsPri1);
psmt2.setString(21,gsUser1);
psmt2.setString(22,gsRem);
psmt2.setString(23,interName);
psmt2.setString(24,interPass);
psmt2.setString(25,interRem);
psmt2.setString(26,usbRem);
psmt2.setString(27,forti);
psmt2.setString(28,hardRem);
psmt2.setString(29,assRem);
psmt2.setString(30,progAll);
psmt2.setString(31,progblok);
psmt2.setString(32,simOption);
psmt2.setString(33,simNo);
psmt2.setString(34,passEmail);
psmt2.setString(35,emailAppRemarks);
psmt2.setString(36,emailID);
psmt2.setString(37,intAcc);
psmt2.setString(38,glowID);
psmt2.setString(39,glowPass);
psmt2.setString(40,glowAppRemarks);
psmt2.setString(41,form_no);
	int jk = psmt2.executeUpdate();

st1 = cn2.createStatement();
ResultSet rsmain = st1.executeQuery("select emplCode from neinapplicationformmain where emplCode='"+emp_code+"' and emplName like '%"+full_name+"%'");
if(!rsmain.next()){

psmt2 = cn2.prepareStatement("insert into neinapplicationformmain (emplCode,emplName,emplBranch,emplDept,emplDesg,emplRO,emplSOW,emplReqBy,emplType,emplConType,emplreqBranch,emplreqFor,emailDomain,group_name,employeeType,mailIDCreated,reqMailID,intuneAccessProvided,CompanyProvMobile,makeAndModel,mobIntune,mobileNo,imei1,imei2,emailRemarks,domainRemarks,domainAccount,domainPassword,domainAppRemarks,bioRemarks,bioAppRemarks,folderRemarks,sharedAppRemarks,internetReqType,internetRemarks,internetAPPRemarks,newinsBranchCode,newinsOpCode,newinsRequest,newinsRemarks,newinsOPAppCode,newinsPassword,newinsLevel,newinsGroup,newinsAccessedBranches,newinsAppRemarks,nexasCompCode,nexasCCName,nexasCCCode,nexasOPRange,nexasReqType,nexasOptionalMenu,nexasRemarks,nexasID,nexasPassword,nexasAppRemarks,gsnetBranchCode,gsnetDivName,gsnetPrimaryDiv,gsnetUserRole,gsnetRemarks,gsnetCode,gsnetPassword,assignedGsnetBranch,assignedGsnetDivName,assignedGsnetPriDiv,assignedGsnetUserRole,gsnetAppRemarks,internalApplication,internalRemarks,internalID,internalPassword,internalAppRemarks,usbAccessFor,usbDetails,usbRemarks,usbAppRemarks,vpnDomainID,vpnEmailID,vpnMPLS,vpnFortiToken,hardPenRemarks,hardPenAppRemarks,otherAssetRemarks,otherAssetAppRemarks,newinProgBlocked,newinProgAllowed,emailPassword,emailAppRemarks,comProvSim,comProvimNumber,passReset,changeBio,selBioBranches,glowProject,glowWarehouse,glowRemarks,glowID,glowPass,glowAppRemarks,changesNewin,prevoiusSelBranchesNewins,changesGSNET,prevGSNETBRcodes,prevGSNETDivcodes,prevGSNETPDivcodes,prevGSNETRoles) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		psmt2.setString(1,emp_code);
		psmt2.setString(2,full_name);
		psmt2.setString(3,branch);
		psmt2.setString(4,depart);
		psmt2.setString(5,designation);
		psmt2.setString(6,r_officer);
		psmt2.setString(7,sow);
		psmt2.setString(8,reqBy);
		psmt2.setString(9,emplType);
		psmt2.setString(10,emplCont);
		psmt2.setString(11,requestBranch);
		psmt2.setString(12,requestFor_change);
		psmt2.setString(13,emailDom);
		psmt2.setString(14,grp);
		psmt2.setString(15,employType);
		psmt2.setString(16,emailID);
		psmt2.setString(17,reqMailID);
		psmt2.setString(18,intAcc);
		psmt2.setString(19,mobileOption);
		psmt2.setString(20,makeModel);
		psmt2.setString(21,onintune);
		psmt2.setString(22,mobileNo);
		psmt2.setString(23,imei1);
		psmt2.setString(24,imei2);
		psmt2.setString(25,emailRemarks);
		psmt2.setString(26,remarksDom);
		psmt2.setString(27,ITusername);
		psmt2.setString(28,ITpassword);
		psmt2.setString(29,ITremark);
		psmt2.setString(30,bioRemarks);
		psmt2.setString(31,bioRemark);
		psmt2.setString(32,sharedRemarks);
		psmt2.setString(33,shaRemark);
		psmt2.setString(34,internetReqType);
		psmt2.setString(35,internetRem);
		psmt2.setString(36,intRemark);
		psmt2.setString(37,reqBrCode);
		psmt2.setString(38,newinCode);
		psmt2.setString(39,newinsRequest);
		psmt2.setString(40,newRem);
		psmt2.setString(41,ITdcode);
		psmt2.setString(42,ITdpassword);
		psmt2.setString(43,ITdlevel);
		psmt2.setString(44,gname);
		psmt2.setString(45,accessbr);
		psmt2.setString(46,ITdremark);
		psmt2.setString(47,nexasCompCode);
		psmt2.setString(48,nexasCCName);
		psmt2.setString(49,costCCode);
		psmt2.setString(50,costOPRange);
		psmt2.setString(51,nexasReqType);
		psmt2.setString(52,nexasOptionalMenu);
		psmt2.setString(53,nexasRem);
		psmt2.setString(54,nexID);
		psmt2.setString(55,nexPass);
		psmt2.setString(56,nexRem);
		psmt2.setString(57,gsnetBranchCode);
		psmt2.setString(58,gsnetDivName);
		psmt2.setString(59,gsnetPrimaryDiv);
		psmt2.setString(60,gsnetUserRole);
		psmt2.setString(61,gsNetremarks);
		psmt2.setString(62,uCode);
		psmt2.setString(63,uPass);
		psmt2.setString(64,gsBCode1);
		psmt2.setString(65,gsDiv1);
		psmt2.setString(66,gsPri1);
		psmt2.setString(67,gsUser1);
		psmt2.setString(68,gsRem);
		psmt2.setString(69,internalApplication);
		psmt2.setString(70,internalRem);
		psmt2.setString(71,interName);
		psmt2.setString(72,interPass);
		psmt2.setString(73,interRem);
		psmt2.setString(74,usbAccessFor);
		psmt2.setString(75,dscNo);
		psmt2.setString(76,usbRem1);
		psmt2.setString(77,usbRem);
		psmt2.setString(78,domID);
		psmt2.setString(79,vpnEmail);
		psmt2.setString(80,vpnMPLS);
		psmt2.setString(81,forti);
		psmt2.setString(82,hardRemarks);
		psmt2.setString(83,hardRem);
		psmt2.setString(84,assetRemarks);
		psmt2.setString(85,assRem);
		psmt2.setString(86,progblok);
		psmt2.setString(87,progAll);
		psmt2.setString(88,passEmail);
		psmt2.setString(89,emailAppRemarks);
		psmt2.setString(90,simOption);
		psmt2.setString(91,simNo);
		psmt2.setString(92,passChan);
		psmt2.setString(93,changeBio);
		psmt2.setString(94,selBranch);
		psmt2.setString(95,project);
		psmt2.setString(96,warehouse);
		psmt2.setString(97,glowRemarks);
		psmt2.setString(98,glowID);
		psmt2.setString(99,glowPass);
		psmt2.setString(100,glowAppRemarks);
		psmt2.setString(101,changeNew);
		psmt2.setString(102,prevNewinBr);
		psmt2.setString(103,changeGS);
		psmt2.setString(104,changesGSNet);
		psmt2.setString(105,prevDivGSNet);
		psmt2.setString(106,prevPDivGSNet);
		psmt2.setString(107,prevRoleGSNet);
			int jkk = psmt2.executeUpdate();

		}else{

psmt2 = cn2.prepareStatement("UPDATE neinapplicationformmain SET emplCode=?,emplName=?,emplBranch=?,emplDept=?,emplDesg=?,emplRO=?,emplSOW=?,emplReqBy=?,emplType=?,emplConType=?,emplreqBranch=?,emplreqFor=?,emailDomain=?,group_name=?,employeeType=?,mailIDCreated=?,reqMailID=?,intuneAccessProvided=?,CompanyProvMobile=?,makeAndModel=?,mobIntune=?,mobileNo=?,imei1=?,imei2=?,emailRemarks=?,domainRemarks=?,domainAccount=?,domainPassword=?,domainAppRemarks=?,bioRemarks=?,bioAppRemarks=?,folderRemarks=?,sharedAppRemarks=?,internetReqType=?,internetRemarks=?,internetAPPRemarks=?,newinsBranchCode=?,newinsOpCode=?,newinsRequest=?,newinsRemarks=?,newinsOPAppCode=?,newinsPassword=?,newinsLevel=?,newinsGroup=?,newinsAccessedBranches=?,newinsAppRemarks=?,nexasCompCode=?,nexasCCName=?,nexasCCCode=?,nexasOPRange=?,nexasReqType=?,nexasOptionalMenu=?,nexasRemarks=?,nexasID=?,nexasPassword=?,nexasAppRemarks=?,gsnetBranchCode=?,gsnetDivName=?,gsnetPrimaryDiv=?,gsnetUserRole=?,gsnetRemarks=?,gsnetCode=?,gsnetPassword=?,assignedGsnetBranch=?,assignedGsnetDivName=?,assignedGsnetPriDiv=?,assignedGsnetUserRole=?,gsnetAppRemarks=?,internalApplication=?,internalRemarks=?,internalID=?,internalPassword=?,internalAppRemarks=?,usbAccessFor=?,usbDetails=?,usbRemarks=?,usbAppRemarks=?,vpnDomainID=?,vpnEmailID=?,vpnMPLS=?,vpnFortiToken=?,hardPenRemarks=?,hardPenAppRemarks=?,otherAssetRemarks=?,otherAssetAppRemarks=?,newinProgBlocked=?,newinProgAllowed=?,emailPassword=?,emailAppRemarks=?,comProvSim=?,comProvimNumber=?,passReset=?,changeBio=?,selBioBranches=?,glowProject=?,glowWarehouse=?,glowRemarks=?,glowID=?,glowPass=?,glowAppRemarks=?,changesNewin=?,prevoiusSelBranchesNewins=?,changesGSNET=?,prevGSNETBRcodes=?,prevGSNETDivcodes=?,prevGSNETPDivcodes=?,prevGSNETRoles=? WHERE emplCode=? and emplName like '%"+full_name+"%'");
		psmt2.setString(1,emp_code);
		psmt2.setString(2,full_name);
		psmt2.setString(3,branch);
		psmt2.setString(4,depart);
		psmt2.setString(5,designation);
		psmt2.setString(6,r_officer);
		psmt2.setString(7,sow);
		psmt2.setString(8,reqBy);
		psmt2.setString(9,emplType);
		psmt2.setString(10,emplCont);
		psmt2.setString(11,requestBranch);
		psmt2.setString(12,requestFor_change);
		psmt2.setString(13,emailDom);
		psmt2.setString(14,grp);
		psmt2.setString(15,employType);
		psmt2.setString(16,emailID);
		psmt2.setString(17,reqMailID);
		psmt2.setString(18,intAcc);
		psmt2.setString(19,mobileOption);
		psmt2.setString(20,makeModel);
		psmt2.setString(21,onintune);
		psmt2.setString(22,mobileNo);
		psmt2.setString(23,imei1);
		psmt2.setString(24,imei2);
		psmt2.setString(25,emailRemarks);
		psmt2.setString(26,remarksDom);
		psmt2.setString(27,ITusername);
		psmt2.setString(28,ITpassword);
		psmt2.setString(29,ITremark);
		psmt2.setString(30,bioRemarks);
		psmt2.setString(31,bioRemark);
		psmt2.setString(32,sharedRemarks);
		psmt2.setString(33,shaRemark);
		psmt2.setString(34,internetReqType);
		psmt2.setString(35,internetRem);
		psmt2.setString(36,intRemark);
		psmt2.setString(37,reqBrCode);
		psmt2.setString(38,newinCode);
		psmt2.setString(39,newinsRequest);
		psmt2.setString(40,newRem);
		psmt2.setString(41,ITdcode);
		psmt2.setString(42,ITdpassword);
		psmt2.setString(43,ITdlevel);
		psmt2.setString(44,gname);
		psmt2.setString(45,accessbr);
		psmt2.setString(46,ITdremark);
		psmt2.setString(47,nexasCompCode);
		psmt2.setString(48,nexasCCName);
		psmt2.setString(49,costCCode);
		psmt2.setString(50,costOPRange);
		psmt2.setString(51,nexasReqType);
		psmt2.setString(52,nexasOptionalMenu);
		psmt2.setString(53,nexasRem);
		psmt2.setString(54,nexID);
		psmt2.setString(55,nexPass);
		psmt2.setString(56,nexRem);
		psmt2.setString(57,gsnetBranchCode);
		psmt2.setString(58,gsnetDivName);
		psmt2.setString(59,gsnetPrimaryDiv);
		psmt2.setString(60,gsnetUserRole);
		psmt2.setString(61,gsNetremarks);
		psmt2.setString(62,uCode);
		psmt2.setString(63,uPass);
		psmt2.setString(64,gsBCode1);
		psmt2.setString(65,gsDiv1);
		psmt2.setString(66,gsPri1);
		psmt2.setString(67,gsUser1);
		psmt2.setString(68,gsRem);
		psmt2.setString(69,internalApplication);
		psmt2.setString(70,internalRem);
		psmt2.setString(71,interName);
		psmt2.setString(72,interPass);
		psmt2.setString(73,interRem);
		psmt2.setString(74,usbAccessFor);
		psmt2.setString(75,dscNo);
		psmt2.setString(76,usbRem1);
		psmt2.setString(77,usbRem);
		psmt2.setString(78,domID);
		psmt2.setString(79,vpnEmail);
		psmt2.setString(80,vpnMPLS);
		psmt2.setString(81,forti);
		psmt2.setString(82,hardRemarks);
		psmt2.setString(83,hardRem);
		psmt2.setString(84,assetRemarks);
		psmt2.setString(85,assRem);
		psmt2.setString(86,progblok);
		psmt2.setString(87,progAll);
		psmt2.setString(88,passEmail);
		psmt2.setString(89,emailAppRemarks);
		psmt2.setString(90,simOption);
		psmt2.setString(91,simNo);
		psmt2.setString(92,passChan);
		psmt2.setString(93,changeBio);
		psmt2.setString(94,selBranch);
		psmt2.setString(95,project);
		psmt2.setString(96,warehouse);
		psmt2.setString(97,glowRemarks);
		psmt2.setString(98,glowID);
		psmt2.setString(99,glowPass);
		psmt2.setString(100,glowAppRemarks);
		psmt2.setString(101,changeNew);
		psmt2.setString(102,prevNewinBr);
		psmt2.setString(103,changeGS);
		psmt2.setString(104,changesGSNet);
		psmt2.setString(105,prevDivGSNet);
		psmt2.setString(106,prevPDivGSNet);
		psmt2.setString(107,prevRoleGSNet);
		psmt2.setString(108,emp_code);
			int jkk = psmt2.executeUpdate();

		}
		}catch(Exception e){
			out.println(e);
		}
	
	   message = mailMessageSub.getMailMessageAppFormSubmission(form_no.trim());
String mailingCheck[] = request.getParameterValues("mailingCheck");
if((SendExtraMails!="NULL")||(mmdradioBcc=="Yes"))
{ 
System.out.println("IF SendExtraMails in incident reported after attachment with CC :"+SendExtraMails);
String valuesbcc[] = SendExtraMails.split(",");
for(int v=0;v<valuesbcc.length;v++)
{
System.out.println("IF SendExtraMails ddddd :"+valuesbcc[v]);
} 
String CCList = "";
for (String	email: valuesbcc) 
{
if(!email.equals("")){	
CCList =  email  + "," +CCList ;
}
}
			  
CCList=ToMail+","+CCList;

String extraMail = "",extraMail1="";
ResultSet rsMail = st1.executeQuery("select emailID from neinappfinalmail");
while(rsMail.next()){
	extraMail = rsMail.getString(1)+",";
	extraMail1+=extraMail;
}

System.out.println("extraMail==>"+extraMail1);
CCList += extraMail1;

System.out.println("CCList :"+CCList);
postMail.sendMailCC(i_email_id,i_name,allMails,CCList," APPLICATION FORM :  " +form_no+ " ", "Your request for APPLICATION FORM "+form_no+" has been approved by " +i_name+ " <br><br><b><u> Open the following URL</u> </b><br>C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
}
}
else{	
psmt10 = cn2.prepareStatement("UPDATE neinapplicationform SET Approval_status=?,Approval_sttatuss=?,Approval_remarks=?,Approval_f_date=?,Approval_emp=?,Approval_desg=?,Approval_empp=?,Approval_desgg=? WHERE applicationNo=?");
psmt10.setString(1,mmdradio);
psmt10.setString(2,"Pending");
psmt10.setString(3,txtmail_msg);
psmt10.setDate(4,form_date);
psmt10.setString(5,emp);
psmt10.setString(6,desg);
psmt10.setString(7,i_name);
psmt10.setString(8,i_desg);
psmt10.setString(9,form_no);
	int b = psmt10.executeUpdate(); 
		 
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

message = mailMessage.getMailMessageAppForm(form_no.trim());
postMail.postMail(i_email_id,i_name,"pass1234",mail," APPLICATION FORM :  " +form_no+ " ",i_name+  " "+  "request you to Approve - APPLICATION FORM " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br>C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
}
}
else
{
if(progBlocked!=null){
for(int h=0;h<progBlocked.length;h++)
{
psmt4 = cn2.prepareStatement("INSERT INTO neinnewinsblocked(form_no,desg,name,proBlocked) VALUES(?,?,?,?)");
psmt4.setString(1,form_no);
psmt4.setString(2,i_desg);
psmt4.setString(3,i_name);
psmt4.setString(4,progBlocked[h]);
	int gg = psmt4.executeUpdate();
}
}

if(progAllowed!=null){
for(int l=0;l<progAllowed.length;l++)
{
psmt2 = cn2.prepareStatement("INSERT INTO neinnewinsallowed(form_no,desg,name,proAllowed) VALUES(?,?,?,?)");
psmt2.setString(1,form_no);
psmt2.setString(2,i_desg);
psmt2.setString(3,i_name);
psmt2.setString(4,progAllowed[l]);
	int hh = psmt2.executeUpdate();
}
}

psmt2 = cn2.prepareStatement("UPDATE neinapplicationform SET Approval_sttatuss=?,Approval_f_date=? WHERE applicationNo=?");
psmt2.setString(1,"Closed");
psmt2.setDate(2,form_date);
psmt2.setString(3,form_no);
	int j = psmt2.executeUpdate();


try{
psmt2 = cn2.prepareStatement("UPDATE neinapplicationform_requestfor SET domainAccount=?,domainPassword=?,domainAppRemarks=?,bioAppRemarks=?,sharedAppRemarks=?,internetAPPRemarks=?,newinsOPAppCode=?,newinsPassword=?,newinsLevel=?,newinsGroup=?,newinsAccessedBranches=?,newinsAppRemarks=?,nexasID=?,nexasPassword=?,nexasAppRemarks=?,gsnetCode=?,gsnetPassword=?,assignedGsnetBranch=?,assignedGsnetDivName=?,assignedGsnetPriDiv=?,assignedGsnetUserRole=?,gsnetAppRemarks=?,internalID=?,internalPassword=?,internalAppRemarks=?,usbAppRemarks=?,vpnFortiToken=?,hardPenAppRemarks=?,otherAssetAppRemarks=?,newinAllowed=?,newinBlocked=?,compProvSimCard=?,compProvSimNumber=?,emailPassword=?,emailAppRemarks=?,mailIDCreated=?,intuneAccessProvided=?,glowID=?,glowPass=?,glowAppRemarks=? WHERE app_no=?");
psmt2.setString(1,ITusername);
psmt2.setString(2,ITpassword);
psmt2.setString(3,ITremark);
psmt2.setString(4,bioRemark);
psmt2.setString(5,shaRemark);
psmt2.setString(6,intRemark);
psmt2.setString(7,ITdcode);
psmt2.setString(8,ITdpassword);
psmt2.setString(9,ITdlevel);
psmt2.setString(10,gname);
psmt2.setString(11,accessbr);
psmt2.setString(12,ITdremark);
psmt2.setString(13,nexID);
psmt2.setString(14,nexPass);
psmt2.setString(15,nexRem);
psmt2.setString(16,uCode);
psmt2.setString(17,uPass);
psmt2.setString(18,gsBCode1);
psmt2.setString(19,gsDiv1);
psmt2.setString(20,gsPri1);
psmt2.setString(21,gsUser1);
psmt2.setString(22,gsRem);
psmt2.setString(23,interName);
psmt2.setString(24,interPass);
psmt2.setString(25,interRem);
psmt2.setString(26,usbRem);
psmt2.setString(27,forti);
psmt2.setString(28,hardRem);
psmt2.setString(29,assRem);
psmt2.setString(30,progAll);
psmt2.setString(31,progblok);
psmt2.setString(32,simOption);
psmt2.setString(33,simNo);
psmt2.setString(34,passEmail);
psmt2.setString(35,emailAppRemarks);
psmt2.setString(36,emailID);
psmt2.setString(37,intAcc);
psmt2.setString(38,glowID);
psmt2.setString(39,glowPass);
psmt2.setString(40,glowAppRemarks);
psmt2.setString(41,form_no);
	int jj = psmt2.executeUpdate();


st1 = cn2.createStatement();
ResultSet rsmain = st1.executeQuery("select emplCode from neinapplicationformmain where emplCode='"+emp_code+"' and emplName like '%"+full_name+"%'");
if(!rsmain.next()){

psmt2 = cn2.prepareStatement("insert into neinapplicationformmain (emplCode,emplName,emplBranch,emplDept,emplDesg,emplRO,emplSOW,emplReqBy,emplType,emplConType,emplreqBranch,emplreqFor,emailDomain,group_name,employeeType,mailIDCreated,reqMailID,intuneAccessProvided,CompanyProvMobile,makeAndModel,mobIntune,mobileNo,imei1,imei2,emailRemarks,domainRemarks,domainAccount,domainPassword,domainAppRemarks,bioRemarks,bioAppRemarks,folderRemarks,sharedAppRemarks,internetReqType,internetRemarks,internetAPPRemarks,newinsBranchCode,newinsOpCode,newinsRequest,newinsRemarks,newinsOPAppCode,newinsPassword,newinsLevel,newinsGroup,newinsAccessedBranches,newinsAppRemarks,nexasCompCode,nexasCCName,nexasCCCode,nexasOPRange,nexasReqType,nexasOptionalMenu,nexasRemarks,nexasID,nexasPassword,nexasAppRemarks,gsnetBranchCode,gsnetDivName,gsnetPrimaryDiv,gsnetUserRole,gsnetRemarks,gsnetCode,gsnetPassword,assignedGsnetBranch,assignedGsnetDivName,assignedGsnetPriDiv,assignedGsnetUserRole,gsnetAppRemarks,internalApplication,internalRemarks,internalID,internalPassword,internalAppRemarks,usbAccessFor,usbDetails,usbRemarks,usbAppRemarks,vpnDomainID,vpnEmailID,vpnMPLS,vpnFortiToken,hardPenRemarks,hardPenAppRemarks,otherAssetRemarks,otherAssetAppRemarks,newinProgBlocked,newinProgAllowed,emailPassword,emailAppRemarks,comProvSim,comProvimNumber,passReset,changeBio,selBioBranches,glowProject,glowWarehouse,glowRemarks,glowID,glowPass,glowAppRemarks,changesNewin,prevoiusSelBranchesNewins,changesGSNET,prevGSNETBRcodes,prevGSNETDivcodes,prevGSNETPDivcodes,prevGSNETRoles) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
psmt2.setString(1,emp_code);
psmt2.setString(2,full_name);
psmt2.setString(3,branch);
psmt2.setString(4,depart);
psmt2.setString(5,designation);
psmt2.setString(6,r_officer);
psmt2.setString(7,sow);
psmt2.setString(8,reqBy);
psmt2.setString(9,emplType);
psmt2.setString(10,emplCont);
psmt2.setString(11,requestBranch);
psmt2.setString(12,requestFor_change);
psmt2.setString(13,emailDom);
psmt2.setString(14,grp);
psmt2.setString(15,employType);
psmt2.setString(16,emailID);
psmt2.setString(17,reqMailID);
psmt2.setString(18,intAcc);
psmt2.setString(19,mobileOption);
psmt2.setString(20,makeModel);
psmt2.setString(21,onintune);
psmt2.setString(22,mobileNo);
psmt2.setString(23,imei1);
psmt2.setString(24,imei2);
psmt2.setString(25,emailRemarks);
psmt2.setString(26,remarksDom);
psmt2.setString(27,ITusername);
psmt2.setString(28,ITpassword);
psmt2.setString(29,ITremark);
psmt2.setString(30,bioRemarks);
psmt2.setString(31,bioRemark);
psmt2.setString(32,sharedRemarks);
psmt2.setString(33,shaRemark);
psmt2.setString(34,internetReqType);
psmt2.setString(35,internetRem);
psmt2.setString(36,intRemark);
psmt2.setString(37,reqBrCode);
psmt2.setString(38,newinCode);
psmt2.setString(39,newinsRequest);
psmt2.setString(40,newRem);
psmt2.setString(41,ITdcode);
psmt2.setString(42,ITdpassword);
psmt2.setString(43,ITdlevel);
psmt2.setString(44,gname);
psmt2.setString(45,accessbr);
psmt2.setString(46,ITdremark);
psmt2.setString(47,nexasCompCode);
psmt2.setString(48,nexasCCName);
psmt2.setString(49,costCCode);
psmt2.setString(50,costOPRange);
psmt2.setString(51,nexasReqType);
psmt2.setString(52,nexasOptionalMenu);
psmt2.setString(53,nexasRem);
psmt2.setString(54,nexID);
psmt2.setString(55,nexPass);
psmt2.setString(56,nexRem);
psmt2.setString(57,gsnetBranchCode);
psmt2.setString(58,gsnetDivName);
psmt2.setString(59,gsnetPrimaryDiv);
psmt2.setString(60,gsnetUserRole);
psmt2.setString(61,gsNetremarks);
psmt2.setString(62,uCode);
psmt2.setString(63,uPass);
psmt2.setString(64,gsBCode1);
psmt2.setString(65,gsDiv1);
psmt2.setString(66,gsPri1);
psmt2.setString(67,gsUser1);
psmt2.setString(68,gsRem);
psmt2.setString(69,internalApplication);
psmt2.setString(70,internalRem);
psmt2.setString(71,interName);
psmt2.setString(72,interPass);
psmt2.setString(73,interRem);
psmt2.setString(74,usbAccessFor);
psmt2.setString(75,dscNo);
psmt2.setString(76,usbRem1);
psmt2.setString(77,usbRem);
psmt2.setString(78,domID);
psmt2.setString(79,vpnEmail);
psmt2.setString(80,vpnMPLS);
psmt2.setString(81,forti);
psmt2.setString(82,hardRemarks);
psmt2.setString(83,hardRem);
psmt2.setString(84,assetRemarks);
psmt2.setString(85,assRem);
psmt2.setString(86,progblok);
psmt2.setString(87,progAll);
psmt2.setString(88,passEmail);
psmt2.setString(89,emailAppRemarks);
psmt2.setString(90,simOption);
psmt2.setString(91,simNo);
psmt2.setString(92,passChan);
psmt2.setString(93,changeBio);
psmt2.setString(94,selBranch);
psmt2.setString(95,project);
psmt2.setString(96,warehouse);
psmt2.setString(97,glowRemarks);
psmt2.setString(98,glowID);
psmt2.setString(99,glowPass);
psmt2.setString(100,glowAppRemarks);
psmt2.setString(101,changeNew);
psmt2.setString(102,prevNewinBr);
psmt2.setString(103,changeGS);
psmt2.setString(104,changesGSNet);
psmt2.setString(105,prevDivGSNet);
psmt2.setString(106,prevPDivGSNet);
psmt2.setString(107,prevRoleGSNet);
	int jjj = psmt2.executeUpdate();

}else{

psmt2 = cn2.prepareStatement("UPDATE neinapplicationformmain SET emplCode=?,emplName=?,emplBranch=?,emplDept=?,emplDesg=?,emplRO=?,emplSOW=?,emplReqBy=?,emplType=?,emplConType=?,emplreqBranch=?,emplreqFor=?,emailDomain=?,group_name=?,employeeType=?,mailIDCreated=?,reqMailID=?,intuneAccessProvided=?,CompanyProvMobile=?,makeAndModel=?,mobIntune=?,mobileNo=?,imei1=?,imei2=?,emailRemarks=?,domainRemarks=?,domainAccount=?,domainPassword=?,domainAppRemarks=?,bioRemarks=?,bioAppRemarks=?,folderRemarks=?,sharedAppRemarks=?,internetReqType=?,internetRemarks=?,internetAPPRemarks=?,newinsBranchCode=?,newinsOpCode=?,newinsRequest=?,newinsRemarks=?,newinsOPAppCode=?,newinsPassword=?,newinsLevel=?,newinsGroup=?,newinsAccessedBranches=?,newinsAppRemarks=?,nexasCompCode=?,nexasCCName=?,nexasCCCode=?,nexasOPRange=?,nexasReqType=?,nexasOptionalMenu=?,nexasRemarks=?,nexasID=?,nexasPassword=?,nexasAppRemarks=?,gsnetBranchCode=?,gsnetDivName=?,gsnetPrimaryDiv=?,gsnetUserRole=?,gsnetRemarks=?,gsnetCode=?,gsnetPassword=?,assignedGsnetBranch=?,assignedGsnetDivName=?,assignedGsnetPriDiv=?,assignedGsnetUserRole=?,gsnetAppRemarks=?,internalApplication=?,internalRemarks=?,internalID=?,internalPassword=?,internalAppRemarks=?,usbAccessFor=?,usbDetails=?,usbRemarks=?,usbAppRemarks=?,vpnDomainID=?,vpnEmailID=?,vpnMPLS=?,vpnFortiToken=?,hardPenRemarks=?,hardPenAppRemarks=?,otherAssetRemarks=?,otherAssetAppRemarks=?,newinProgBlocked=?,newinProgAllowed=?,emailPassword=?,emailAppRemarks=?,comProvSim=?,comProvimNumber=?,passReset=?,changeBio=?,selBioBranches=?,glowProject=?,glowWarehouse=?,glowRemarks=?,glowID=?,glowPass=?,glowAppRemarks=?,changesNewin=?,prevoiusSelBranchesNewins=?,changesGSNET=?,prevGSNETBRcodes=?,prevGSNETDivcodes=?,prevGSNETPDivcodes=?,prevGSNETRoles=? WHERE emplCode=? and emplName like '%"+full_name+"%'");
psmt2.setString(1,emp_code);
psmt2.setString(2,full_name);
psmt2.setString(3,branch);
psmt2.setString(4,depart);
psmt2.setString(5,designation);
psmt2.setString(6,r_officer);
psmt2.setString(7,sow);
psmt2.setString(8,reqBy);
psmt2.setString(9,emplType);
psmt2.setString(10,emplCont);
psmt2.setString(11,requestBranch);
psmt2.setString(12,requestFor_change);
psmt2.setString(13,emailDom);
psmt2.setString(14,grp);
psmt2.setString(15,employType);
psmt2.setString(16,emailID);
psmt2.setString(17,reqMailID);
psmt2.setString(18,intAcc);
psmt2.setString(19,mobileOption);
psmt2.setString(20,makeModel);
psmt2.setString(21,onintune);
psmt2.setString(22,mobileNo);
psmt2.setString(23,imei1);
psmt2.setString(24,imei2);
psmt2.setString(25,emailRemarks);
psmt2.setString(26,remarksDom);
psmt2.setString(27,ITusername);
psmt2.setString(28,ITpassword);
psmt2.setString(29,ITremark);
psmt2.setString(30,bioRemarks);
psmt2.setString(31,bioRemark);
psmt2.setString(32,sharedRemarks);
psmt2.setString(33,shaRemark);
psmt2.setString(34,internetReqType);
psmt2.setString(35,internetRem);
psmt2.setString(36,intRemark);
psmt2.setString(37,reqBrCode);
psmt2.setString(38,newinCode);
psmt2.setString(39,newinsRequest);
psmt2.setString(40,newRem);
psmt2.setString(41,ITdcode);
psmt2.setString(42,ITdpassword);
psmt2.setString(43,ITdlevel);
psmt2.setString(44,gname);
psmt2.setString(45,accessbr);
psmt2.setString(46,ITdremark);
psmt2.setString(47,nexasCompCode);
psmt2.setString(48,nexasCCName);
psmt2.setString(49,costCCode);
psmt2.setString(50,costOPRange);
psmt2.setString(51,nexasReqType);
psmt2.setString(52,nexasOptionalMenu);
psmt2.setString(53,nexasRem);
psmt2.setString(54,nexID);
psmt2.setString(55,nexPass);
psmt2.setString(56,nexRem);
psmt2.setString(57,gsnetBranchCode);
psmt2.setString(58,gsnetDivName);
psmt2.setString(59,gsnetPrimaryDiv);
psmt2.setString(60,gsnetUserRole);
psmt2.setString(61,gsNetremarks);
psmt2.setString(62,uCode);
psmt2.setString(63,uPass);
psmt2.setString(64,gsBCode1);
psmt2.setString(65,gsDiv1);
psmt2.setString(66,gsPri1);
psmt2.setString(67,gsUser1);
psmt2.setString(68,gsRem);
psmt2.setString(69,internalApplication);
psmt2.setString(70,internalRem);
psmt2.setString(71,interName);
psmt2.setString(72,interPass);
psmt2.setString(73,interRem);
psmt2.setString(74,usbAccessFor);
psmt2.setString(75,dscNo);
psmt2.setString(76,usbRem1);
psmt2.setString(77,usbRem);
psmt2.setString(78,domID);
psmt2.setString(79,vpnEmail);
psmt2.setString(80,vpnMPLS);
psmt2.setString(81,forti);
psmt2.setString(82,hardRemarks);
psmt2.setString(83,hardRem);
psmt2.setString(84,assetRemarks);
psmt2.setString(85,assRem);
psmt2.setString(86,progblok);
psmt2.setString(87,progAll);
psmt2.setString(88,passEmail);
psmt2.setString(89,emailAppRemarks);
psmt2.setString(90,simOption);
psmt2.setString(91,simNo);
psmt2.setString(92,passChan);
psmt2.setString(93,changeBio);
psmt2.setString(94,selBranch);
psmt2.setString(95,project);
psmt2.setString(96,warehouse);
psmt2.setString(97,glowRemarks);
psmt2.setString(98,glowID);
psmt2.setString(99,glowPass);
psmt2.setString(100,glowAppRemarks);
psmt2.setString(101,changeNew);
psmt2.setString(102,prevNewinBr);
psmt2.setString(103,changeGS);
psmt2.setString(104,changesGSNet);
psmt2.setString(105,prevDivGSNet);
psmt2.setString(106,prevPDivGSNet);
psmt2.setString(107,prevRoleGSNet);
psmt2.setString(108,emp_code);
	int jjj = psmt2.executeUpdate();

}
}catch(Exception e){
	out.println("here im====>"+e);
}

message = mailMessageSub.getMailMessageAppFormSubmission(form_no.trim());

String mailingCheck[] = request.getParameterValues("mailingCheck");
if((SendExtraMails!="NULL")||(mmdradioBcc=="Yes"))
{ 
System.out.println("IF SendExtraMails in incident reported after attachment with CC :"+SendExtraMails);
String valuesbcc[] = SendExtraMails.split(",");
for(int v=0;v<valuesbcc.length;v++)
{
System.out.println("IF SendExtraMails ddddd :"+valuesbcc[v]);
} 
String CCList = "";
for (String	email: valuesbcc) 
{
	if(!email.equals("")){
		CCList =  email  + "," +CCList ;
	}
}
System.out.println("CCList222222222 :"+CCList);

CCList=ToMail+","+CCList;

String extraMail = "",extraMail1="";
ResultSet rsMail = st1.executeQuery("select emailID from neinappfinalmail");
while(rsMail.next()){
	extraMail = rsMail.getString(1)+",";
	extraMail1+=extraMail;
}

CCList += extraMail1;

System.out.println("CCList 2 :"+CCList);
postMail.sendMailCC(i_email_id,i_name,allMails,CCList," APPLICATION FORM :  " +form_no+ " ", "Your request for APPLICATION FORM "+form_no+" has been approved by " +i_name+ " <br><br><b><u> Open the following URL</u> </b><br>C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
}
}
}
else
{
String allMails1="";
psmt4 = cn2.prepareStatement("SELECT mail,emp FROM neinapplicationform_item WHERE form2_no=?");
psmt4.setString(1,form_no);
	
message = mailMessage.getMailMessageAppForm(form_no.trim());
ResultSet rs1 = psmt4.executeQuery();
while(rs1.next())
{
allMails1 += rs1.getString(1)+",";
}
postMail.postMail(i_email_id,i_name,"pass1234",allMails1," APPLICATION FORM :  " +form_no+ " ", "Your request for APPLICATION FORM "+form_no+" Is NOT Approved by " +i_name+ " <br>Remarks : "+txtmail_msg+"<br><b><u> Open the following URL</u> </b><br>C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
}
message = null;
msg = "APPLICATION__FORM__SAVED__AND__SENT__SUCCESSFULLY";
System.out.println("result..date..........."+form_date);
	response.sendRedirect("../../adminHR.jsp?msg=" +msg);
}
catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(rs,st1,conn);
	DbUtil.closeDBResources(null,st2,conn1);
	DbUtil.closeDBResources(null,st3,cn2);
	DbUtil.closeDBResources(null,st4,null);
	DbUtil.closeDBResources(null,st5,null);
	DbUtil.closeDBResources(null,st6,null);
	DbUtil.closeDBResources(null,st7,null);
	DbUtil.closeDBResources(null,st8,null);
	DbUtil.closeDBResources(null,st9,null);
	DbUtil.closeDBResources(null,st11,null);
	DbUtil.closeDBResources(null,psmt,null);
	DbUtil.closeDBResources(null,psmt2,null);
	DbUtil.closeDBResources(null,psmt3,null);
 }
}
%>
</html>