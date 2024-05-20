<%@page import="CON2.DbUtil"%>
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
String inititor_email_id  = request.getParameter("inititor_email_id");



String form_no = request.getParameter("form7_no");
String f_date = request.getParameter("f_date");
String mmdradio = request.getParameter("mmdradio");



String itRemarksForAccount = request.getParameter("itRemarksForAccount");
//String mailingCheck[] = request.getParameterValues("mailingCheck2");//
String mailingCheck[] = request.getParameterValues("CheckValues2");//mailingCheck2




//String HRadminFromQuery = request.getParameter("HRadminFromQuery");
//String HRadminNameFromQuery = request.getParameter("HRadminNameFromQuery");
String HRadminFromQuery = request.getParameter("i_email_id");
String HRadminNameFromQuery = request.getParameter("i_name");
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


System.out.println("DOUBTTTTTTTTTTTTTTTtt");
System.out.println("Desg "+i_desg);
System.out.println("name "+i_name);
System.out.println("Remarks "+itRemarksForAccount);


//psmt = cn2.prepareStatement("UPDATE form7_newins_item SET status=?,remarks=?,f_date=?,presence=? WHERE form7_no=? AND desg=? AND emp=? ");
psmt = cn2.prepareStatement("UPDATE form7_newins_item f,(SELECT max(id) as idf FROM form7_newins_item WHERE form7_no=? AND desg=? AND emp=?) as p SET f.status=?,f.remarks=?,f.f_date=?,f.presence=? WHERE f.form7_no=? AND f.desg=? AND f.emp=? AND f.id=p.idf");
//psmt = cn2.prepareStatement("INSERT INTO form2_domain_item(status,remarks,f_date,presence,form2_no,desg,emp) VALUES(?,?,?,?,?,?,?)");
psmt.setString(1,form_no);
psmt.setString(2,i_desg);
psmt.setString(3,i_name);
psmt.setString(4,"Approved");
psmt.setString(5,itRemarksForAccount);
psmt.setDate(6,form_date);
psmt.setString(7,"over");
psmt.setString(8,form_no);
psmt.setString(9,i_desg);
psmt.setString(10,i_name);

int i = psmt.executeUpdate();





String part1=null;
String part2=null;
String part3=null;

if(HRadminFromQuery != null)
{
	for(int k=0;k<mailingCheck.length;k++)
	{
		//String string = "004-034556";
		System.out.println("mailingCheck"+mailingCheck[k]);
		String[] parts = mailingCheck[k].split("--");
		 part1 = parts[0]; // 004
		 part2 = parts[1]; // 004
		 part3 = parts[2]; // 004
		//String part2 = parts[1]; // 034556
		System.out.println("part1 : "+part1);//VANI
		System.out.println("part2 : "+part2);//farooq.s@nittsu.co.in
		System.out.println("part3 : "+part3);//HR MANAGER
	//psmt = cn2.prepareStatement("UPDATE form7_newins_item SET status=?,remarks=?,f_date=?,presence=? WHERE form7_no=? AND desg=? AND emp=? ");
	psmt3 = cn2.prepareStatement("INSERT INTO form7_newins_item(status,remarks,f_date,presence,form7_no,emp,desg,mail) VALUES(?,?,?,?,?,?,?,?)");
	psmt3.setString(1,"Pending");
	//psmt3.setString(2,itRemarksForAccount);
	psmt3.setString(2,"Pending");
	psmt3.setDate(3,form_date);
	psmt3.setString(4,"over");
	psmt3.setString(5,form_no);
	psmt3.setString(6,part1);
	psmt3.setString(7,part3);
	psmt3.setString(8,part2);
	int l = psmt3.executeUpdate();	
	
	
	
	
	
	}
}




psmt2 = cn2.prepareStatement("UPDATE form7_newins SET ITdremark=?,Approval_sttatuss=?,Approval_f_date=?,Approval_emp=?,Approval_desg=?,Approval_empp=?,Approval_desgg=? WHERE form7_no=?");
//psmt2.setString(1,itRemarksForAccount);
psmt2.setString(1,"Pending");
psmt2.setString(2,"Pending");
psmt2.setDate(3,form_date);
psmt2.setString(4,part1);
psmt2.setString(5,part3);
psmt2.setString(6,i_name);
psmt2.setString(7,i_desg);
psmt2.setString(8,form_no);

int j = psmt2.executeUpdate();


message = mailMessage.getMailMessageNewins(form_no.trim());

for(int u=0;u<mailingCheck.length;u++)
{
	System.out.println("NEW MAIL after changing if not approved : "+mailingCheck[u]);
	System.out.println("mailingCheck"+mailingCheck[u]);
	String[] parts = mailingCheck[u].split("--");
	 part1 = parts[0]; // 004
	 part2 = parts[1]; // 004
	 part3 = parts[2]; // 004
	//String part2 = parts[1]; // 034556
	System.out.println("part1---------- : "+part1);//VANI
	System.out.println("part2---------- : "+part2);//farooq.s@nittsu.co.in
	System.out.println("part3---------- : "+part3);//HR MANAGER
	System.out.println("HRadminFromQuery ----------- : "+HRadminFromQuery);
	//For Account Guys : Arun and Biju
             postMail.postMail(i_email_id,i_name,"pass1234",part2," NEWINS USER FORM :  " +form_no+ " ",i_name+  " "+  "request is Approved for Newin's Form : " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
			if(HRadminFromQuery != null)
				{ 
				   // FOR SR.MANAGER IT
					postMail.postMail(i_email_id,i_name,"pass1234",HRadminFromQuery," NEWINS USER FORM :  " +form_no+ " ",i_name+  " "+  "HR/ADMIN(HO) request is Approved " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
				   
				   // For Initiaitor inititor_email_id
					postMail.postMail(i_email_id,i_name,"pass1234",inititor_email_id," NEWINS USER FORM :  " +form_no+ " ",i_name+  " "+  "Approved and requested Accounts(HO) for further Approved of Form : " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
				}
			else{
				
		    	}
}

message = null;

msg = "NEWINS__USER__FORM__SAVED__AND__SENT__SUCCESSFULLY";
System.out.println("result..date..........."+form_date);
//response.sendRedirect("ITclearanceSelectAdmin.jsp?msg=" +msg);
//response.sendRedirect("NewinsSelectAdmin.jsp?msg=" +msg);
response.sendRedirect("PopUpPage.jsp?form_no=" +form_no);
}
catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(rs,st1,conn);
	DbUtil.closeDBResources(null,st2,conn1);
	DbUtil.closeDBResources(null,st3,cn2);
	DbUtil.closeDBResources(null,st4,null);
	DbUtil.closeDBResources(null,st5,null);
	DbUtil.closeDBResources(null,st6,null);
	DbUtil.closeDBResources(null,st7,null);
	DbUtil.closeDBResources(null,st8,null);
	DbUtil.closeDBResources(null,st9,null);
	DbUtil.closeDBResources(null,st11,null);

	DbUtil.closeDBResources(null,psmt,null);
	
	DbUtil.closeDBResources(null,psmt2,null);
	DbUtil.closeDBResources(null,psmt3,null);
  }
%>


</html>
