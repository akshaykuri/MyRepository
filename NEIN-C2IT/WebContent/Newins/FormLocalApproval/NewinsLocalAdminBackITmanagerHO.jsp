<%@page import="CON2.MailMessageNewins"%>
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
                  MailMessageNewins mailMessage = new MailMessageNewins();
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
	              
<%

String i_name= request.getParameter("i_name");
String i_desg= request.getParameter("i_desg");
String i_city= request.getParameter("i_city");
String i_b_no= request.getParameter("i_b_no");
String i_admin= request.getParameter("i_admin");
String i_email_id= request.getParameter("i_email_id");




String form_no = request.getParameter("form7_no");
String f_date = request.getParameter("f_date");
String mmdradio = request.getParameter("mmdradio");


String ITdcode = request.getParameter("ITdcode");
String ITdpassword = request.getParameter("ITdpassword");
String ITdlevel = request.getParameter("ITdlevel");
String ITdremark = request.getParameter("ITdremark");
String mailingCheck[] = request.getParameterValues("mailingCheck");
String HRadminFromQuery = request.getParameter("HRadminFromQuery");
String HRadminNameFromQuery = request.getParameter("HRadminNameFromQuery");

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






//psmt = cn2.prepareStatement("UPDATE form7_newins_item SET status=?,remarks=?,f_date=?,presence=? WHERE form7_no=? AND desg=? AND emp=? ");
psmt = cn2.prepareStatement("UPDATE form7_newins_item f,(SELECT max(id) as idf FROM form7_newins_item WHERE form7_no=? AND desg=? AND emp=?) as p SET f.status=?,f.remarks=?,f.f_date=?,f.presence=? WHERE f.form7_no=? AND f.desg=? AND f.emp=? AND f.id=p.idf");
//psmt = cn2.prepareStatement("INSERT INTO form2_domain_item(status,remarks,f_date,presence,form2_no,desg,emp) VALUES(?,?,?,?,?,?,?)");
psmt.setString(1,form_no);
psmt.setString(2,i_desg);
psmt.setString(3,i_name);
psmt.setString(4,"Approved");
psmt.setString(5,ITdremark);
psmt.setDate(6,form_date);
psmt.setString(7,"over");
psmt.setString(8,form_no);
psmt.setString(9,i_desg);
psmt.setString(10,i_name);

int i = psmt.executeUpdate();

psmt2 = cn2.prepareStatement("UPDATE form7_newins SET ITdcode=?,ITdpassword=?,ITdlevel=?,ITdremark=?,Approval_sttatuss=?,Approval_f_date=? WHERE form7_no=?");
psmt2.setString(1,ITdcode);
psmt2.setString(2,ITdpassword);
psmt2.setString(3,ITdlevel);
psmt2.setString(4,ITdremark);

psmt2.setString(5,"NULL");
psmt2.setDate(6,form_date);

psmt2.setString(7,form_no);


int j = psmt2.executeUpdate();

if(HRadminFromQuery != null)
{
	//psmt = cn2.prepareStatement("UPDATE form7_newins_item SET status=?,remarks=?,f_date=?,presence=? WHERE form7_no=? AND desg=? AND emp=? ");
	psmt3 = cn2.prepareStatement("INSERT INTO form7_newins_item(status,remarks,f_date,presence,form7_no,desg,emp,mail) VALUES(?,?,?,?,?,?,?,?)");
	psmt3.setString(1,"SENT MAIL");
	psmt3.setString(2,"Recieved Mail");
	psmt3.setDate(3,form_date);
	psmt3.setString(4,"over");
	psmt3.setString(5,form_no);
	psmt3.setString(6,"HR/ADMIN");
	psmt3.setString(7,HRadminNameFromQuery);
	psmt3.setString(8,HRadminFromQuery);
	int k = psmt3.executeUpdate();	
}



message = mailMessage.getMailMessageNewins(form_no.trim());

for(int u=0;u<mailingCheck.length;u++)
{
	System.out.println("NEW MAIL after changing if not approved : "+mailingCheck[u]);
postMail.postMail(i_email_id,i_name,"pass1234",mailingCheck[u]," NEWINS USER FORM :  " +form_no+ " ",i_name+  " "+  "request is Approved " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
			if(HRadminFromQuery != null)
				{
					postMail.postMail(i_email_id,i_name,"pass1234",HRadminFromQuery," NEWINS USER FORM :  " +form_no+ " ",i_name+  " "+  "HR/ADMIN(HO) request is Approved " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
				}
			else{
				
		    	}
}

message = null;

msg = "NEWINS__USER__FORM__SAVED__AND__SENT__SUCCESSFULLY";
System.out.println("result..date..........."+form_date);
//response.sendRedirect("ITclearanceSelectAdmin.jsp?msg=" +msg);
response.sendRedirect("NewinsSelectLocalAdmin.jsp?msg=" +msg);


%>


</html>
