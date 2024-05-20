
<%@page import="CON2.MailMessageCCDReport"%>

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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id = "postMail" class="CON2.PostMail" /> 
<html>
<head>
</head>
<%! 
                  MailMessageCCDReport mailMessage = new MailMessageCCDReport();
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
String empid1 = request.getParameter("empid1");
String levelno = request.getParameter("levelno");

String txtmail_msg = request.getParameter("txtmail_msg");


String mmradio = request.getParameter("mmradio");
String higherAuthority = request.getParameter("higherAuthority");
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
psmt4 = cn2.prepareStatement("SELECT mail,emp FROM form13_ccdreport_item WHERE form_no=? AND status=?");
psmt4.setString(1,form_no);
psmt4.setString(2,"Initiator");
ResultSet rs = psmt4.executeQuery();
while(rs.next())
    {
	allMails = rs.getString(1); 
	initiatorNameIfNotApproved =rs.getString(2);
    }


//System.out.println("FORM 2 NO ****************************: "+form_no);
//System.out.println("mmdradio: "+mmdradio);
//System.out.println("txtmail_msg : "+txtmail_msg);

if(mmdradio.equals("Approved"))
        {//System.out.println("hdfsds");
        psmt = cn2.prepareStatement("UPDATE form13_ccdreport_item set status='"+mmdradio+"',remarks='"+txtmail_msg+"' where status='Pending' and form_no='"+form_no+"'");
        int i = psmt.executeUpdate();
        
		psmt2 = cn2.prepareStatement("INSERT INTO form13_ccdreport_item(form_no,desg,emp,status,remarks,mail,empid,levelno) VALUES(?,?,?,?,?,?,?,?)");
		psmt2.setString(1,form_no);
		psmt2.setString(2,desg);
		psmt2.setString(3,emp);
		psmt2.setString(4,"Pending");
		psmt2.setString(5,"Pending");
		psmt2.setString(6,mail);
		psmt2.setString(7,empid1);
		psmt2.setString(8,levelno);
		int j = psmt2.executeUpdate();
		message = mailMessage.getMailMessageCCDReport(form_no.trim());
		postMail.postMail(i_email_id,i_name,"pass1234",mail,"NEIN-C2IT CCD Report FORM :  " +form_no+ " ",i_name+  " "+  "request you to Approve - CCD Report FORM : " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
        }
    else
        {
    	 psmt = cn2.prepareStatement("UPDATE form13_ccdreport_item set status='"+mmdradio+"' , remarks='"+txtmail_msg+"' where status='Pending' and form_no='"+form_no+"'");
         int i = psmt.executeUpdate();
         message = mailMessage.getMailMessageCCDReport(form_no.trim());
     	String allMails1=null;
    	psmt4 = cn2.prepareStatement("SELECT mail,emp FROM form13_ccdreport_item WHERE form_no=?");
    	psmt4.setString(1,form_no);
    	ResultSet rs1 = psmt4.executeQuery();
    	while(rs1.next())
    	   {
    	   allMails1 = rs1.getString(1); 
           postMail.postMail(i_email_id,i_name,"pass1234",allMails1,"NEIN-C2IT CCD Report FORM :  " +form_no+ " ",initiatorNameIfNotApproved+  " "+  "your request for - CCD Report FORM : "+form_no+" Is NOT Approved by " +i_name+ " <br>Remarks : "+txtmail_msg+"<br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>");
           }	
        }

//System.out.println("desg for sending mail : "+desg);
//System.out.println("Emp for sending mail : "+emp);
//System.out.println("Mail id for edning mail : "+mail);


message = null;

msg = "CCD__Report__FORM__SAVED__AND__SENT__SUCCESSFULLY";
System.out.println("result..date..........."+form_date);
//response.sendRedirect("ITclearanceSelectAdmin.jsp?msg=" +msg);
response.sendRedirect("../adminHR.jsp?msg=" +msg);


%>


</html>
