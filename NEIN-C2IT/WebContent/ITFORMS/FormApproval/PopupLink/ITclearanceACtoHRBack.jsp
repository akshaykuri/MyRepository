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
                  Connection conn = null, conn1 = null,cn2=null,cn3=null; 
	              Statement st= null, st1=null,st2=null,st3=null,st4=null,st5=null,st6=null,st7=null,st8=null,st9=null,st11=null;
	              ResultSet rs = null,rsi=null;
	              String message = null;
	              %>
	              <%
	              
	              cn2 = con.getConnection2();
	              st2 = cn2.createStatement();
	              PreparedStatement psmt=null,psmt2=null,psmt3=null,psmt4=null,psmt4i=null;
	              PreparedStatement psmtApOp1=null,psmtApOp2=null,psmtApOp3=null,psmtNotApproved=null,psmtPP=null;
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


//
//mmdradioHR,HRremark,mailingCheckSendingTOAC
String mmdradioHR = request.getParameter("mmdradioAC");
String HRremark = request.getParameter("ACremark");
String mailingCheckSendingTOAC = request.getParameter("mailingCheckACHOSendingToHRHO");//CheckValuesAC
//
	System.out.println("If FinalStatus is TRUE");
	
	
	//String NONITfullSendingDetails = request.getParameter("NONITfullSendingDetails");//Nname,Npost,Nmail=emp,desg,mail
	System.out.println("Mail mailingCheckSendingTOAC value FOR IT CLEARANCE"+mailingCheckSendingTOAC);
	
		
		String values[] = mailingCheckSendingTOAC.split(",");
		System.out.println("val 1 : "+values[0].replaceAll(" ", ""));//emp
		System.out.println("val 2 : "+values[1].replaceAll(" ", ""));//desg
		System.out.println("val 3 : "+values[2].replaceAll(" ", ""));//mail

	String empHR = values[0];
	String desgHR = values[1];
	String mailHR = values[2].replaceAll(" ", "");
	
	
	String initiatorNameIfNotApproved=null;
	psmt4i = cn2.prepareStatement("SELECT mail,emp FROM form1_it_clearance_item WHERE form1_no=? AND status=?");
	psmt4i.setString(1,form_no);
	psmt4i.setString(2,"Initiator");
	ResultSet rs = psmt4i.executeQuery();
	while(rs.next())
	{
		initiatorNameIfNotApproved = rs.getString(2);
	}
