<%@page import="CON2.DbUtil"%>
<%@page import="CON2.MailMessageITclearance"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.text.resources.FormatData"%>
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
	              PreparedStatement psmt=null,psmt2=null,psmt3=null,psmt4=null,psmt19=null,psmt41=null;
	              %>
	              	<%--i_name,i_desg,i_city,i_b_no,i_admin,i_email_id --%>
<%
//form1_it_clearance
//form1_it_clearance_item 
try{
String i_name= request.getParameter("i_name");
String i_desg= request.getParameter("i_desg");

String i_city= request.getParameter("i_city");
String i_b_no= request.getParameter("i_b_no");
String i_admin= request.getParameter("i_admin");
String i_email_id= request.getParameter("i_email_id");

String subDept = request.getParameter("subDept");

String form_no = request.getParameter("form1_no");
String f_date = request.getParameter("f_date");
String mmdradio = request.getParameter("mmdradio");
System.out.println("mmdradio : "+mmdradio);
/* String desg = request.getParameter("desg");
String emp = request.getParameter("emp");
String mail = request.getParameter("mail1"); */

//--------------------------

String mailingCheck = request.getParameter("mailingCheck");//Nname,Npost,Nmail=emp,desg,mail
System.out.println("Mail value FOR IT CLEARANCE"+mailingCheck);
if((mailingCheck=="null"))
{
	String mss=null;
	mss = "MAIL__ID__DOES__NOT__EXIST";
	//System.out.println("IT CLEARANCE MAIL NOT EXIST : "+mailingCheck);
	response.sendRedirect("ITclearanceLocalAdmin.jsp?msg="+mss);
}
else{
	System.out.println("Mail value FOR IT CLEARANCE"+mailingCheck);
	
	String values[] = mailingCheck.split(",");
	System.out.println("val 1 : "+values[0].replaceAll(" ", ""));//emp
	System.out.println("val 2 : "+values[1].replaceAll(" ", ""));//desg
	System.out.println("val 3 : "+values[2].replaceAll(" ", ""));//mail

String emp = values[0];
String desg = values[1];
String mail = values[2].replaceAll(" ", "");

//----------------------------
String txtmail_msg = request.getParameter("txtmail_msg");

String higherAuthority = request.getParameter("higherAuthority");
String mdradio=request.getParameter("mdradio");

String Itradio=request.getParameter("Itradio");




String a_model = request.getParameter("a_model");
System.out.println("A_model :"+a_model);
String a_data_card = request.getParameter("a_datacard");
String a_email = request.getParameter("a_email");
String a_newins = request.getParameter("a_newins");
String a_domain = request.getParameter("a_domain");
String a_mobile_model = request.getParameter("a_mobile_model");
String a_mobile_no = request.getParameter("a_mobile_no");
String a_access_card = request.getParameter("a_access_card");
String a_drive = request.getParameter("a_drive");
String a_other_asset = request.getParameter("a_other_asset");
String a_remarks = request.getParameter("a_remarks");

String r_model = request.getParameter("r_model");
System.out.println("R_model :"+r_model);
String r_data_card = request.getParameter("r_datacard");
String r_email = request.getParameter("r_email");
String r_newins = request.getParameter("r_newins");
String r_domain = request.getParameter("r_domain");
String r_mobile_model = request.getParameter("r_mobile_model");
String r_mobile_no = request.getParameter("r_mobile_no");
String r_access_card = request.getParameter("r_access_card");
String r_drive = request.getParameter("r_drive");
String r_other_asset = request.getParameter("r_other_asset");
String r_remarks = request.getParameter("r_remarks");

//int requestOption= Integer.parseInt(request.getParameter("requestOption"));
String requestOption= request.getParameter("requestOption");

//New changes from here To 


String d_new_relieved_request = request.getParameter("d_new_relieved_request");
String d_new_reliving_co =request.getParameter("d_new_reliving_co");

String a_model_info=request.getParameter("a_model_info");
String r_model_info=request.getParameter("r_model_info");
String a_document_ac=request.getParameter("a_document_ac");
String r_document_ac=request.getParameter("r_document_ac");
System.out.println("a_document_ac :"+a_document_ac);
System.out.println("r_document_ac :"+r_document_ac);

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






String msg=null;
Date result1=null,result2=null,form_date=null;
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

try{
	form_date = new Date(sdf.parse(f_date).getTime());
	//result1 = new Date(sdf.parse(d_new_relieved_request).getTime());
	//result2 = new Date(sdf.parse(d_new_reliving_co).getTime());
}
catch (Exception e) {
	e.printStackTrace();
}


//if((desg!=null||desg=="none")&&(emp!=null||emp=="-1"))
	if((Itradio!=null && Itradio.equals("IT")))
     {
		desg ="ASST. GENERAL MANAGER";
		emp="Prasanna Kumar";
		mail ="prasanna.v@nittsu.co.in";
		//mail ="farooqsha27@gmail.com";
	 }
	if((Itradio!=null && Itradio.equals("NON")))
    {
		desg ="NONIT MANAGER";
		emp="VaniShree";
		mail ="vani.shree@nittsu.co.in";
		//mail ="farooqsha27@gmail.com";
	 }
	String allMails=null,initiatorNameIfNotApproved=null;
	psmt4 = cn2.prepareStatement("SELECT mail,emp FROM form1_it_clearance_item WHERE form1_no=? AND status=?");
	psmt4.setString(1,form_no);
	psmt4.setString(2,"Initiator");
	ResultSet rs = psmt4.executeQuery();
	while(rs.next())
	{
		allMails = rs.getString(1); 
		initiatorNameIfNotApproved = rs.getString(2);
	}

	/* if(mmdradio!=null && mmdradio.equals("Not Approved"))
	{
		desg ="NOT APPROVED";
		emp="NOT APPROVED";
		mail =allMails;
	} */
	String pending = "Pending";
	if(mmdradio!=null && mmdradio.equals("Not Approved"))
	{
		desg ="NOT APPROVED";
		emp="NOT APPROVED";
		mmdradio="NOT APPROVED";
		txtmail_msg = "NOT APPROVED";
		mail =allMails;
		pending ="NOT APPROVED";
	}
	System.out.println("NEW MAIL after changing if not approved : "+mail);
											psmt41 = cn2.prepareStatement("SELECT i_name FROM form1_it_clearance WHERE form1_no=? AND ? LIKE '%HR%'");
											psmt41.setString(1,form_no);
											psmt41.setString(2,i_desg);
										    String NotHRThenEnterINTable=null;
											ResultSet rs141 = psmt41.executeQuery();
											if(rs141.next())
											{
												NotHRThenEnterINTable = rs141.getString(1); 
												psmt19 = cn2.prepareStatement("UPDATE form1_it_clearance SET NotHRThenEnterINTable=? WHERE form1_no=?");
												psmt19.setString(1,subDept);//i_desg
												psmt19.setString(2,form_no);
											    int b = psmt19.executeUpdate(); 
											}
											System.out.println("NotHRThenEnterINTable :"+NotHRThenEnterINTable);
											
/* if(mmdradio=="NULL"||mmdradio==null||mmdradio=="")
{
	msg = "Kindly ";
	System.out.println("result..date..........."+form_date);
	response.sendRedirect("ITclearanceAdmin.jsp?msg=" +msg);
} */

//st22.executeUpdate("update mr_master set newStatus='"+Itradio+"' where emp = '"+realname+"' AND mr_id='"+mr_id+"' AND newStatus='Pending'");
 //psmt19 = cn2.prepareStatement("UPDATE form1_it_clearance_item SET status=?,remarks=?,f_date=?,presence=? WHERE form1_no=? AND desg=? AND emp=? AND MAX(id)");
 //UPDATE form1_it_clearance_item f,(SELECT max(id) as idf FROM form1_it_clearance_item WHERE form1_no='NEIN/CS/IT/90-99' AND desg='IT SUPPORT' AND emp='Adwin Jose') as p SET f.status='statusss',f.remarks='remarks',f.presence='presence' WHERE f.form1_no='NEIN/CS/IT/90-99' AND f.desg='IT SUPPORT' AND f.emp='Adwin Jose' AND f.id = p.idf
 psmt19 = cn2.prepareStatement("UPDATE form1_it_clearance_item f,(SELECT max(id) as idf FROM form1_it_clearance_item WHERE form1_no=? AND desg=? AND emp=?) as p SET f.status=?,f.remarks=?,f.f_date=?,f.presence=? WHERE f.form1_no=? AND f.desg=? AND f.emp=? AND f.id=p.idf");
/* psmt19.setString(1,mmdradio);
psmt19.setString(2,txtmail_msg);
psmt19.setDate(3,form_date);
psmt19.setString(4,"over");
psmt19.setString(5,form_no);
psmt19.setString(6,i_desg);
psmt19.setString(7,i_name); */
psmt19.setString(1,form_no);
psmt19.setString(2,i_desg);
psmt19.setString(3,i_name);
psmt19.setString(4,mmdradio);
psmt19.setString(5,txtmail_msg);
psmt19.setDate(6,form_date);
psmt19.setString(7,"over");
psmt19.setString(8,form_no);
psmt19.setString(9,i_desg);
psmt19.setString(10,i_name);

int i = psmt19.executeUpdate();
System.out.println("UPDATE query for i is working ? ");
//psmt = cn2.prepareStatement("INSERT INTO form1_it_clearance(form1_no,branch,depart,full_name,emp_code,designation,r_officer,d_resignation,d_reliving,a_model,a_data_card,a_email,a_newins,a_domain,a_mobile_model,a_mobile_no,a_access_card,a_drive,a_other_asset,a_remarks,r_model,r_data_card,r_email,r_newins,r_domain,r_mobile_model,r_mobile_no,r_access_card,r_drive,r_other_asset,f_date,i_name,i_desg,i_city,i_b_no,i_admin,i_email_id,desg,emp,mail,idextend,notServed,grade,requestOption,form_name) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
psmt = cn2.prepareStatement("UPDATE form1_it_clearance SET a_model=?,a_data_card=?,a_email=?,a_newins=?,a_domain=?,a_mobile_model=?,a_mobile_no=?,a_access_card=?,a_drive=?,a_other_asset=?,a_remarks=?,r_model=?,r_data_card=?,r_email=?,r_newins=?,r_domain=?,r_mobile_model=?,r_mobile_no=?,r_access_card=?,r_drive=?,r_other_asset=?,"
		                    +"a_document_hr=?,r_document_hr=?,a_co_car_hr=?,r_co_car_hr=?,a_calculator_hr=?,r_calculator_hr=?,a_conn_mobile_hr=?,r_conn_mobile_hr=?,a_mobile_handset_hr=?,r_mobile_handset_hr=?,a_id_card_hr=?,r_id_card_hr=?,a_work_key_hr=?,r_work_key_hr=?,a_any_other_hr=?,r_any_other_hr=?,"
		                    +"a_leave_card_hr=?,r_leave_card_hr=?,a_resignation_letter_hr=?,r_resignation_letter_hr=?,a_identity_card_hr=?,r_identity_card_hr=?,a_model_info=?,r_model_info=?,a_document_ac=?,r_document_ac=? "//,d_new_relieved_request=?,d_new_reliving_co=?
		                    +"WHERE form1_no=?");

psmt.setString(1,a_model);
psmt.setString(2,a_data_card);
psmt.setString(3,a_email);
psmt.setString(4,a_newins);
psmt.setString(5,a_domain);
psmt.setString(6,a_mobile_model);
psmt.setString(7,a_mobile_no);
psmt.setString(8,a_access_card);
psmt.setString(9,a_drive);
psmt.setString(10,a_other_asset);
psmt.setString(11,a_remarks);
psmt.setString(12,r_model);
psmt.setString(13,r_data_card);
psmt.setString(14,r_email);
psmt.setString(15,r_newins);
psmt.setString(16,r_domain);
psmt.setString(17,r_mobile_model);
psmt.setString(18,r_mobile_no);
psmt.setString(19,r_access_card);
psmt.setString(20,r_drive);
psmt.setString(21,r_other_asset);



psmt.setString(22,a_document_hr);
psmt.setString(23,r_document_hr);
psmt.setString(24,a_co_car_hr);
psmt.setString(25,r_co_car_hr);
psmt.setString(26,a_calculator_hr);
psmt.setString(27,r_calculator_hr);
psmt.setString(28,a_conn_mobile_hr);
psmt.setString(29,r_conn_mobile_hr);
psmt.setString(30,a_mobile_handset_hr);
psmt.setString(31,r_mobile_handset_hr);
psmt.setString(32,a_id_card_hr);
psmt.setString(33,r_id_card_hr);
psmt.setString(34,a_work_key_hr);
psmt.setString(35,r_work_key_hr);
psmt.setString(36,a_any_other_hr);
psmt.setString(37,r_any_other_hr);
psmt.setString(38,a_leave_card_hr);
psmt.setString(39,r_leave_card_hr);
psmt.setString(40,a_resignation_letter_hr);
psmt.setString(41,r_resignation_letter_hr);
psmt.setString(42,a_identity_card_hr);
psmt.setString(43,r_identity_card_hr);

psmt.setString(44,a_model_info);//only for IT 1.a
psmt.setString(45,r_model_info);//only for IT 1.a remarks


psmt.setString(46,a_document_ac);
psmt.setString(47,r_document_ac);

psmt.setString(48,form_no);
//psmt.setString(49,dateF);//d_new_relieved_request //Two extra dates
//psmt.setString(50,dateFF);//d_new_reliving_co //Two extra dates


System.out.println("BEFORE EXECUTE UPDATE OF I ");
int ii = psmt.executeUpdate();
System.out.println("AFTER EXECUTE UPDATE OF I ");

PreparedStatement psmt10=null;
psmt10 = cn2.prepareStatement("UPDATE form1_it_clearance SET Approval_status=?,Approval_sttatuss=?,Approval_remarks=?,Approval_f_date=?,Approval_emp=?,Approval_desg=?,Approval_empp=?,Approval_desgg=? WHERE form1_no=?");
psmt10.setString(1,mmdradio);
psmt10.setString(2,pending);
psmt10.setString(3,txtmail_msg);
psmt10.setDate(4,form_date);
psmt10.setString(5,emp);
psmt10.setString(6,desg);
psmt10.setString(7,i_name);
psmt10.setString(8,i_desg);
psmt10.setString(9,form_no);
int b = psmt10.executeUpdate(); 
	
psmt2 = cn2.prepareStatement("INSERT INTO form1_it_clearance_item(form1_no,desg,emp,status,remarks,f_date,mail,presence) VALUES(?,?,?,?,?,?,?,?)");
psmt2.setString(1,form_no);
psmt2.setString(2,desg);
psmt2.setString(3,emp);
psmt2.setString(4,pending);
psmt2.setString(5,pending);
psmt2.setDate(6,form_date);
psmt2.setString(7,mail);
psmt2.setString(8,"now");

int j = psmt2.executeUpdate();

message = mailMessage.getMailMessage(form_no.trim());
System.out.print("MMRADIO VALUE **************** : "+mmdradio+" END");
System.out.print("higherAuthority VALUE **************** : "+higherAuthority+" END");

/* if((mmdradio!=null && mmdradio.equals("Approved"))&&(higherAuthority!=null && higherAuthority.equals("higherAuthority"))) 
{   // if Approved and sending again to Higher authority 
	postMail.postMail(i_email_id,i_name,"pass1234",mail," IT CLEARANCE FORM :  " +form_no+ " ",i_name+  " "+  "Approved Request Of IT Clearance Form No.:" +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.3:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.2:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>"+message);
}
	if((mmdradio!=null && mmdradio.equals("Approved"))&&(higherAuthority!=null && higherAuthority.equals("directApprove"))) 
{   // if Approved and want to send directly to IT nonIT persons of HO and ONE copy to Initiator
	postMail.postMail(i_email_id,i_name,"pass1234",mail," IT CLEARANCE FORM :  " +form_no+ " ",i_name+  " "+  "Approved Request Of IT Clearance Form No.:" +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.3:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.2:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>"+message);
	postMail.postMail(i_email_id,i_name,"pass1234",allMails," IT CLEARANCE FORM :  " +form_no+ " ",initiatorNameIfNotApproved+  " "+  "Approved Request Of IT Clearance Form No.:" +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.3:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.2:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>");
} */
/* if((mmdradio!=null && mmdradio.equals("Not Approved"))&&(higherAuthority!=null && higherAuthority.equals("directApprove")))
{   // if NOT Approved , so a copy to Initaior 
	postMail.postMail(i_email_id,i_name,"pass1234",mail," IT CLEARANCE FORM :  " +form_no+ " ",initiatorNameIfNotApproved+  " "+  "request Is NOT Approved Of IT Clearance Form No.:" +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.3:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.2:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>");
} */
if((mmdradio!=null && mmdradio.equals("Approved"))) 
{   // if Approved and sending again to Higher authority 
	postMail.postMail(i_email_id,i_name,"pass1234",mail," IT CLEARANCE FORM :  " +form_no+ " ",i_name+  " "+  "request you to Approve - IT CLEARANCE FORM : " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT Link -  https://ninsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> Common Link - https://neinsoft.nittsu.co.in:8185/NEIN/  <br><br><br><br>"+message);
}
if((mmdradio!=null && mmdradio.equals("Not Approved") || mmdradio.equals("NOT APPROVED")))
{	
   System.out.println("IF NOT APPROVED THIS LOOP WILL RUN");
	String allMails1=null;
	psmt4 = cn2.prepareStatement("SELECT mail,emp FROM form1_it_clearance_item WHERE form1_no=?");
	psmt4.setString(1,form_no);

	ResultSet rs1 = psmt4.executeQuery();
	while(rs1.next())
	{
	allMails1 = rs1.getString(1); 
	//initiatorNameIfNotApproved = rs1.getString(2);
	// if NOT Approved , so a copy to Initaior 
    postMail.postMail(i_email_id,i_name,"pass1234",allMails1,"  IT CLEARANCE FORM :  " +form_no+ " ",initiatorNameIfNotApproved+  " "+  "your request for - IT CLEARANCE FORM : "+form_no+" Is NOT Approved by " +i_name+ " <br>Remarks : "+txtmail_msg+"<br><b><u> Open the following URL</u> </b><br> C2IT Link -  https://ninsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> Common Link - https://neinsoft.nittsu.co.in:8185/NEIN/  <br><br><br><br>");
   }
}
message = null;


msg = "IT__CLEARANCE__NO__:__'"+form_no+"'__SAVED__AND__SENT__SUCCESSFULLY";
//ITclearanceSelectAdmin
response.sendRedirect("ITclearanceSelectLocalAdmin.jsp?msg=" +msg);
}
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
	DbUtil.closeDBResources(null,psmt19,null);
	DbUtil.closeDBResources(null,psmt2,null);
	DbUtil.closeDBResources(null,psmt3,null);
	DbUtil.closeDBResources(null,psmt4,null);

	

			}
%>


</html>
