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
Connection cn2=null; 
Statement st1=null;
ResultSet rs = null;
String message = null;
%>
<%	              

String empnoSession = (String) session.getAttribute("EmpNo");

session.setMaxInactiveInterval(20*60);
if(session==null||session.getAttribute("Nname")==null||session.getAttribute("city")==null||session.getAttribute("admin")==null||session.getAttribute("b_no")==null||session.getAttribute("b_no")=="null")
{	
	String msg2=null;
	msg2="Session__Time__Out \\n __ __ Login__Again";
	response.sendRedirect("../../adminlinkHR.jsp?msg="+msg2);
}else{

cn2 = con.getConnection2();
PreparedStatement psmt=null,psmt2=null,psmt3=null,psmt4=null,psmt5=null,psmt6=null,psmt7=null,psmt8=null,psmt9=null,psmt10=null,psmt11=null,psmtt=null;

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
String mailingCheckClarificationStart = request.getParameter("mailingCheckClarificationStart");
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

psmt = cn2.prepareStatement("UPDATE neinapplicationform_item SET clarifyCol=? WHERE form2_no=?");
psmt.setString(1,"0");
psmt.setString(2,form_no);
int ii = psmt.executeUpdate();

psmt3 = cn2.prepareStatement("UPDATE neinapplicationform_item SET status=?,remarks=?,presence=? WHERE form2_no=? and presence='now'");
psmt3.setString(1,mmdradio);
psmt3.setString(2,txtmail_msg);
psmt3.setString(3,"over");
psmt3.setString(4,form_no);
	int i = psmt3.executeUpdate();


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

psmt11 = cn2.prepareStatement("UPDATE neinapplicationform SET Approval_status=?,Approval_sttatuss=?,Approval_remarks=?,Approval_f_date=?,Approval_emp=?,Approval_desg=?,Approval_empp=?,Approval_desgg=? WHERE applicationNo=?");
psmt11.setString(1,mmdradio);
psmt11.setString(2,"Pending");
psmt11.setString(3,txtmail_msg);
psmt11.setDate(4,form_date);
psmt11.setString(5,emp);
psmt11.setString(6,desg);
psmt11.setString(7,i_name);
psmt11.setString(8,i_desg);
psmt11.setString(9,form_no);
	int b = psmt11.executeUpdate(); 

psmt5 = cn2.prepareStatement("INSERT INTO neinapplicationform_item(form2_no,desg,emp,status,remarks,f_date,mail,presence,empid,levelno) VALUES(?,?,?,?,?,?,?,?,?,?)");
psmt5.setString(1,form_no);
psmt5.setString(2,desg);
psmt5.setString(3,emp);
psmt5.setString(4,"Pending");
psmt5.setString(5,"Pending");
psmt5.setDate(6,form_date);
psmt5.setString(7,mail);
psmt5.setString(8,"now");
psmt5.setString(9,empid);
psmt5.setString(10,levelno);
	int j = psmt5.executeUpdate();

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
	
psmt6 = cn2.prepareStatement("UPDATE neinapplicationform SET Approval_sttatuss=?,Approval_f_date=? WHERE applicationNo=?");
psmt6.setString(1,"Closed");
psmt6.setDate(2,form_date);
psmt6.setString(3,form_no);
	int j = psmt6.executeUpdate();


try{
psmt7 = cn2.prepareStatement("UPDATE neinapplicationform_requestfor SET domainAccount=?,domainPassword=?,domainAppRemarks=?,bioAppRemarks=?,sharedAppRemarks=?,internetAPPRemarks=?,newinsOPAppCode=?,newinsPassword=?,newinsLevel=?,newinsGroup=?,newinsAccessedBranches=?,newinsAppRemarks=?,nexasID=?,nexasPassword=?,nexasAppRemarks=?,gsnetCode=?,gsnetPassword=?,assignedGsnetBranch=?,assignedGsnetDivName=?,assignedGsnetPriDiv=?,assignedGsnetUserRole=?,gsnetAppRemarks=?,internalID=?,internalPassword=?,internalAppRemarks=?,usbAppRemarks=?,vpnFortiToken=?,hardPenAppRemarks=?,otherAssetAppRemarks=?,newinAllowed=?,newinBlocked=?,compProvSimCard=?,compProvSimNumber=?,emailPassword=?,emailAppRemarks=?,mailIDCreated=?,intuneAccessProvided=?,glowID=?,glowPass=?,glowAppRemarks=? WHERE app_no=?");
psmt7.setString(1,ITusername);
psmt7.setString(2,ITpassword);
psmt7.setString(3,ITremark);
psmt7.setString(4,bioRemark);
psmt7.setString(5,shaRemark);
psmt7.setString(6,intRemark);
psmt7.setString(7,ITdcode);
psmt7.setString(8,ITdpassword);
psmt7.setString(9,ITdlevel);
psmt7.setString(10,gname);
psmt7.setString(11,accessbr);
psmt7.setString(12,ITdremark);
psmt7.setString(13,nexID);
psmt7.setString(14,nexPass);
psmt7.setString(15,nexRem);
psmt7.setString(16,uCode);
psmt7.setString(17,uPass);
psmt7.setString(18,gsBCode1);
psmt7.setString(19,gsDiv1);
psmt7.setString(20,gsPri1);
psmt7.setString(21,gsUser1);
psmt7.setString(22,gsRem);
psmt7.setString(23,interName);
psmt7.setString(24,interPass);
psmt7.setString(25,interRem);
psmt7.setString(26,usbRem);
psmt7.setString(27,forti);
psmt7.setString(28,hardRem);
psmt7.setString(29,assRem);
psmt7.setString(30,progAll);
psmt7.setString(31,progblok);
psmt7.setString(32,simOption);
psmt7.setString(33,simNo);
psmt7.setString(34,passEmail);
psmt7.setString(35,emailAppRemarks);
psmt7.setString(36,emailID);
psmt7.setString(37,intAcc);
psmt7.setString(38,glowID);
psmt7.setString(39,glowPass);
psmt7.setString(40,glowAppRemarks);
psmt7.setString(41,form_no);
	int jk = psmt7.executeUpdate();

st1 = cn2.createStatement();
ResultSet rsmain = st1.executeQuery("select emplCode from neinapplicationformmain where emplCode='"+emp_code+"' and emplName like '%"+full_name+"%'");
if(!rsmain.next()){

psmt8 = cn2.prepareStatement("insert into neinapplicationformmain (emplCode,emplName,emplBranch,emplDept,emplDesg,emplRO,emplSOW,emplReqBy,emplType,emplConType,emplreqBranch,emplreqFor,emailDomain,group_name,employeeType,mailIDCreated,reqMailID,intuneAccessProvided,CompanyProvMobile,makeAndModel,mobIntune,mobileNo,imei1,imei2,emailRemarks,domainRemarks,domainAccount,domainPassword,domainAppRemarks,bioRemarks,bioAppRemarks,folderRemarks,sharedAppRemarks,internetReqType,internetRemarks,internetAPPRemarks,newinsBranchCode,newinsOpCode,newinsRequest,newinsRemarks,newinsOPAppCode,newinsPassword,newinsLevel,newinsGroup,newinsAccessedBranches,newinsAppRemarks,nexasCompCode,nexasCCName,nexasCCCode,nexasOPRange,nexasReqType,nexasOptionalMenu,nexasRemarks,nexasID,nexasPassword,nexasAppRemarks,gsnetBranchCode,gsnetDivName,gsnetPrimaryDiv,gsnetUserRole,gsnetRemarks,gsnetCode,gsnetPassword,assignedGsnetBranch,assignedGsnetDivName,assignedGsnetPriDiv,assignedGsnetUserRole,gsnetAppRemarks,internalApplication,internalRemarks,internalID,internalPassword,internalAppRemarks,usbAccessFor,usbDetails,usbRemarks,usbAppRemarks,vpnDomainID,vpnEmailID,vpnMPLS,vpnFortiToken,hardPenRemarks,hardPenAppRemarks,otherAssetRemarks,otherAssetAppRemarks,newinProgBlocked,newinProgAllowed,emailPassword,emailAppRemarks,comProvSim,comProvimNumber,passReset,changeBio,selBioBranches,glowProject,glowWarehouse,glowRemarks,glowID,glowPass,glowAppRemarks,changesNewin,prevoiusSelBranchesNewins,changesGSNET,prevGSNETBRcodes,prevGSNETDivcodes,prevGSNETPDivcodes,prevGSNETRoles) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		psmt8.setString(1,emp_code);
		psmt8.setString(2,full_name);
		psmt8.setString(3,branch);
		psmt8.setString(4,depart);
		psmt8.setString(5,designation);
		psmt8.setString(6,r_officer);
		psmt8.setString(7,sow);
		psmt8.setString(8,reqBy);
		psmt8.setString(9,emplType);
		psmt8.setString(10,emplCont);
		psmt8.setString(11,requestBranch);
		psmt8.setString(12,requestFor_change);
		psmt8.setString(13,emailDom);
		psmt8.setString(14,grp);
		psmt8.setString(15,employType);
		psmt8.setString(16,emailID);
		psmt8.setString(17,reqMailID);
		psmt8.setString(18,intAcc);
		psmt8.setString(19,mobileOption);
		psmt8.setString(20,makeModel);
		psmt8.setString(21,onintune);
		psmt8.setString(22,mobileNo);
		psmt8.setString(23,imei1);
		psmt8.setString(24,imei2);
		psmt8.setString(25,emailRemarks);
		psmt8.setString(26,remarksDom);
		psmt8.setString(27,ITusername);
		psmt8.setString(28,ITpassword);
		psmt8.setString(29,ITremark);
		psmt8.setString(30,bioRemarks);
		psmt8.setString(31,bioRemark);
		psmt8.setString(32,sharedRemarks);
		psmt8.setString(33,shaRemark);
		psmt8.setString(34,internetReqType);
		psmt8.setString(35,internetRem);
		psmt8.setString(36,intRemark);
		psmt8.setString(37,reqBrCode);
		psmt8.setString(38,newinCode);
		psmt8.setString(39,newinsRequest);
		psmt8.setString(40,newRem);
		psmt8.setString(41,ITdcode);
		psmt8.setString(42,ITdpassword);
		psmt8.setString(43,ITdlevel);
		psmt8.setString(44,gname);
		psmt8.setString(45,accessbr);
		psmt8.setString(46,ITdremark);
		psmt8.setString(47,nexasCompCode);
		psmt8.setString(48,nexasCCName);
		psmt8.setString(49,costCCode);
		psmt8.setString(50,costOPRange);
		psmt8.setString(51,nexasReqType);
		psmt8.setString(52,nexasOptionalMenu);
		psmt8.setString(53,nexasRem);
		psmt8.setString(54,nexID);
		psmt8.setString(55,nexPass);
		psmt8.setString(56,nexRem);
		psmt8.setString(57,gsnetBranchCode);
		psmt8.setString(58,gsnetDivName);
		psmt8.setString(59,gsnetPrimaryDiv);
		psmt8.setString(60,gsnetUserRole);
		psmt8.setString(61,gsNetremarks);
		psmt8.setString(62,uCode);
		psmt8.setString(63,uPass);
		psmt8.setString(64,gsBCode1);
		psmt8.setString(65,gsDiv1);
		psmt8.setString(66,gsPri1);
		psmt8.setString(67,gsUser1);
		psmt8.setString(68,gsRem);
		psmt8.setString(69,internalApplication);
		psmt8.setString(70,internalRem);
		psmt8.setString(71,interName);
		psmt8.setString(72,interPass);
		psmt8.setString(73,interRem);
		psmt8.setString(74,usbAccessFor);
		psmt8.setString(75,dscNo);
		psmt8.setString(76,usbRem1);
		psmt8.setString(77,usbRem);
		psmt8.setString(78,domID);
		psmt8.setString(79,vpnEmail);
		psmt8.setString(80,vpnMPLS);
		psmt8.setString(81,forti);
		psmt8.setString(82,hardRemarks);
		psmt8.setString(83,hardRem);
		psmt8.setString(84,assetRemarks);
		psmt8.setString(85,assRem);
		psmt8.setString(86,progblok);
		psmt8.setString(87,progAll);
		psmt8.setString(88,passEmail);
		psmt8.setString(89,emailAppRemarks);
		psmt8.setString(90,simOption);
		psmt8.setString(91,simNo);
		psmt8.setString(92,passChan);
		psmt8.setString(93,changeBio);
		psmt8.setString(94,selBranch);
		psmt8.setString(95,project);
		psmt8.setString(96,warehouse);
		psmt8.setString(97,glowRemarks);
		psmt8.setString(98,glowID);
		psmt8.setString(99,glowPass);
		psmt8.setString(100,glowAppRemarks);
		psmt8.setString(101,changeNew);
		psmt8.setString(102,prevNewinBr);
		psmt8.setString(103,changeGS);
		psmt8.setString(104,changesGSNet);
		psmt8.setString(105,prevDivGSNet);
		psmt8.setString(106,prevPDivGSNet);
		psmt8.setString(107,prevRoleGSNet);
			int jkk = psmt8.executeUpdate();

		}else{

psmt8 = cn2.prepareStatement("UPDATE neinapplicationformmain SET emplCode=?,emplName=?,emplBranch=?,emplDept=?,emplDesg=?,emplRO=?,emplSOW=?,emplReqBy=?,emplType=?,emplConType=?,emplreqBranch=?,emplreqFor=?,emailDomain=?,group_name=?,employeeType=?,mailIDCreated=?,reqMailID=?,intuneAccessProvided=?,CompanyProvMobile=?,makeAndModel=?,mobIntune=?,mobileNo=?,imei1=?,imei2=?,emailRemarks=?,domainRemarks=?,domainAccount=?,domainPassword=?,domainAppRemarks=?,bioRemarks=?,bioAppRemarks=?,folderRemarks=?,sharedAppRemarks=?,internetReqType=?,internetRemarks=?,internetAPPRemarks=?,newinsBranchCode=?,newinsOpCode=?,newinsRequest=?,newinsRemarks=?,newinsOPAppCode=?,newinsPassword=?,newinsLevel=?,newinsGroup=?,newinsAccessedBranches=?,newinsAppRemarks=?,nexasCompCode=?,nexasCCName=?,nexasCCCode=?,nexasOPRange=?,nexasReqType=?,nexasOptionalMenu=?,nexasRemarks=?,nexasID=?,nexasPassword=?,nexasAppRemarks=?,gsnetBranchCode=?,gsnetDivName=?,gsnetPrimaryDiv=?,gsnetUserRole=?,gsnetRemarks=?,gsnetCode=?,gsnetPassword=?,assignedGsnetBranch=?,assignedGsnetDivName=?,assignedGsnetPriDiv=?,assignedGsnetUserRole=?,gsnetAppRemarks=?,internalApplication=?,internalRemarks=?,internalID=?,internalPassword=?,internalAppRemarks=?,usbAccessFor=?,usbDetails=?,usbRemarks=?,usbAppRemarks=?,vpnDomainID=?,vpnEmailID=?,vpnMPLS=?,vpnFortiToken=?,hardPenRemarks=?,hardPenAppRemarks=?,otherAssetRemarks=?,otherAssetAppRemarks=?,newinProgBlocked=?,newinProgAllowed=?,emailPassword=?,emailAppRemarks=?,comProvSim=?,comProvimNumber=?,passReset=?,changeBio=?,selBioBranches=?,glowProject=?,glowWarehouse=?,glowRemarks=?,glowID=?,glowPass=?,glowAppRemarks=?,changesNewin=?,prevoiusSelBranchesNewins=?,changesGSNET=?,prevGSNETBRcodes=?,prevGSNETDivcodes=?,prevGSNETPDivcodes=?,prevGSNETRoles=? WHERE emplCode=? and emplName like '%"+full_name+"%'");
		psmt8.setString(1,emp_code);
		psmt8.setString(2,full_name);
		psmt8.setString(3,branch);
		psmt8.setString(4,depart);
		psmt8.setString(5,designation);
		psmt8.setString(6,r_officer);
		psmt8.setString(7,sow);
		psmt8.setString(8,reqBy);
		psmt8.setString(9,emplType);
		psmt8.setString(10,emplCont);
		psmt8.setString(11,requestBranch);
		psmt8.setString(12,requestFor_change);
		psmt8.setString(13,emailDom);
		psmt8.setString(14,grp);
		psmt8.setString(15,employType);
		psmt8.setString(16,emailID);
		psmt8.setString(17,reqMailID);
		psmt8.setString(18,intAcc);
		psmt8.setString(19,mobileOption);
		psmt8.setString(20,makeModel);
		psmt8.setString(21,onintune);
		psmt8.setString(22,mobileNo);
		psmt8.setString(23,imei1);
		psmt8.setString(24,imei2);
		psmt8.setString(25,emailRemarks);
		psmt8.setString(26,remarksDom);
		psmt8.setString(27,ITusername);
		psmt8.setString(28,ITpassword);
		psmt8.setString(29,ITremark);
		psmt8.setString(30,bioRemarks);
		psmt8.setString(31,bioRemark);
		psmt8.setString(32,sharedRemarks);
		psmt8.setString(33,shaRemark);
		psmt8.setString(34,internetReqType);
		psmt8.setString(35,internetRem);
		psmt8.setString(36,intRemark);
		psmt8.setString(37,reqBrCode);
		psmt8.setString(38,newinCode);
		psmt8.setString(39,newinsRequest);
		psmt8.setString(40,newRem);
		psmt8.setString(41,ITdcode);
		psmt8.setString(42,ITdpassword);
		psmt8.setString(43,ITdlevel);
		psmt8.setString(44,gname);
		psmt8.setString(45,accessbr);
		psmt8.setString(46,ITdremark);
		psmt8.setString(47,nexasCompCode);
		psmt8.setString(48,nexasCCName);
		psmt8.setString(49,costCCode);
		psmt8.setString(50,costOPRange);
		psmt8.setString(51,nexasReqType);
		psmt8.setString(52,nexasOptionalMenu);
		psmt8.setString(53,nexasRem);
		psmt8.setString(54,nexID);
		psmt8.setString(55,nexPass);
		psmt8.setString(56,nexRem);
		psmt8.setString(57,gsnetBranchCode);
		psmt8.setString(58,gsnetDivName);
		psmt8.setString(59,gsnetPrimaryDiv);
		psmt8.setString(60,gsnetUserRole);
		psmt8.setString(61,gsNetremarks);
		psmt8.setString(62,uCode);
		psmt8.setString(63,uPass);
		psmt8.setString(64,gsBCode1);
		psmt8.setString(65,gsDiv1);
		psmt8.setString(66,gsPri1);
		psmt8.setString(67,gsUser1);
		psmt8.setString(68,gsRem);
		psmt8.setString(69,internalApplication);
		psmt8.setString(70,internalRem);
		psmt8.setString(71,interName);
		psmt8.setString(72,interPass);
		psmt8.setString(73,interRem);
		psmt8.setString(74,usbAccessFor);
		psmt8.setString(75,dscNo);
		psmt8.setString(76,usbRem1);
		psmt8.setString(77,usbRem);
		psmt8.setString(78,domID);
		psmt8.setString(79,vpnEmail);
		psmt8.setString(80,vpnMPLS);
		psmt8.setString(81,forti);
		psmt8.setString(82,hardRemarks);
		psmt8.setString(83,hardRem);
		psmt8.setString(84,assetRemarks);
		psmt8.setString(85,assRem);
		psmt8.setString(86,progblok);
		psmt8.setString(87,progAll);
		psmt8.setString(88,passEmail);
		psmt8.setString(89,emailAppRemarks);
		psmt8.setString(90,simOption);
		psmt8.setString(91,simNo);
		psmt8.setString(92,passChan);
		psmt8.setString(93,changeBio);
		psmt8.setString(94,selBranch);
		psmt8.setString(95,project);
		psmt8.setString(96,warehouse);
		psmt8.setString(97,glowRemarks);
		psmt8.setString(98,glowID);
		psmt8.setString(99,glowPass);
		psmt8.setString(100,glowAppRemarks);
		psmt8.setString(101,changeNew);
		psmt8.setString(102,prevNewinBr);
		psmt8.setString(103,changeGS);
		psmt8.setString(104,changesGSNet);
		psmt8.setString(105,prevDivGSNet);
		psmt8.setString(106,prevPDivGSNet);
		psmt8.setString(107,prevRoleGSNet);
		psmt8.setString(108,emp_code);
			int jkk = psmt8.executeUpdate();

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
		 
psmt9 = cn2.prepareStatement("INSERT INTO neinapplicationform_item(form2_no,desg,emp,status,remarks,f_date,mail,presence,empid,levelno) VALUES(?,?,?,?,?,?,?,?,?,?)");
psmt9.setString(1,form_no);
psmt9.setString(2,desg);
psmt9.setString(3,emp);
psmt9.setString(4,"Pending");
psmt9.setString(5,"Pending");
psmt9.setDate(6,form_date);
psmt9.setString(7,mail);
psmt9.setString(8,"now");
psmt9.setString(9,empid);
psmt9.setString(10,levelno);
	int j = psmt9.executeUpdate();

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

psmt5 = cn2.prepareStatement("UPDATE neinapplicationform SET Approval_sttatuss=?,Approval_f_date=? WHERE applicationNo=?");
psmt5.setString(1,"Closed");
psmt5.setDate(2,form_date);
psmt5.setString(3,form_no);
	int j = psmt5.executeUpdate();


try{
psmt6 = cn2.prepareStatement("UPDATE neinapplicationform_requestfor SET domainAccount=?,domainPassword=?,domainAppRemarks=?,bioAppRemarks=?,sharedAppRemarks=?,internetAPPRemarks=?,newinsOPAppCode=?,newinsPassword=?,newinsLevel=?,newinsGroup=?,newinsAccessedBranches=?,newinsAppRemarks=?,nexasID=?,nexasPassword=?,nexasAppRemarks=?,gsnetCode=?,gsnetPassword=?,assignedGsnetBranch=?,assignedGsnetDivName=?,assignedGsnetPriDiv=?,assignedGsnetUserRole=?,gsnetAppRemarks=?,internalID=?,internalPassword=?,internalAppRemarks=?,usbAppRemarks=?,vpnFortiToken=?,hardPenAppRemarks=?,otherAssetAppRemarks=?,newinAllowed=?,newinBlocked=?,compProvSimCard=?,compProvSimNumber=?,emailPassword=?,emailAppRemarks=?,mailIDCreated=?,intuneAccessProvided=?,glowID=?,glowPass=?,glowAppRemarks=? WHERE app_no=?");
psmt6.setString(1,ITusername);
psmt6.setString(2,ITpassword);
psmt6.setString(3,ITremark);
psmt6.setString(4,bioRemark);
psmt6.setString(5,shaRemark);
psmt6.setString(6,intRemark);
psmt6.setString(7,ITdcode);
psmt6.setString(8,ITdpassword);
psmt6.setString(9,ITdlevel);
psmt6.setString(10,gname);
psmt6.setString(11,accessbr);
psmt6.setString(12,ITdremark);
psmt6.setString(13,nexID);
psmt6.setString(14,nexPass);
psmt6.setString(15,nexRem);
psmt6.setString(16,uCode);
psmt6.setString(17,uPass);
psmt6.setString(18,gsBCode1);
psmt6.setString(19,gsDiv1);
psmt6.setString(20,gsPri1);
psmt6.setString(21,gsUser1);
psmt6.setString(22,gsRem);
psmt6.setString(23,interName);
psmt6.setString(24,interPass);
psmt6.setString(25,interRem);
psmt6.setString(26,usbRem);
psmt6.setString(27,forti);
psmt6.setString(28,hardRem);
psmt6.setString(29,assRem);
psmt6.setString(30,progAll);
psmt6.setString(31,progblok);
psmt6.setString(32,simOption);
psmt6.setString(33,simNo);
psmt6.setString(34,passEmail);
psmt6.setString(35,emailAppRemarks);
psmt6.setString(36,emailID);
psmt6.setString(37,intAcc);
psmt6.setString(38,glowID);
psmt6.setString(39,glowPass);
psmt6.setString(40,glowAppRemarks);
psmt6.setString(41,form_no);
	int jj = psmt6.executeUpdate();


st1 = cn2.createStatement();
ResultSet rsmain = st1.executeQuery("select emplCode from neinapplicationformmain where emplCode='"+emp_code+"' and emplName like '%"+full_name+"%'");
if(!rsmain.next()){

psmt8 = cn2.prepareStatement("insert into neinapplicationformmain (emplCode,emplName,emplBranch,emplDept,emplDesg,emplRO,emplSOW,emplReqBy,emplType,emplConType,emplreqBranch,emplreqFor,emailDomain,group_name,employeeType,mailIDCreated,reqMailID,intuneAccessProvided,CompanyProvMobile,makeAndModel,mobIntune,mobileNo,imei1,imei2,emailRemarks,domainRemarks,domainAccount,domainPassword,domainAppRemarks,bioRemarks,bioAppRemarks,folderRemarks,sharedAppRemarks,internetReqType,internetRemarks,internetAPPRemarks,newinsBranchCode,newinsOpCode,newinsRequest,newinsRemarks,newinsOPAppCode,newinsPassword,newinsLevel,newinsGroup,newinsAccessedBranches,newinsAppRemarks,nexasCompCode,nexasCCName,nexasCCCode,nexasOPRange,nexasReqType,nexasOptionalMenu,nexasRemarks,nexasID,nexasPassword,nexasAppRemarks,gsnetBranchCode,gsnetDivName,gsnetPrimaryDiv,gsnetUserRole,gsnetRemarks,gsnetCode,gsnetPassword,assignedGsnetBranch,assignedGsnetDivName,assignedGsnetPriDiv,assignedGsnetUserRole,gsnetAppRemarks,internalApplication,internalRemarks,internalID,internalPassword,internalAppRemarks,usbAccessFor,usbDetails,usbRemarks,usbAppRemarks,vpnDomainID,vpnEmailID,vpnMPLS,vpnFortiToken,hardPenRemarks,hardPenAppRemarks,otherAssetRemarks,otherAssetAppRemarks,newinProgBlocked,newinProgAllowed,emailPassword,emailAppRemarks,comProvSim,comProvimNumber,passReset,changeBio,selBioBranches,glowProject,glowWarehouse,glowRemarks,glowID,glowPass,glowAppRemarks,changesNewin,prevoiusSelBranchesNewins,changesGSNET,prevGSNETBRcodes,prevGSNETDivcodes,prevGSNETPDivcodes,prevGSNETRoles) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
psmt8.setString(1,emp_code);
psmt8.setString(2,full_name);
psmt8.setString(3,branch);
psmt8.setString(4,depart);
psmt8.setString(5,designation);
psmt8.setString(6,r_officer);
psmt8.setString(7,sow);
psmt8.setString(8,reqBy);
psmt8.setString(9,emplType);
psmt8.setString(10,emplCont);
psmt8.setString(11,requestBranch);
psmt8.setString(12,requestFor_change);
psmt8.setString(13,emailDom);
psmt8.setString(14,grp);
psmt8.setString(15,employType);
psmt8.setString(16,emailID);
psmt8.setString(17,reqMailID);
psmt8.setString(18,intAcc);
psmt8.setString(19,mobileOption);
psmt8.setString(20,makeModel);
psmt8.setString(21,onintune);
psmt8.setString(22,mobileNo);
psmt8.setString(23,imei1);
psmt8.setString(24,imei2);
psmt8.setString(25,emailRemarks);
psmt8.setString(26,remarksDom);
psmt8.setString(27,ITusername);
psmt8.setString(28,ITpassword);
psmt8.setString(29,ITremark);
psmt8.setString(30,bioRemarks);
psmt8.setString(31,bioRemark);
psmt8.setString(32,sharedRemarks);
psmt8.setString(33,shaRemark);
psmt8.setString(34,internetReqType);
psmt8.setString(35,internetRem);
psmt8.setString(36,intRemark);
psmt8.setString(37,reqBrCode);
psmt8.setString(38,newinCode);
psmt8.setString(39,newinsRequest);
psmt8.setString(40,newRem);
psmt8.setString(41,ITdcode);
psmt8.setString(42,ITdpassword);
psmt8.setString(43,ITdlevel);
psmt8.setString(44,gname);
psmt8.setString(45,accessbr);
psmt8.setString(46,ITdremark);
psmt8.setString(47,nexasCompCode);
psmt8.setString(48,nexasCCName);
psmt8.setString(49,costCCode);
psmt8.setString(50,costOPRange);
psmt8.setString(51,nexasReqType);
psmt8.setString(52,nexasOptionalMenu);
psmt8.setString(53,nexasRem);
psmt8.setString(54,nexID);
psmt8.setString(55,nexPass);
psmt8.setString(56,nexRem);
psmt8.setString(57,gsnetBranchCode);
psmt8.setString(58,gsnetDivName);
psmt8.setString(59,gsnetPrimaryDiv);
psmt8.setString(60,gsnetUserRole);
psmt8.setString(61,gsNetremarks);
psmt8.setString(62,uCode);
psmt8.setString(63,uPass);
psmt8.setString(64,gsBCode1);
psmt8.setString(65,gsDiv1);
psmt8.setString(66,gsPri1);
psmt8.setString(67,gsUser1);
psmt8.setString(68,gsRem);
psmt8.setString(69,internalApplication);
psmt8.setString(70,internalRem);
psmt8.setString(71,interName);
psmt8.setString(72,interPass);
psmt8.setString(73,interRem);
psmt8.setString(74,usbAccessFor);
psmt8.setString(75,dscNo);
psmt8.setString(76,usbRem1);
psmt8.setString(77,usbRem);
psmt8.setString(78,domID);
psmt8.setString(79,vpnEmail);
psmt8.setString(80,vpnMPLS);
psmt8.setString(81,forti);
psmt8.setString(82,hardRemarks);
psmt8.setString(83,hardRem);
psmt8.setString(84,assetRemarks);
psmt8.setString(85,assRem);
psmt8.setString(86,progblok);
psmt8.setString(87,progAll);
psmt8.setString(88,passEmail);
psmt8.setString(89,emailAppRemarks);
psmt8.setString(90,simOption);
psmt8.setString(91,simNo);
psmt8.setString(92,passChan);
psmt8.setString(93,changeBio);
psmt8.setString(94,selBranch);
psmt8.setString(95,project);
psmt8.setString(96,warehouse);
psmt8.setString(97,glowRemarks);
psmt8.setString(98,glowID);
psmt8.setString(99,glowPass);
psmt8.setString(100,glowAppRemarks);
psmt8.setString(101,changeNew);
psmt8.setString(102,prevNewinBr);
psmt8.setString(103,changeGS);
psmt8.setString(104,changesGSNet);
psmt8.setString(105,prevDivGSNet);
psmt8.setString(106,prevPDivGSNet);
psmt8.setString(107,prevRoleGSNet);
	int jjj = psmt8.executeUpdate();

}else{

psmt8 = cn2.prepareStatement("UPDATE neinapplicationformmain SET emplCode=?,emplName=?,emplBranch=?,emplDept=?,emplDesg=?,emplRO=?,emplSOW=?,emplReqBy=?,emplType=?,emplConType=?,emplreqBranch=?,emplreqFor=?,emailDomain=?,group_name=?,employeeType=?,mailIDCreated=?,reqMailID=?,intuneAccessProvided=?,CompanyProvMobile=?,makeAndModel=?,mobIntune=?,mobileNo=?,imei1=?,imei2=?,emailRemarks=?,domainRemarks=?,domainAccount=?,domainPassword=?,domainAppRemarks=?,bioRemarks=?,bioAppRemarks=?,folderRemarks=?,sharedAppRemarks=?,internetReqType=?,internetRemarks=?,internetAPPRemarks=?,newinsBranchCode=?,newinsOpCode=?,newinsRequest=?,newinsRemarks=?,newinsOPAppCode=?,newinsPassword=?,newinsLevel=?,newinsGroup=?,newinsAccessedBranches=?,newinsAppRemarks=?,nexasCompCode=?,nexasCCName=?,nexasCCCode=?,nexasOPRange=?,nexasReqType=?,nexasOptionalMenu=?,nexasRemarks=?,nexasID=?,nexasPassword=?,nexasAppRemarks=?,gsnetBranchCode=?,gsnetDivName=?,gsnetPrimaryDiv=?,gsnetUserRole=?,gsnetRemarks=?,gsnetCode=?,gsnetPassword=?,assignedGsnetBranch=?,assignedGsnetDivName=?,assignedGsnetPriDiv=?,assignedGsnetUserRole=?,gsnetAppRemarks=?,internalApplication=?,internalRemarks=?,internalID=?,internalPassword=?,internalAppRemarks=?,usbAccessFor=?,usbDetails=?,usbRemarks=?,usbAppRemarks=?,vpnDomainID=?,vpnEmailID=?,vpnMPLS=?,vpnFortiToken=?,hardPenRemarks=?,hardPenAppRemarks=?,otherAssetRemarks=?,otherAssetAppRemarks=?,newinProgBlocked=?,newinProgAllowed=?,emailPassword=?,emailAppRemarks=?,comProvSim=?,comProvimNumber=?,passReset=?,changeBio=?,selBioBranches=?,glowProject=?,glowWarehouse=?,glowRemarks=?,glowID=?,glowPass=?,glowAppRemarks=?,changesNewin=?,prevoiusSelBranchesNewins=?,changesGSNET=?,prevGSNETBRcodes=?,prevGSNETDivcodes=?,prevGSNETPDivcodes=?,prevGSNETRoles=? WHERE emplCode=? and emplName like '%"+full_name+"%'");
psmt8.setString(1,emp_code);
psmt8.setString(2,full_name);
psmt8.setString(3,branch);
psmt8.setString(4,depart);
psmt8.setString(5,designation);
psmt8.setString(6,r_officer);
psmt8.setString(7,sow);
psmt8.setString(8,reqBy);
psmt8.setString(9,emplType);
psmt8.setString(10,emplCont);
psmt8.setString(11,requestBranch);
psmt8.setString(12,requestFor_change);
psmt8.setString(13,emailDom);
psmt8.setString(14,grp);
psmt8.setString(15,employType);
psmt8.setString(16,emailID);
psmt8.setString(17,reqMailID);
psmt8.setString(18,intAcc);
psmt8.setString(19,mobileOption);
psmt8.setString(20,makeModel);
psmt8.setString(21,onintune);
psmt8.setString(22,mobileNo);
psmt8.setString(23,imei1);
psmt8.setString(24,imei2);
psmt8.setString(25,emailRemarks);
psmt8.setString(26,remarksDom);
psmt8.setString(27,ITusername);
psmt8.setString(28,ITpassword);
psmt8.setString(29,ITremark);
psmt8.setString(30,bioRemarks);
psmt8.setString(31,bioRemark);
psmt8.setString(32,sharedRemarks);
psmt8.setString(33,shaRemark);
psmt8.setString(34,internetReqType);
psmt8.setString(35,internetRem);
psmt8.setString(36,intRemark);
psmt8.setString(37,reqBrCode);
psmt8.setString(38,newinCode);
psmt8.setString(39,newinsRequest);
psmt8.setString(40,newRem);
psmt8.setString(41,ITdcode);
psmt8.setString(42,ITdpassword);
psmt8.setString(43,ITdlevel);
psmt8.setString(44,gname);
psmt8.setString(45,accessbr);
psmt8.setString(46,ITdremark);
psmt8.setString(47,nexasCompCode);
psmt8.setString(48,nexasCCName);
psmt8.setString(49,costCCode);
psmt8.setString(50,costOPRange);
psmt8.setString(51,nexasReqType);
psmt8.setString(52,nexasOptionalMenu);
psmt8.setString(53,nexasRem);
psmt8.setString(54,nexID);
psmt8.setString(55,nexPass);
psmt8.setString(56,nexRem);
psmt8.setString(57,gsnetBranchCode);
psmt8.setString(58,gsnetDivName);
psmt8.setString(59,gsnetPrimaryDiv);
psmt8.setString(60,gsnetUserRole);
psmt8.setString(61,gsNetremarks);
psmt8.setString(62,uCode);
psmt8.setString(63,uPass);
psmt8.setString(64,gsBCode1);
psmt8.setString(65,gsDiv1);
psmt8.setString(66,gsPri1);
psmt8.setString(67,gsUser1);
psmt8.setString(68,gsRem);
psmt8.setString(69,internalApplication);
psmt8.setString(70,internalRem);
psmt8.setString(71,interName);
psmt8.setString(72,interPass);
psmt8.setString(73,interRem);
psmt8.setString(74,usbAccessFor);
psmt8.setString(75,dscNo);
psmt8.setString(76,usbRem1);
psmt8.setString(77,usbRem);
psmt8.setString(78,domID);
psmt8.setString(79,vpnEmail);
psmt8.setString(80,vpnMPLS);
psmt8.setString(81,forti);
psmt8.setString(82,hardRemarks);
psmt8.setString(83,hardRem);
psmt8.setString(84,assetRemarks);
psmt8.setString(85,assRem);
psmt8.setString(86,progblok);
psmt8.setString(87,progAll);
psmt8.setString(88,passEmail);
psmt8.setString(89,emailAppRemarks);
psmt8.setString(90,simOption);
psmt8.setString(91,simNo);
psmt8.setString(92,passChan);
psmt8.setString(93,changeBio);
psmt8.setString(94,selBranch);
psmt8.setString(95,project);
psmt8.setString(96,warehouse);
psmt8.setString(97,glowRemarks);
psmt8.setString(98,glowID);
psmt8.setString(99,glowPass);
psmt8.setString(100,glowAppRemarks);
psmt8.setString(101,changeNew);
psmt8.setString(102,prevNewinBr);
psmt8.setString(103,changeGS);
psmt8.setString(104,changesGSNet);
psmt8.setString(105,prevDivGSNet);
psmt8.setString(106,prevPDivGSNet);
psmt8.setString(107,prevRoleGSNet);
psmt8.setString(108,emp_code);
	int jjj = psmt8.executeUpdate();

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
}else if(mmdradio.equals("Clarification Required")){
	
	psmt7 = cn2.prepareStatement("UPDATE neinapplicationform_item SET clarifyCol=? WHERE form2_no=? and empid=?");
	psmt7.setString(1,"1");
	psmt7.setString(2,form_no);
	psmt7.setString(3,empnoSession);
	ii = psmt7.executeUpdate();
	
	psmt8 = cn2.prepareStatement("INSERT INTO neinapplicationform_item(form2_no,desg,emp,status,remarks,f_date,mail,presence,empid,levelno,clarifyCol) VALUES(?,?,?,?,?,?,?,?,?,?,?)");
	psmt8.setString(1,form_no);
	psmt8.setString(2,desg);
	psmt8.setString(3,emp);
	psmt8.setString(4,"Pending");
	psmt8.setString(5,"Pending");
	psmt8.setDate(6,form_date);
	psmt8.setString(7,mail);
	psmt8.setString(8,"now");
	psmt8.setString(9,empid);
	psmt8.setString(10,levelno);
	psmt8.setString(11,"2");
	int j = psmt8.executeUpdate();

	message = mailMessage.getMailMessageAppForm(form_no.trim());
	postMail.postMail(i_email_id,i_name,"pass1234",mail," APPLICATION FORM :  " +form_no+ " ",i_name+  " "+  "requests you to provide clarification for APPLICATION FORM with number - " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br>C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
	
}else{
String allMails1="";
psmt5 = cn2.prepareStatement("SELECT mail,emp FROM neinapplicationform_item WHERE form2_no=?");
psmt5.setString(1,form_no);
	
message = mailMessage.getMailMessageAppForm(form_no.trim());
ResultSet rs1 = psmt5.executeQuery();
while(rs1.next())
{
allMails1 += rs1.getString(1)+",";
}
postMail.postMail(i_email_id,i_name,"pass1234",allMails1," APPLICATION FORM :  " +form_no+ " ", "Your request for APPLICATION FORM "+form_no+" Is NOT Approved by " +i_name+ " <br>Remarks : "+txtmail_msg+"<br><b><u> Open the following URL</u> </b><br>C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
}
message = null;
msg = "APPLICATION__FORM__SAVED__AND__SENT__SUCCESSFULLY";
System.out.println("result..date..........."+form_date);
//response.sendRedirect("../../adminHR.jsp?msg=" +msg);



String flag=request.getParameter("flag");


if(flag.equals("1")){
               System.out.println("Approved From Nein Home Page");
               msg = "APPLICATION__FORM__SAVED__AND__SENT__SUCCESSFULLY";
 
               %>
                <script>
    // JavaScript code to redirect the parent window
    var msg = "APPLICATION__FORM__SAVED__AND__SENT__SUCCESSFULLY";
    alert(msg);
	   window.close();
	if (window.opener && !window.opener.closed) {
	    window.opener.location.reload();
	}
</script>

                   <%
 
}else{
msg = "APPLICATION__FORM__SAVED__AND__SENT__SUCCESSFULLY";
System.out.println("result..date..........."+form_date);
response.sendRedirect("../../adminHR.jsp?msg=" +msg);
}















}
catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(rs,st1,cn2);
	DbUtil.closeDBResources(null,psmt,null);
	DbUtil.closeDBResources(null,psmt2,null);
	DbUtil.closeDBResources(null,psmt3,null);
	DbUtil.closeDBResources(null,psmt4,null);
	DbUtil.closeDBResources(null,psmt5,null);
	DbUtil.closeDBResources(null,psmt6,null);
	DbUtil.closeDBResources(null,psmt7,null);
	DbUtil.closeDBResources(null,psmt8,null);
	DbUtil.closeDBResources(null,psmt9,null);
	DbUtil.closeDBResources(null,psmt10,null);
	DbUtil.closeDBResources(null,psmt11,null);
	DbUtil.closeDBResources(null,psmtt,null);
 }
}
%>
</html>