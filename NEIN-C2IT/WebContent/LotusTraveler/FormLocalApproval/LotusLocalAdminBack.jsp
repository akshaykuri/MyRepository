<%@page import="CON2.MailMessageLotusTraveler"%>
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
                  MailMessageLotusTraveler mailMessage = new MailMessageLotusTraveler();
                  Connection conn = null, conn1 = null,cn2=null; 
	              Statement st= null, st1=null,st2=null,st3=null,st4=null,st5=null,st6=null,st7=null,st8=null,st9=null,st11=null;
	              ResultSet rs = null;
	              String message = null;
	              %>
	              <%
	              
	              cn2 = con.getConnection2();
	              st2 = cn2.createStatement();
	              PreparedStatement psmt=null,psmt2=null,psmt3=null,psmt4=null,psmt10=null,psmtt=null;
	              %>
	              	<%--i_name,i_desg,i_city,i_b_no,i_admin,i_email_id --%>
<%
//form1_it_clearance
//form1_it_clearance_item 
String i_name= request.getParameter("i_name");
String i_desg= request.getParameter("i_desg");
String i_city= request.getParameter("i_city");
String i_b_no= request.getParameter("i_b_no");
String i_admin= request.getParameter("i_admin");
String i_email_id= request.getParameter("i_email_id");

String ITusername = request.getParameter("ITusername");
String ITpassword = request.getParameter("ITpassword");
String ITcreated = "";
String ITremark = request.getParameter("ITremark");
String senddirect = request.getParameter("senddirect");

String mmdradioBcc = request.getParameter("mmdradioBcc");
String SendExtraMails = request.getParameter("SendBCCmail");
System.out.println("mmdradioBcc :"+mmdradioBcc);
System.out.println("SendExtraMails :"+SendExtraMails);


String form8_no = request.getParameter("form8_no");
String f_date = request.getParameter("f_date");
String mmdradio = request.getParameter("mmdradio");
String desg = request.getParameter("desg");
String emp = request.getParameter("emp");
String mail = request.getParameter("mail1");
String empid = request.getParameter("empid1");
String levelno = request.getParameter("levelno");
String txtmail_msg = request.getParameter("txtmail_msg");


String mmradio = request.getParameter("mmradio");
String higherAuthority = request.getParameter("higherAuthority");
//String Itradio = request.getParameter("Itradio");
String Itradio ="IT";
System.out.println("mmradio "+mmdradio   +"higherAuthority"+higherAuthority  +"It radio :"+Itradio);
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

String allMails=null,initiatorNameIfNotApproved=null;
psmt4 = cn2.prepareStatement("SELECT mail,emp FROM  form8_lotus_traveler_item WHERE form8_no=? AND status=?");
psmt4.setString(1,form8_no);
psmt4.setString(2,"Initiator");
ResultSet rs = psmt4.executeQuery();
while(rs.next())
{
	allMails = rs.getString(1); 
	initiatorNameIfNotApproved = rs.getString(2);
}


String ToMail="";
psmtt = cn2.prepareStatement("SELECT mail,emp FROM form8_lotus_traveler_item WHERE form8_no=? AND status!='Initiator'");
psmtt.setString(1,form8_no);
ResultSet rstt = psmtt.executeQuery();
while(rstt.next())
    {
	ToMail = ToMail+","+rstt.getString(1); 
    }
System.out.println("ToMail %%%%%%%%%%%%%%%%%%%%%%%%%%%%5:"+ToMail);



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

System.out.println("FORMA NUMBER FOR LOTUS : "+form8_no);

psmt = cn2.prepareStatement("UPDATE form8_lotus_traveler_item  SET status=?,remarks=?,f_date=?,presence=? WHERE form8_no=? and presence='now' ");

psmt.setString(1,mmdradio);
psmt.setString(2,txtmail_msg);
psmt.setDate(3,form_date);
psmt.setString(4,"over");
psmt.setString(5,form8_no);

int i = psmt.executeUpdate();



