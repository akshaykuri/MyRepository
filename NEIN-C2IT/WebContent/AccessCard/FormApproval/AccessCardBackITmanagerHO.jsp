<%@page import="CON2.MailMessageAccessCard"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.text.resources.FormatData"%>

<jsp:useBean id="dateFormat" class="CON2.DateFormat"/>

<jsp:useBean id = "con" class="CON2.Connection2" /> 


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id = "postMail" class="CON2.PostMail" /> 
<html>
<head>
</head>
<%! 
                  MailMessageAccessCard mailMessage = new MailMessageAccessCard();
			
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




String form_no = request.getParameter("form4_no");
String f_date = request.getParameter("f_date");
String mmdradio = request.getParameter("mmdradio");


String ITusername = request.getParameter("ITusername");
String ITpassword = request.getParameter("ITpassword");
String ITcreated = request.getParameter("ITcreated");
String ITremark = request.getParameter("ITremark");
String mailingCheck[] = request.getParameterValues("mailingCheck");

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

psmt = cn2.prepareStatement("UPDATE form4_accesscard_item SET status=?,remarks=?,f_date=?,presence=? WHERE form4_no=? AND desg=? AND emp=? ");
psmt.setString(1,"Approved");
psmt.setString(2,ITremark);
psmt.setDate(3,form_date);
psmt.setString(4,"over");
psmt.setString(5,form_no);
psmt.setString(6,i_desg);
psmt.setString(7,i_name);

int i = psmt.executeUpdate();

psmt2 = cn2.prepareStatement("UPDATE form4_accesscard SET ITusername=?,ITpassword=?,ITcreated=?,ITremark=?,Approval_sttatuss=?,Approval_f_date=? WHERE form4_no=?");
psmt2.setString(1,ITusername);
psmt2.setString(2,ITpassword);
psmt2.setString(3,ITcreated);
psmt2.setString(4,ITremark);
psmt2.setString(5,"NULL");
psmt2.setDate(6,form_date);
psmt2.setString(7,form_no);


int j = psmt2.executeUpdate();

message = mailMessage.getMailMessageCard(form_no.trim());

for(int u=0;u<mailingCheck.length;u++)
{
postMail.postMail(i_email_id,i_name,"pass1234",mailingCheck[u],"ACCESS CARD FORM :  " +form_no+ " ",i_name+  " "+  "Approved Form No.:" +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
}

message = null;

msg = "ACCESS_CARD__FORM__NO__:__'"+form_no+"'__SAVED__AND__SENT__SUCCESSFULLY";
response.sendRedirect("AccessCardSelectAdmin.jsp?msg=" +msg);


%>


</html>
