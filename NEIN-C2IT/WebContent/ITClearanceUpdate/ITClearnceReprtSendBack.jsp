<%@page import="CON2.DbUtil"%>
<%@page import="CON2.CreateAttachment"%>
<%@page import="CON2.MailMessageCheckList"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.text.resources.FormatData"%>
<jsp:useBean id="dateFormat" class="CON2.DateFormat"/>
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<jsp:useBean id = "pdf" class="com.ck.file.FileAttachment" /> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id = "postMail" class="CON2.PostMail" /> 
<html>
<head>
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />

</head>
<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80" topmargin="50" bottommargin="40" marginwidth="50" marginheight="100">
<form name=form>
   <%
   String messaage="";
   String formno=request.getParameter("formno");
   String mailid=request.getParameter("sentToName");
   String e_name = (String) session.getAttribute("Nname");
   String Initiator_mail_id = (String) session.getAttribute("Nmail");
   
   System.out.println("formnoformnoformnoformno  : "+formno);
   System.out.println("mailidmailidmailidmailid : "+mailid);
   System.out.println("e_namee_namee_namee_namee_name  : "+e_name);
   System.out.println("Initiator_mail_idInitiator_ : "+Initiator_mail_id);
   
 try
   {
   pdf.getAttachmentFileITClearance(formno);
   postMail.postMailAttachedFileITClerance(Initiator_mail_id,e_name,"pass1234",mailid,"NEIN-C2IT Outstanding Dues & Handover Report:  " +formno+ " ",e_name+  " "+  "Sent Outstanding Dues & Handover Report :  " +formno+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>",formno);

		
	    
	String msg = "IT__CLEARANCE__UPDATED__AND__SAVED__SUCCESSFULLY";
    response.sendRedirect("ItClearanceUpdateForm.jsp?msg=" +msg); 
   }
   catch(Exception e){ System.out.println("End of itclerance"+e); e.printStackTrace(); }
   finally{
	//DbUtil.closeDBResources(null,null,conn);
    }
%>
</form>
</body>
</html>
