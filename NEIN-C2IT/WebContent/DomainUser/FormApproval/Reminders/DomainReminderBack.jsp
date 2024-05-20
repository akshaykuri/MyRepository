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




String form_no = request.getParameter("form_no");
String initiator_for = request.getParameter("initiator_for");
String initiator_by = request.getParameter("initiator_by");
String f_date = request.getParameter("f_date");



String reminder = request.getParameter("reminder");

System.out.println("--------- FRONT ENDtttttttttttttttttttttttttt ----------" + reminder);



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
psmt11 = cn2.prepareStatement("UPDATE form2_domain SET reminder=?,f_date=? WHERE form2_no=?");
psmt11.setString(1,reminder);
psmt11.setDate(2,form_date);
psmt11.setString(3,form_no);
int r = psmt11.executeUpdate();








msg2 = "Domain__User__REMINDER__FORM__NO__:__'"+form_no+"'__SAVED__SUCCESSFULLY";
System.out.println("result..date..........."+form_date);
response.sendRedirect("DomainReminder.jsp?msg2="+msg2);
//response.sendRedirect("DisplayITPendingReminder.jsp?msg=" +msg);

//response.sendRedirect("../../../adminPage.jsp?msg=" +msg);


%>


</html>
