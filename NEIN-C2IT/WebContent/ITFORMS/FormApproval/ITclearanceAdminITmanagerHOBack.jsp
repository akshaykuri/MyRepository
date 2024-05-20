<%@page import="CON2.MailMessageITclearance"%>

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
                  MailMessageITclearance mailMessage = new MailMessageITclearance();
                  Connection conn = null, conn1 = null,cn2=null,cn3=null; 
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




String form_no = request.getParameter("form1_no");
String f_date = request.getParameter("f_date");
String mmdradio = request.getParameter("mmdradio");
String NONITmailing = request.getParameter("NONITmailing");
String NONITName = request.getParameter("NONITName");
//String ITusername = request.getParameter("ITusername");
//String ITpassword = request.getParameter("ITpassword");
//String ITcreated = request.getParameter("ITcreated");
String ITremark = request.getParameter("ITremark");
String mailingCheck[] = request.getParameterValues("mailingCheck");


String it1a = request.getParameter("it1a");
String it1aa = request.getParameter("it1aa");
String it2b = request.getParameter("it2b");
String it2bb = request.getParameter("it2bb");
String it3c = request.getParameter("it3c");
String it3cc = request.getParameter("it3cc");
String it4d = request.getParameter("it4d");
String it4dd = request.getParameter("it4dd");
String it5e = request.getParameter("it5e");
String it5ee = request.getParameter("it5ee");
String it6f = request.getParameter("it6f");
String it6ff = request.getParameter("it6ff");
String it7g = request.getParameter("it7g");
String it7gg = request.getParameter("it7gg");
String it8h = request.getParameter("it8h");
String it8hh = request.getParameter("it8hh");
String it9i = request.getParameter("it9i");
String it9ii = request.getParameter("it9ii");
String it10j = request.getParameter("it10j");
String it10jj = request.getParameter("it10jj");


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




System.out.println("NEW MAIL after changing if not approved : "+mailingCheck);

psmt = cn2.prepareStatement("UPDATE form1_it_clearance_item SET status=?,remarks=?,f_date=?,presence=? WHERE form1_no=? AND desg=? AND emp=? ");
//psmt = cn2.prepareStatement("INSERT INTO form2_domain_item(status,remarks,f_date,presence,form2_no,desg,emp) VALUES(?,?,?,?,?,?,?)");
psmt.setString(1,"Approved");
psmt.setString(2,ITremark);
psmt.setDate(3,form_date);
psmt.setString(4,"over");
psmt.setString(5,form_no);
psmt.setString(6,i_desg);
psmt.setString(7,i_name);

int i = psmt.executeUpdate();

PreparedStatement psmt10=null;
psmt10 = cn2.prepareStatement("UPDATE form1_it_clearance SET Approval_status=?,Approval_sttatuss=?,Approval_remarks=?,Approval_f_date=?,Approval_emp=?,Approval_desg=?,Approval_empp=?,Approval_desgg=? WHERE form1_no=?");
psmt10.setString(1,mmdradio);
psmt10.setString(2,"Pending");
psmt10.setString(3,ITremark);
psmt10.setDate(4,form_date);
psmt10.setString(5,NONITName);
psmt10.setString(6,"HR MANAGER");
psmt10.setString(7,i_name);
psmt10.setString(8,i_desg);
psmt10.setString(9,form_no);
int b = psmt10.executeUpdate(); 

PreparedStatement psmt11=null;
//psmt11 = cn3.prepareStatement("INSERT INTO form1_it_clearance(it1a,it1aa,it2b,it2bb,it3c,it3cc,it4d,it4d,it5e,it5ee,it6f,it6ff,it7g,it7gg,it8h,it8hh,it9i,it9ii,it10j,it10jj)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) WHERE form1_no=?");
psmt11 = cn2.prepareStatement("UPDATE form1_it_clearance SET it1a=?,it1aa=?,it2b=?,it2bb=?,it3c=?,it3cc=?,it4d=?,it4dd=?,it5e=?,it5ee=?,it6f=?,it6ff=?,it7g=?,it7gg=?,it8h=?,it8hh=?,it9i=?,it9ii=?,it10j=?,it10jj=? WHERE form1_no=?");
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
psmt11.setString(21,form_no);
int r = psmt11.executeUpdate();


psmt2 = cn2.prepareStatement("UPDATE form1_it_clearance SET ITremark=?,Approval_sttatuss=?,Approval_f_date=? WHERE form1_no=?");
//psmt2.setString(1,ITusername);
//psmt2.setString(2,ITpassword);
//psmt2.setString(3,ITcreated);
psmt2.setString(1,ITremark);

psmt2.setString(2,"NULL");
psmt2.setDate(3,form_date);

psmt2.setString(4,form_no);


int j = psmt2.executeUpdate();
System.out.println("NONITName : "+NONITName);
System.out.println("NONITmailing : "+NONITmailing);

if(NONITmailing!=null){
psmt3 = cn3.prepareStatement("INSERT INTO form1_it_clearance_item(form1_no,desg,emp,status,remarks,f_date,mail,presence) VALUES(?,?,?,?,?,?,?,?)");
psmt3.setString(1,form_no);
psmt3.setString(2,"HR MANAGER");
psmt3.setString(3,NONITName);
psmt3.setString(4,"Pending");
psmt3.setString(5,"Pending");
psmt3.setDate(6,form_date);
psmt3.setString(7,NONITmailing);
psmt3.setString(8,"now");

int k = psmt2.executeUpdate();

}




message = mailMessage.getMailMessage(form_no.trim());

for(int u=0;u<mailingCheck.length;u++)
{
postMail.postMail(i_email_id,i_name,"pass1234",mailingCheck[u]," IT CLEARANCE FORM :  " +form_no+ " ",i_name+  " "+  "Approved request of FORM :" +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://ninsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
}
if(NONITmailing!=null)
{
	postMail.postMail(i_email_id,i_name,"pass1234",NONITmailing," IT CLEARANCE FORM :  " +form_no+ " ",i_name+  " "+  "request you to Approved of FORM :" +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://ninsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
}
message = null;

msg = "IT__CLEARANCE__FORM__NO__:__'"+form_no+"'__SAVED__AND__SENT__SUCCESSFULLY";
System.out.println("result..date..........."+form_date);
//response.sendRedirect("ITclearanceSelectAdmin.jsp?msg=" +msg);
response.sendRedirect("ITclearanceSelectAdmin.jsp?msg=" +msg);


%>


</html>
