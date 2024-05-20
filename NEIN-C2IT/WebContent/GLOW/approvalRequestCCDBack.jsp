
<%@page import="CON2.MailMessageCCDReport"%>

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



<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sun.xml.internal.fastinfoset.util.ValueArray"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.File" %>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id = "postMail" class="CON2.PostMail" /> 
<html>
<head>
</head>
<%! 
                  MailMessageCCDReport mailMessage = new MailMessageCCDReport();
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
	              	<%--i_name,i_desg,i_city,i_b_no,i_admin,i_email_id --%>
<%
//form1_it_clearance
//form1_it_clearance_item 
/* String i_name= request.getParameter("i_name");
String i_desg= request.getParameter("i_desg");
String i_city= request.getParameter("i_city");
String i_b_no= request.getParameter("i_b_no");
String i_admin= request.getParameter("i_admin");
String i_email_id= request.getParameter("i_email_id"); */


String i_name= "";
String i_desg= "";
String i_city="";
String i_b_no= "";
String i_admin= "";
String i_email_id= "";



/* String form_no = request.getParameter("form1_no");
String f_date = request.getParameter("f_date");
String mmdradio = request.getParameter("mmdradio");
String higherAuthority= request.getParameter("higherAuthority"); */

String form_no = null;
String f_date = null;
String mmdradio =null;
String higherAuthority=null;

/* String desg = request.getParameter("desg");
String emp = request.getParameter("emp");
String mail = request.getParameter("mail1");
String empid1 = request.getParameter("empid1");
String levelno = request.getParameter("levelno"); */


String desg = "";
String emp = "";
String mail = "";
String empid1 = "";
String levelno = "";

//String txtmail_msg = request.getParameter("txtmail_msg");


String mmradio = "";
String msg=null;
Date form_date=null;
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");



//System.out.println("FORM 2 NO ****************************: "+form_no);
//System.out.println("mmdradio: "+mmdradio);
//System.out.println("txtmail_msg : "+txtmail_msg);




    /* ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// */




String []fileName=null;
String itemName =null;
FileItem item = null;
ArrayList<String> filenameList;
 filenameList = new ArrayList<String>();
    int count1 = 0,f1=0,f2=0;
    int incre = 0;
    int id=0;
  
  
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    String txtmail_msg=null;
 if (!isMultipart) 
        {
        }
    else
        {
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List items = null;
        try 
           {
           items = upload.parseRequest(request);
           } catch (FileUploadException e) {
              e.printStackTrace();
           }
       Iterator itr = items.iterator();
       while (itr.hasNext()) 
              {
              item = (FileItem) itr.next();
              if(item.isFormField()) 
                     {
 	                 String name = item.getFieldName();
 	                 String value = item.getString();	
 	                 //cm_date,idextend,cm_name,cm_mail,phno,reportTo,cm_location,cm_type,pType,typo,cm_problem,priority,file,desg,emp,transid
 	                 if(name.equals("txtmail_msg")) 
 		                  {
 	                    	txtmail_msg = value;
   		                  }
 	                if(name.equals("form1_no")) 
	                  {
 	                	form_no = value;
		                  }
 	               if(name.equals("f_date")) 
	                  {
 	            	  f_date = value;
	                  }
 	              if(name.equals("mmdradio")) 
	                  {
 	            	 mmdradio = value;
	                  }
 	             if(name.equals("higherAuthority")) 
                  {
 	            	higherAuthority = value;
	                  }
 	            if(name.equals("mmradio")) 
                {
 	            	mmradio = value;
	                  }  
 	             
 	             
 	             
 	             
 	            if(name.equals("desg")) 
                 {
 	            	desg = value;
	                  }
           if(name.equals("emp")) 
            {
        	   emp = value;
                }
          if(name.equals("mail1")) 
            {
        	  mail = value;
            }
         if(name.equals("empid1")) 
            {
        	 empid1 = value;
            }
        if(name.equals("levelno")) 
        {
        	levelno = value;
            }
  	     //i_name,i_desg,i_city,i_b_no,i_admin,i_email_id
             if(name.equals("i_name")) 
            {
            	 i_name = value;
            }
         if(name.equals("i_desg")) 
            {
        	 i_desg = value;
            }
        if(name.equals("i_city")) 
        {
        	i_city = value;
            }
        if(name.equals("i_b_no")) 
        {
        	i_b_no = value;
        }
     if(name.equals("i_admin")) 
        {
    	 i_admin = value;
        }
    if(name.equals("i_email_id")) 
    {
    	i_email_id = value;
        }
  	                                   
  	                 } 
                 else 
                    {
             		try
        		       {	
                       itemName = item.getName();
                       filenameList.add(itemName);
                       if(!filenameList.get(0).equals("") && f2==0)
                            {
                        	f2=1;
                            File savedFile = new File("E:/neinSoft/files/C2IT/CCDReport/"+form_no);
                            if(!savedFile.exists())
	                              {
	                              savedFile.mkdirs();
	                              savedFile.setWritable(true);
	                              }
	                        File  insertFile = new File("E:/neinSoft/files/C2IT/CCDReport/"+form_no+"/"+filenameList.get(0));
	                        item.write(insertFile);
	                        }    
                     }catch (Exception e)
          		           {
          		           out.println("Error"+e.getMessage());
          		           }
                    }
            }
           // System.out.println("File name :"+filenameList.get(0));
      }


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



