<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<%@page import="CON2.DbUtil"%>
<%@page import="CON2.MailMessageIncidentLog"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.text.resources.FormatData"%>

<jsp:useBean id = "dateFormat" class="CON2.DateFormat"/>
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<jsp:useBean id = "pdf" class="com.ck.file.FileAttachment" /> 
<jsp:useBean id = "postMail" class="CON2.PostMail" /> 
<html>
<head>
</head>
<%! 
                  MailMessageIncidentLog mailMessage = new MailMessageIncidentLog();
                  Connection conn = null, conn1 = null,cn2=null; 
	              Statement st= null, st1=null,st2=null,st3=null,st4=null,st5=null,st6=null,st7=null,st8=null,st9=null,st11=null;
	              ResultSet rs = null;
	              String message = null;
	              %>edddr
	              <%
	              
	              cn2 = con.getConnection2();
	              st2 = cn2.createStatement();
	              PreparedStatement psmt=null,psmt2=null,psmt3=null,psmt4=null;PreparedStatement psmt10=null,psmtga=null;
	              %>
	              	<%--i_name,i_desg,i_city,i_b_no,i_admin,i_email_id --%>
<%
//form1_it_clearance
//form1_it_clearance_item 
System.out.println("---------------------------INCIDENT ADMIN BACK-----------------------------");
try{
String i_name= request.getParameter("i_name");
String i_desg= request.getParameter("i_desg");
String i_city= request.getParameter("i_city");
String i_b_no= request.getParameter("i_b_no");
String i_admin= request.getParameter("i_admin");
String i_email_id= request.getParameter("i_email_id");




String form_no = request.getParameter("form9_no");
String f_date = request.getParameter("f_date");

String mmdradio = request.getParameter("mmdradio1");//mmdradio1
String mailingCheck = request.getParameter("mailingCheckToIT");//CheckValuesAC
//
	System.out.println("If FinalStatus is TRUE");
	
	
	//String NONITfullSendingDetails = request.getParameter("NONITfullSendingDetails");//Nname,Npost,Nmail=emp,desg,mail
	System.out.println("Mail mailingCheckSendingTOAC value FOR Incident FORM "+mailingCheck);
	
		
		String values[] = mailingCheck.split(",");
		System.out.println("val 1 : "+values[0].replaceAll(" ", ""));//emp
		System.out.println("val 2 : "+values[1].replaceAll(" ", ""));//desg
		System.out.println("val 3 : "+values[2].replaceAll(" ", ""));//mail

	String emp = values[0];
	String desg = values[1];
	String mail= values[2].replaceAll(" ", "");
/* String desg = request.getParameter("desg");
String emp = request.getParameter("emp");
String mail = request.getParameter("mail1"); */
String txtmail_msg = request.getParameter("txtmail_msg");


String mmradio = request.getParameter("mmdradio");

//mmradio Approved    higherAuthority directApprove   It radio :IT
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
if((desg!=null||desg=="none")&&(emp!=null||emp=="-1"))
{
	desg ="ASST. GENERAL MANAGER";
	emp="Prasanna Kumar";
	//PRASANNA.V@NITSSU.CO.IN
	//mail ="prasanna.kumar@nipponexpress.com";
	mail ="chintu.kumar@nipponexpress.com";
}
String allMails=null,initiatorNameIfNotApproved=null;
psmt4 = cn2.prepareStatement("SELECT mail,emp FROM form9_incident_log_item WHERE form9_no=? AND status=?");
psmt4.setString(1,form_no);
psmt4.setString(2,"Initiator");
ResultSet rs = psmt4.executeQuery();
while(rs.next())
{
	allMails = rs.getString(1); 
	initiatorNameIfNotApproved = rs.getString(2);
}
System.out.println("WORKINGGGGGGGGGggggggggggg");
/* if(mmdradio!=null && mmdradio.equals("Not Approved"))
{
	desg ="NOT APPROVED";
	emp="NOT APPROVED";
	mail =allMails;
} */
String pending = "Pending";
if(mmdradio!=null && mmdradio.equals("Not Approved"))
{
	mail =allMails;
}
//System.out.println("NEW MAIL after changing if not approved : "+mail);


int k=1;
int totflag= Integer.parseInt(request.getParameter("flag"));
System.out.println("Total floag : "+totflag);
while(k<=totflag)
   {
   String id= request.getParameter("id"+k);
   //System.out.println("Total floag id : "+id);
   String gastatus= request.getParameter("I_viewedByGA"+k);
   //System.out.println("Total floag gastatus: "+gastatus);
   psmtga = cn2.prepareStatement("UPDATE form9_incident_item SET viewedByGA=? WHERE form9_no=? and id=?");
   psmtga.setString(1,gastatus);
   psmtga.setString(2,form_no);
   psmtga.setString(3,id);
   int b1 = psmtga.executeUpdate(); 
   k++;
   }






psmt = cn2.prepareStatement("UPDATE  form9_incident_log_item f,(SELECT max(id) as idf FROM  form9_incident_log_item WHERE form9_no=? AND desg=? AND emp=?) as p SET f.status=?,f.remarks=?,f.f_date=?,f.presence=? WHERE f.form9_no=? AND f.desg=? AND f.emp=? AND f.id=p.idf");
psmt.setString(1,form_no);
psmt.setString(2,i_desg);
psmt.setString(3,i_name);
psmt.setString(4,mmdradio);
psmt.setString(5,txtmail_msg);
psmt.setDate(6,form_date);
psmt.setString(7,"over");
psmt.setString(8,form_no);
psmt.setString(9,i_desg);
psmt.setString(10,i_name);
int a = psmt.executeUpdate();
System.out.println("psmt saved : "+a);

psmt10 = cn2.prepareStatement("UPDATE form9_incident_log SET Approval_status=?,Approval_sttatuss=?,Approval_remarks=?,Approval_f_date=?,Approval_emp=?,Approval_desg=?,Approval_empp=?,Approval_desgg=? WHERE form9_no=?");
psmt10.setString(1,mmdradio);
psmt10.setString(2,"Pending");
psmt10.setString(3,txtmail_msg);
psmt10.setDate(4,form_date);
psmt10.setString(5,emp);
psmt10.setString(6,desg);
psmt10.setString(7,i_name);
psmt10.setString(8,i_desg);
psmt10.setString(9,form_no);
int b = psmt10.executeUpdate(); 
System.out.println("psmt10 saved : "+b);
psmt2 = cn2.prepareStatement("INSERT INTO form9_incident_log_item(form9_no,desg,emp,status,remarks,f_date,mail,presence) VALUES(?,?,?,?,?,?,?,?)");
psmt2.setString(1,form_no);
psmt2.setString(2,desg);
psmt2.setString(3,emp);
psmt2.setString(4,"Pending");
psmt2.setString(5,"Pending");
psmt2.setDate(6,form_date);
psmt2.setString(7,mail);
psmt2.setString(8,"now");


int j = psmt2.executeUpdate();
/* System.out.println("psmt2 saved : "+j);
System.out.println("mmradio :"+mmradio);//null
System.out.println("mmdradio :"+mmdradio);//Incident reported
System.out.println("form_no :"+form_no);//null
System.out.println("mail :"+mail);//null
System.out.println("allMails :"+allMails);//null
System.out.println("i_email_id :"+i_email_id);//null
System.out.println("i_name :"+i_name);//null
System.out.println("initiatorNameIfNotApproved :"+initiatorNameIfNotApproved);//null */
message = mailMessage.getMailMessageIncidentLog(form_no.trim());

			if(mmdradio!=null && mmdradio.equals("Incident reported")) 
			{   // if Approved and want to send directly to IT nonIT persons of HO and ONE copy to Initiator
					System.out.println("if Approved and want to send directly to IT nonIT persons of HO and ONE copy to Initiator");
				postMail.postMail(i_email_id,i_name,"pass1234",mail,"NEIN-C2IT INCIDENT LOG FORM :  " +form_no+ " ",i_name+  " "+  "request Is Been Approved " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
				postMail.postMail(i_email_id,i_name,"pass1234",allMails,"NEIN-C2IT INCIDENT LOG FORM:  " +form_no+ " ",initiatorNameIfNotApproved+  " "+  "request Is Been Approved " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
			}
			if(mmdradio!=null && mmdradio.equals("No Incident reported"))
			{   // if NOT Approved , so a copy to Initaior
				System.out.println("if NOT Approved , so a copy to Initaior");
				postMail.postMail(i_email_id,i_name,"pass1234",mail,"NEIN-C2IT INCIDENT LOG FORM:  " +form_no+ " ",initiatorNameIfNotApproved+  " "+  "request Is NOT Approved " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp <br>COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
			}
		
	      
message = null;

msg = "INCIDENT__LOG__FORM__SAVED__AND__SENT__SUCCESSFULLY";
System.out.println("result..date..........."+form_date);
//response.sendRedirect("InternetAccessSelectAdmin.jsp?msg=" +msg);
//response.sendRedirect("PopUpPage.jsp?form_no=" +form_no);
response.sendRedirect("../../../adminPage.jsp?msg=" +msg);
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
