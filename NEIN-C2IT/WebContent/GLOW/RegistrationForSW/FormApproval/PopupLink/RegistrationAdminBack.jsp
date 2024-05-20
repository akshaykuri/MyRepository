<%@page import="CON2.MailMessageRegistration"%>

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
                  MailMessageRegistration mailMessage = new MailMessageRegistration();
                  Connection conn = null, conn1 = null,cn2=null; 
	              Statement st= null, st1=null,st2=null,st3=null,st4=null,st5=null,st6=null,st7=null,st8=null,st9=null,st11=null;
	              ResultSet rs = null;
	              String message = null;
	              %>
	              <%
	              cn2 = con.getConnection2();
	              st2 = cn2.createStatement();
	              PreparedStatement psmt=null,psmt2=null,psmt3=null,psmt4=null,psmt4it;
	              %>
	          
<%

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
String levelno=request.getParameter("levelno");
String txtmail_msg = request.getParameter("txtmail_msg");

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



System.out.println("desg for sending mail : "+desg);
System.out.println("Emp for sending mail : "+emp);
System.out.println("Mail id for edning mail : "+mail);
if((mmdradio!=null && mmdradio.equals("Approved"))) 
    {  
	if(!empid1.equals("Final"))
			{
	        psmt = cn2.prepareStatement("UPDATE  form14_ccdregistration_item SET status=?,remarks=?,presence=? WHERE form10_no=?  and empid='"+session.getAttribute("EmpNo")+"' ");
	        psmt.setString(1,mmdradio);
	        psmt.setString(2,txtmail_msg);
	        psmt.setString(3,"over");
	        psmt.setString(4,form_no);
	        int i = psmt.executeUpdate();

         	PreparedStatement psmt10=null;
	        psmt10 = cn2.prepareStatement("insert into form14_ccdregistration_item (form10_no,desg,emp,status,remarks,f_date,mail,presence,empid,levelno) values (?,?,?,?,?,?,?,?,?,?)");
	        psmt10.setString(1,form_no);
         	psmt10.setString(2,desg);
	        psmt10.setString(3,emp);
	        psmt10.setString(4,"Pending");
	        psmt10.setString(5,"Pending");
	        psmt10.setDate(6,form_date);
	        psmt10.setString(7,mail);
	        psmt10.setString(8,"now");
	        psmt10.setString(9,empid1);
	        psmt10.setString(10,levelno);
	        int b = psmt10.executeUpdate(); 
	        message = mailMessage.getMailMessageCCDRegistration(form_no.trim());
	        postMail.postMail(i_email_id,i_name,"pass1234",mail,"NEIN-C2IT CCD USER - REGISTRATION FORM :  " +form_no+ " ",i_name+  " "+  "Request you to please approve :" +form_no+ "  <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
			}
	    else
	        {
	    	psmt = cn2.prepareStatement("UPDATE  form14_ccdregistration_item SET status=?,remarks=?,presence=? WHERE form10_no=?  and empid='"+session.getAttribute("EmpNo")+"' ");
	    	psmt.setString(1,mmdradio);
	    	psmt.setString(2,txtmail_msg);
	    	psmt.setString(3,"over");
	    	psmt.setString(4,form_no);
	    	int i = psmt.executeUpdate();
	    	
	    	PreparedStatement psmt11=null;
	        psmt11 = cn2.prepareStatement("insert into form14_ccdregistration_item (form10_no,desg,emp,status,remarks,f_date,mail,presence,empid,levelno) values (?,?,?,?,?,?,?,?,?,?)");
	        psmt11.setString(1,form_no);
         	psmt11.setString(2,desg);
	        psmt11.setString(3,emp);
	        psmt11.setString(4,"Pending");
	        psmt11.setString(5,"Pending");
	        psmt11.setDate(6,form_date);
	        psmt11.setString(7,mail);
	        psmt11.setString(8,"now");
	        psmt11.setString(9,"2645");
	        psmt11.setString(10,levelno);
	        int b = psmt11.executeUpdate(); 
	    	
	    	
	    	
	    	message = mailMessage.getMailMessageCCDRegistration(form_no.trim());
	    	postMail.postMail(i_email_id,i_name,"pass1234",mail,"NEIN-C2IT CCD USER - REGISTRATION FORM :  " +form_no+ " ","Dear "+emp+","+"<br>Request you to Create User Credential in CCD Application of Form No :" +form_no+ "  <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
            }
		
 	}
else
    {
	psmt = cn2.prepareStatement("UPDATE  form14_ccdregistration_item SET status=?,remarks=?,presence=? WHERE form10_no=?  and empid='"+session.getAttribute("EmpNo")+"' ");
	psmt.setString(1,mmdradio);
	psmt.setString(2,txtmail_msg);
	psmt.setString(3,"over");
	psmt.setString(4,form_no);
	int i = psmt.executeUpdate();
	message = mailMessage.getMailMessageCCDRegistration(form_no.trim());
	postMail.postMail(i_email_id,i_name,"pass1234",mail,"NEIN-C2IT CCD USER - REGISTRATION FORM :  " +form_no+ " ", "Your request for CCD user registration form no :" +form_no+ " not approved by :" +i_name+ "<br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
	 
    }

message = null;
msg = "CCD__USER__REGISTRATION__SAVED__AND__SENT__SUCCESSFULLY";
response.sendRedirect("../../../../adminPage.jsp?msg=" +msg);


%>


</html>
