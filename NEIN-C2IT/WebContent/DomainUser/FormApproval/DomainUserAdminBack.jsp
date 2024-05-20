<%@page import="CON2.MailMessageDomainUser"%>
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

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id = "postMail" class="CON2.PostMail" /> 
<html>
<head>
</head>
<%! 
                  MailMessageDomainUser mailMessage = new MailMessageDomainUser();
                  Connection conn = null, conn1 = null,cn2=null; 
	              Statement st= null, st1=null,st2=null,st3=null,st4=null,st5=null,st6=null,st7=null,st8=null,st9=null,st11=null;
	              ResultSet rs = null;
	              String message = null;
	              %>
	              <%
	              
	              cn2 = con.getConnection2();
	              st2 = cn2.createStatement();
	              PreparedStatement psmt=null,psmt2=null,psmt3=null,psmt4=null;
	              %>
	              	<%--i_name,i_desg,i_city,i_b_no,i_admin,i_email_id --%>
<%
//form1_it_clearance
//form1_it_clearance_item 
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
String txtmail_msg = request.getParameter("txtmail_msg");


String mmradio = request.getParameter("mmradio");
String higherAuthority = request.getParameter("higherAuthority");
//String Itradio = request.getParameter("Itradio");
String Itradio ="IT";
System.out.println("mmradio "+mmdradio   +"higherAuthority"+higherAuthority  +"It radio :"+Itradio);
//mmradio Approved    higherAuthority directApprove   It radio :IT
String msg=null;
Date form_date=null;
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

try{
	form_date = new Date(sdf.parse(f_date).getTime());
}
catch (Exception e) {
	e.printStackTrace();
}
System.out.println("f_date "+f_date   +"           form_date   :"+form_date);

if((desg!=null||desg=="none")&&(emp!=null||emp=="-1")&&(higherAuthority!=null && higherAuthority.equals("directApprove")))
{
	desg ="ASST. GENERAL MANAGER";
	emp="Prasanna Kumar";
	//PRASANNA.V@NITSSU.CO.IN
	mail ="prasanna.v@nittsu.co.in";
	//mail ="farooqsha27@gmail.com";
}

String allMails=null,initiatorNameIfNotApproved=null;
psmt4 = cn2.prepareStatement("SELECT mail,emp FROM form2_domain_item WHERE form2_no=? AND status=?");
psmt4.setString(1,form_no);
psmt4.setString(2,"Initiator");
ResultSet rs = psmt4.executeQuery();
while(rs.next())
{
	allMails = rs.getString(1); 
	initiatorNameIfNotApproved =rs.getString(2);
}

if(mmdradio!=null && mmdradio.equals("Not Approved"))
{
	desg ="NOT APPROVED";
	emp="NOT APPROVED";
	mail =allMails;
}
System.out.println("NEW MAIL after changing if not approved : "+mail);
System.out.println("mmradio : "+mmradio);
System.out.println("mmdradio : "+mmdradio);
System.out.println("form_no : "+form_no);
System.out.println("i_desg : "+i_desg);
System.out.println("i_name : "+i_name);
psmt = cn2.prepareStatement("UPDATE form2_domain_item SET status=?,remarks=?,f_date=?,presence=? WHERE form2_no=? AND desg=? AND emp=? ");
psmt.setString(1,mmdradio);
psmt.setString(2,txtmail_msg);
psmt.setDate(3,form_date);
psmt.setString(4,"over");
psmt.setString(5,form_no);
psmt.setString(6,i_desg);
psmt.setString(7,i_name);

int i = psmt.executeUpdate();

PreparedStatement psmt10=null;
psmt10 = cn2.prepareStatement("UPDATE form2_domain SET Approval_status=?,Approval_sttatuss=?,Approval_remarks=?,Approval_f_date=?,Approval_emp=?,Approval_desg=?,Approval_empp=?,Approval_desgg=? WHERE form2_no=?");
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


psmt2 = cn2.prepareStatement("INSERT INTO form2_domain_item(form2_no,desg,emp,status,remarks,f_date,mail,presence) VALUES(?,?,?,?,?,?,?,?)");
psmt2.setString(1,form_no);
psmt2.setString(2,desg);
psmt2.setString(3,emp);
psmt2.setString(4,"Pending");
psmt2.setString(5,"Pending");
psmt2.setDate(6,form_date);
psmt2.setString(7,mail);
psmt2.setString(8,"now");

int j = psmt2.executeUpdate();


message = mailMessage.getMailMessageDomain(form_no.trim());
System.out.println("desg for sending mail : "+desg);
System.out.println("Emp for sending mail : "+emp);
System.out.println("Mail id for edning mail : "+mail);
//postMail.postMail(i_email_id,"pass1234",mail," DOMAIN USER FORM :  " +form_no+ " ",i_name+  " "+  "request your approval for the following DOMAIN USER FORM. " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  https://10.206.10.18:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - https://203.124.152.5:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>"+message);

/* if(mmdradio!=null && mmdradio.equals("Approved"))
{
	postMail.postMail(i_email_id,"pass1234",mail," DOMAIN USER FORM :  " +form_no+ " ",i_name+  " "+  "request Is Been Approved " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  https://10.206.10.3:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
}
if(mmdradio!=null && mmdradio.equals("Not Approved"))
{
	postMail.postMail(i_email_id,"pass1234",mail," DOMAIN USER FORM :  " +form_no+ " ",initiatorNameIfNotApproved+  " "+  "request Is NOT Approved " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  https://10.206.10.3:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>");
}
 */

if((mmdradio!=null && mmdradio.equals("Approved"))&&(higherAuthority!=null && higherAuthority.equals("higherAuthority"))) 
{   // if Approved and sending again to Higher authority 
	postMail.postMail(i_email_id,i_name,"pass1234",mail," DOMAIN USER FORM :  " +form_no+ " ",i_name+  " "+  "request you to Approve - DOMAIN USER FORM : " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://ninsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
}
	if((mmdradio!=null && mmdradio.equals("Approved"))&&(higherAuthority!=null && higherAuthority.equals("directApprove"))) 
{   // if Approved and want to send directly to IT nonIT persons of HO and ONE copy to Initiator
	postMail.postMail(i_email_id,i_name,"pass1234",mail," DOMAIN USER FORM :  " +form_no+ " ",i_name+  " "+  "request you to approve - DOMAIN USER FORM : " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://ninsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
	postMail.postMail(i_email_id,i_name,"pass1234",allMails," DOMAIN USER FORM :  " +form_no+ " ",initiatorNameIfNotApproved+  " "+  "your request for DOMAIN USER FORM "+form_no+" Is Been Approved by " +i_name+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://ninsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>");
}
if((mmdradio!=null && mmdradio.equals("Not Approved"))&&(higherAuthority!=null && higherAuthority.equals("directApprove")))
{   // if NOT Approved , so a copy to Initaior 
	postMail.postMail(i_email_id,i_name,"pass1234",mail," DOMAIN USER FORM :  " +form_no+ " ",initiatorNameIfNotApproved+  " "+  "your request for DOMAIN USER FORM : "+form_no+" Is NOT Approved by " +i_name+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://ninsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>");
}

message = null;

msg = "DOMAIN__USER__FORM__SAVED__AND__SENT__SUCCESSFULLY";
System.out.println("result..date..........."+form_date);
//response.sendRedirect("ITclearanceSelectAdmin.jsp?msg=" +msg);
response.sendRedirect("DomainUserSelectAdmin.jsp?msg=" +msg);


%>


</html>
