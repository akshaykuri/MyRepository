<%@page import="CON2.MailMessageSharedFolder"%>

<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.text.resources.FormatData"%>

<jsp:useBean id="dateFormat" class="CON2.DateFormat"/>

<jsp:useBean id = "con" class="CON2.Connection2" /> 


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id = "postMail" class="CON2.PostMail" /> 
<html>
<head>
</head>
<%! 
                  MailMessageSharedFolder mailMessage = new MailMessageSharedFolder();
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
System.out.println("::::::::::::::::::::Shared Folder Admin IT manager BAck:::::::::::::::::::::::::: ");
String i_name= request.getParameter("i_name");
String i_desg= request.getParameter("i_desg");
String i_city= request.getParameter("i_city");
String i_b_no= request.getParameter("i_b_no");
String i_admin= request.getParameter("i_admin");
String i_email_id= request.getParameter("i_email_id");

String mmdradioBcc = request.getParameter("mmdradioBcc");
String SendExtraMails = request.getParameter("SendBCCmail");
System.out.println("mmdradioBcc :"+mmdradioBcc);
System.out.println("SendExtraMails :"+SendExtraMails);

String ApprovalOption = request.getParameter("ApprovalOption");
System.out.println("ApprovalOption :::::::::::::::::::: "+ApprovalOption);
String txtmail_msg = request.getParameter("txtmail_msg");
String desg = request.getParameter("desg");
String emp = request.getParameter("emp");
String Mail1 = request.getParameter("mail1");
String higherAuthority = request.getParameter("higherAuthority");


String reminder = request.getParameter("reminder");

String form_no = request.getParameter("form5_no");
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
String allMails=null,initiatorNameIfNotApproved=null,initiatorNamee=null;
psmt4 = cn2.prepareStatement("SELECT mail,emp FROM form5_folder_item WHERE form5_no=? AND status=?");
psmt4.setString(1,form_no);
psmt4.setString(2,"Initiator");
ResultSet rs = psmt4.executeQuery();
while(rs.next())
{
	allMails = rs.getString(1); 
	initiatorNameIfNotApproved = rs.getString(2);
	initiatorNamee = rs.getString(2);
}

/* if(mmdradio!=null && mmdradio.equals("Not Approved"))
{
	desg ="NOT APPROVED";
	emp="NOT APPROVED";
	Mail1 =allMails;
} */
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
System.out.println("NEW MAIL after changing if not approved : "+Mail1);
System.out.println("initiatorNamee :"+initiatorNamee );


