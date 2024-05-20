<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
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
<%@page import="java.util.ResourceBundle"%>

<%@page import="CON2.DbUtil"%>
<%@page import="sun.org.mozilla.javascript.internal.regexp.SubString"%>
<%@page import="CON2.MailMessage"%>
<jsp:useBean id = "postMail" class="CON2.PostMail" /> 
<%@page import="CON2.Connection2" %> 
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.text.resources.FormatData"%>
<jsp:useBean id="dateFormat" class="CON2.DateFormat"/>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<jsp:useBean id = "con" class="CON2.Connection2" /> 









<%    
Connection conn = null;
Statement st= null, st1=null,st2=null,st3=null,st123=null;
ResultSet rs = null,rs1 = null,rs3=null,rs123=null; 
PreparedStatement  psmt3 = null,prs1=null;

/* String url = "jdbc:mysql://localhost:3306/";
String dbName = "csdb";
String driver = "com.mysql.jdbc.Driver";
String userName = "root";
String password = ""; */

ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");


java.util.Date date= new java.util.Date();
Timestamp ss = new Timestamp(date.getTime());
Date result=null;// = formater.parse(po_date);
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");



String msg="",message="",newidvalue="",l=null;
int j = 0;
String []fileName=null;
String itemName =null;
FileItem item = null;
ArrayList<String> filenameList;

String cm_date="",idextend="",cm_name="",cm_mail="",phno="",reportTo="",cm_location="",cm_type="",pType="",typo="",cm_problem="",priority="";
String file="",desg="",emp="",transid="",mail=null;

