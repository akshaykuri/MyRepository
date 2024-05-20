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

<%@page import="CON2.DbUtil.*"%>
<%@page import="sun.org.mozilla.javascript.internal.regexp.SubString"%>
<%@page import="CON2.MailMessageRegistration" %>
 
<jsp:useBean id = "postMail" class="CON2.PostMail" /> 
<%@page import="CON2.Connection2" %> 
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.text.resources.FormatData"%>
<jsp:useBean id="dateFormat" class="CON2.DateFormat"/>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<jsp:useBean id = "con" class="CON2.Connection2" /> 









<% 
MailMessageRegistration mailmsg=new MailMessageRegistration();


Connection conn = null,cn6=null;
Statement st= null, st1=null,st2=null,st3=null,st123=null,st4=null,st5=null,st6=null,st7=null;
ResultSet rs = null,rs1 = null,rs3=null,rs123=null,rs4=null,rs5=null,rs6=null; 
PreparedStatement  psmt1 = null,psmt2=null,prs1=null,psmt3=null,psmt4=null;

String b_no=null;
int s=0;
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

ResourceBundle dbPropertiesl = ResourceBundle.getBundle("leavemanagement");
String userNamel = dbPropertiesl.getString("leavemanagement.username");
String passwordl = dbPropertiesl.getString("leavemanagement.password");
String urll = dbPropertiesl.getString("leavemanagement.url");
String dbNamel = dbPropertiesl.getString("leavemanagement.dbName");
Class.forName(driver).newInstance();

Connection connhrms = null;
String napproval="",nuname=null,ndesg=null,nmailid=null,napproval1="";
connhrms = DriverManager.getConnection(urll+dbNamel,userNamel,passwordl);
Statement nstmt = connhrms.createStatement();  


java.util.Date date= new java.util.Date();
Timestamp ss = new Timestamp(date.getTime());
Date result=null;// = formater.parse(po_date);
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
/* String date2=request.getParameter("f_date");
result = new Date(sdf.parse(date2).getTime()); */



String msg="",message="",newidvalue="",l=null;
int j = 0;
String []fileName=null;
String itemName =null;
FileItem item = null;
ArrayList<String> filenameList;

String emp_code="",full_name="",branch="",depart="",designation="",regis_mail="",requestOption="",requestOption1="",newName="",newDepart="",newDesc="",Cvers="",Uvers="",
hDesc="",Hpatchchange="",  HCvers="", HUvers="", NCvers="", NUvers="", chaName="",  chaModule="",   chaDesc="",  CSCvers="",  CSUvers="", Hname="", Hbranch="";
String file="",desg="",emp="",transid="",mail=null,CSpatchChange=null,Nfile="",date1="",Rempid="", Remp="", Rdesg="", Rmail="", Rlevelno="";
String id2=null,f_date="",Cfile="",file_names="",fn="",fn1="",remarks=null,i_name=null,Hlevelno="",Hsname="";

Class.forName(driver).newInstance();
conn = DriverManager.getConnection(url+dbName,userName,password); 
Statement stmt = conn.createStatement();


int flag=0;