try
    {
	form_date = new Date(sdf.parse(f_date).getTime());
    }
    catch (Exception e) 
        {
	    e.printStackTrace(); 
        }
    
String allMails=null,initiatorNameIfNotApproved=null;
psmt4 = cn2.prepareStatement("SELECT mail,emp FROM form13_ccdreport_item WHERE form_no=? AND status=?");
psmt4.setString(1,form_no);
psmt4.setString(2,"Initiator");
ResultSet rs = psmt4.executeQuery();
while(rs.next())
    {
	allMails = rs.getString(1); 
	initiatorNameIfNotApproved =rs.getString(2);
    }


















if(mmdradio.equals("Approved") && higherAuthority.equals("higherAuthority"))
        {//System.out.println("hdfsds");
        psmt = cn2.prepareStatement("UPDATE form13_ccdreport_item set status='"+mmdradio+"',remarks='"+txtmail_msg+"' where status='Pending' and form_no='"+form_no+"'");
        int i = psmt.executeUpdate();
        
		psmt2 = cn2.prepareStatement("INSERT INTO form13_ccdreport_item(form_no,desg,emp,status,remarks,mail,empid,levelno) VALUES(?,?,?,?,?,?,?,?)");
		psmt2.setString(1,form_no);
		psmt2.setString(2,desg);
		psmt2.setString(3,emp);
		psmt2.setString(4,"Pending");
		psmt2.setString(5,"Pending");
		psmt2.setString(6,mail);
		psmt2.setString(7,empid1);
		psmt2.setString(8,levelno);
		int j = psmt2.executeUpdate();
		message = mailMessage.getMailMessageCCDReport(form_no.trim());
		postMail.postMail(i_email_id,i_name,"pass1234",mail,"NEIN-C2IT CCDReport FORM :  " +form_no+ " ",i_name+  " "+  "request you to Approve - CCDReport FORM : " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
        }
else if(mmdradio.equals("Approved") && higherAuthority.equals("directApprove"))
        {
	     String filename=request.getParameter("file");
	     
	
	    System.out.println("Direct approved..");
	    psmt = cn2.prepareStatement("UPDATE form13_ccdreport_item set status='"+mmdradio+"' , remarks='"+txtmail_msg+"' where status='Pending' and form_no='"+form_no+"'");
        int i = psmt.executeUpdate();
        
        
        
        psmt2 = cn2.prepareStatement("UPDATE form13_ccdreport set finalApproved='Final'  where form_no='"+form_no+"'");
		int j = psmt2.executeUpdate();
        
		message = mailMessage.getMailMessageCCDReport(form_no.trim());
		
     	String allMails1=null;
   	    psmt4 = cn2.prepareStatement("SELECT mail,emp FROM form13_ccdreport_item WHERE form_no=?");
      	psmt4.setString(1,form_no);//
   	    ResultSet rs1 = psmt4.executeQuery();
        while(rs1.next())
   	       {
   	       allMails1 = rs1.getString(1); 
    	   postMail.postMailCCDReportAttachedFile(i_email_id,i_name,"pass1234",allMails1,"NEIN-C2IT CCDReport FORM :  " +form_no+ " ",initiatorNameIfNotApproved+  " "+  "your request for - CCDReport FORM : "+form_no+" Is Approved by " +i_name+ " Please find the Attatched CCD Report as per your requested query.<br><b><u> Open the following URL</u> </b><br> C2IT LINK - http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message,form_no);
          }
       }
  else 
        {
    	 psmt = cn2.prepareStatement("UPDATE form13_ccdreport_item set status='"+mmdradio+"' , remarks='"+txtmail_msg+"' where status='Pending' and form_no='"+form_no+"'");
         int i = psmt.executeUpdate();
         message = mailMessage.getMailMessageCCDReport(form_no.trim());
     	 String allMails1=null;
    	 psmt4 = cn2.prepareStatement("SELECT mail,emp FROM form13_ccdreport_item WHERE form_no=?");
    	 psmt4.setString(1,form_no);
    	 ResultSet rs1 = psmt4.executeQuery();
    	 while(rs1.next())
    	   {
    	   allMails1 = rs1.getString(1); 
           postMail.postMail(i_email_id,i_name,"pass1234",allMails1,"NEIN-C2IT CCDReport FORM :  " +form_no+ " ",initiatorNameIfNotApproved+  " "+  "your request for - CCDReport FORM : "+form_no+" Is NOT Approved by " +i_name+ " <br>Remarks : "+txtmail_msg+"<br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>");
           }	
        }

//System.out.println("desg for sending mail : "+desg);
//System.out.println("Emp for sending mail : "+emp);
//System.out.println("Mail id for edning mail : "+mail);


message = null;

msg = "CCDReport__FORM__NO__:__'"+form_no+"'__SAVED__AND__SENT__SUCCESSFULLY";
System.out.println("result..date..........."+form_date);
//response.sendRedirect("ITclearanceSelectAdmin.jsp?msg=" +msg);
response.sendRedirect("../adminPage.jsp?msg=" +msg);


%>


</html>
