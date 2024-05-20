<%@page import="CON2.DbUtil"%>
<%@page import="CON2.MailMessageLotus"%>
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
                  MailMessageLotus mailMessage = new MailMessageLotus();
                  Connection conn = null, conn1 = null,cn2=null; 
	              Statement st= null, st1=null,st2=null,st3=null,st4=null,st5=null,st6=null,st7=null,st8=null,st9=null,st11=null;
	              ResultSet rs = null;
	              String message = null;
	              %>
	              <%
	              
	              cn2 = con.getConnection2();
	              st2 = cn2.createStatement();
	              PreparedStatement psmt=null,psmt2=null,psmt3=null,psmt4=null;PreparedStatement psmt10=null,psmtt=null;
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

String reminder = request.getParameter("reminder");


String form3_no = request.getParameter("form3_no");
String f_date = request.getParameter("f_date");
String mmdradio = request.getParameter("mmdradio");
String desg = request.getParameter("desg");
String emp = request.getParameter("emp");
String mail = request.getParameter("mail1");
String empid1 = request.getParameter("empid1");
String levelno = request.getParameter("levelno");
String txtmail_msg = request.getParameter("txtmail_msg");



String notesid = request.getParameter("notesid");
String ITusername = request.getParameter("ITusername");
String ITpassword = request.getParameter("ITpassword");
String gname = request.getParameter("gname");
String ITcreated = request.getParameter("ITcreated");
String ITremark = request.getParameter("ITremark");


String mmdradioBcc = request.getParameter("mmdradioBcc");
String SendExtraMails = request.getParameter("SendBCCmail");
System.out.println("mmdradioBcc :"+mmdradioBcc);
System.out.println("SendExtraMails :"+SendExtraMails);


String senddirect = request.getParameter("senddirect");

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
psmt4 = cn2.prepareStatement("SELECT mail,emp FROM form3_lotus_item WHERE form3_no=? AND status=?");
psmt4.setString(1,form3_no);
psmt4.setString(2,"Initiator");
ResultSet rs = psmt4.executeQuery();
while(rs.next())
{
	allMails = rs.getString(1); 
	initiatorNameIfNotApproved = rs.getString(2);
}
String ToMail="";
psmtt = cn2.prepareStatement("SELECT mail,emp FROM form3_lotus_item WHERE form3_no=?");
psmtt.setString(1,form3_no);
ResultSet rst = psmtt.executeQuery();
while(rst.next())
    {
	ToMail = ToMail+","+rst.getString(1); 
    }
System.out.println("ToMail %%%%%%%%%%%%%%%%%%%%%%%%%%%%5:"+ToMail);




psmt = cn2.prepareStatement("UPDATE form3_lotus_item  SET status=?,remarks=?,f_date=?,presence=? WHERE form3_no=? and presence='now' ");

psmt.setString(1,mmdradio);
psmt.setString(2,txtmail_msg);
psmt.setDate(3,form_date);
psmt.setString(4,"over");
psmt.setString(5,form3_no);
int i = psmt.executeUpdate();



