<%@page import="CON2.DbUtil"%>
<%@page import="CON2.MailMessageITclearance"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<%@page import="CON2.ConnectionLMS" %> 
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.text.resources.FormatData"%>
<jsp:useBean id ="successpoSender" class="CON2.ItNonitMailSender" /> 
<jsp:useBean id="dateFormat" class="CON2.DateFormat"/>

<jsp:useBean id = "con" class="CON2.Connection2" /> 
<jsp:useBean id = "conlms" class="CON2.ConnectionLMS" /> 

<jsp:useBean id = "pdf" class="com.ck.file.FileAttachment" /> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id = "postMail" class="CON2.PostMail" /> 
<html>
<head>
</head>
<%! 
MailMessageITclearance mailMessage = new MailMessageITclearance();
Connection conn = null, conn1 = null,cn2=null,cnlms=null; 
Statement st= null, st1=null,st2=null,st3=null,st4=null,st5=null,st6=null,st7=null,st8=null,st9=null,st11=null,stlms=null;
ResultSet rs = null,rslms=null;
String message = null;
String form_no =null;
%>

<%
cn2 = con.getConnection2();
cnlms = conlms.getConnectionlms();
st2 = cn2.createStatement();
stlms = cnlms.createStatement();
PreparedStatement psmt=null,psmt2=null,psmt3=null,psmt4=null,psmt19=null,psmt11=null;
%>