//mmdradioHR - Approved/Not Approved
//-----------------bunch of code removed from here and above to add in Approved field and non approved field
message = mailMessage.getMailMessage(form_no.trim());
					if((mmdradioHR!=null && mmdradioHR.equals("Approved") || mmdradioHR.equals("APPROVED")))
					{
							/* 
							System.out.println("Trim Part");
							for(int u=0;u<mailingCheck.length;u++)
							{
								postMail.postMail(i_email_id,i_name,"pass1234",mailingCheck[u]," IT CLEARANCE FORM :  " +form_no+ " ",i_name+  " "+  "Approved request of FORM :" +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.3:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.2:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>"+message);
								System.out.println("inside for mailing Check");
							} */
							
							psmt = cn2.prepareStatement("UPDATE form1_it_clearance_item SET status=?,remarks=?,f_date=?,presence=? WHERE form1_no=? AND desg=? AND emp=? ");
							//psmt = cn2.prepareStatement("INSERT INTO form2_domain_item(status,remarks,f_date,presence,form2_no,desg,emp) VALUES(?,?,?,?,?,?,?)");
							psmt.setString(1,mmdradioHR);
							psmt.setString(2,HRremark);
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
							psmt10 = cn2.prepareStatement("UPDATE form1_it_clearance SET Approval_status=?,Approval_sttatuss=?,Approval_remarks=?,Approval_f_date=?,Approval_emp=?,Approval_desg=?,Approval_empp=?,Approval_desgg=?,HRvalidateAC=? WHERE form1_no=?");
							psmt10.setString(1,mmdradioHR);
							psmt10.setString(2,"Pending");
							psmt10.setString(3,HRremark);
							psmt10.setDate(4,form_date);
							//psmt10.setString(5,NONITName);//empHR
							psmt10.setString(5,empHR);//
							//psmt10.setString(6,"HR MANAGER");//desgHR
							psmt10.setString(6,desgHR);//
							psmt10.setString(7,i_name);
							psmt10.setString(8,i_desg);
							psmt10.setString(9,"Accounts");
							psmt10.setString(10,form_no);
							int b = psmt10.executeUpdate(); 
							
							
							
							
							
							
								if(mailHR!=null)
								{
									System.out.println("Inside Non IT mailing ");
									postMail.postMail(i_email_id,i_name,"pass1234",mailHR," IT CLEARANCE FORM :  " +form_no+ " "," your request for IT CLEARANCE FORM : "+form_no+" has been Approved by :" +i_name+ " <br><br><b><u> Open the following URL</u> </b><br>C2IT LINK -  https://ninsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
								}
					
					}
				if((mmdradioHR!=null && mmdradioHR.equals("Not Approved") || mmdradioHR.equals("NOT APPROVED")))
				//else
				    {
				    	System.out.println("IF NOT APPROVED THIS LOOP WILL RUN");
					
				    	psmt = cn2.prepareStatement("UPDATE form1_it_clearance_item SET status=?,remarks=?,f_date=?,presence=? WHERE form1_no=? AND desg=? AND emp=? ");
				    	//psmt = cn2.prepareStatement("INSERT INTO form2_domain_item(status,remarks,f_date,presence,form2_no,desg,emp) VALUES(?,?,?,?,?,?,?)");
				    	psmt.setString(1,mmdradioHR);
				    	psmt.setString(2,HRremark);
				    	psmt.setDate(3,form_date);
				    	psmt.setString(4,"over");
				    	psmt.setString(5,form_no);
				    	psmt.setString(6,i_desg);
				    	psmt.setString(7,i_name);

				    	int i = psmt.executeUpdate();

				    	//String PreviousPersonIfNotApproved=null;
				    	String PPname=null,PPdesg=null,PPmail=null;
				    	//SELECT * FROM  form1_it_clearance_item WHERE form1_no='NEIN/CS/IT/54-11' ORDER BY id DESC LIMIT 1,1
				    	psmtPP = cn2.prepareStatement("SELECT mail,emp,desg FROM form1_it_clearance_item WHERE form1_no=? ORDER BY id DESC LIMIT 1,1");
				    	psmtPP.setString(1,form_no);
				    	//psmtPP.setString(2,"Initiator");
				    	ResultSet rsPP = psmtPP.executeQuery();
				    	while(rsPP.next())
				    	{
				    		PPname = rsPP.getString(2);
				    		PPdesg = rsPP.getString(3);
				    		PPmail = rsPP.getString(1);
				    		
				    	}
				    	


				    	psmtApOp3 = cn2.prepareStatement("INSERT INTO form1_it_clearance_item(form1_no,desg,emp,status,remarks,f_date,mail,presence) VALUES(?,?,?,?,?,?,?,?)");
				    	psmtApOp3.setString(1,form_no);
				    	//psmtApOp3.setString(2,desg);
				    	//psmtApOp3.setString(2,desgHR);//PPdesg
				    		psmtApOp3.setString(2,PPdesg);
				    	//psmtApOp3.setString(3,emp);
				    	//psmtApOp3.setString(3,empHR);//PPname
				    	psmtApOp3.setString(3,PPname);//PPname
				    	psmtApOp3.setString(4,"Pending");
				    	psmtApOp3.setString(5,"Pending");
				    	psmtApOp3.setDate(6,form_date);
				    	//psmtApOp3.setString(7,Mail1);
				    	//psmtApOp3.setString(7,mailHR);//PPmail
				    	psmtApOp3.setString(7,PPmail);//PPmail
				    	psmtApOp3.setString(8,"now");


				    	int jA = psmtApOp3.executeUpdate();


				    	PreparedStatement psmt10=null;
				    	psmt10 = cn2.prepareStatement("UPDATE form1_it_clearance SET Approval_status=?,Approval_sttatuss=?,Approval_remarks=?,Approval_f_date=?,Approval_emp=?,Approval_desg=?,Approval_empp=?,Approval_desgg=?,HRvalidateAC=? WHERE form1_no=?");
				    	psmt10.setString(1,mmdradioHR);
				    	psmt10.setString(2,"Pending");
				    	psmt10.setString(3,HRremark);
				    	psmt10.setDate(4,form_date);
				    	//psmt10.setString(5,NONITName);//empHR
				    	//psmt10.setString(5,empHR);//
				    	psmt10.setString(5,PPname);//PPname
				    	//psmt10.setString(6,"HR MANAGER");//desgHR
				    	//psmt10.setString(6,desgHR);//
				    	psmt10.setString(6,PPdesg);
				    	psmt10.setString(7,i_name);
				    	psmt10.setString(8,i_desg);
				    	//psmt10.setString(9,"Accounts");
				    	psmt10.setString(9,"Accounts");
				    	psmt10.setString(10,form_no);
				    	int b = psmt10.executeUpdate(); 
				    	
				    	
					
					
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
							//postMail.postMail(i_email_id,i_name,"pass1234",allMails1," IT CLEARANCE FORM :  " +form_no+ " ",initiatorNameIfNotApproved+  " "+  "request Is NOT Approved " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.3:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.2:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>");
								postMail.postMail(i_email_id,i_name,"pass1234",allMails1," IT CLEARANCE FORM  :  " +form_no+ " ",initiatorNameIfNotApproved+  " "+  "your request for IT CLEARANCE FORM : "+form_no+" Is NOT Approved by " +i_name+ " <br>Remarks : "+txtmail_msg+"<br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://ninsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
							}
					
					
				   }
message = null;

msg = "IT__CLEARANCE__FORM__NO__:__'"+form_no+"'__SAVED__AND__SENT__SUCCESSFULLY";
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
	DbUtil.closeDBResources(rsi,psmt4i,null);
  }
%>


</html>
