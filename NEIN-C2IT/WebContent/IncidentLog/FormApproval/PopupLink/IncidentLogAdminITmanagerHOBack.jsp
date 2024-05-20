<%@page import="CON2.MailMessageIncidentLog"%>
<%@page import="CON2.DbUtil"%>


<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.text.resources.FormatData"%>

<jsp:useBean id="dateFormat" class="CON2.DateFormat"/>

<jsp:useBean id = "con" class="CON2.Connection2" /> 


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id = "postMail" class="CON2.PostMail" /> 
<html>
<head>
</head>
<%! 
                  MailMessageIncidentLog mailMessage = new MailMessageIncidentLog();
                  Connection conn = null, conn1 = null,cn2=null; 
	              Statement st= null, st1=null,st2=null,st3=null,st4=null,st5=null,st6=null,st7=null,st8=null,st9=null,st11=null;
	              ResultSet rs = null;
	              String message = null;
	              %>
	              <%
	              
	              cn2 = con.getConnection2();
	              st2 = cn2.createStatement();
	              PreparedStatement psmt=null,psmt2=null,psmt3=null,psmt4=null;
	              PreparedStatement psmtApOp1=null,psmtApOp2=null,psmtApOp3=null;
	              %>
	              
<%
try{
String i_name= request.getParameter("i_name");
String i_desg= request.getParameter("i_desg");
String i_city= request.getParameter("i_city");
String i_b_no= request.getParameter("i_b_no");
String i_admin= request.getParameter("i_admin");
String i_email_id= request.getParameter("i_email_id");


/* String ApprovalOption = request.getParameter("ApprovalOption");
System.out.println("ApprovalOption :::::::::::::::::::: "+ApprovalOption); */
String txtmail_msg = request.getParameter("txtmail_msg");
String desg = request.getParameter("desg");
String emp = request.getParameter("emp");
String Mail1 = request.getParameter("mail1");
String higherAuthority = request.getParameter("higherAuthority");

String reminder = request.getParameter("reminder");

String form_no = request.getParameter("form9_no");
String f_date = request.getParameter("f_date");
String mmdradio = request.getParameter("mmdradio");


String ITstatusRev = request.getParameter("I_viewedByHOIT");
//String HRstatusRev = request.getParameter("HRstatusRev");




String ITstatus = request.getParameter("ITstatus");
/* String ITpassword = request.getParameter("ITpassword");
String ITcreated = request.getParameter("ITcreated") */;
String ITremark = request.getParameter("ITremark");
String mailingCheck[] = request.getParameterValues("mailingCheck");
String mmdradioBcc = request.getParameter("mmdradioBcc");
String SendExtraMails = request.getParameter("SendBCCmail");
System.out.println("mmdradioBcc :"+mmdradioBcc);
System.out.println("SendExtraMails :"+SendExtraMails);
/* String values[] = SendExtraMails.split(",");


System.out.println("val 1 To Mail: "+values[0]);//farooq.s@nittsu.co.in
System.out.println("val 2 : "+values[1]);//NEIN/CM-71
System.out.println("val 3 From Name: "+values[2]);// ddd */



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





String allMails=null,initiatorNameIfNotApproved=null,initiatorNamee=null;
psmt4 = cn2.prepareStatement("SELECT mail,emp FROM  form9_incident_log_item WHERE form9_no=? AND status=?");
psmt4.setString(1,form_no);
psmt4.setString(2,"Initiator");
ResultSet rs = psmt4.executeQuery();
while(rs.next())
{
	allMails = rs.getString(1); 
	initiatorNameIfNotApproved = rs.getString(2);
	initiatorNamee = rs.getString(2);
}

/* if(mmdradio!=null && mmdradio.equals("Not Approved"))
{
	desg ="NOT APPROVED";
	emp="NOT APPROVED";
	Mail1 =allMails;
} */
String pending = "Pending";
if(mmdradio!=null && mmdradio.equals("No Incident reported"))
{
	//desg ="NOT APPROVED";
	//emp="NOT APPROVED";
	//mmdradio="NOT APPROVED";
	//txtmail_msg = "NOT APPROVED";
	Mail1 =allMails;
	//pending ="NOT APPROVED";
}
System.out.println("NEW MAIL after changing if not approved : "+Mail1);
System.out.println("initiatorNamee :"+initiatorNamee );




psmt = cn2.prepareStatement("UPDATE  form9_incident_log_item SET status=?,remarks=?,f_date=?,presence=? WHERE form9_no=? AND desg=? AND emp=? ");
psmt.setString(1,ITstatus);
psmt.setString(2,ITremark);
psmt.setDate(3,form_date);
psmt.setString(4,"over");
psmt.setString(5,form_no);
psmt.setString(6,i_desg);
psmt.setString(7,i_name);

int i = psmt.executeUpdate();
System.out.println("i executed :");
psmt2 = cn2.prepareStatement("UPDATE form9_incident_log SET ITstatus=?,ITremark=?,Approval_sttatuss=?,Approval_f_date=?,status=?,ITViewStatus=? WHERE form9_no=?");
//psmt2 = cn2.prepareStatement("UPDATE form9_incident_log SET ITusername=?,ITpassword=?,ITcreated=?,ITremark=?,Approval_sttatuss=?,Approval_f_date=?,reminder=? WHERE form6_no=?");
psmt2.setString(1,ITstatus);
psmt2.setString(2,ITremark);

psmt2.setString(3,"NULL");
psmt2.setDate(4,form_date);
//psmt2.setString(5,reminder);
psmt2.setString(5,"over");
psmt2.setString(6,ITstatusRev);
 //psmt2.setString(7,HRstatusRev);
psmt2.setString(7,form_no);


int j = psmt2.executeUpdate();

System.out.println("j executed :");

System.out.println("messageeeeee :"+mailingCheck);
//message = mailMessage.getMailMessageIncidentLog(form_no.trim());
message = mailMessage.getMailMessageIncidentLog(form_no.trim());

for(int u=0;u<mailingCheck.length;u++)
{
postMail.postMail(i_email_id,i_name,"pass1234",mailingCheck[u],"NEIN-C2IT INCIDENT LOG FORM :  " +form_no+ " ",i_name+  " "+  " Approved request for the Form No.:" +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
}







//postMail.postMail(i_email_id,i_name,"pass1234","prasanna.shetty@nittsu.co.in","NEIN-C2IT INCIDENT LOG FORM :  " +form_no+ " ",i_name+  " "+  " Approved request for the Form No.:" +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
postMail.postMail(i_email_id,i_name,"pass1234","sharath.kumara@nipponexpress.com","NEIN-C2IT INCIDENT LOG FORM :  " +form_no+ " ",i_name+  " "+  " Approved request for the Form No.:" +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
postMail.postMail(i_email_id,i_name,"pass1234","kishan.gowda@nipponexpress.com","NEIN-C2IT INCIDENT LOG FORM :  " +form_no+ " ",i_name+  " "+  " Approved request for the Form No.:" +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
postMail.postMail(i_email_id,i_name,"pass1234","chintu.kumar@nipponexpress.com","NEIN-C2IT INCIDENT LOG FORM :  " +form_no+ " ",i_name+  " "+  " Approved request for the Form No.:" +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);












//System.out.println("IF SendExtraMails before :"+SendExtraMails);
if((SendExtraMails!="NULL")||(mmdradioBcc=="Yes"))
{ System.out.println("IF SendExtraMails"+SendExtraMails);
   String values[] = SendExtraMails.split(",");
	for(int u=0;u<values.length;u++)
	{
	 System.out.println("IF SendExtraMails ddddd :"+values[u]);
	 postMail.postMail(i_email_id,i_name,"pass1234",values[u],"NEIN-C2IT INCIDENT LOG FORM :  " +form_no+ " ",i_name+  " "+  " Approved request for the Form No.:" +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
	}
}
message = null;
System.out.println("message null :");
msg = "INCIDENT__LOG__FORM__SAVED__AND__SENT__SUCCESSFULLY";
System.out.println("result..date..........."+form_date);
//response.sendRedirect("ITclearanceSelectAdmin.jsp?msg=" +msg);
//response.sendRedirect("InternetAccessSelectAdmin.jsp?msg=" +msg);
response.sendRedirect("../../../adminPage.jsp?msg=" +msg);
}
catch (Exception e) { //System.out.println(e); 
}
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
	DbUtil.closeDBResources(null,psmt4,null);
	DbUtil.closeDBResources(null,psmt2,null);
	DbUtil.closeDBResources(null,psmt3,null);
	
	DbUtil.closeDBResources(null,psmtApOp1,null);
	DbUtil.closeDBResources(null,psmtApOp2,null);
	DbUtil.closeDBResources(null,psmtApOp3,null);
  }
%>


</html>