Class.forName(driver).newInstance();
conn = DriverManager.getConnection(url+dbName,userName,password); 
Statement stmt = conn.createStatement();
int flag=0;
MailMessage mailMessage = new MailMessage();
try
    { 
   
    filenameList = new ArrayList<String>();
    int count1 = 0,f1=0,f2=0;
    int incre = 0;
    int id=0;
  
    st = conn.createStatement();
  
    st2 = conn.createStatement();
   
    st3 = conn.createStatement();
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    
    
    prs1 = conn.prepareStatement("select max(idextend) as idd from complain_master_item"); 
    rs = prs1.executeQuery();
    if(rs.next())
          {
           int rde = rs.getInt("idd");
              System.out.println("idextend value "+rde);
          try
                  {
             id=rs.getInt(1);
             //System.out.println("id of complain id "+id);
             incre =id+1;
             //  System.out.println("EXTENDof complain id "+id);
             newidvalue = "NEIN/CM-" +incre;
             }catch(SQLException ex)
               	{
             	    System.out.println(ex.toString());
               	incre = 1;
               	}
          }
    
    
    
    
    
    
    
    
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
 	                 if(name.equals("cm_date")) 
 		                  {
  	                	  cm_date = value;
   		                  }
  	                  if(name.equals("idextend")) 
                          {
  	                	  idextend = value;
                          }
  	                  if(name.equals("cm_name")) 
                          {
  	                	  cm_name = value;
                          }
                      if(name.equals("cm_mail")) 
                          {
                    	  cm_mail = value;
                          }
                      if(name.equals("phno")) 
	                      {
                	      phno = value;
		                  }
                      if(name.equals("reportTo")) 
                          {
                	      reportTo = value;
                          }
                     if(name.equals("cm_location")) 
                          {
	                      cm_location = value;
                          }
                     if(name.equals("cm_type")) 
	                      {
                	      cm_type = value;
		                  }
                     if(name.equals("pType")) 
                          {
                	      pType = value;
                          }
                     if(name.equals("typo")) 
                          {
                	      typo = value;
                          }
                    if(name.equals("cm_problem")) 
	                      {
                	      cm_problem = value;
		                  }
                    if(name.equals("priority")) 
                          {
                	      priority = value;
                          } 
                    if(name.equals("desg")) 
                          {
                	      desg = value;
                          }
                    if(name.equals("emp")) 
	                      {
                	      emp = value;
		                  }
                   if(name.equals("transid")) 
                          {
                	      transid = value;
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
                            File savedFile = new File("E:/neinSoft/files/C2IT/UploadlogComplaint/"+newidvalue);
                            if(!savedFile.exists())
	                              {
	                              savedFile.mkdirs();
	                              savedFile.setWritable(true);
	                              }
	                        File  insertFile = new File("E:/neinSoft/files/C2IT/UploadlogComplaint/"+newidvalue+"/"+filenameList.get(0));
	                        item.write(insertFile);
	                        }    
                     }catch (Exception e)
          		           {
          		           out.println("Error"+e.getMessage());
          		           }
                    }
            }
            System.out.println("File name :"+filenameList.get(0));
            
            try
                {
        	    result = new Date(sdf.parse(cm_date).getTime());
                }
            catch (Exception e){e.printStackTrace();}

            
            
        }
             
            
            st123 = conn.createStatement();  
            rs123 = st123.executeQuery("SELECT DISTINCT NEHo.Nmail,NEHo.Locname,SubQ.Locname FROM assigned_master NEHo LEFT JOIN"+
           		 "(SELECT a.Locname,av.name FROM assigned_master a LEFT JOIN availability av ON(a.Locname=av.name) WHERE DATE(NOW()) between av.date1 AND av.date2) as subQ ON (NEHo.Locname=subQ.Locname) WHERE  NEHo.assignedLocation='"+cm_location+"' AND NEHo.depart='"+reportTo+"' AND SubQ.locname is null ORDER BY NEHo.Locname ASC");
            while(rs123.next())
                 {  message = null; 
  	             l=rs123.getString("Locname");
  	             System.out.println("********************Name **************************************** "+l);
  	             mail=rs123.getString("Nmail");
  	             System.out.println("MAIL send to IT SUPPORT ....................*********............."+mail);
  	             if(!l.equals("PRASANNA KUMAR"))
  	                  {
                      st2.executeUpdate("insert into complain_master_item (idextend,complain_id,cm_name,phoneNo, "+
            		          "cm_location,cm_date,desg,emp,transid,cm_type,cm_problem,mail,cm_mail,status, "+
            		          "cm_time2,originally_assigned_to,priority,pType,reportTo,scrrenshotpath,filename,cm_status) "+
            		          "values('"+incre+"','"+newidvalue+"','"+cm_name+"','"+phno+"','"+cm_location+"','"+result+"', "+
            		          "'"+desg+"','"+l+"','"+transid+"','"+pType+"','"+cm_problem+"','"+mail+"', "+
            		          "'"+cm_mail+"','normal','"+ss+"','"+l+"','"+priority+"','"+typo+"','"+reportTo+"', "+
              		     	  "'E:/neinSoft/files/C2IT/UploadlogComplaint/"+newidvalue+"/"+filenameList.get(0)+"','"+filenameList.get(0)+"','Pending')");
                     //System.out.println("filenameList.get(1)"+filenameList.get(1));
                     msg="Files__uploaded__and__sent__sucessfully..";
                    System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
                    message = mailMessage.getMailMessage(newidvalue.trim());
                   // System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"+message);
                    postMail.postMail(cm_mail,cm_name,"pass1234",mail,"NEIN-C2IT Complaint No. :  " +newidvalue+ " ",  "<b> " +cm_name+  " "+  "</b>request you to Resolve <font color=blue>" +newidvalue+ "</font> <br>Priority: <font color=red>" +priority+ " </font><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
                   
  	                }
  	             }
            message = mailMessage.getMailMessage(newidvalue.trim());
            //System.out.println("cm_mail $$$$$$$$$$$$$$$$$$$$$$$$$$$$$ :"+cm_mail);
            postMail.postMail(cm_mail,cm_name,"pass1234",cm_mail,"NEIN-C2IT Complaint No. :  " +newidvalue+ " ",  "<font color=red>Copy Of Sent Mail :</font> <b>" +cm_name+  " "+  "</b> request you to Resolve <font color=blue>" +newidvalue+ "</font> <br> Priority: <font color=red>" +priority+ " </font><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
         	 
         
    
    
    response.sendRedirect("complaintPage.jsp?msg=" +msg);      
 %>
	<%}catch (Exception e) { System.out.println(e); }
	finally{
	
	} %>

















