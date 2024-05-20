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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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




String form_no = request.getParameter("form1_no");
String initiator_for = request.getParameter("initiator_for");
String initiator_by = request.getParameter("initiator_by");
String f_date = request.getParameter("f_date");



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

/* System.out.println("--------- FRONT ENDtttttttttttttttttttttttttt ----------");
System.out.println("it1a : "+it1a);
System.out.println("it1aa : "+it1aa);
System.out.println("it2b : "+it2b);
System.out.println("it2bb : "+it2bb);
System.out.println("it3c : "+it3c);
System.out.println("it3cc : "+it3cc);
System.out.println("it4d : "+it4d);
System.out.println("it4dd : "+it4dd);
System.out.println("it5e : "+it5e);
System.out.println("it5ee : "+it5ee);
System.out.println("it6f : "+it6f);
System.out.println("it6ff : "+it6ff);
System.out.println("it7g : "+it7g);
System.out.println("it7gg : "+it7gg);
System.out.println("it8h : "+it8h);
System.out.println("it8hh : "+it8hh);
System.out.println("it9i : "+it9i);
System.out.println("it9ii : "+it9ii);
System.out.println("it10j : "+it10j);
System.out.println("it10jj : "+it10jj);

System.out.println("--------- FRONT END tttttttttttttttttttttttt----------"); */


String msg2=null;
Date form_date=null;
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

try{
	form_date = new Date(sdf.parse(f_date).getTime());
}
catch (Exception e) {
	e.printStackTrace();
}
System.out.println("f_date "+f_date   +"           form_date   :"+form_date);









PreparedStatement psmt11=null;
//psmt11 = cn3.prepareStatement("INSERT INTO form1_it_clearance(it1a,it1aa,it2b,it2bb,it3c,it3cc,it4d,it4d,it5e,it5ee,it6f,it6ff,it7g,it7gg,it8h,it8hh,it9i,it9ii,it10j,it10jj)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) WHERE form1_no=?");
psmt11 = cn2.prepareStatement("UPDATE form1_it_clearance SET it1a=?,it1aa=?,it2b=?,it2bb=?,it3c=?,it3cc=?,it4d=?,it4dd=?,it5e=?,it5ee=?,it6f=?,it6ff=?,it7g=?,it7gg=?,it8h=?,it8hh=?,it9i=?,it9ii=?,it10j=?,it10jj=?,f_date=? WHERE form1_no=?");
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
psmt11.setDate(21,form_date);
psmt11.setString(22,form_no);
int r = psmt11.executeUpdate();








msg2 = "IT__CLEARANCE__REMINDER__FORM__NO__:__'"+form_no+"'__SAVED__SUCCESSFULLY";
System.out.println("result..date..........."+form_date);
response.sendRedirect("ITclearanceReminder.jsp?msg2="+msg2);
//response.sendRedirect("DisplayITPendingReminder.jsp?msg=" +msg);

//response.sendRedirect("../../../adminPage.jsp?msg=" +msg);


%>


</html>
