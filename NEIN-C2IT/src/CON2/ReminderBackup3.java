package CON2;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import email.EmailEntity;
import email.EmailUtility;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
public class ReminderBackup3 implements Job
      {
 	  @Override
	  public void execute(JobExecutionContext arg0) throws JobExecutionException 
	           {
 		       Connection conn=null;
	           Statement st=null,st1=null,st2=null,st4=null; 
	           ResultSet rs=null,rs1=null,rs2=null;
	           String email=null,adminname=null,schtime=null,schfor=null,username=null,bno=null,query2=null,bra=null,sbra=null;
	           String  empid=null,sdate=null,fil=null;
	           try{
			         Class.forName("com.mysql.jdbc.Driver");
			         conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb", "root", "");
			         String query1 = "select * from systembackupstatus where Status='Pending'";
			 		 st1 = conn.createStatement();
			 		 rs1 = st1.executeQuery(query1);
			 		 while(rs1.next())
			 		       {	
			 			   empid=rs1.getString(2);
			               username=rs1.getString(3);
			        	   bno=rs1.getString(9);
			        	   sdate=rs1.getString(10);
			        	   fil=rs1.getString(11);
			        	   
			        	   //System.out.println("User name :"+username);		
					       //System.out.println("branch no : " + bno);
			 		       if(bno.equals("90"))
			 		            query2 = "select Nname,Nmail from nentryho where NpostingCo='HEAD OFFICE-90' and `department`='IT SUPPORT' and Npost='IT SUPPORT' and EMP_NO='1945'";
			 		        else if(bno.equals("10"))
			 		            query2 = "select Nname,Nmail from nentryho where (NpostingCo='BANGALORE - 10' OR EMP_NO='1920') and `department`='IT SUPPORT' and Npost='IT SUPPORT'";
			 		        else if(bno.equals("40"))
			 		            query2 = "select Nname,Nmail from nentryho where NpostingCo='CHENNAI - 40' and `department`='IT SUPPORT' and Npost='IT SUPPORT'";
			 		        else if(bno.equals("30"))
		 		                query2 = "select Nname,Nmail from nentryho where NpostingCo='MUMBAI - 30' and `department`='IT SUPPORT' and Npost='IT SUPPORT'";
			 		        else if(bno.equals("20"))
		 		                query2 = "select Nname,Nmail from nentryho where NpostingCo='DELHI - 20' and `department`='IT SUPPORT' and Npost='IT SUPPORT'";
		 		            st2 = conn.createStatement();
			 		        rs2 = st2.executeQuery(query2);
			 		        while(rs2.next())
			 		                  {	
			 		            	  adminname=rs2.getString(1);
			        		          email=rs2.getString(2);
			        		          //System.out.println("admin name :"+adminname);		
							          //System.out.println("email : " + email);      
			        	              EmailEntity emailEntity = new EmailEntity();
						              // String managerIdemail = "chintu.kumar@nittsu.co.in";
						              //String userName  = "Chintu Kumar";
						              emailEntity.setPort("25");
						              emailEntity.setHost("10.206.10.10");
					 	              emailEntity.setSubject("BACKUP STATUS UPDATE PENDING REMINDER");
					 	              emailEntity.setUserName("C2IT Alert");
						              emailEntity.setPassword("test");
					 	              emailEntity.setToAddress(email);
					 	              //emailEntity.setToAddress("support.itho@nittsu.co.in");
					                  //emailEntity.setCcAddress("support.itho@nittsu.co.in");
						              emailEntity.setFromAddress("HRMS.nittsu.co.in");
						              emailEntity.setMessage("<html><body><label style='font-family: Calibri;'>Dear "+adminname+"</label>" +
										                     "<br><br><label style='font-family: Calibri;'> Please Update the employee <b>"+username+" ("+empid+")</b> System Backup Status for <b> "+fil+" </b> which schedule on<b> "+sdate+" </b>. </label>" +
										                     "<br><label style='font-family: Calibri;'> NOTE : This is System Generated mail Please Dont Reply to this mail ID.</label>" +
										                     "<br><b style='font-family: Calibri;color:#EC6820'>Follow below URL to access</b> <br>http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/" +
										                     "<br><br><br><label style='font-family: Calibri;'>Thanks & Regards</label>"+
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
							        // adminname=null;email=null;
							      }//rs2 while close
			 		          // username=null;bno=null;
			 		       }
			         
			      }catch(Exception ex)
		                    {
			    	        ex.printStackTrace();
			 	            }
	   }//function close
   }//class close
		
		
		
		
		
	