<%
try{
String empIdForMail="";
String fg=request.getParameter("fg");	
String i_name= request.getParameter("i_name");
String i_desg= request.getParameter("i_desg");
String i_city= request.getParameter("i_city");
String i_b_no= request.getParameter("i_b_no");
String i_admin= request.getParameter("i_admin");
String i_email_id= request.getParameter("i_email_id");
String senddirect= request.getParameter("senddirect");

form_no = request.getParameter("form1_no");
String f_date = request.getParameter("f_date");
String mmdradio = request.getParameter("mmdradio");
String desg = request.getParameter("desg");
String emp = request.getParameter("emp");
String mail = request.getParameter("mail1");
String empid = request.getParameter("empid1");
String levelno = request.getParameter("levelno");

String txtmail_msg = request.getParameter("txtmail_msg");

String higherAuthority = request.getParameter("higherAuthority");
String mdradio=request.getParameter("mdradio");
String Itradio=request.getParameter("Itradio");

String a_model = request.getParameter("a_model");
String a_data_card = request.getParameter("a_datacard");
String a_email = request.getParameter("a_email");
String a_newins = request.getParameter("a_newins");
String a_domain = request.getParameter("a_domain");
String a_mobile_model = request.getParameter("a_mobile_model");
String a_mobile_no = request.getParameter("a_mobile_no");
String a_access_card = request.getParameter("a_access_card");
String a_drive = request.getParameter("a_drive");
String a_other_asset = request.getParameter("a_other_asset");
String a_remarks = request.getParameter("a_remarks");

String a_nexas = request.getParameter("a_nexas");
String r_nexas = request.getParameter("r_nexas");

String a_compmobile_no = request.getParameter("a_compmobile_no");
String r_compmobile_no = request.getParameter("r_compmobile_no");

String r_model = request.getParameter("r_model");
System.out.println("R_model :"+r_model);
String r_data_card = request.getParameter("r_datacard");
String r_email = request.getParameter("r_email");
String r_newins = request.getParameter("r_newins");
String r_domain = request.getParameter("r_domain");
String r_mobile_model = request.getParameter("r_mobile_model");
String r_mobile_no = request.getParameter("r_mobile_no");
String r_access_card = request.getParameter("r_access_card");
String r_drive = request.getParameter("r_drive");
String r_other_asset = request.getParameter("r_other_asset");
String r_remarks = request.getParameter("r_remarks");
String requestOption= request.getParameter("requestOption");
String d_new_relieved_request = request.getParameter("d_new_relieved_request");
String d_new_reliving_co =request.getParameter("d_new_reliving_co");
String a_model_info=request.getParameter("a_model_info");
String r_model_info=request.getParameter("r_model_info");
String a_document_ac=request.getParameter("a_document_ac");
String r_document_ac=request.getParameter("r_document_ac");

String a_document_hr=request.getParameter("a_document_hr");
String r_document_hr=request.getParameter("r_document_hr");
String a_co_car_hr=request.getParameter("a_co_car_hr");
String r_co_car_hr=request.getParameter("r_co_car_hr");
String a_calculator_hr=request.getParameter("a_calculator_hr");
String r_calculator_hr=request.getParameter("r_calculator_hr");
String a_conn_mobile_hr=request.getParameter("a_conn_mobile_hr");
String r_conn_mobile_hr=request.getParameter("r_conn_mobile_hr");
String a_mobile_handset_hr=request.getParameter("a_mobile_handset_hr");
String r_mobile_handset_hr=request.getParameter("r_mobile_handset_hr");
String a_id_card_hr=request.getParameter("a_id_card_hr");
String r_id_card_hr=request.getParameter("r_id_card_hr");
String a_work_key_hr=request.getParameter("a_work_key_hr");
String r_work_key_hr=request.getParameter("r_work_key_hr");
String a_any_other_hr=request.getParameter("a_any_other_hr");
String r_any_other_hr=request.getParameter("r_any_other_hr");
String a_leave_card_hr=request.getParameter("a_leave_card_hr");
String r_leave_card_hr=request.getParameter("r_leave_card_hr");
String a_resignation_letter_hr=request.getParameter("a_resignation_letter_hr");
String r_resignation_letter_hr=request.getParameter("r_resignation_letter_hr");
String a_identity_card_hr=request.getParameter("a_identity_card_hr");
String r_identity_card_hr=request.getParameter("r_identity_card_hr");
String levelno1=request.getParameter("levelno1");
String duty=request.getParameter("duty");
String keyJob=request.getParameter("keyJob");
String noticePeriod=request.getParameter("noticePeriod");

String msg=null;
Date result1=null,result2=null,form_date=null;
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

try
{
form_date = new Date(sdf.parse(f_date).getTime());
}
catch (Exception e) {
e.printStackTrace();
}

String allMails=null,initiatorNameIfNotApproved=null;
psmt4 = cn2.prepareStatement("SELECT mail,emp FROM form1_it_clearance_item WHERE form1_no=? AND status=?");
psmt4.setString(1,form_no);
psmt4.setString(2,"Initiator");
ResultSet rs = psmt4.executeQuery();
while(rs.next())
{
allMails = rs.getString(1); 
initiatorNameIfNotApproved = rs.getString(2);
}
String pending = "Pending";
if(mmdradio!=null && mmdradio.equals("Not Approved"))
{
desg ="NOT APPROVED";
emp="NOT APPROVED";
mmdradio="NOT APPROVED";
txtmail_msg = "NOT APPROVED";
mail =allMails;
pending ="NOT APPROVED";
}
String sesempid = (String) session.getAttribute("EmpNo");

psmt19 = cn2.prepareStatement("UPDATE form1_it_clearance_item  SET status=?,remarks=?,f_date=?,presence=? WHERE form1_no=? AND presence='now' and ((desg=? AND emp=?)or(empid='"+sesempid+"'))");
psmt19.setString(1,mmdradio);
psmt19.setString(2,txtmail_msg);
psmt19.setDate(3,form_date);
psmt19.setString(4,"over");
psmt19.setString(5,form_no);
psmt19.setString(6,i_desg);
psmt19.setString(7,i_name);
int i = psmt19.executeUpdate();

if(levelno1.equals("5"))
{
String it1a=request.getParameter("it1a");
String it1aa=request.getParameter("it1aa");
String it2b=request.getParameter("it2b");
String it2bb=request.getParameter("it2bb");
String it3c=request.getParameter("it3c");
String it3cc=request.getParameter("it3cc");
String it4d=request.getParameter("it4d");
String it4dd=request.getParameter("it4dd");
String it5e=request.getParameter("it5e");
String it5ee=request.getParameter("it5ee");
String it6f=request.getParameter("it6f");
String it6ff=request.getParameter("it6ff");
String it7g=request.getParameter("it7g");
String it7gg=request.getParameter("it7gg");
String it8h=request.getParameter("it8h");
String it8hh=request.getParameter("it8hh");
String it9i=request.getParameter("it9i");
String it9ii=request.getParameter("it9ii");
String it10j=request.getParameter("it10j");
String it10jj=request.getParameter("it10jj");
String it10jnexas=request.getParameter("it10jnexas");
String it10jjnexas=request.getParameter("it10jjnexas");
String it11k=request.getParameter("it11k");
String it11kk=request.getParameter("it11kk");
String it12l=request.getParameter("it12l");
String it12ll=request.getParameter("it12ll");
String it13m=request.getParameter("it13m");
String it13mm=request.getParameter("it13mm");
String it14n=request.getParameter("it14n");
String it14nn=request.getParameter("it14nn");
String it15o=request.getParameter("it15o");
String it15oo=request.getParameter("it15oo");
String it16p=request.getParameter("it16p");
String it16pp=request.getParameter("it16pp");
String it17q=request.getParameter("it17q");
String it17qq=request.getParameter("it17qq");
String it18r=request.getParameter("it18r");
String it18rr=request.getParameter("it18rr");
String it19s=request.getParameter("it19s");
String it19ss=request.getParameter("it19ss");
String itrairLin=request.getParameter("itrairLin");
String itrairLin1=request.getParameter("itrairLin1");
String itrsophos=request.getParameter("itrsophos");
String itrsophos1=request.getParameter("itrsophos1");
String itrforti=request.getParameter("itrforti");
String itrforti1=request.getParameter("itrforti1");

psmt11 = cn2.prepareStatement("UPDATE form1_it_clearance SET it1a=?,it1aa=?,it2b=?,it2bb=?,it3c=?,it3cc=?,it4d=?,it4dd=?,it5e=?,it5ee=?,it6f=?,it6ff=?,it7g=?,it7gg=?,it8h=?,it8hh=?,it9i=?,it9ii=?,it10j=?,it10jj=?,it10jnexas=?,it10jjnexas=?,it11k=?,it11kk=?,it12l=?,it12ll=?,it13m=?,it13mm=?,it14n=?,it14nn=?,it15o=?,it15oo=?,it16p=?,it16pp=?,it17q=?,it17qq=?,it18r=?,it18rr=?,it19s=?,it19ss=?,itrairLin=?,itrairLin1=?,itrsophos=?,itrsophos1=?,itrforti=?,itrforti1=? WHERE form1_no=?");
psmt11.setString(1,it1a);
psmt11.setString(2,it1aa);
psmt11.setString(3,it2b);
psmt11.setString(4,it2bb);
psmt11.setString(5,it3c);
psmt11.setString(6,it3cc);
psmt11.setString(7,it4d);
psmt11.setString(8,it4dd);
psmt11.setString(9,it5e);
psmt11.setString(10,it5ee);
psmt11.setString(11,it6f);
psmt11.setString(12,it6ff);
psmt11.setString(13,it7g);
psmt11.setString(14,it7gg);
psmt11.setString(15,it8h);
psmt11.setString(16,it8hh);
psmt11.setString(17,it9i);
psmt11.setString(18,it9ii);
psmt11.setString(19,it10j);
psmt11.setString(20,it10jj);
psmt11.setString(21,it10jnexas);
psmt11.setString(22,it10jjnexas);
psmt11.setString(23,it11k);
psmt11.setString(24,it11kk);
psmt11.setString(25,it12l);
psmt11.setString(26,it12ll);
psmt11.setString(27,it13m);
psmt11.setString(28,it13mm);
psmt11.setString(29,it14n);
psmt11.setString(30,it14nn);
psmt11.setString(31,it15o);
psmt11.setString(32,it15oo);
psmt11.setString(33,it16p);
psmt11.setString(34,it16pp);
psmt11.setString(35,it17q);
psmt11.setString(36,it17qq);
psmt11.setString(37,it18r);
psmt11.setString(38,it18rr);
psmt11.setString(39,it19s);
psmt11.setString(40,it19ss);
psmt11.setString(41,itrairLin);
psmt11.setString(42,itrairLin1);
psmt11.setString(43,itrsophos);
psmt11.setString(44,itrsophos1);
psmt11.setString(45,itrforti);
psmt11.setString(46,itrforti1);
psmt11.setString(47,form_no);
int r = psmt11.executeUpdate();
}

if(!senddirect.equals("direct") && mmdradio.equals("Approved"))
{
psmt = cn2.prepareStatement("UPDATE form1_it_clearance SET a_model=?,a_data_card=?,a_email=?,a_newins=?,a_domain=?,a_mobile_model=?,a_mobile_no=?,a_access_card=?,a_drive=?,a_other_asset=?,a_remarks=?,r_model=?,r_data_card=?,r_email=?,r_newins=?,r_domain=?,r_mobile_model=?,r_mobile_no=?,r_access_card=?,r_drive=?,r_other_asset=?,a_document_hr=?,r_document_hr=?,a_co_car_hr=?,r_co_car_hr=?,a_calculator_hr=?,r_calculator_hr=?,a_conn_mobile_hr=?,r_conn_mobile_hr=?,a_mobile_handset_hr=?,r_mobile_handset_hr=?,a_id_card_hr=?,r_id_card_hr=?,a_work_key_hr=?,r_work_key_hr=?,a_any_other_hr=?,r_any_other_hr=?,a_leave_card_hr=?,r_leave_card_hr=?,a_resignation_letter_hr=?,r_resignation_letter_hr=?,a_identity_card_hr=?,r_identity_card_hr=?,a_model_info=?,r_model_info=?,a_document_ac=?,r_document_ac=?,a_nexas=?,r_nexas=?,rduty=?,rkeyJob=?,rnoticePeriod=?,a_compmobile_no=?,r_compmobile_no=? WHERE form1_no=?");
psmt.setString(1,a_model);
psmt.setString(2,a_data_card);
psmt.setString(3,a_email);
psmt.setString(4,a_newins);
psmt.setString(5,a_domain);
psmt.setString(6,a_mobile_model);
psmt.setString(7,a_mobile_no);
psmt.setString(8,a_access_card);
psmt.setString(9,a_drive);
psmt.setString(10,a_other_asset);
psmt.setString(11,a_remarks);
psmt.setString(12,r_model);
psmt.setString(13,r_data_card);
psmt.setString(14,r_email);
psmt.setString(15,r_newins);
psmt.setString(16,r_domain);
psmt.setString(17,r_mobile_model);
psmt.setString(18,r_mobile_no);
psmt.setString(19,r_access_card);
psmt.setString(20,r_drive);
psmt.setString(21,r_other_asset);
psmt.setString(22,a_document_hr);
psmt.setString(23,r_document_hr);
psmt.setString(24,a_co_car_hr);
psmt.setString(25,r_co_car_hr);
psmt.setString(26,a_calculator_hr);
psmt.setString(27,r_calculator_hr);
psmt.setString(28,a_conn_mobile_hr);
psmt.setString(29,r_conn_mobile_hr);
psmt.setString(30,a_mobile_handset_hr);
psmt.setString(31,r_mobile_handset_hr);
psmt.setString(32,a_id_card_hr);
psmt.setString(33,r_id_card_hr);
psmt.setString(34,a_work_key_hr);
psmt.setString(35,r_work_key_hr);
psmt.setString(36,a_any_other_hr);
psmt.setString(37,r_any_other_hr);
psmt.setString(38,a_leave_card_hr);
psmt.setString(39,r_leave_card_hr);
psmt.setString(40,a_resignation_letter_hr);
psmt.setString(41,r_resignation_letter_hr);
psmt.setString(42,a_identity_card_hr);
psmt.setString(43,r_identity_card_hr);
psmt.setString(44,a_model_info);
psmt.setString(45,r_model_info);
psmt.setString(46,a_document_ac);
psmt.setString(47,r_document_ac);
psmt.setString(48,a_nexas);
psmt.setString(49,r_nexas);
psmt.setString(50,duty);
psmt.setString(51,keyJob);
psmt.setString(52,noticePeriod);
psmt.setString(53,a_compmobile_no);
psmt.setString(54,r_compmobile_no);
psmt.setString(55,form_no);
int ii = psmt.executeUpdate();

PreparedStatement psmt10=null;
psmt10 = cn2.prepareStatement("UPDATE form1_it_clearance SET Approval_status=?,Approval_sttatuss=?,Approval_remarks=?,Approval_f_date=?,Approval_emp=?,Approval_desg=?,Approval_empp=?,Approval_desgg=? WHERE form1_no=?");
psmt10.setString(1,mmdradio);
psmt10.setString(2,pending);
psmt10.setString(3,txtmail_msg);
psmt10.setDate(4,form_date);
psmt10.setString(5,emp);
psmt10.setString(6,desg);
psmt10.setString(7,i_name);
psmt10.setString(8,i_desg);
psmt10.setString(9,form_no);
int b = psmt10.executeUpdate(); 
	
psmt2 = cn2.prepareStatement("INSERT INTO form1_it_clearance_item(form1_no,desg,emp,status,remarks,f_date,mail,presence,empid,levelno) VALUES(?,?,?,?,?,?,?,?,?,?)");
psmt2.setString(1,form_no);
psmt2.setString(2,desg);
psmt2.setString(3,emp);
psmt2.setString(4,pending);
psmt2.setString(5,pending);
psmt2.setDate(6,form_date);
psmt2.setString(7,mail);
psmt2.setString(8,"now");
psmt2.setString(9,empid);
psmt2.setString(10,levelno);
int j = psmt2.executeUpdate();
}

else if(senddirect.equals("direct") && mmdradio.equals("Approved"))
{
String allMails1="";
psmt4 = cn2.prepareStatement("SELECT distinct empid FROM form1_it_clearance_item WHERE form1_no=? and empid not in('1','7069')");
psmt4.setString(1,form_no);
ResultSet rs1 = psmt4.executeQuery();
message = mailMessage.getMailMessage(form_no.trim());
while(rs1.next())
{
	empIdForMail += rs1.getString("empid")+",";
} 
if(!empIdForMail.equals("")){
	empIdForMail = empIdForMail.substring(0, empIdForMail.length()-1);
}

rslms = stlms.executeQuery("select email from user where emp_id in ("+empIdForMail+") or emp_id in ('1952','214','1665')");
while(rslms.next()){
	allMails1 += rslms.getString("email")+",";
}
/* if(!allMails1.equals("")){
	//allMails1 = allMails1.substring(0, allMails1.length()-1);
} */

postMail.postMail(i_email_id,i_name,"pass1234",allMails1,"  Outstanding Dues & Handover Report :  " +form_no+ " ","Outstanding Dues & Handover Report Form : "+form_no+" Is Approved and Files closed by " +i_name+ " <br>Remarks : "+txtmail_msg+"<br><b><u> Open the following URL</u> </b><br> C2IT Link -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> Common Link - https://neinsoft.nittsu.co.in:8185/NEIN/  <br><br><br><br>"+message);
}

message = mailMessage.getMailMessage(form_no.trim());
if(mmdradio!=null && mmdradio.equals("Approved") && !senddirect.equals("direct")) 
{ 
postMail.postMail(i_email_id,i_name,"pass1234",mail," Outstanding Dues & Handover Report :  " +form_no+ " ",i_name+  " "+  "request you to Approve - Outstanding Dues & Handover Report Form : " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT link -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> Common link - https://neinsoft.nittsu.co.in:8185/NEIN/  <br><br><br><br>"+message);
//prasanna.v@nittsu.co.in
if(i_email_id.equals("prasanna.kumar@nipponexpress.com"))
postMail.postMail(i_email_id,i_name,"pass1234","prasanna.kumar@nipponexpress.com"," Outstanding Dues & Handover Report :  " +form_no+ " ","Outstanding Dues & Handover Report Form : " +form_no+ " approved by you."+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT link -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> Common link - https://neinsoft.nittsu.co.in:8185/NEIN/  <br><br><br><br>"+message);
}
	
if((mmdradio!=null && mmdradio.equals("Not Approved") || mmdradio.equals("NOT APPROVED")))
{	
String allMails1="";
psmt4 = cn2.prepareStatement("SELECT distinct empid FROM form1_it_clearance_item WHERE form1_no=?");
psmt4.setString(1,form_no);
ResultSet rs1 = psmt4.executeQuery();
while(rs1.next())
{
empIdForMail += rs1.getString("empid")+",";
} 
if(!empIdForMail.equals("")){
	empIdForMail = empIdForMail.substring(0, empIdForMail.length()-1);
}
rslms = stlms.executeQuery("select email from user where emp_id in ("+empIdForMail+")");
while(rslms.next()){
	allMails1 += rslms.getString("email")+",";
}
postMail.postMail(i_email_id,i_name,"pass1234",allMails1,"  Outstanding Dues & Handover Report :  " +form_no+ " ",initiatorNameIfNotApproved+  " "+  "your request for Outstanding Dues & Handover Report Form : "+form_no+" Is NOT Approved by " +i_name+ " <br>Remarks : "+txtmail_msg+"<br><b><u> Open the following URL</u> </b><br> C2IT Link -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> Common Link - https://neinsoft.nittsu.co.in:8185/NEIN/  <br><br><br><br>");
}

if(fg.equals("1")){
	System.out.println("Approved From Nein Home Page");
	msg = "IT__CLEARANCE__SAVED__AND__SENT__SUCCESSFULLY";

	%>
	  <script>
	    // JavaScript code to redirect the parent window
	    var msg = "IT__CLEARANCE__SAVED__AND__SENT__SUCCESSFULLY";
	    alert(msg);
	   window.close();
	if (window.opener && !window.opener.closed) {
	    window.opener.location.reload();
	}	    </script>
	    <%

}else{

message = null;
msg = "IT__CLEARANCE__SAVED__AND__SENT__SUCCESSFULLY";
response.sendRedirect("../../../adminPage.jsp?msg=" +msg);
}
}
catch (SQLException ex) {
    ex.printStackTrace();
}

finally{
DbUtil.closeDBResources(rs,st,conn);
DbUtil.closeDBResources(rslms,stlms,cnlms);
DbUtil.closeDBResources(null,st2,conn1);
DbUtil.closeDBResources(null,st1,cn2);
DbUtil.closeDBResources(null,st11,null);
DbUtil.closeDBResources(null,st3,null);
DbUtil.closeDBResources(null,st4,null);
DbUtil.closeDBResources(null,st5,null);
DbUtil.closeDBResources(null,st6,null);
DbUtil.closeDBResources(null,st7,null);
DbUtil.closeDBResources(null,st8,null);
DbUtil.closeDBResources(null,st9,null);
DbUtil.closeDBResources(null,psmt,null);
DbUtil.closeDBResources(null,psmt19,null);
DbUtil.closeDBResources(null,psmt2,null);
DbUtil.closeDBResources(null,psmt3,null);
DbUtil.closeDBResources(null,psmt4,null);
}
%>
</html>