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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
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
	              PreparedStatement psmt=null,psmt2=null,psmt3=null,psmt4=null,psmt5=null;
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


String progBlocked[] = request.getParameterValues("progBlocked");
String progAllowed[] = request.getParameterValues("progAllowed");

String NonITremark = request.getParameter("NonitRemarks");
String level = request.getParameter("level");

String ITmail = request.getParameter("ITmail");
String ITName = request.getParameter("ITName");
String ITdesg = request.getParameter("ITdesg");


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


System.out.println(" form_no :"+form_no);


System.out.println(" i_desg :"+i_desg);
System.out.println(" i_name :"+i_name);



System.out.println(" NonITremark :"+NonITremark);
System.out.println(" form_date :"+form_date);


//psmt = cn2.prepareStatement("UPDATE form7_newins_item SET status=?,remarks=?,f_date=?,presence=? WHERE form7_no=? AND desg=? AND emp=? ");
psmt = cn2.prepareStatement("UPDATE form7_newins_item f,(SELECT max(id) as idf FROM form7_newins_item WHERE form7_no=? AND desg=? AND emp=?) as p SET f.status=?,f.remarks=?,f.f_date=?,f.presence=? WHERE f.form7_no=? AND f.desg=? AND f.emp=? AND f.id=p.idf");
//psmt = cn2.prepareStatement("INSERT INTO form2_domain_item(status,remarks,f_date,presence,form2_no,desg,emp) VALUES(?,?,?,?,?,?,?)");
psmt.setString(1,form_no);
psmt.setString(2,i_desg);
psmt.setString(3,i_name);
psmt.setString(4,"Approved");
psmt.setString(5,NonITremark);
psmt.setDate(6,form_date);
psmt.setString(7,"over");
psmt.setString(8,form_no);
psmt.setString(9,i_desg);
psmt.setString(10,i_name);

int i = psmt.executeUpdate();

System.out.println(" level :"+level);

psmt2 = cn2.prepareStatement("UPDATE form7_newins SET ITdlevel=?,Approval_sttatuss=?,Approval_f_date=?,Approval_emp=?,Approval_desg=?,Approval_sttatuss=? WHERE form7_no=?");
psmt2.setString(1,level);
//psmt2.setString(1,"NULL");
psmt2.setString(2,"NULL");
psmt2.setDate(3,form_date);
psmt2.setString(4,ITName);
psmt2.setString(5,ITdesg);
psmt2.setString(6,"Pending");
psmt2.setString(7,form_no);

int j = psmt2.executeUpdate();



System.out.println(" ITdesg :"+ITdesg);// ITdesg :farooqsha27@gmail.com
System.out.println(" ITName :"+ITName);// ITName :GENERAL MANAGER
System.out.println(" ITmail :"+ITmail);// ITmail :90

psmt3 = cn2.prepareStatement("INSERT INTO form7_newins_item(status,remarks,f_date,presence,form7_no,desg,emp,mail) VALUES(?,?,?,?,?,?,?,?)");
psmt3.setString(1,"Pending");
psmt3.setString(2,"Pending");
psmt3.setDate(3,form_date);
psmt3.setString(4,"now");
psmt3.setString(5,form_no);

psmt3.setString(6,ITdesg);// ITdesg :farooqsha27@gmail.com
psmt3.setString(7,ITName);//ITName :GENERAL MANAGER
psmt3.setString(8,ITmail);// 

int k = psmt3.executeUpdate();	

System.out.println(" progBlocked :"+progBlocked);
System.out.println(" progAllowed :"+progAllowed);
try{
	for(int h=0;h<progBlocked.length;h++)
		{
		//st1.executeUpdate("insert into form7_blocked(form7_no,desg,name) values(,'IT SUPPORT','"+idb+"','"+Npwdb+"','"+assignedLocation[k]+"','"+Npostingcob+"')");
		psmt4 = cn2.prepareStatement("INSERT INTO form7_blocked(form7_no,desg,name,progBlocked) VALUES(?,?,?,?)");
		psmt4.setString(1,form_no);
		psmt4.setString(2,i_desg);
		psmt4.setString(3,i_name);
		psmt4.setString(4,progBlocked[h]);
		int g = psmt4.executeUpdate();
		}
	
	for(int l=0;l<progAllowed.length;l++)
		{
		//st1.executeUpdate("insert into form7_blocked(form7_no,desg,name) values(,'IT SUPPORT','"+idb+"','"+Npwdb+"','"+assignedLocation[k]+"','"+Npostingcob+"')");
		psmt5 = cn2.prepareStatement("INSERT INTO form7_allowed(form7_no,desg,name,progAllowed) VALUES(?,?,?,?)");
		psmt5.setString(1,form_no);
		psmt5.setString(2,i_desg);
		psmt5.setString(3,i_name);
		psmt5.setString(4,progAllowed[l]);
		int h = psmt5.executeUpdate();
		}
  }
catch(Exception e){e.printStackTrace();}
System.out.println(" After Catch");

message = mailMessage.getMailMessageNewins(form_no.trim());
postMail.postMail(i_email_id,i_name,"pass1234",ITmail," NEWINS USER FORM :  " +form_no+ " ",i_name+  " "+  "requested to Approve " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);


message = null;

msg = "NEWINS__USER__FORM__SAVED__AND__SENT__SUCCESSFULLY";
System.out.println("At END of Sending newins mail from Arun to Biju.");
//response.sendRedirect("ITclearanceSelectAdmin.jsp?msg=" +msg);
response.sendRedirect("NewinsSelectLocalAdmin.jsp?msg=" +msg);


%>


</html>