PreparedStatement psmtApOp1=null,psmtApOp2=null,psmtApOp3=null;
if(ApprovalOption.equals("ContinueStatus"))
{
	System.out.println("If continue ststaus");
	//psmtApOp1 = cn2.prepareStatement("UPDATE form5_folder_item SET status=?,remarks=?,f_date=?,presence=? WHERE form5_no=? AND desg=? AND emp=? ");
	psmtApOp1 = cn2.prepareStatement("UPDATE form5_folder_item f,(SELECT max(id) as idf FROM form5_folder_item WHERE form5_no=? AND desg=? AND emp=?) as p SET f.status=?,f.remarks=?,f.f_date=?,f.presence=? WHERE f.form5_no=? AND f.desg=? AND f.emp=? AND f.id=p.idf");
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


	psmtApOp2 = cn2.prepareStatement("UPDATE form5_folder SET Approval_status=?,Approval_sttatuss=?,Approval_remarks=?,Approval_f_date=?,Approval_emp=?,Approval_desg=?,Approval_empp=?,Approval_desgg=? WHERE form5_no=?");
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
		
	psmtApOp3 = cn2.prepareStatement("INSERT INTO form5_folder_item(form5_no,desg,emp,status,remarks,f_date,mail,presence) VALUES(?,?,?,?,?,?,?,?)");
	psmtApOp3.setString(1,form_no);
	psmtApOp3.setString(2,desg);
	psmtApOp3.setString(3,emp);
	psmtApOp3.setString(4,"Pending");
	psmtApOp3.setString(5,"Pending");
	psmtApOp3.setDate(6,form_date);
	psmtApOp3.setString(7,Mail1);
	psmtApOp3.setString(8,"now");

	int jA = psmtApOp3.executeUpdate();
	
	
	
	

	


	System.out.println("Mail is Working for IT clearnace i_email_id :"+i_email_id);
	System.out.println("Mail is Working for IT clearnace i_name :"+i_name);
	System.out.println("Mail is Working for IT clearnace Mail1 :"+Mail1);
	System.out.println("Mail is Working for IT clearnace form_no :"+form_no);
	System.out.println("Mail is Working for IT clearnace allMails  :"+allMails);
	System.out.println("Mail is Working for IT clearnace initiatorNameIfNotApproved :"+initiatorNameIfNotApproved);




	message = mailMessage.getMailMessageFolder(form_no.trim());

//postMail.postMail(i_email_id,i_name,"pass1234",mailingCheck[u]," LOTUS NOTES USER FORM :  " +form_no+ " ",i_name+  " "+  "request is Approved " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - https://203.124.152.5:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>"+message);
	if((mmdradio!=null && mmdradio.equals("Approved"))&&(higherAuthority!=null && higherAuthority.equals("higherAuthority"))) 
	{  System.out.println("if Approved and sending again to Higher authority ");
		postMail.postMail(i_email_id,i_name,"pass1234",Mail1,"  SHARED FOLDER FORM:  " +form_no+ " ",i_name+  " "+  "request you to Approved " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://ninsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
	}
		if((mmdradio!=null && mmdradio.equals("Approved"))&&(higherAuthority!=null && higherAuthority.equals("directApprove"))) 
	{  System.out.println("if Approved and want to send directly to IT nonIT persons of HO and ONE copy to Initiator");
		postMail.postMail(i_email_id,i_name,"pass1234",Mail1,"  SHARED FOLDER FORM :  " +form_no+ " ",i_name+  " "+  "approved your request " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://ninsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
		postMail.postMail(i_email_id,i_name,"pass1234",allMails," SHARED FOLDER FORM  :  " +form_no+ " ",initiatorNameIfNotApproved+  " "+  "approved your request " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://ninsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>");
	}
/* 	if((mmdradio!=null && mmdradio.equals("Not Approved"))&&(higherAuthority!=null && higherAuthority.equals("directApprove")))
	{  System.out.println("if NOT Approved , so a copy to Initaior ");
		postMail.postMail(i_email_id,i_name,"pass1234",Mail1," SHARED FOLDER FORM  :  " +form_no+ " ",initiatorNameIfNotApproved+  " "+  "request Is NOT Approved " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>");
		postMail.postMail(i_email_id,i_name,"pass1234",allMails,"  SHARED FOLDER FORM  :  " +form_no+ " ",initiatorNameIfNotApproved+  " "+  "request Is NOT Approved " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>");
	} */
	 if((mmdradio!=null && mmdradio.equals("Not Approved") || mmdradio.equals("NOT APPROVED")))
     {	
        System.out.println("IF NOT APPROVED THIS LOOP WILL RUN");
    	String allMails1=null;
		psmt4 = cn2.prepareStatement("SELECT mail,emp FROM form5_folder_item WHERE form5_no=?");
		psmt4.setString(1,form_no);

		ResultSet rs1 = psmt4.executeQuery();
		while(rs1.next())
		{
		allMails1 = rs1.getString(1); 
		//initiatorNameIfNotApproved = rs1.getString(2);
		// if NOT Approved , so a copy to Initaior 
         postMail.postMail(i_email_id,i_name,"pass1234",allMails1," SHARED FOLDER FORM :  " +form_no+ " ",initiatorNameIfNotApproved+  " "+  "request Is NOT Approved for the Form No." +form_no+ " <br>Remarks : "+txtmail_msg+"<br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://ninsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
        }
     }

	
	/* for(int u=0;u<mailingCheck.length;u++)
	{
	postMail.postMail(i_email_id,i_name,"pass1234",mailingCheck[u]," DOMAIN USER FORM :  " +form_no+ " ",i_name+  " "+  "request is Approved " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - https://203.124.152.5:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>"+message);
	} */
	
	
	
}
else
{
psmt = cn2.prepareStatement("UPDATE form5_folder_item SET status=?,remarks=?,f_date=?,presence=? WHERE form5_no=? AND desg=? AND emp=? ");
psmt.setString(1,"Approved");
psmt.setString(2,ITremark);
psmt.setDate(3,form_date);
psmt.setString(4,"over");
psmt.setString(5,form_no);
psmt.setString(6,i_desg);
psmt.setString(7,i_name);

int i = psmt.executeUpdate();

psmt2 = cn2.prepareStatement("UPDATE form5_folder SET ITusername=?,ITpassword=?,ITcreated=?,ITremark=?,Approval_sttatuss=?,Approval_f_date=?,reminder=? WHERE form5_no=?");
psmt2.setString(1,"NULL");//ITusername
psmt2.setString(2,"NULL");//ITpassword
psmt2.setString(3,"NULL");//ITcreated
psmt2.setString(4,ITremark);
psmt2.setString(5,"NULL");
psmt2.setDate(6,form_date);
psmt2.setString(7,reminder);
psmt2.setString(8,form_no);


int j = psmt2.executeUpdate();




message = mailMessage.getMailMessageFolder(form_no.trim());

/* for(int u=0;u<mailingCheck.length;u++)
{
postMail.postMail(i_email_id,i_name,"pass1234",mailingCheck[u]," SHARED FOLDER FORM :  " +form_no+ " ",i_name+  " "+  "Approved Form No.: " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  https://10.206.10.18:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - https://203.124.152.5:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>"+message);
} */





if((SendExtraMails!="NULL")||(mmdradioBcc=="Yes"))
		{ System.out.println("IF SendExtraMails in incident reported :"+SendExtraMails);
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
		 	
		 	System.out.println("i_email_id :"+i_email_id);
		 	System.out.println("i_name :"+i_name);
		 	System.out.println("CCList :"+CCList);
		 	System.out.println("form_no :"+form_no);
		 	
		 	//System.out.println("IF After For loop :"+allValues);
			/* for(int u=0;u<mailingCheck.length;u++)
			{
				System.out.println("INSIDE FOR LOOP OF mailingCheck[u] main "+mailingCheck[u]);
		//	postMail.postMail(i_email_id,i_name,"pass1234",mailingCheck[u]," DOMAIN USER FORM :  " +form_no+ " ","your request for DOMAIN USER FORM "+form_no+" is Approved by " +i_name+ " <br><br><b><u> Open the following URL</u> </b><br>C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
			//postMail.postMailCC(i_email_id,i_name,"pass1234",mailingCheck[u],CCList," DOMAIN USER FORM :  " +form_no+ " ","your request for DOMAIN USER FORM "+form_no+" is Approved by " +i_name+ " <br><br><b><u> Open the following URL</u> </b><br>C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
				postMail.postMailCC(i_email_id,i_name,"pass1234",mailingCheck[u],CCList," SHARED FOLDER FORM :  " +form_no+ " ",i_name+  " "+  "Approved Form No.: " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  https://10.206.10.18:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - https://203.124.152.5:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>"+message);
			} */
			
		 	postMail.sendMailCC(i_email_id,i_name,ToMail,CCList," SHARED FOLDER FORM :  " +form_no+ " ",i_name+  " "+  "Approved Form No.: " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>"+message);
		}

		else
		{
			for(int u=0;u<mailingCheck.length;u++)
			{
			//postMail.postMail(i_email_id,i_name,"pass1234",mailingCheck[u]," DOMAIN USER FORM :  " +form_no+ " ","your request for DOMAIN USER FORM "+form_no+" is Approved by " +i_name+ " <br><br><b><u> Open the following URL</u> </b><br>C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
			postMail.postMail(i_email_id,i_name,"pass1234",mailingCheck[u]," SHARED FOLDER FORM :  " +form_no+ " ",i_name+  " "+  "Approved Form No.: " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  https://10.206.10.18:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - https://203.124.152.5:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>"+message);
			}
		}


}
message = null;

msg = "SHARED__FOLDER__FORM__NO__:__'"+form_no+"'__SAVED__AND__SENT__SUCCESSFULLY";
System.out.println("result..date..........."+form_date);
//response.sendRedirect("ITclearanceSelectAdmin.jsp?msg=" +msg);
//response.sendRedirect("SharedFolderSelectAdmin.jsp?msg=" +msg);
response.sendRedirect("PopUpPage.jsp?form_no=" +form_no);

%>


</html>
