<%@page import="CON2.DbUtil"%>
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
try{
String i_name= request.getParameter("i_name");
String i_desg= request.getParameter("i_desg");
String i_city= request.getParameter("i_city");
String i_b_no= request.getParameter("i_b_no");
String i_admin= request.getParameter("i_admin");
String i_email_id= request.getParameter("i_email_id");


//New changes from here To 


String d_new_relieved_request = request.getParameter("d_new_relieved_request");
String d_new_reliving_co =request.getParameter("d_new_reliving_co");

String a_model_info=request.getParameter("a_model_info");
String r_model_info=request.getParameter("r_model_info");
String a_document_ac=request.getParameter("a_document_ac");
String r_document_ac=request.getParameter("r_document_ac");


String a_document_hr=request.getParameter("a_document_hr");
String r_document_hr=request.getParameter("r_document_hr");
String a_co_car_hr=request.getParameter("a_co_car_hr");
String r_co_car_hr=request.getParameter("r_co_car_hr");
String a_calculator_hr=request.getParameter("a_calculator_hr");
String r_calculator_hr=request.getParameter("r_calculator_hr");
String a_conn_mobile_hr=request.getParameter("a_conn_mobile_hr");
String r_conn_mobile_hr=request.getParameter("r_conn_mobile_hr");
String a_mobile_handset_hr=request.getParameter("a_mobile_handset_hr");
String r_mobile_handset_hr=request.getParameter("r_mobile_handset_hr");
String a_id_card_hr=request.getParameter("a_id_card_hr");
String r_id_card_hr=request.getParameter("r_id_card_hr");
String a_work_key_hr=request.getParameter("a_work_key_hr");
String r_work_key_hr=request.getParameter("r_work_key_hr");
String a_any_other_hr=request.getParameter("a_any_other_hr");
String r_any_other_hr=request.getParameter("r_any_other_hr");
String a_leave_card_hr=request.getParameter("a_leave_card_hr");
String r_leave_card_hr=request.getParameter("r_leave_card_hr");
String a_resignation_letter_hr=request.getParameter("a_resignation_letter_hr");
String r_resignation_letter_hr=request.getParameter("r_resignation_letter_hr");
String a_identity_card_hr=request.getParameter("a_identity_card_hr");
String r_identity_card_hr=request.getParameter("r_identity_card_hr");

//Till here 

String form_no = request.getParameter("form1_no");
String f_date = request.getParameter("f_date");
String mmdradio = request.getParameter("mmdradio");


//String ITusername = request.getParameter("ITusername");
//String ITpassword = request.getParameter("ITpassword");
//String ITcreated = request.getParameter("ITcreated");
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

psmt2 = cn2.prepareStatement("UPDATE form1_it_clearance SET ITremark=?,Approval_sttatuss=?,Approval_f_date=? WHERE form1_no=?");
//psmt2.setString(1,ITusername);
//psmt2.setString(2,ITpassword);
//psmt2.setString(3,ITcreated);
psmt2.setString(1,ITremark);

psmt2.setString(2,"NULL");
psmt2.setDate(3,form_date);

psmt2.setString(4,form_no);


int j = psmt2.executeUpdate();




message = mailMessage.getMailMessage(form_no.trim());

for(int u=0;u<mailingCheck.length;u++)
{
postMail.postMail(i_email_id,i_name,"pass1234",mailingCheck[u]," IT CLEARANCE FORM :  " +form_no+ " ","your request for IT CLEARANCE FORM : "+form_no+" has been Approved by " +i_name+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT -  https://ninsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> Common Link - https://neinsoft.nittsu.co.in:8185/NEIN/  <br><br><br><br>"+message);
}

message = null;

msg = "IT__CLEARANCE__FORM__NO__:__'"+form_no+"'__SAVED__AND__SENT__SUCCESSFULLY";
System.out.println("result..date..........."+form_date);
//response.sendRedirect("ITclearanceSelectAdmin.jsp?msg=" +msg);
response.sendRedirect("ITclearanceSelectLocalAdmin.jsp?msg=" +msg);

}
catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
	DbUtil.closeDBResources(rs,st,conn);
	DbUtil.closeDBResources(null,st2,conn1);
	DbUtil.closeDBResources(null,st1,cn2);
	DbUtil.closeDBResources(null,st11,null);
	DbUtil.closeDBResources(null,st3,null);
	DbUtil.closeDBResources(null,st4,null);
	DbUtil.closeDBResources(null,st5,null);
	DbUtil.closeDBResources(null,st6,null);
	DbUtil.closeDBResources(null,st7,null);
	DbUtil.closeDBResources(null,st8,null);
	DbUtil.closeDBResources(null,st9,null);
	DbUtil.closeDBResources(null,psmt,null);

	DbUtil.closeDBResources(null,psmt2,null);
	DbUtil.closeDBResources(null,psmt3,null);
	DbUtil.closeDBResources(null,psmt4,null);
	
	

			}
%>


</html>
