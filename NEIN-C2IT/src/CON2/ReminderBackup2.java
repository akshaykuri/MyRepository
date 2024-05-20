package CON2;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import email.EmailEntity;
import email.EmailUtility;
import java.sql.*;
public class ReminderBackup2 implements Job
      {
 	  @Override
	  public void execute(JobExecutionContext arg0) throws JobExecutionException 
	           {
	 	       Connection conn=null;
		       Statement st=null,st1=null,st2=null;
		       ResultSet rs=null,rs1=null,rs2=null;
		       String email=null,adminname=null,query2=null;
	       try{
		         Class.forName("com.mysql.jdbc.Driver");
		         conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb", "root", "");
		         query2 = "select Nname,Nmail from login where post='SR.MANAGER IT'";
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
				 	              emailEntity.setSubject("SYSTEM BACKUP CHECK AND VERYFY");
				 	              emailEntity.setUserName("C2IT Alert");
					              emailEntity.setPassword("test");
				 	              emailEntity.setToAddress(email);
				 	              //emailEntity.setToAddress("support.itho@nittsu.co.in");
				                  //emailEntity.setCcAddress("support.itho@nittsu.co.in");
					              emailEntity.setFromAddress("HRMS.nittsu.co.in");
					              emailEntity.setMessage("<html><body><label style='font-family: Calibri;'>Dear "+adminname+"</label>" +
									                     "<br><br><label style='font-family: Calibri;'> Please Check and verify System Backup Status for current month for all branches. </label>" +
									                     "<br><label style='font-family: Calibri;'> If you Checked and verifyed then ignore mail.</label>" +
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
						        // adminname=null;email=null;
						      }//rs2 while close
		 		          // username=null;bno=null;
		 		     //  }//date comparison if close
		          
		      }catch(Exception ex)
	                    {
		    	        ex.printStackTrace();
		 	            }
	   }//function close
   }//class close
		
		
		
		
		
	