try
    { 
   
    filenameList = new ArrayList<String>();
    int count1 = 0,f1=0,f2=0;
    int incre = 0;
    int id=0;
    
  
    st = conn.createStatement();
  
    st2 = conn.createStatement();
   
    st3 = conn.createStatement();
    st4=conn.createStatement();
    st5=conn.createStatement();
    st6=conn.createStatement();
    st7=conn.createStatement();
    
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    
    b_no = (String) session.getAttribute("b_no");
    prs1 = conn.prepareStatement("SELECT max(idextend) FROM Audit_form WHERE form_no IN(SELECT form_no FROM Audit_form LEFT JOIN branch_master b ON(substr(form_no,10,2)=b.b_no) WHERE '"+b_no+"'=b.b_no GROUP BY form_no)");
    rs = prs1.executeQuery();
    if(rs.next()){
    	
    	try
    	{
    		
    		id=rs.getInt(1);
    		System.out.println("ID :"+id);
    		if(id==0)
     			id=1;
    		else
    			id++; 
    		System.out.println("ID VALUE "+id);
    		if(id2==null)
     			id2="NEIN/NEW/"+b_no+"-";
    		//id2= rs_id.getString(3);
    		//System.out.println("ID2 VALUE "+id2);
    	            
    			//System.out.println("Gen id "  +rs_id.getInt(1));
    			//new_id = "" +String.valueOf(id);
    			newidvalue = id2+String.valueOf(id);
    			//System.out.println("MR HO "  +new_id);
    		
    	}
    	catch(SQLException ex)
    	{
    		  System.out.println(ex.toString());
    		  newidvalue ="NEIN/NEW/"+b_no+"-1";
    	    }
    	//System.out.println("new Id **************************222222222: "  +new_id);
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
 	                 
 	                 if(name.equals("i_name")){
 	                	i_name=value; 
 	                 }
 	                 if(name.equals("f_date")){
 	                	f_date=value; 
 	                 }
 	                 if(name.equals("emp_code")) 
 		                  {
 	                	emp_code = value;
   		                  }
  	                  if(name.equals("full_name")) 
                          {
  	                	full_name = value;
                          }
  	                  if(name.equals("branch")) 
                          {
  	                	branch = value;
                          }
                      if(name.equals("depart")) 
                          {
                    	  depart = value;
                          }
                      if(name.equals("designation")) 
	                      {
                    	  designation = value;
		                  }
                      if(name.equals("regis_mail")) 
                          {
                    	  regis_mail = value;
                          }
                     if(name.equals("requestOption")) 
                          {
                    	 requestOption = value;
                          }
                     
                   	if(name.equals("requestOption1")){
                    		 requestOption1=value;
                    	 }
                   	if(name.equals("newName")){
                   		newName=value;
                   	}
                   	if(name.equals("newDepart")){
                   		newDepart=value;
                   	}
                   	if(name.equals("newDesc")){
                   		newDesc=value;
                   	}
                   	/* if(name.equals("Nfile")){
                   		Nfile=value;
                   	 System.out.println("Nfile"+Nfile); 
                   	} */
                   	if(name.equals("NCvers")){
                   		NCvers=value;
                   	}                                     
                   	if(name.equals("NUvers")){
                   		NUvers=value;						
                   	}
                   	if(name.equals("chaName")){
                   		chaName=value;
                   	}
                   	if(name.equals("chaModule")){
                   		chaModule=value;
                   	}
                   	if(name.equals("Management")){
                   		CSpatchChange=value;
                   	}
                   	if(name.equals("chaDesc")){
                   		chaDesc=value;
                   	}
                   	if(name.equals("CSCvers")){
                   		CSCvers=value;
                   	}
                   	if(name.equals("CSUvers")){
                   		CSUvers=value;
                   	}
                   	/* if(name.equals("Cfile")){
                   		Cfile=value;
                   	} */
                   	if(name.equals("Hname")){
                   		Hname=value;
                   	}
                   	if(name.equals("Hsname")){
                   		Hsname=value;
                   	}
                   	if(name.equals("Hbranch")){
                   		Hbranch=value;
                   	}
                   	if(name.equals("hDesc")){
                   		hDesc=value;
                   	}
                   	if(name.equals("HManagement")){
                   		Hpatchchange=value;
                   	}
                   	if(name.equals("HCvers")){
                   		HCvers=value;
                   	}
                   	if(name.equals("HUvers")){
                   		HUvers=value;
                   	}
                   	if(name.equals("empid1")){
                   		Rempid=value;
                   	}
                   	if(name.equals("emp")){
                   		Remp=value;
                   	}
                   	if(name.equals("desg")){
                   		Rdesg=value;
                   		
                   	}
                   	if(name.equals("mail")){
                   		Rmail=value;
                   	}
                   	if(name.equals("ITlevelno")){
                   		Rlevelno=value;
                   	}
                   	if(name.equals("levelno")){
                   		Hlevelno=value;
                   	}
                   	if(name.equals("remarks")){
                   		remarks=value;
                   		
                   	}
                     
                /* System.out.println("mail"+Rmail);    */
                  
  	                 } 
                 else 
                    {
             		try
        		       {
             			result = new Date(sdf.parse(f_date).getTime());
             			
                       itemName = item.getName();
                       File savedFile = new File("E:/neinSoft/C2IT/AuditForm/"+newidvalue);
                       if(!savedFile.exists())
                       {
                       savedFile.mkdirs();
                       savedFile.setWritable(true);
                       }
                       File  insertFile = new File("E:/neinSoft/C2IT/AuditForm/"+newidvalue+"/"+itemName);
                    		   			   item.write(insertFile);
                    		   			 st4.executeUpdate("Insert into file_paths(form_no,path,filename,Uploaded_By,empid,Uploaded_Date)Values('"+newidvalue+"','E:/neinSoft/C2IT/AuditForm/"+newidvalue+"/"+itemName+"','"+itemName+"','"+i_name+"','"+emp_code+"','"+result+"')");
                       /*  filenameList.add(itemName); */
                     
                    	 /*   if(!filenameList.get(0).equals("") && f2==0)
                    		  
                            {
                    		 
                        	f2=1;
                            File savedFile = new File("D:/neinSoft/C2IT/AuditForm/"+newidvalue);
							 if(!savedFile.exists())
	                              {
	                              savedFile.mkdirs();
	                              savedFile.setWritable(true);
	                              }
                            
                            
                            
                            	
	                        File  insertFile = new File("D:/neinSoft/C2IT/AuditForm/"+newidvalue+"/"+filenameList.get(0));
	                        item.write(insertFile);
	                        st4.executeUpdate("Insert into file_paths(form_no,path,filename)Values('"+newidvalue+"','D:/neinSoft/C2IT/AuditForm/"+newidvalue+"/"+filenameList.get(0)+"','"+filenameList.get(0)+"')");
                    	                      
                            }  */
                            
                       
                  
                            
    
                       
                       
        		       }catch(Exception e){
        	            	System.out.println(e);
        		       }
        		      /*  System.out.println("File name :"+fn1); */
                    }
             
              }
       try
       {
	    /* result = new Date(sdf.parse(f_date).getTime()); */
       }
   catch (Exception e){e.printStackTrace();}

   
   
}
   
	                        
                       if((requestOption.equals("Software"))&&(requestOption1.equals("New"))){
                           
                           st2.executeUpdate("Insert into audit_form(Formname,idextend,form_no,empcode,branch,empdesg,empname,empdept,empmail,Date,type,Subtype,NSApplicationName,NSDepartment,NSDescription,Project_Status)"+
                           "Values('Audit Form','"+id+"','"+newidvalue+"','"+emp_code+"','"+branch+"','"+designation+"','"+full_name+"',"+
                         		  "'"+depart+"','"+regis_mail+"','"+result+"','"+requestOption+"','"+requestOption1+"','"+newName+"','"+newDepart+"','"+newDesc+"',"+
                         		 "'Pending')");
                          
                           
                           psmt1=conn.prepareStatement("INSERT INTO Auditform_item(form_no,desg,emp,Status,remarks,Date,Mail,Presence,empid)VALUES(?,?,?,?,?,?,?,?,?)");
                           psmt1.setString(1,newidvalue);
                           psmt1.setString(2,designation);
                           psmt1.setString(3,full_name);
                           psmt1.setString(4,"Initiator");
                           psmt1.setString(5,remarks);
                           psmt1.setDate(6,result);
                           psmt1.setString(7,regis_mail);
                           psmt1.setString(8,"over");
                           psmt1.setString(9,emp_code);
                           
                           int ap=psmt1.executeUpdate();
                           
                           
                           psmt4=conn.prepareStatement("INSERT INTO Branch_Requirements(form_no,desg,emp,Status,remarks,Date,mail,Presence,empid)VALUES(?,?,?,?,?,?,?,?,?)");
                           psmt4.setString(1,newidvalue);
                           psmt4.setString(2,designation);
                           psmt4.setString(3,full_name);
                           psmt4.setString(4,"Pending");
                           psmt4.setString(5,"Pending");
                           psmt4.setDate(6,result);
                           psmt4.setString(7,regis_mail);
                           psmt4.setString(8,"now");
                           psmt4.setString(9,emp_code);
                           
                           int ap4=psmt4.executeUpdate();
                           
                           
                     rs6=st6.executeQuery("Select * From Branch_IT where Type='Hardware'");
                           String itEmpname=null,itEmpid=null,itEmpbranch=null,itEmpdesg=null,itEmpmail=null,itEmpBCode=null,em1=null,em2="";
                           while(rs6.next()){
                        	   itEmpid=rs6.getString("empid");
                           
                        	   ResultSet nrs = nstmt.executeQuery("SELECT DISTINCT u.user_name,rr.role_code,b.branch_name,b.branch_type_code,d.department_name, m3.user_name AS manager_name,u.email,u.mobile_number FROM user u Inner Join user_role ur on ur.user_id=u.user_id INNER JOIN reporting_officers m1 ON m1.user_id = u.user_id INNER JOIN role rr ON ur.role_id =rr.role_id INNER JOIN branchmaster b ON b.branch_id = u.branch_id INNER JOIN department d ON d.department_id = u.department_id INNER JOIN user m3 ON m3.user_id = m1.manager_id INNER JOIN user m4 ON m4.user_id = m1.manager2_id WHERE ( m1.emp_id ='" + rs6.getString("empid") + "' ) AND u.employee_status = 'yes' ");
                        	     if(nrs.next())
                        	            { 
                        	   
                        	   itEmpname=nrs.getString("user_name");
                        	   
                        	   itEmpbranch=nrs.getString("branch_name");
                        	   itEmpdesg=nrs.getString("role_code");
                        	   itEmpBCode=nrs.getString("branch_type_code");
                        	   itEmpmail=nrs.getString("email");
                        	   em1=itEmpmail.concat(",");
                        	   em2=em2+em1;
                        	   
                           psmt2=conn.prepareStatement("INSERT INTO Branch_Requirements(form_no,desg,emp,Status,remarks,Date,mail,Presence,empid,levelno,Branch)VALUES(?,?,?,?,?,?,?,?,?,?,?)");
                           psmt2.setString(1,newidvalue);
                           psmt2.setString(2,itEmpdesg);
                           psmt2.setString(3,itEmpname);
                           psmt2.setString(4,"Pending");
                           psmt2.setString(5,"Pending");
                           psmt2.setDate(6,result);
                           psmt2.setString(7,itEmpmail);
                           psmt2.setString(8,"now");
                           psmt2.setString(9,itEmpid);
                           psmt2.setString(10,Rlevelno);
                           psmt2.setString(11,itEmpBCode);
                           
                           int Rap=psmt2.executeUpdate();
                           
                           
                          
                          msg="Files__uploaded__and__sent__sucessfully..";
                         System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
                         message=mailmsg.getAuditForm(newidvalue.trim());
                        System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
                     
                           }
                           }
                 postMail.AuditFormWithAttachment(regis_mail,full_name,em2,"","Software Development Request :  " +newidvalue+ " ","Dear Team-IT, <br>"+
               		   "&nbsp &nbsp &nbsp &nbsp &nbsp"+  "Request you to provide information about respective people of the department who will give suggestions or feedback about the initiated project. " +newidvalue+ " <br><br> "+message+"<b><br><br><br><u> Open the following URL </u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br>",newidvalue,"E://neinsoft//C2IT//AuditForm//"+newidvalue+"\\"); 
                 
                       
                       
                    }else if(requestOption.equals("Software")&&(requestOption1.equals("Changes"))) {
                 	
                 	st3.executeUpdate("Insert into audit_form(Formname,idextend,form_no,empcode,branch,empdesg,empname,empdept,empmail,Date,type,Subtype,CSApplicationName,CSModule,CSDescription,CSPatchChange,CSCurrentVersion,Project_Status)"+
                             "Values('Audit Form','"+id+"','"+newidvalue+"','"+emp_code+"','"+branch+"','"+designation+"','"+full_name+"',"+
                           		  "'"+depart+"','"+regis_mail+"','"+result+"','"+requestOption+"','"+requestOption1+"','"+chaName+"','"+chaModule+"','"+chaDesc+"','"+CSpatchChange+"','"+CSCvers+"','Pending')");
                             
                 	psmt1=conn.prepareStatement("INSERT INTO Auditform_item(form_no,desg,emp,Status,remarks,Date,Mail,Presence,empid)VALUES(?,?,?,?,?,?,?,?,?)");
                     psmt1.setString(1,newidvalue);
                     psmt1.setString(2,designation);
                     psmt1.setString(3,full_name);
                     psmt1.setString(4,"Initiator");
                     psmt1.setString(5,remarks);
                     psmt1.setDate(6,result);
                     psmt1.setString(7,regis_mail);
                     psmt1.setString(8,"over");
                     psmt1.setString(9,emp_code);
                     
                     int ap=psmt1.executeUpdate();
                     
                    
                     psmt4=conn.prepareStatement("INSERT INTO Branch_Requirements(form_no,desg,emp,Status,remarks,Date,mail,Presence,empid)VALUES(?,?,?,?,?,?,?,?,?)");
                     psmt4.setString(1,newidvalue);
                     psmt4.setString(2,designation);
                     psmt4.setString(3,full_name);
                     psmt4.setString(4,"Pending");
                     psmt4.setString(5,"Pending");
                     psmt4.setDate(6,result);
                     psmt4.setString(7,regis_mail);
                     psmt4.setString(8,"now");
                     psmt4.setString(9,emp_code);
                     
                     int ap4=psmt4.executeUpdate();
                     
                     
                     rs6=st6.executeQuery("Select * From Branch_IT where Type='Hardware'");
                     String itEmpname=null,itEmpid=null,itEmpbranch=null,itEmpdesg=null,itEmpmail=null,itEmpBCode=null,em1=null,em2="";
                     while(rs6.next()){
                    	 itEmpid=rs6.getString("empid");
                         
                  	   ResultSet nrs = nstmt.executeQuery("SELECT DISTINCT u.user_name,rr.role_code,b.branch_name,b.branch_type_code,d.department_name, m3.user_name AS manager_name,u.email,u.mobile_number FROM user u Inner Join user_role ur on ur.user_id=u.user_id INNER JOIN reporting_officers m1 ON m1.user_id = u.user_id INNER JOIN role rr ON ur.role_id =rr.role_id INNER JOIN branchmaster b ON b.branch_id = u.branch_id INNER JOIN department d ON d.department_id = u.department_id INNER JOIN user m3 ON m3.user_id = m1.manager_id INNER JOIN user m4 ON m4.user_id = m1.manager2_id WHERE ( m1.emp_id ='" + rs6.getString("empid") + "' ) AND u.employee_status = 'yes' ");
                  	     if(nrs.next())
                  	            { 
                  	   
                  	   itEmpname=nrs.getString("user_name");
                  	   
                  	   itEmpbranch=nrs.getString("branch_name");
                  	   itEmpdesg=nrs.getString("role_code");
                  	   itEmpBCode=nrs.getString("branch_type_code");
                  	   itEmpmail=nrs.getString("email");
                  	   em1=itEmpmail.concat(",");
                  	   em2=em2+em1;
                  	   
                     psmt2=conn.prepareStatement("INSERT INTO branch_requirements(form_no,desg,emp,Status,remarks,Date,mail,Presence,empid,levelno,Branch)VALUES(?,?,?,?,?,?,?,?,?,?,?)");
                     psmt2.setString(1,newidvalue);
                     psmt2.setString(2,itEmpdesg);
                     psmt2.setString(3,itEmpname);
                     psmt2.setString(4,"Pending");
                     psmt2.setString(5,"Pending");
                     psmt2.setDate(6,result);
                     psmt2.setString(7,itEmpmail);
                     psmt2.setString(8,"now");
                     psmt2.setString(9,itEmpid);
                     psmt2.setString(10,Rlevelno);
                     psmt2.setString(11,itEmpBCode);
                     int Rap=psmt2.executeUpdate();
                     
                     
                    
                    msg="Files__uploaded__and__sent__sucessfully..";
                   System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
                   message=mailmsg.getAuditForm(newidvalue.trim());
                  System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
               
                     }
                     }
           postMail.AuditFormWithAttachment(regis_mail,full_name,em2,"","Software Development Request :  " +newidvalue+ " ","Dear Team-IT, <br>"+
         		   "&nbsp &nbsp &nbsp &nbsp &nbsp"+  "Request you to provide information about respective people of the department who will give suggestions or feedback about the initiated project. " +newidvalue+ " <br><br> "+message+"<b><br><br><br><u> Open the following URL </u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>",newidvalue,"E://neinsoft//C2IT//AuditForm//"+newidvalue+"\\");
                 
                 }else{
                 	System.out.println("The hardware Sub is"+Hsname);
                 	st4.executeUpdate("Insert into audit_form(Formname,idextend,form_no,empcode,branch,empdesg,empname,empdept,empmail,Date,type,HardwareName,Hardware_Sub,H_branch,H_patch_change,H_description,Project_Status)"+
                             "Values('Audit Form','"+id+"','"+newidvalue+"','"+emp_code+"','"+branch+"','"+designation+"','"+full_name+"',"+
                           		  "'"+depart+"','"+regis_mail+"','"+result+"','"+requestOption+"','"+Hname+"','"+Hsname+"','"+Hbranch+"','"+Hpatchchange+"','"+hDesc+"','Pending')");
                 	psmt1=conn.prepareStatement("INSERT INTO Auditform_item(form_no,desg,emp,Status,remarks,Date,Mail,Presence,empid)VALUES(?,?,?,?,?,?,?,?,?)");
                    psmt1.setString(1,newidvalue);
                    psmt1.setString(2,designation);
                    psmt1.setString(3,full_name);
                    psmt1.setString(4,"Initiator");
                    psmt1.setString(5,remarks);
                    psmt1.setDate(6,result);
                    psmt1.setString(7,regis_mail);
                    psmt1.setString(8,"over");
                    psmt1.setString(9,emp_code);
                    
                    int ap=psmt1.executeUpdate();
                    
                    psmt2=conn.prepareStatement("INSERT INTO Auditform_item(form_no,desg,emp,Status,remarks,Date,Mail,Presence,empid,levelno)VALUES(?,?,?,?,?,?,?,?,?,?)");
                    psmt2.setString(1,newidvalue);
                    psmt2.setString(2,Rdesg);
                    psmt2.setString(3,Remp);
                    psmt2.setString(4,"Pending");
                    psmt2.setString(5,"Pending");
                    psmt2.setDate(6,result);
                    psmt2.setString(7,Rmail);
                    psmt2.setString(8,"now");
                    psmt2.setString(9,Rempid);
                    psmt2.setString(10,Hlevelno);
                    
                    int Rap=psmt2.executeUpdate();
                    
                   /*  PreparedStatement psmt10=null;
                    psmt10=conn.prepareStatement("INSERT INTO Audit_Hardware_Flow(form_no,Hardware_name,Branch)VALUES(?,?,?)");
                    psmt10.setString(1,newidvalue);
                    psmt10.setString(2,Hname);
                    psmt10.setString(3, Hbranch);
                    int hj=psmt10.executeUpdate(); */
                            
                            msg="Files__uploaded__and__sent__sucessfully..";
                           System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
                           message=mailmsg.getAuditForm(newidvalue.trim());
                          System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
                          postMail.AuditFormWithAttachment(regis_mail,full_name,Rmail,"","Hardware Request :  " +newidvalue+ " ","Dear Sir,<br>"+full_name+  " "+  "request your approval for the Hardware Request. " +newidvalue+ " <br><br>"+message+"<br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>",newidvalue,"E://neinsoft//C2IT//AuditForm//"+newidvalue+"\\");
                 	
                 }
response.sendRedirect("NewForm.jsp?msg=" +msg);      
}catch (Exception e) { System.out.println(e); }
finally{
	
	} %>