if(mmdradio.equals("Approved"))
{//System.out.println("mmradio 111:"+mmdradio);
if(senddirect.equals("sendonly"))
     {//System.out.println("Send direct 33:"+senddirect);
    	 psmt10 = cn2.prepareStatement("UPDATE form8_lotus_traveler SET Approval_status=?,Approval_sttatuss=?,Approval_remarks=?,Approval_f_date=?,Approval_emp=?,Approval_desg=?,Approval_empp=?,Approval_desgg=?,reminder=? WHERE form8_no=?");
    	 psmt10.setString(1,mmdradio);
    	 psmt10.setString(2,"Pending");
    	 psmt10.setString(3,txtmail_msg);
    	 psmt10.setDate(4,form_date);
    	 psmt10.setString(5,emp);
    	 psmt10.setString(6,desg);
    	 psmt10.setString(7,i_name);
    	 psmt10.setString(8,i_desg);
    	 psmt10.setString(9,"no");
    	 psmt10.setString(10,form8_no);
    	 int b = psmt10.executeUpdate(); 
    	 
    	 psmt2 = cn2.prepareStatement("INSERT INTO form8_lotus_traveler_item (form8_no,desg,emp,status,remarks,f_date,mail,presence,empid,levelno) VALUES(?,?,?,?,?,?,?,?,?,?)");
    	 psmt2.setString(1,form8_no);
    	 psmt2.setString(2,desg);
    	 psmt2.setString(3,emp);
    	 psmt2.setString(4,"Pending");
    	 psmt2.setString(5,"Pending");
    	 psmt2.setDate(6,form_date);
    	 psmt2.setString(7,mail);
    	 psmt2.setString(8,"now");
    	 psmt2.setString(9,empid);
         psmt2.setString(10,levelno);
    	 int j = psmt2.executeUpdate();
    	 message = mailMessage.getMailMessageLotusTraveler(form8_no.trim());
    	 postMail.postMail(i_email_id,i_name,"pass1234",mail," LOTUS TRAVELER FORM :  " +form8_no+ " ",i_name+  " "+  "request you to Approved " +form8_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);

     }
else if(senddirect.equals("senddirect"))
     {//System.out.println("Send direct22:"+senddirect);
	 if(higherAuthority.equals("direct"))
	       {
		 psmt2 = cn2.prepareStatement("UPDATE form8_lotus_traveler SET ITusername=?,ITpassword=?,ITcreated=?,ITremark=?,Approval_sttatuss=?,Approval_f_date=?,reminder=? WHERE form8_no=?");
		 psmt2.setString(1,ITusername);
		 psmt2.setString(2,ITpassword);
		 psmt2.setString(3,ITcreated);
		 psmt2.setString(4,ITremark);
		 psmt2.setString(5,"NULL");
		 psmt2.setDate(6,form_date);
		 psmt2.setString(7,"no");
		 psmt2.setString(8,form8_no);


		 int j = psmt2.executeUpdate();
         //postMail.postMail(i_email_id,i_name,"pass1234",allMails," LOTUS TRAVELER FORM :  " +form8_no+ " ",initiatorNameIfNotApproved+  " "+  "approved your request " +form8_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>");
         message = mailMessage.getMailMessageLotusTraveler(form8_no.trim());
         
         String mailingCheck[] = request.getParameterValues("mailingCheck");

		   if((SendExtraMails!="NULL")||(mmdradioBcc=="Yes"))
		        { 
			       //  System.out.println("IF SendExtraMails in incident reported after attachment with CC :"+SendExtraMails);
		        String valuesbcc[] = SendExtraMails.split(",");
			         for(int v=0;v<valuesbcc.length;v++)
			             {
			             System.out.println("IF SendExtraMails ddddd :"+valuesbcc[v]);
			             } 
			  String CCList = "nilkanth.pawar@nipponexpress.com,chintu.kumar@nipponexpress.com";
			  for (String	email: valuesbcc) 
			      {
				  CCList =  email  + "," +CCList ;
				  }
			  System.out.println("CCList :"+CCList);
			  
			  
			  CCList=ToMail+","+CCList;
			  System.out.println("CCList 1 :"+CCList);
			  postMail.sendMailCC(i_email_id,i_name,allMails,CCList," LOTUS TRAVELER FORM :  " +form8_no+ " ",initiatorNameIfNotApproved+  " "+  "approved your request " +form8_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
		   }
         }
	 else
	       {
		 psmt10 = cn2.prepareStatement("UPDATE form8_lotus_traveler SET Approval_status=?,Approval_sttatuss=?,Approval_remarks=?,Approval_f_date=?,Approval_emp=?,Approval_desg=?,Approval_empp=?,Approval_desgg=?,reminder=? WHERE form8_no=?");
		 psmt10.setString(1,mmdradio);
		 psmt10.setString(2,"Pending");
		 psmt10.setString(3,txtmail_msg);
		 psmt10.setDate(4,form_date);
		 psmt10.setString(5,emp);
		 psmt10.setString(6,desg);
		 psmt10.setString(7,i_name);
		 psmt10.setString(8,i_desg);
		 psmt10.setString(9,"no");
		 psmt10.setString(10,form8_no);
		 int b = psmt10.executeUpdate(); 
    	 
		 psmt2 = cn2.prepareStatement("INSERT INTO form8_lotus_traveler_item (form8_no,desg,emp,status,remarks,f_date,mail,presence,empid,levelno) VALUES(?,?,?,?,?,?,?,?,?,?)");
		 psmt2.setString(1,form8_no);
		 psmt2.setString(2,desg);
		 psmt2.setString(3,emp);
		 psmt2.setString(4,"Pending");
		 psmt2.setString(5,"Pending");
		 psmt2.setDate(6,form_date);
		 psmt2.setString(7,mail);
		 psmt2.setString(8,"now");
		 psmt2.setString(9,empid);
         psmt2.setString(10,levelno);
		 int j = psmt2.executeUpdate();
		 message = mailMessage.getMailMessageLotusTraveler(form8_no.trim());
		 postMail.postMail(i_email_id,i_name,"pass1234",mail," LOTUS TRAVELER FORM :  " +form8_no+ " ",i_name+  " "+  "request you to Approved " +form8_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);

	       }
     }
else
     {
	 //System.out.println("Send direct 111:"+senddirect);
	 psmt2 = cn2.prepareStatement("UPDATE form8_lotus_traveler SET ITusername=?,ITpassword=?,ITcreated=?,ITremark=?,Approval_sttatuss=?,Approval_f_date=?,reminder=? WHERE form8_no=?");
psmt2.setString(1,ITusername);
psmt2.setString(2,ITpassword);
psmt2.setString(3,ITcreated);
psmt2.setString(4,ITremark);
psmt2.setString(5,"NULL");
psmt2.setDate(6,form_date);
psmt2.setString(7,"no");
psmt2.setString(8,form8_no);


int j = psmt2.executeUpdate();

message = mailMessage.getMailMessageLotusTraveler(form8_no.trim());

String mailingCheck[] = request.getParameterValues("mailingCheck");

  if((SendExtraMails!="NULL")||(mmdradioBcc=="Yes"))
       { 
	       //  System.out.println("IF SendExtraMails in incident reported after attachment with CC :"+SendExtraMails);
       String valuesbcc[] = SendExtraMails.split(",");
	         for(int v=0;v<valuesbcc.length;v++)
	             {
	             System.out.println("IF SendExtraMails ddddd :"+valuesbcc[v]);
	             } 
	  String CCList = "nilkanth.pawar@nittsu.co.in,chintu.kumar@nittsu.co.in";
	  for (String	email: valuesbcc) 
	      {
		  CCList =  email  + "," +CCList ;
		  }
	  System.out.println("CCList  1111 :"+CCList);
	  
	  
	  CCList=ToMail+","+CCList;
	  System.out.println("CCList 1111111 :"+CCList);
	  postMail.sendMailCC(i_email_id,i_name,allMails,CCList," LOTUS TRAVELER FORM :  " +form8_no+ " ",initiatorNameIfNotApproved+  " "+  "approved your request " +form8_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
  }

 	
     }
}
else
    {
	String allMails1=null;
	psmt4 = cn2.prepareStatement("SELECT mail,emp FROM form8_lotus_traveler_item WHERE form2_no=?");
	psmt4.setString(1,form8_no);
	message = mailMessage.getMailMessageLotusTraveler(form8_no.trim());
	ResultSet rs1 = psmt4.executeQuery();
	while(rs1.next())
	    {
	    allMails1 = rs1.getString(1); 
	    postMail.postMail(i_email_id,i_name,"pass1234",allMails1," LOTUS TRAVELER FORM :  " +form8_no+ " ",initiatorNameIfNotApproved+  " "+  "request Is NOT Approved for the Form No." +form8_no+ " <br>Remarks : "+txtmail_msg+"<br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
	    }
    }



message = null;

msg = "LOTUS__TRAVELER__FORM__SAVED__AND__SENT__SUCCESSFULLY";
System.out.println("result..date..........."+form_date);
response.sendRedirect("LotusSelectLocalAdmin.jsp?msg=" +msg);


%>


</html>
