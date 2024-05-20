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
	              PreparedStatement psmtApOp1=null,psmtApOp2=null,psmtApOp3=null,psmtNotApproved=null;
	              %>
	              
<%
try{
String i_name= request.getParameter("i_name");
String i_desg= request.getParameter("i_desg");
String i_city= request.getParameter("i_city");
String i_b_no= request.getParameter("i_b_no");
String i_admin= request.getParameter("i_admin");
String i_email_id= request.getParameter("i_email_id");

String ApprovalOption = request.getParameter("ApprovalOption");
System.out.println("ApprovalOption :::::::::::::::::::: "+ApprovalOption);
String txtmail_msg = request.getParameter("txtmail_msg");
String desg = request.getParameter("desg");
String emp = request.getParameter("emp");
String Mail1 = request.getParameter("mail1");
String higherAuthority = request.getParameter("higherAuthority");


String form_no = request.getParameter("form1_no");
String f_date = request.getParameter("f_date");
String mmdradio = request.getParameter("mmdradio");
//String NONITmailing = request.getParameter("NONITmailing");//
String NONITfullSendingDetails = request.getParameter("NONITfullSendingDetails");
String NONITName = request.getParameter("NONITName");
//String ITusername = request.getParameter("ITusername");
//String ITpassword = request.getParameter("ITpassword");
//String ITcreated = request.getParameter("ITcreated");
String ITremark = request.getParameter("ITremark");
String mailingCheck[] = request.getParameterValues("mailingCheck");


String mmdradioBcc = request.getParameter("mmdradioBcc");
String SendExtraMails = request.getParameter("SendBCCmail");
System.out.println("mmdradioBcc :"+mmdradioBcc);
System.out.println("SendExtraMails :"+SendExtraMails);



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
PreparedStatement psmt11=null;
System.out.println("NEW MAIL after changing if not approved : "+mailingCheck);
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
String pending = "Pending";
if(mmdradio!=null && mmdradio.equals("Not Approved"))
     {
	//desg ="NOT APPROVED";
	//emp="NOT APPROVED";
	//mmdradio="NOT APPROVED";
	//txtmail_msg = "NOT APPROVED";
	Mail1 =allMails;
	//pending ="NOT APPROVED";
    }



if(ApprovalOption.equals("ContinueStatus"))
    {
	
	System.out.println("NEW MAIL after changing if not approved : "+Mail1);
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

	
	
	
	
	
	
	
	
	
	
	
	
	
	System.out.println("If continue ststaus");
	/* psmtApOp1 = cn2.prepareStatement("UPDATE form1_it_clearance_item SET status=?,remarks=?,f_date=?,presence=? WHERE form1_no=? AND desg=? AND emp=? ");
	psmtApOp1.setString(1,mmdradio);
	psmtApOp1.setString(2,txtmail_msg);
	psmtApOp1.setDate(3,form_date);
	psmtApOp1.setString(4,"over");
	psmtApOp1.setString(5,form_no);
	psmtApOp1.setString(6,i_desg);
	psmtApOp1.setString(7,i_name); */
	psmtApOp1 = cn2.prepareStatement("UPDATE form1_it_clearance_item f,(SELECT max(id) as idf FROM form1_it_clearance_item WHERE form1_no=? AND desg=? AND emp=?) as p SET f.status=?,f.remarks=?,f.f_date=?,f.presence=? WHERE f.form1_no=? AND f.desg=? AND f.emp=? AND f.id=p.idf ");
	psmtApOp1.setString(1,form_no);
	psmtApOp1.setString(2,i_desg);
	psmtApOp1.setString(3,i_name);
	
	psmtApOp1.setString(4,mmdradio);
	psmtApOp1.setString(5,txtmail_msg);
	psmtApOp1.setDate(6,form_date);
	psmtApOp1.setString(7,"over");
	psmtApOp1.setString(8,form_no);
	psmtApOp1.setString(9,i_desg);
	psmtApOp1.setString(10,i_name);

	int iA = psmtApOp1.executeUpdate();


	psmtApOp2 = cn2.prepareStatement("UPDATE form1_it_clearance SET Approval_status=?,Approval_sttatuss=?,Approval_remarks=?,Approval_f_date=?,Approval_emp=?,Approval_desg=?,Approval_empp=?,Approval_desgg=? WHERE form1_no=?");
	psmtApOp2.setString(1,mmdradio);
	psmtApOp2.setString(2,"Pending");
	psmtApOp2.setString(3,txtmail_msg);
	psmtApOp2.setDate(4,form_date);
	psmtApOp2.setString(5,emp);
	psmtApOp2.setString(6,desg);
	psmtApOp2.setString(7,i_name);
	psmtApOp2.setString(8,i_desg);
	psmtApOp2.setString(9,form_no);
	int bA = psmtApOp2.executeUpdate(); 
		
	psmtApOp3 = cn2.prepareStatement("INSERT INTO form1_it_clearance_item(form1_no,desg,emp,status,remarks,f_date,mail,presence) VALUES(?,?,?,?,?,?,?,?)");
	psmtApOp3.setString(1,form_no);
	psmtApOp3.setString(2,desg);
	psmtApOp3.setString(3,emp);
	psmtApOp3.setString(4,"Pending");
	psmtApOp3.setString(5,"Pending");
	psmtApOp3.setDate(6,form_date);
	psmtApOp3.setString(7,Mail1);
	psmtApOp3.setString(8,"now");

	int jA = psmtApOp3.executeUpdate();
	message = mailMessage.getMailMessage(form_no.trim());
	//System.out.println("Mail is Working for IT clearnace");
	//System.out.println("Mail is Working for IT clearnace i_email_id :"+i_email_id);
	//System.out.println("Mail is Working for IT clearnace i_name :"+i_name);
	//System.out.println("Mail is Working for IT clearnace Mail1 :"+Mail1);
	//System.out.println("Mail is Working for IT clearnace form_no :"+form_no);
	//System.out.println("Mail is Working for IT clearnace allMails  :"+allMails);
	//System.out.println("Mail is Working for IT clearnace initiatorNameIfNotApproved :"+initiatorNameIfNotApproved);
	if((mmdradio!=null && mmdradio.equals("Approved"))&&(higherAuthority!=null && higherAuthority.equals("higherAuthority"))) 
	    {  
		System.out.println("if Approved and sending again to Higher authority ");
		postMail.postMail(i_email_id,i_name,"pass1234",Mail1," IT CLEARANCE FORM :  " +form_no+ " ",i_name+  " "+  "request you to Approve IT CLEARANCE FORM : " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT Link -  https://ninsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> All Software Link - https://neinsoft.nittsu.co.in:8185/NEIN/  <br><br><br><br>"+message);
	    }
	if((mmdradio!=null && mmdradio.equals("Approved"))&&(higherAuthority!=null && higherAuthority.equals("directApprove"))) 
	    {
		System.out.println("if Approved and want to send directly to IT nonIT persons of HO and ONE copy to Initiator");
		postMail.postMail(i_email_id,i_name,"pass1234",Mail1," IT CLEARANCE FORM :  " +form_no+ " ",i_name+  " "+  "request you to approve IT CLEARANCE FORM : "+form_no+" <br><br><b><u> Open the following URL</u> </b><br> C2IT Link -  https://ninsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> All Software Link - https://neinsoft.nittsu.co.in:8185/NEIN/  <br><br><br><br>"+message);
		postMail.postMail(i_email_id,i_name,"pass1234",allMails," IT CLEARANCE FORM :  " +form_no+ " ",initiatorNameIfNotApproved+  " "+  "your request for IT CLEARANCE FORM : "+form_no+" has been approved by " +i_name+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT Link -  https://ninsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> All Software Link - https://neinsoft.nittsu.co.in:8185/NEIN/  <br><br><br><br>");
	    }
       /* 	if((mmdradio!=null && mmdradio.equals("Not Approved"))&&(higherAuthority!=null && higherAuthority.equals("directApprove")))
	   {  System.out.println("if NOT Approved , so a copy to Initaior ");
		postMail.postMail(i_email_id,i_name,"pass1234",Mail1," IT CLEARANCE FORM :  " +form_no+ " ",initiatorNameIfNotApproved+  " "+  "request Is NOT Approved " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT Link -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - https://203.124.152.2:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>");
		postMail.postMail(i_email_id,i_name,"pass1234",allMails," IT CLEARANCE FORM :  " +form_no+ " ",initiatorNameIfNotApproved+  " "+  "request Is NOT Approved " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT Link -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - https://203.124.152.2:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>");
	   } */
	
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
			//postMail.postMail(i_email_id,i_name,"pass1234",allMails1," IT CLEARANCE FORM :  " +form_no+ " ",initiatorNameIfNotApproved+  " "+  "request Is NOT Approved " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT Link -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - https://203.124.152.2:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>");
			 postMail.postMail(i_email_id,i_name,"pass1234",allMails1," IT CLEARANCE FORM  :  " +form_no+ " ",initiatorNameIfNotApproved+  " "+  "your request for IT CLEARANCE FORM : "+form_no+" Is NOT Approved by " +i_name+ " <br>Remarks : "+txtmail_msg+"<br><b><u> Open the following URL</u> </b><br> C2IT Link -  https://ninsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - https://203.124.152.2:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>"+message);
			}
	     }
     }
else
     {
	//FinalStatus
	System.out.println("If FinalStatus is TRUE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
	if( ApprovalOption.equals("directApprove") )
	    {
		
		
		System.out.println("NEW MAIL after changing if not approved : "+Mail1);
		psmt11 = cn2.prepareStatement("UPDATE form1_it_clearance SET it1a=?,it1aa=?,it2b=?,it2bb=?,it3c=?,it3cc=?,it4d=?,it4dd=?,it5e=?,it5ee=?,it6f=?,it6ff=?,it7g=?,it7gg=?,it8h=?,it8hh=?,it9i=?,it9ii=?,it10j=?,it10jj=? WHERE form1_no=?");
		psmt11.setString(1,it1a);
		psmt11.setString(2,"No");
		psmt11.setString(3,it2b);
		psmt11.setString(4,"No");
		psmt11.setString(5,it3c);
		psmt11.setString(6,"No");
		psmt11.setString(7,it4d);
		psmt11.setString(8,"No");
		psmt11.setString(9,it5e);
		psmt11.setString(10,"No");
		psmt11.setString(11,it6f);
		psmt11.setString(12,"No");
		psmt11.setString(13,it7g);
		psmt11.setString(14,"No");
		psmt11.setString(15,it8h);
		psmt11.setString(16,"No");
		psmt11.setString(17,it9i);
		psmt11.setString(18,"No");
		psmt11.setString(19,it10j);
		psmt11.setString(20,"No");
		psmt11.setString(21,form_no);
		int r = psmt11.executeUpdate();

		
		
		
		
		
		
		
		
		
		
		//System.out.println("If FinalStatus is TRUE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%1111111111");	
		PreparedStatement psmt1011=null;
		//String values[] = NONITfullSendingDetails.split(",");
		 //String empHR = values[0];
		//String desgHR = values[1];
		System.out.println("If FinalStatus is TRUE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%1111111111");	
		psmt = cn2.prepareStatement("UPDATE form1_it_clearance_item SET status=?,remarks=?,f_date=?,presence=? WHERE form1_no=? AND desg=? AND emp=? ");
	    //psmt = cn2.prepareStatement("INSERT INTO form2_domain_item(status,remarks,f_date,presence,form2_no,desg,emp) VALUES(?,?,?,?,?,?,?)");
	    psmt.setString(1,"Approved");
	    psmt.setString(2,"Form Closed");
	    psmt.setDate(3,form_date);
	    psmt.setString(4,"over");
	    psmt.setString(5,form_no);
	    psmt.setString(6,i_desg);
	    psmt.setString(7,i_name);
	    int i = psmt.executeUpdate();
	    psmt1011 = cn2.prepareStatement("UPDATE form1_it_clearance SET Approval_status=?,Approval_sttatuss=?,Approval_remarks=?,Approval_f_date=?,Approval_empp=?,Approval_desgg=? WHERE form1_no=?");
	    psmt1011.setString(1,mmdradio);
	    psmt1011.setString(2,"Approved");
	    psmt1011.setString(3,ITremark);
	    psmt1011.setDate(4,form_date);
	    //psmt10.setString(5,NONITName);//empHR
	   // psmt1011.setString(5,empHR);//
	    //psmt10.setString(6,"HR MANAGER");//desgHR
	    //psmt1011.setString(6,desgHR);//
	    psmt1011.setString(5,i_name);
	    psmt1011.setString(6,i_desg);
	    psmt1011.setString(7,form_no);
	    int b1 = psmt1011.executeUpdate(); 
	}
	else
	{
		
		
		System.out.println("NEW MAIL after changing if not approved : "+Mail1);
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

		
		
		
		
		
		
		
		
		System.out.println("If FinalStatus is TRUE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%2222222222%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%1111111111");	
	//String NONITfullSendingDetails = request.getParameter("NONITfullSendingDetails");//Nname,Npost,Nmail=emp,desg,mail
	System.out.println("Mail NONITfullSendingDetails value FOR IT CLEARANCE"+NONITfullSendingDetails);
	String values[] = NONITfullSendingDetails.split(",");
	System.out.println("val 1 : "+values[0].replaceAll(" ", ""));//emp
	System.out.println("val 2 : "+values[1].replaceAll(" ", ""));//desg
	System.out.println("val 3 : "+values[2].replaceAll(" ", ""));//mail
	String empHR = values[0];
	String desgHR = values[1];
	String mailHR = values[2].replaceAll(" ", "");
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

    psmtApOp3 = cn2.prepareStatement("INSERT INTO form1_it_clearance_item(form1_no,desg,emp,status,remarks,f_date,mail,presence) VALUES(?,?,?,?,?,?,?,?)");
    psmtApOp3.setString(1,form_no);
    //psmtApOp3.setString(2,desg);
    psmtApOp3.setString(2,desgHR);
    //psmtApOp3.setString(3,emp);
    psmtApOp3.setString(3,empHR);
    psmtApOp3.setString(4,"Pending");
    psmtApOp3.setString(5,"Pending");
    psmtApOp3.setDate(6,form_date);
    //psmtApOp3.setString(7,Mail1);
    psmtApOp3.setString(7,mailHR);
    psmtApOp3.setString(8,"now");
    int jA = psmtApOp3.executeUpdate();
    PreparedStatement psmt10=null;
    psmt10 = cn2.prepareStatement("UPDATE form1_it_clearance SET Approval_status=?,Approval_sttatuss=?,Approval_remarks=?,Approval_f_date=?,Approval_emp=?,Approval_desg=?,Approval_empp=?,Approval_desgg=? WHERE form1_no=?");
    psmt10.setString(1,mmdradio);
    psmt10.setString(2,"Pending");
    psmt10.setString(3,ITremark);
    psmt10.setDate(4,form_date);
    //psmt10.setString(5,NONITName);//empHR
    psmt10.setString(5,empHR);//
    //psmt10.setString(6,"HR MANAGER");//desgHR
    psmt10.setString(6,desgHR);//
    psmt10.setString(7,i_name);
    psmt10.setString(8,i_desg);
    psmt10.setString(9,form_no);
    int b = psmt10.executeUpdate(); 
    //System.out.println("NONITName : "+NONITName);
    //System.out.println("NONITmailing : "+mailHR);
    //System.out.println("form_no : "+form_no);
    //System.out.println("form_date : "+form_date);
	System.out.println("Before Mail message:");
	message = mailMessage.getMailMessage(form_no.trim());
	System.out.println("Trim Part");
	     if((SendExtraMails!="NULL")||(mmdradioBcc=="Yes"))
				{ 
	    	     System.out.println("IF SendExtraMails in incident reported :"+SendExtraMails);
				   String valuesbcc[] = SendExtraMails.split(",");
				 	for(int v=0;v<valuesbcc.length;v++)
					{
					 System.out.println("IF SendExtraMails ddddd :"+valuesbcc[v]);
					} 
				 	String CCList = "";
				 	for (String	email: valuesbcc) 
				 	    {
						  CCList =  email  + "," +CCList ;
						}
				 	System.out.println("CCList :"+CCList);
				 	
				 	String ToMail = null;
				 	for(String mainMails:mailingCheck)
				 	{
				 		System.out.println("MAIN MAILS for loop BEFORE:"+mainMails);
				 		ToMail = mainMails + "," +ToMail;
				 		System.out.println("MAIN MAILS for loop AFTER:"+mainMails);
				 	}
				 	System.out.println("MAIL MAILS :"+ToMail);
				 	ToMail = ToMail.replace("'","");
				 	ToMail = ToMail.replace("''","");
				 	ToMail = ToMail.replace("`","");
				 	ToMail = ToMail.replace("``","");
				 	ToMail = ToMail.replace(" ","");
				 	ToMail = ToMail.replaceAll("\\s+","");
				 	ToMail = ToMail.replace("null","");
				 	System.out.println("MAIL MAILS replace :"+ToMail);
				 	
				 	/* //System.out.println("IF After For loop :"+allValues);
					for(int u=0;u<mailingCheck.length;u++)
					{
						System.out.println("INSIDE FOR LOOP OF mailingCheck[u] main "+mailingCheck[u]);
				//	postMail.postMail(i_email_id,i_name,"pass1234",mailingCheck[u]," DOMAIN USER FORM :  " +form_no+ " ","your request for DOMAIN USER FORM "+form_no+" is Approved by " +i_name+ " <br><br><b><u> Open the following URL</u> </b><br>C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
					//postMail.postMailCC(i_email_id,i_name,"pass1234",mailingCheck[u],CCList," DOMAIN USER FORM :  " +form_no+ " ","your request for DOMAIN USER FORM "+form_no+" is Approved by " +i_name+ " <br><br><b><u> Open the following URL</u> </b><br>C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
						postMail.postMailCC(i_email_id,i_name,"pass1234",mailingCheck[u],CCList," IT CLEARANCE FORM :  " +form_no+ " ","your request for IT CLEARANCE FORM : "+form_no+" has been Approved by  :" +i_name+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT Link -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> All Software Link - https://neinsoft.nittsu.co.in:8185/NEIN/  <br><br><br><br>"+message);
					} */
				 	postMail.sendMailCC(i_email_id,i_name,ToMail,CCList," IT CLEARANCE FORM :  " +form_no+ " ","your request for IT CLEARANCE FORM : "+form_no+" has been Approved by  :" +i_name+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT Link -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> All Software Link - https://neinsoft.nittsu.co.in:8185/NEIN/  <br><br><br><br>"+message);
				}
				else
				{
					for(int u=0;u<mailingCheck.length;u++)
					{
					//postMail.postMail(i_email_id,i_name,"pass1234",mailingCheck[u]," DOMAIN USER FORM :  " +form_no+ " ","your request for DOMAIN USER FORM "+form_no+" is Approved by " +i_name+ " <br><br><b><u> Open the following URL</u> </b><br>C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
					postMail.postMail(i_email_id,i_name,"pass1234",mailingCheck[u]," IT CLEARANCE FORM :  " +form_no+ " ","your request for IT CLEARANCE FORM : "+form_no+" has been Approved by  :" +i_name+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT Link -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> All Software Link - https://neinsoft.nittsu.co.in:8185/NEIN/  <br><br><br><br>"+message);
					}
				}
		
		
		
			if(mailHR!=null)
			{
				System.out.println("Inside Non IT mailing ");
				postMail.postMail(i_email_id,i_name,"pass1234",mailHR," IT CLEARANCE FORM :  " +form_no+ " "," your request for IT CLEARANCE FORM : "+form_no+" has been Approved by :" +i_name+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT Link -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> All Software Link - https://neinsoft.nittsu.co.in:8185/NEIN/  <br><br><br><br>"+message);
			}

}}
postMail.postMail(i_email_id,i_name,"pass1234","chintu.kumar@nittsu.co.in","NEIN-C2IT IT CLEARANCE FORM :  " +form_no+ " "," your request for IT CLEARANCE FORM : "+form_no+" has been Approved by :" +i_name+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT Link -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> All Software Link - https://neinsoft.nittsu.co.in:8185/NEIN/  <br><br><br><br>"+message);


message = null;

msg = "IT__CLEARANCE__FORM__SAVED";
System.out.println("result..date..........."+form_date);
//response.sendRedirect("ITclearanceSelectAdmin.jsp?msg=" +msg);
//response.sendRedirect("ITclearanceSelectAdmin.jsp?msg=" +msg);
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
	DbUtil.closeDBResources(null,psmt4,null);
	DbUtil.closeDBResources(null,psmt2,null);
	DbUtil.closeDBResources(null,psmt3,null);
	
	DbUtil.closeDBResources(null,psmtApOp1,null);
	DbUtil.closeDBResources(null,psmtApOp2,null);
	DbUtil.closeDBResources(null,psmtApOp3,null);
	DbUtil.closeDBResources(null,psmtNotApproved,null);
	
  }
%>


</html>
