<%@page import="CON2.DbUtil"%>
<%@page import="CON2.MailMessageNExAS"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.text.resources.FormatData"%>
<jsp:useBean id="dateFormat" class="CON2.DateFormat"/>
<jsp:useBean id = "con" class="CON2.Connection2" /> 

<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id = "postMail" class="CON2.PostMail" /> 



<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.FileUploadException"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sun.xml.internal.fastinfoset.util.ValueArray"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.File" %>





<html>
<head>
</head>
                 <%! 
                  MailMessageNExAS mailMessage = new MailMessageNExAS();
                  Connection cn2=null; 
	              Statement st= null;
	              ResultSet rs = null;
	              String message = null,username=null,usermail=null,userempid=null;
	              String []fileName=null;
	              ArrayList<String> filenameList;
	              
	              %>
	              <%
	              cn2 = con.getConnection2();
	              PreparedStatement psmt=null,psmt1=null;
	              String dirname="";
	              String f_date = "";
	              //String idextend = request.getParameter("idextend");
	              String formno = "";
	              String file1 = "";
	              String uid = "";
	              String pwd = "";
	              
	              String i_name=(String)session.getAttribute("Nname");
	              String i_email_id=(String)session.getAttribute("Nmail");
	              %>
<%
boolean isMultipart = ServletFileUpload.isMultipartContent(request);
filenameList = new ArrayList<String>();
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
         //System.out.println("items ..................."+items);
         } catch (FileUploadException e) {
         e.printStackTrace();
         }
         
       Iterator itr = items.iterator();
       while (itr.hasNext()) 
            {
            FileItem item = (FileItem) itr.next();
            //String vv = (String)itr.next();
            if(item.isFormField()) 
                  {
         	      String name = item.getFieldName();
         	      String value = item.getString();
                
         	      if (name.equals("formno")) 
         		       {
         	    	   formno = value;
           		       }
         	     if (name.equals("uid")) 
   		               {
   	    	           uid = value;
     		           }
         	     if (name.equals("pwd")) 
  		               {
  	    	           pwd = value;
    		           }
         	     
                }
            else
                {
      
             	      String[] a = formno.split("NEIN/NExAS/");
            	      dirname=a[1];
            	      //System.out.println("dir no "+dirname);
            	      String itemName = item.getName();
            	      //System.out.println("itemName is a file Name?"+itemName);
            	      filenameList.add(itemName);
            	  	  try {
            	  	      boolean success;
            		      File savedFile = new File("E:/neinSoft/files/C2IT/NExASFilesUpload/"+dirname);
  		                  if(!savedFile.exists()) 
            				 {
            				 savedFile.mkdirs();//The constructor File(File) is undefined
            		 	     savedFile.setWritable(true);
            	        	 // System.out.println("set Writable");
            		 		 }
            		 	  File  insertFile = new File("E:/neinSoft/files/C2IT/NExASFilesUpload/"+dirname+"/"+itemName);
            		 	  item.write(insertFile);
            	       	  //System.out.println("after writnig files");
 		                  } catch(Exception e)
 		                        {
            				    e.printStackTrace();
            				    } 
 		                  
            }  
         }     	  
      }	                  
 		                  
 		                 try
 		                    {
 		                	psmt1 = cn2.prepareStatement("SELECT * FROM form12_nexas WHERE form_no='"+formno+"'");
 		                    rs = psmt1.executeQuery();
 		                    if(rs.next())
 		                         {
 		                    	 username=rs.getString(5);
 		                    	 userempid=rs.getString(4);
 		                         usermail=rs.getString(10);
 		                         message = mailMessage.getMailMessageNExAS(formno.trim());
 	 		                	 postMail.postMail(i_email_id,i_name,"pass1234",usermail,"NEIN-C2IT NExAS FORM :  " +formno+ " Request Approved ","Dear "+username+ "<br><br><br> Your NExAS User ID  :  "+uid+"<br>  Password :  "+pwd+" <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);              
                                 }
 		                	 
 		                	 
 		                   	psmt = cn2.prepareStatement("UPDATE form12_nexas SET filepath=?,fileName=?,uid=?,pwd=? where form_no='"+formno+"'");
                           	psmt.setString(1,"E:/neinSoft/files/C2IT/NExASFilesUpload/"+dirname+"/"+filenameList.get(0)+"");
 		                	psmt.setString(2,filenameList.get(0));
 		                	psmt.setString(3,uid);
 		                	psmt.setString(4,pwd);
 		                	int i = psmt.executeUpdate();

 		                	message = null;
         	                String msg = "NExAS__FORM__NO__:__'"+formno+"'__SAVED__AND__SENT__SUCCESSFULLY";
 		                	//System.out.println("result..date..........."+form_date);
 		                	response.sendRedirect("UploadNExASForm.jsp?msg=" +msg);

 		                	}
 		                	catch (Exception e) { System.out.println(e); }
 		                	finally{
 		                	  	   DbUtil.closeDBResources(null,psmt,null);
 		                  	       }
 		                	 
 		
%>	              