package CON2;
import javax.mail.MessagingException;

import javax.mail.internet.AddressException;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import email.EmailEntity;
import email.EmailUtility;
import java.sql.*;
import java.util.Date;
import java.util.Calendar;
import java.text.SimpleDateFormat;  
import java.util.Locale;
import java.text.DateFormat;

public class ReminderBackup1 implements Job
      {
 	  @Override
	 public void execute(JobExecutionContext arg0) throws JobExecutionException 
	           {
	 	       //System.out.println("Reminder for System Backup check list...");
		       Connection conn=null;
		       Statement st=null,st1=null,st2=null,st4=null; 
		       ResultSet rs=null,rs1=null,rs2=null;
		       String email=null,adminname=null,schtime=null,schfor=null,username=null,bno=null,query2=null,bra=null,sbra=null;
		       int empid=0;
		       ////////////////////////////// Current Day ///////////////////////
		       
		       Calendar calendar = Calendar.getInstance();
		       Date date = calendar.getTime();
		       String currDay=new SimpleDateFormat("EE", Locale.ENGLISH).format(date.getTime()).toUpperCase();
               //System.out.println("Current Day :"+currDay);
		       //System.out.println(new SimpleDateFormat("EEEE", Locale.ENGLISH).format(date.getTime()));
		       /////////////////////////// Current Day ////////////////////////
               String currtime=(calendar.get(Calendar.HOUR_OF_DAY) + ":" + calendar.get(Calendar.MINUTE));
	 	  try{
		         Class.forName("com.mysql.jdbc.Driver");
		         conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb", "root", "");
		         String query = "select * from systembackupschdaytime where schday='"+currDay+"'";
		         st = conn.createStatement();
		         rs = st.executeQuery(query);
		         while(rs.next())
		              {	
		        	  empid=rs.getInt(2);
		        	  schfor=rs.getString(3);
		        	  schtime=rs.getString(5);
		        	  SimpleDateFormat parser = new SimpleDateFormat("HH:mm");
		        	  Date myDate = parser.parse(schtime);
		        	  Calendar cal =Calendar.getInstance();
		        	  cal.setTime(myDate);
		        	  cal.add(Calendar.HOUR_OF_DAY,3);
		        	  String afteradd = (cal.get(Calendar.HOUR_OF_DAY) + ":" + cal.get(Calendar.MINUTE));
		        	  //System.out.println("Emp id :"+empid);
		        	  //System.out.println("Scheduld for :"+schfor);
		        	  //System.out.println("Schedule time :"+schtime);
		        	  //System.out.println("Date after added 3 hr :"+afteradd);		
		        	  //System.out.println("Current Hours : " + currtime);
		        	  if(afteradd.equals(currtime))
		        	        {
		        		    String query1 = "select empname,bno,branch,subbranch from systembackupchecklist where empno='"+empid+"'";
		 		            st1 = conn.createStatement();
		 		            rs1 = st1.executeQuery(query1);
		 		            while(rs1.next())
		 		                  {	
		        		          username=rs1.getString(1);
		        		          bno=rs1.getString(2);
		        		          bra=rs1.getString(3);
		        		          sbra=rs1.getString(4);
		        		          } 
		 		         
		 		            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		 	         	   java.util.Date date1 = new Date();
		 	               String schdate = dateFormat.format(date1);
		 	               //System.out.println("cs date we are getting "+schdate);
		 		           st4=conn.createStatement();
		 		           st4.executeUpdate("insert into systembackupstatus (empno,empname,branch,subbranch,file,bno,schdate) values ('"+empid+"','"+username+"','"+bra+"','"+sbra+"','"+schfor+"','"+bno+"','"+schdate+"')");
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
				 	              emailEntity.setSubject("BACKUP STATUS ENTERY");
				 	              emailEntity.setUserName("C2IT Alert");
					              emailEntity.setPassword("test");
				 	              emailEntity.setToAddress(email);
				 	              //emailEntity.setToAddress("support.itho@nittsu.co.in");
				                  //emailEntity.setCcAddress("support.itho@nittsu.co.in");
					              emailEntity.setFromAddress("HRMS.nittsu.co.in");
					              emailEntity.setMessage("<html><body><label style='font-family: Calibri;'>Dear "+adminname+"</label>" +
									                     "<br><br><label style='font-family: Calibri;'> Please Update the employee <b>"+username+" ("+empid+")</b> System Backup Status for <b> "+schfor+" </b>weather its is completed or not , which schedule today at<b> "+schtime+" </b>. </label>" +
									                     "<br><label style='font-family: Calibri;'>Backup schdule created please update. </label>" +
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
		 		       }//date comparison if close
		            }//rs while close
		      }catch(Exception ex)
	                    {
		    	        ex.printStackTrace();
		 	            }
	   }//function close
   }//class close
		
		
		
		
		
	