if(mmdradio.equals("Approved"))
{//System.out.println("mmradio 111:"+mmdradio);
if(senddirect.equals("sendonly"))
     {//System.out.println("Send direct 33:"+senddirect);
	// PreparedStatement psmt10=null;
     psmt10 = cn2.prepareStatement("UPDATE form3_lotus SET Approval_status=?,Approval_sttatuss=?,Approval_remarks=?,Approval_f_date=?,Approval_emp=?,Approval_desg=?,Approval_empp=?,Approval_desgg=? WHERE form3_no=?");
     psmt10.setString(1,mmdradio);
     psmt10.setString(2,"Pending");
     psmt10.setString(3,txtmail_msg);
     psmt10.setDate(4,form_date);
     psmt10.setString(5,emp);
     psmt10.setString(6,desg);
     psmt10.setString(7,i_name);
     psmt10.setString(8,i_desg);
     psmt10.setString(9,form3_no);
     int b = psmt10.executeUpdate(); 
	  psmt2 = cn2.prepareStatement("INSERT INTO form3_lotus_item (form3_no,desg,emp,status,remarks,f_date,mail,presence,empid,levelno) VALUES(?,?,?,?,?,?,?,?,?,?)");
     psmt2.setString(1,form3_no);
     psmt2.setString(2,desg);
     psmt2.setString(3,emp);
     psmt2.setString(4,"Pending");
     psmt2.setString(5,"Pending");
     psmt2.setDate(6,form_date);
     psmt2.setString(7,mail);
     psmt2.setString(8,"now");
     psmt2.setString(9,empid1);
     psmt2.setString(10,levelno);
	     int j = psmt2.executeUpdate();
	     message = mailMessage.getMailMessageLotus(form3_no.trim());

	     postMail.postMail(i_email_id,i_name,"pass1234",mail," EMAIL ID USER FORM :  " +form3_no+ " ",i_name+  " "+  "request you to Approve " +form3_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
     }
else if(senddirect.equals("senddirect"))
     {//System.out.println("Send direct22:"+senddirect);
     if(!higherAuthority.equals("direct"))
           {
	      // PreparedStatement psmt10=null;
	       psmt10 = cn2.prepareStatement("UPDATE form3_lotus SET Approval_status=?,Approval_sttatuss=?,Approval_remarks=?,Approval_f_date=?,Approval_emp=?,Approval_desg=?,Approval_empp=?,Approval_desgg=? WHERE form3_no=?");
	       psmt10.setString(1,mmdradio);
	       psmt10.setString(2,"Pending");
	       psmt10.setString(3,txtmail_msg);
	       psmt10.setDate(4,form_date);
	       psmt10.setString(5,emp);
	       psmt10.setString(6,desg);
	       psmt10.setString(7,i_name);
	       psmt10.setString(8,i_desg);
	       psmt10.setString(9,form3_no);
	       int b = psmt10.executeUpdate(); 
   	       psmt2 = cn2.prepareStatement("INSERT INTO form3_lotus_item (form3_no,desg,emp,status,remarks,f_date,mail,presence,empid,levelno) VALUES(?,?,?,?,?,?,?,?,?,?)");
	       psmt2.setString(1,form3_no);
	       psmt2.setString(2,desg);
	       psmt2.setString(3,emp);
	       psmt2.setString(4,"Pending");
	       psmt2.setString(5,"Pending");
	       psmt2.setDate(6,form_date);
	       psmt2.setString(7,mail);
	       psmt2.setString(8,"now");
	       psmt2.setString(9,empid1);
	       psmt2.setString(10,levelno);
  	       int j = psmt2.executeUpdate();
  	       message = mailMessage.getMailMessageLotus(form3_no.trim());

           postMail.postMail(i_email_id,i_name,"pass1234",mail," EMAIL ID USER FORM :  " +form3_no+ " ",i_name+  " "+  "request you to Approve " +form3_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
           }
        else
           { 
        	psmt2 = cn2.prepareStatement("UPDATE form3_lotus SET ITusername=?,ITpassword=?,ITcreated=?,ITremark=?,notesid=?,groupName=? WHERE form3_no=?");
        	psmt2.setString(1,ITusername);
        	psmt2.setString(2,ITpassword);
        	psmt2.setString(3,ITcreated);
        	psmt2.setString(4,ITremark);
        	
        	psmt2.setString(5,notesid);
        	psmt2.setString(6,gname);
        	psmt2.setString(7,form3_no);
  	        int j = psmt2.executeUpdate();
  	        message = mailMessage.getMailMessageLotus(form3_no.trim());

  	       /*  postMail.postMail(i_email_id,i_name,"pass1234",mail,"LOTUS NOTES USER FORM :  " +form3_no+ " ",i_name+  " "+  "request has been Approved " +form3_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://ninsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
  	   	    postMail.postMail(i_email_id,i_name,"pass1234",allMails," LOTUS NOTES USER FORM :  " +form3_no+ " ",initiatorNameIfNotApproved+  " "+  "request has been Approved " +form3_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://ninsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>");
 */           
  	   	    String mailingCheck[] = request.getParameterValues("mailingCheck");

  	        if((SendExtraMails!="NULL")||(mmdradioBcc=="Yes"))
  	             { 
  	  	         System.out.println("IF SendExtraMails in incident reported after attachment with CC :"+SendExtraMails);
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
  	   	  
  	   	  
  	    	  postMail.sendMailCCWithAttachment(i_email_id,i_name,ToMail,CCList," EMAIL ID USER FORM :  " +form3_no+ " ",i_name+  " "+  "Approved your request " +form3_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message,form3_no);
  	        }
  	        
           
           
           
           
           }
    }
 else
    {
		psmt2 = cn2.prepareStatement("UPDATE form3_lotus SET ITusername=?,ITpassword=?,ITcreated=?,ITremark=?,notesid=?,groupName=? WHERE form3_no=?");
    	psmt2.setString(1,ITusername);
    	psmt2.setString(2,ITpassword);
    	psmt2.setString(3,ITcreated);
    	psmt2.setString(4,ITremark);
    	psmt2.setString(5,notesid);
    	psmt2.setString(6,gname);
    	psmt2.setString(7,form3_no);
    int j = psmt2.executeUpdate();
    message = mailMessage.getMailMessageLotus(form3_no.trim());

    /* postMail.postMail(i_email_id,i_name,"pass1234",mail,"LOTUS NOTES USER FORM :  " +form3_no+ " ",i_name+  " "+  "request has been Approved " +form3_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://ninsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
	postMail.postMail(i_email_id,i_name,"pass1234",allMails," LOTUS NOTES USER FORM :  " +form3_no+ " ",initiatorNameIfNotApproved+  " "+  "request has been Approved " +form3_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://ninsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>");
 */    
	String mailingCheck[] = request.getParameterValues("mailingCheck");

      if((SendExtraMails!="NULL")||(mmdradioBcc=="Yes"))
           { 
	         System.out.println("IF SendExtraMails in incident reported after attachment with CC :"+SendExtraMails);
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
 	   postMail.sendMailCCWithAttachment(i_email_id,i_name,ToMail,CCList," EMAIL ID USER FORM :  " +form3_no+ " ",i_name+  " "+  "Approved your request " +form3_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message,form3_no);
      }
      
    
    
    
    
    }
}
else
{
String allMails1=null;
psmt4 = cn2.prepareStatement("SELECT mail,emp FROM form3_lotus_item WHERE form3_no=?");
psmt4.setString(1,form3_no);
ResultSet rs1 = psmt4.executeQuery();
while(rs1.next())
    {
    allMails1 = rs1.getString(1); 
    postMail.postMail(i_email_id,i_name,"pass1234",allMails1," EMAIL ID USER FORM :  " +form3_no+ " ",initiatorNameIfNotApproved+  " "+  "request Is NOT Approved for the Form No." +form3_no+ " <br>Remarks : "+txtmail_msg+"<br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>");
    }
}

//message = mailMessage.getMailMessageLotus(form3_no.trim());

  













message = null;

msg = "FORM__SAVED__AND__SENT__SUCCESSFULLY";
System.out.println("result..date..........."+form_date);
//response.sendRedirect("LotusSelectAdmin.jsp?msg=" +msg);
response.sendRedirect("PopUpPage.jsp?form_no=" +form3_no);
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
;
	DbUtil.closeDBResources(null,psmt,null);

	DbUtil.closeDBResources(null,psmt2,null);
	DbUtil.closeDBResources(null,psmt3,null);
  }
%>


</html>
