<%@page import="javax.mail.MessagingException"%>;
<%@page import="javax.mail.internet.AddressException"%>;
<%@page import="org.quartz.Job"%>;
<%@page import="org.quartz.JobExecutionContext"%>;
<%@page import="org.quartz.JobExecutionException"%>;
<%@page import="email.EmailEntity"%>;
<%@page import="email.EmailUtility"%>;
<%@page import="CON2.DbUtil"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
Connection cn = null,cn2=null,cn3=null,conn=null; 
Statement st = null,st1=null,st2=null,st3=null,st4=null,st2a=null; 
ResultSet rs = null,rs1 = null,rs2=null,rs3=null,rs4=null,rs2a=null; 
System.out.println("name ....");

String query2=null,adminname=null,admemail=null;
int p=1,r=1;
  try{
        cn = con.getConnection2();
        conn = con.getConnection2();
        st=cn.createStatement();
        st1=cn.createStatement();
        st2a=conn.createStatement();
        String msg = null,empid=null,empid1=null,file=null,filet=null,file1=null,filetime=null,rem="",remarks="";
        String email = null,emailt = null,email1 = null,emailtime = null,empname=null,empname1=null;
        int k=1,k1=1;;
        String b_no = (String) session.getAttribute("b_no");
        String branch = (String) session.getAttribute("branch");
        String yr = (String) session.getAttribute("year");
        String mo = (String) session.getAttribute("month");
        System.out.println("Branch ............................ :"+branch); 
        System.out.println("year ............................ :"+yr); 
        System.out.println("month ............................ :"+mo); 
        String desg = request.getParameter("desg2");
        String name=request.getParameter("emp");
        String coun = request.getParameter("coun");
        String num = request.getParameter("num");
        String dept = request.getParameter("desg");
        //System.out.println("desg :"+desg); 
        //System.out.println("name :"+name);
	   // System.out.println("count :"+coun);
	   // System.out.println("num :"+num);
	    int q=Integer.parseInt(coun);
	   // System.out.println("q :"+q);
	   if(branch.equals("HEAD OFFICE"))
             query2 = "select Nname,Nmail from nentryho where NpostingCo='HEAD OFFICE-90' and `department`='IT SUPPORT' and Npost='IT SUPPORT' and EMP_NO='1945'";
       else if(branch.equals("BANGALORE"))
             query2 = "select Nname,Nmail from nentryho where (NpostingCo='BANGALORE - 10' OR EMP_NO='1920') and `department`='IT SUPPORT' and Npost='IT SUPPORT'";
       else if(branch.equals("CHENNAI"))
             query2 = "select Nname,Nmail from nentryho where NpostingCo='CHENNAI - 40' and `department`='IT SUPPORT' and Npost='IT SUPPORT'";
       else if(branch.equals("MUMBAI"))
             query2 = "select Nname,Nmail from nentryho where NpostingCo='MUMBAI - 30' and `department`='IT SUPPORT' and Npost='IT SUPPORT'";
       else if(branch.equals("DELHI"))
             query2 = "select Nname,Nmail from nentryho where NpostingCo='DELHI - 20' and `department`='IT SUPPORT' and Npost='IT SUPPORT'";

	    while(k<=Integer.parseInt(num))
               {
    	       empid="empid"+k;
    	       empname="empname"+k;
    	       file="file"+k;
    	       filet="filetime"+k;
    	       email="email"+k;
    	       emailt="emailtime"+k;
               empid1=request.getParameter(empid);
               empname1=request.getParameter(empname);
    	       file1=request.getParameter(file);
               filetime=request.getParameter(filet);
               email1=request.getParameter(email);
               emailtime=request.getParameter(emailt);
               //System.out.println("empid :"+empid1);
    	       //System.out.println("file :"+file1);
    	       // System.out.println("file time :"+filetime);
    	       // System.out.println("email :"+email1);
    	       //System.out.println("email time :"+emailtime);
    	       /* rem="text"+r;
    	       remarks=request.getParameter(rem);
    	       System.out.println("Remarks :"+remarks); */
    	       if(file1!=null)
    	             {
    	    	     rem="text"+r;
        	         remarks=request.getParameter(rem);
        	         System.out.println("Remarks :"+remarks);
        	         if(remarks!="")
        	                {
    		                st.executeUpdate("insert into systembackupverification(empid,fileemail,remarks,verifybydesg,verifybyemp,verified,status,year,month,branch) values('"+empid1+"','FILE','"+remarks+"','"+desg+"','"+name+"','No','1','"+yr+"','"+mo+"','"+branch+"')");
        	                st2a = conn.createStatement();
		 		            rs2a = st2a.executeQuery(query2);
		 		            while(rs2a.next())
		 		                  {	
		 		            	  adminname=rs2a.getString(1);
		        		          admemail=rs2a.getString(2);
		        		          System.out.println("admin name :"+adminname);		
						          System.out.println("email : " + admemail);      
						          EmailEntity emailEntity = new EmailEntity();
					              // String managerIdemail = "chintu.kumar@nittsu.co.in";
					              //String userName  = "Chintu Kumar";
					              emailEntity.setPort("25");
					              emailEntity.setHost("203.124.152.3");
					              emailEntity.setSubject("SYSTEM BACKUP NOT VERIFIED");
				 	              emailEntity.setUserName("C2IT Alert");
					              emailEntity.setPassword("test");
				 	              emailEntity.setToAddress(admemail);
				 	              //emailEntity.setToAddress("support.itho@nittsu.co.in");
				                  //emailEntity.setCcAddress("support.itho@nittsu.co.in");
					              emailEntity.setFromAddress("HRMS.nittsu.co.in");
					              emailEntity.setMessage("<html><body><label style='font-family: Calibri;'>Dear "+adminname+"</label>" +
									                     "<br><br><label style='font-family: Calibri;'>Mr/Mrs. <b>"+empname1+"</b> employee code <b> "+empid1+" </b> system backup not verifyed by Mr.<b>"+name+" ("+desg+")</b> for <b>FILE</b> Backup. </label>" +
									                     "<br><label style='font-family: Calibri;'> Remarks by Verifyer :<b>"+remarks+"</b>.</label>" +
									                     "<br><label style='font-family: Calibri;'> NOTE : This is System Generated mail Please Dont Reply to this mail ID.</label>" +
									                     "<br><b style='font-family: Calibri;color:#EC6820'>Follow below URL to access</b> <br>http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/" +
									                     "<br><br><br><br><label style='font-family: Calibri;'>Thanks & Regards</label>"+
									                     "<br><label style='font-family: Calibri;'>C2IT Nippon Express </label>");
					                try {
						             EmailUtility.sendEmailWithAttachment(emailEntity);
						             }
						         catch (AddressException e)
						             {
								     // TODO Auto-generated catch block
							   	     System.out.println("============================Address Exception===============");
								     e.printStackTrace();
						             }
						         catch (MessagingException e)
						            {
								    // TODO Auto-generated catch block
								    System.out.println("===============Messaging Exception==============");
								    e.printStackTrace();
						            }
		 		                  }
        	                 }
        	             else 
        	                {
    		            	st.executeUpdate("insert into systembackupverification(empid,fileemail,remarks,verifybydesg,verifybyemp,verified,status,year,month,branch) values('"+empid1+"','FILE','Verified','"+desg+"','"+name+"','Yes','0','"+yr+"','"+mo+"','"+branch+"')");
    		                }
    		         r++;
    	             }
    		   if(email!=null)
		             {
    			     rem="text"+r;
        	         remarks=request.getParameter(rem);
        	         System.out.println("Remarks :"+remarks);
        	         if(remarks!="")
        	                {
    		                st.executeUpdate("insert into systembackupverification(empid,fileemail,remarks,verifybydesg,verifybyemp,verified,status,year,month,branch) values('"+empid1+"','EMAIL','"+remarks+"','"+desg+"','"+name+"','No','1','"+yr+"','"+mo+"','"+branch+"')");
        	                st2a = conn.createStatement();
		 		            rs2a = st2a.executeQuery(query2);
		 		            while(rs2a.next())
		 		                  {	
		 		            	  adminname=rs2a.getString(1);
		        		          admemail=rs2a.getString(2);
		        		          System.out.println("admin name :"+adminname);		
						          System.out.println("email : " + admemail);      
						          EmailEntity emailEntity = new EmailEntity();
					              // String managerIdemail = "chintu.kumar@nittsu.co.in";
					              //String userName  = "Chintu Kumar";
					              emailEntity.setPort("25");
					              emailEntity.setHost("203.124.152.3");
				 	              emailEntity.setSubject("SYSTEM BACKUP NOT VERIFIED");
				 	              emailEntity.setUserName("C2IT Alert");
					              emailEntity.setPassword("test");
				 	              emailEntity.setToAddress(admemail);
				 	              //emailEntity.setToAddress("support.itho@nittsu.co.in");
				                  //emailEntity.setCcAddress("support.itho@nittsu.co.in");
					              emailEntity.setFromAddress("HRMS.nittsu.co.in");
					              emailEntity.setMessage("<html><body><label style='font-family: Calibri;'>Dear "+adminname+"</label>" +
									                     "<br><br><label style='font-family: Calibri;'>Mr/Mrs. <b>"+empname1+"</b> employee code <b> "+empid1+" </b> system backup not verifyed by Mr.<b>"+name+" ("+desg+")</b> for <b>EMAIL</b> Backup. </label>" +
									                     "<br><label style='font-family: Calibri;'> Remarks by Verifyer :<b>"+remarks+"</b>.</label>" +
									                     "<br><label style='font-family: Calibri;'> NOTE : This is System Generated mail Please Dont Reply to this mail ID.</label>" +
									                     "<br><b style='font-family: Calibri;color:#EC6820'>Follow below URL to access</b> <br>http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/" +
									                     "<br><br><br><br><label style='font-family: Calibri;'>Thanks & Regards</label>"+
									                     "<br><label style='font-family: Calibri;'>C2IT Nippon Express </label>");
					                try {
						             EmailUtility.sendEmailWithAttachment(emailEntity);
						             }
						         catch (AddressException e)
						             {
								     // TODO Auto-generated catch block
							   	     System.out.println("============================Address Exception===============");
								     e.printStackTrace();
						             }
						         catch (MessagingException e)
						            {
								    // TODO Auto-generated catch block
								    System.out.println("===============Messaging Exception==============");
								    e.printStackTrace();
						            }
		 		                  }
        	                 }
        	             else 
        	                {
    		           	    st.executeUpdate("insert into systembackupverification(empid,fileemail,remarks,verifybydesg,verifybyemp,verified,status,year,month,branch) values('"+empid1+"','EMAIL','Verified','"+desg+"','"+name+"','Yes','0','"+yr+"','"+mo+"','"+branch+"')");
    		                 }
		             r++;
		             }
    	       k++;
               }
	    response.sendRedirect("backupverification.jsp?msg=1");
 }catch (Exception e) {
	// TODO: handle exception
                          }
       finally{
	          DbUtil.closeDBResources(rs,st,cn);
	          }
%>
