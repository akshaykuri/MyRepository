package CON2;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.mysql.jdbc.Statement;

public class Reminder_jobs implements Job{

	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		
	    // System.out.println("==============calling ReminderFor Pending ISPOUTAGE===================");
		try {
			ReminderForISP();
			ReminderForPhotoCopierInvoiceDetails();
			ReminderForPhotoCopierCheckDetails1();
			ReminderForCatridgeCheque();
			ReminderForConsumptionCheque(); 
			ReminderForMplsCheque();
			ReminderForPaymentCheque();
			ReminderForPaymentInvoice();
			
			ReminderForSoftwareAMC();
			ReminderForHardwareAMC();
			ReminderForAMCNonIt();
			
		       } catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		     } catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		     } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		   } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
///////////////////////////////////////////// Soumya //////////////////////////////////
	
	private void ReminderForSoftwareAMC() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, UnsupportedEncodingException {
		Connection con = null;
		Connection2 dbConn = new Connection2();
		con = dbConn.getConnection2();
		
	    Statement st=null,st1=null;
	    ResultSet rs=null,rs1=null;
		
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String cdate = dateFormat.format(new Date());
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, +1);
		Calendar c = Calendar.getInstance();
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		Calendar c3 = Calendar.getInstance();
		Calendar c4 = Calendar.getInstance();
		Calendar c5 = Calendar.getInstance();
		Calendar c6 = Calendar.getInstance();
		Calendar c7 = Calendar.getInstance();
		Calendar c8 = Calendar.getInstance();
		Calendar c9 = Calendar.getInstance();
		
		c.setTime(new Date());
		c.add(Calendar.DATE,+6); 
		String date1 = dateFormat.format(c.getTime());
			
		c1.setTime(new Date()); 
		c1.add(Calendar.DATE, +12); 
		String date2 = dateFormat.format(c1.getTime());
		
		c2.setTime(new Date());
		c2.add(Calendar.DATE,+18); 
		String date3 = dateFormat.format(c2.getTime());
		
		c3.setTime(new Date());
		c3.add(Calendar.DATE,+24); 
		String date4 = dateFormat.format(c3.getTime());
		
		c4.setTime(new Date());
		c4.add(Calendar.DATE,+30); 
		String date5 = dateFormat.format(c4.getTime());
		
		
		c5.setTime(new Date());
		c5.add(Calendar.DATE,+36); 
		String date6 = dateFormat.format(c5.getTime());
		
		
		c6.setTime(new Date());
		c6.add(Calendar.DATE,+42); 
		String date7 = dateFormat.format(c6.getTime());
		
		
		c7.setTime(new Date());
		c7.add(Calendar.DATE,+48); 
		String date8 = dateFormat.format(c7.getTime());
		
		
		c8.setTime(new Date());
		c8.add(Calendar.DATE,+54); 
		String date9 = dateFormat.format(c8.getTime());
		
		
		c9.setTime(new Date());
		c9.add(Calendar.DATE,+60); 
		String date10 = dateFormat.format(c9.getTime());
		String query1 = "SELECT *,u.email,mb.m_b_name,sb.b_name FROM `software_details` s INNER JOIN leavemanagement.user u ON u.emp_id=s.initiator_empid INNER JOIN `branch_master_main` mb ON mb.m_b_no=s.branch INNER JOIN `branch_master` sb on sb.id=s.sub_branch";
	    st = (Statement) con.createStatement();
		rs = st.executeQuery(query1);
				try {
					
					PreparedStatement statement = con.prepareStatement(query1);
					rs = statement.executeQuery();
					while(rs.next())
					{
						String aa=rs.getString("AMC_expiry");
						String body ="<html><body>" +
						        "<p>Hi" +
								"<p> Product with following details getting expired on "+rs.getString("AMC_expiry")+".,</p>"+	
							     "<br><br><table border='10'>"+
								 "<tr><td>Software Name</td><td>"+
								 ""+rs.getString("software_name")+""+
							    "</td>"+
								"<td>License_no</td><td>"+
								""+rs.getString("license_no")+""+
								"</td></tr>"+
							     "<tr><td>PO Number</td><td>"+
								""+rs.getString("po_number")+""+
								"</td>"+
								"<td>Purchase Date</td><td>"+
								""+rs.getString("purchase_date")+""+
								"</td></tr>"+
							    "<tr><td>Vender</td><td>"+
							    ""+rs.getString("vender")+""+
								"</td>"+
								"<td>IP Address</td><td>"+
								""+rs.getString("IP_address")+""+
								"</td></tr>"+
								"<tr><td>Branch</td><td>"+
								""+rs.getString("m_b_name")+""+
								"</td>"+
								"<td>Sub Branch</td><td>"+
								""+rs.getString("b_name")+""+
								"</td></tr>"+
								"<tr><td>AMC From</td><td>"+
								""+rs.getString("AMC_from_date")+""+
								"</td>"+
								"<td>AMC To</td><td>"+
								""+rs.getString("AMC_to_date")+""+
								"</td></tr>"+
								"</table>"+
							    "<h3 style='color:red;'>https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h3><br>" +
							    "<h3 style='color:red;'>https://neinsoft1.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp</h3>" +
								"<br></body></html>";
												
						//String CCList = "soumya.a@nittsu.co.in";
						String query2 = "SELECT full_name,email FROM leavemanagement.`user` WHERE department_id='12' AND branch_id='1' AND `emp_grade` IN ('MM-03','OL-02')  AND employee_status='yes'";
						
						
				        st1 = (Statement) con.createStatement();
						rs1 = st1.executeQuery(query2);
						
					//	String CCList = "venkatesh.a@nittsu.co.in";
						
						//System.out.println("cclisttttttttt========"+CCList);
						try {
							
						//	System.out.println("in inner try");
							
							PreparedStatement statement1 = con.prepareStatement(query2);
						
							rs1 = statement1.executeQuery();
							
							while(rs1.next()){
								
								//GA to be addeddddddddddddddd
							String CCList = rs1.getString("email");	
								//String CCList ="soumya.a@nittsu.co.in";
							//	System.out.println("cclisttttttttt========"+CCList);
								
						if((date1.equals(aa)) || (date2.equals(aa)) || (date3.equals(aa)) || (date4.equals(aa)) || (date5.equals(aa)) || (date6.equals(aa)) || (date7.equals(aa)) || (date8.equals(aa)) || (date9.equals(aa)) || (date10.equals(aa)) || (cdate.equals(aa)) )
						{
						//System.out.println("in if conditionnnnnnnnnnn");
					 	new NormalMail().sendMail("SOFTWARE DETAILS",rs.getString("email"),CCList,body , "SOFTWARE AMC Expiry reminder");
					  } 
							}
							} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}	
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	        }

	private void ReminderForHardwareAMC() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, UnsupportedEncodingException {
		
		
		//System.out.println("inside hardware AMC reminder jobs");
		Connection con = null;
		Connection2 dbConn = new Connection2();
		con = dbConn.getConnection2();
		
	    Statement st=null,st1=null;
	    ResultSet rs=null,rs1=null;
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String cdate = dateFormat.format(new Date());
		Calendar c = Calendar.getInstance();
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		Calendar c3 = Calendar.getInstance();
		Calendar c4 = Calendar.getInstance();
		Calendar c5 = Calendar.getInstance();
		Calendar c6 = Calendar.getInstance();
		Calendar c7 = Calendar.getInstance();
		Calendar c8 = Calendar.getInstance();
		Calendar c9 = Calendar.getInstance();
		
		c.setTime(new Date());
		c.add(Calendar.DATE,+6); 
		String date1 = dateFormat.format(c.getTime());
		
		
		
		
		c1.setTime(new Date()); 
		c1.add(Calendar.DATE, +12); 
		String date2 = dateFormat.format(c1.getTime());
		
		
		c2.setTime(new Date());
		c2.add(Calendar.DATE,+18); 
		String date3 = dateFormat.format(c2.getTime());
		
		
		c3.setTime(new Date());
		c3.add(Calendar.DATE,+24); 
		String date4 = dateFormat.format(c3.getTime());
		
		
		c4.setTime(new Date());
		c4.add(Calendar.DATE,+30); 
		String date5 = dateFormat.format(c4.getTime());
		
		
		c5.setTime(new Date());
		c5.add(Calendar.DATE,+36); 
		String date6 = dateFormat.format(c5.getTime());
		
		
		c6.setTime(new Date());
		c6.add(Calendar.DATE,+42); 
		String date7 = dateFormat.format(c6.getTime());
		
		
		c7.setTime(new Date());
		c7.add(Calendar.DATE,+48); 
		String date8 = dateFormat.format(c7.getTime());
		
		
		c8.setTime(new Date());
		c8.add(Calendar.DATE,+54); 
		String date9 = dateFormat.format(c8.getTime());
		
		
		c9.setTime(new Date());
		c9.add(Calendar.DATE,+60); 
		String date10 = dateFormat.format(c9.getTime());
		
		
			//String query1 = "SELECT *,u.email,mb.m_b_name,sb.b_name FROM `hardware_details` s INNER JOIN leavemanagement.user u ON u.emp_id=s.initiator_empid INNER JOIN `branch_master_main` mb ON mb.m_b_no=s.branch INNER JOIN `branch_master` sb on sb.id=s.sub_branch";
			
		  String query1="SELECT *,u.email,mb.m_b_name,sb.b_name,h.Asset_type FROM `hardware_details` s INNER JOIN leavemanagement.user u ON u.emp_id=s.initiator_empid INNER JOIN `branch_master_main` mb ON mb.m_b_no=s.branch INNER JOIN `branch_master` sb on sb.id=s.sub_branch INNER JOIN `hardware_details_multiple` h ON h.Asset_no=s.Asset_no ";	
		
	        st = (Statement) con.createStatement();
			rs = st.executeQuery(query1);
			  
				try {
					PreparedStatement statement = con.prepareStatement(query1);
					rs = statement.executeQuery();
					while(rs.next()){
					 
						String aa=rs.getString("amc_exp_date");
						String body ="<html><body>" +
						        "<p>Hi" +
								"<p> Product with following details getting expired on "+rs.getString("amc_exp_date")+".,</p>"+	
							     "<br><br><table border='10'>"+
								 "<tr><td>Hardware Name</td><td>"+
								 ""+rs.getString("Asset_type")+""+
							    "</td>"+
								/*"<td>ItemType</td><td>"+
								""+rs.getString("item_type")+""+*/
								"</tr>"+
							     "<tr><td>PO Number</td><td>"+
								""+rs.getString("po_no")+""+
								"</td>"+
								"<td>Purchase Date</td><td>"+
								""+rs.getString("po_date")+""+
								"</td></tr>"+
							    "<tr><td>Vender</td><td>"+
							    ""+rs.getString("vender_name")+""+
								"</td>"+
								"<td>IP Address</td><td>"+
								""+rs.getString("ip_address")+""+
								"</td></tr>"+
								"<tr><td>Branch</td><td>"+
								""+rs.getString("m_b_name")+""+
								"</td>"+
								"<td>Sub Branch</td><td>"+
								""+rs.getString("b_name")+""+
								"</td></tr>"+
								"<tr><td>AMC From</td><td>"+
								""+rs.getString("amc_from_date")+""+
								"</td>"+
								"<td>AMC To</td><td>"+
								""+rs.getString("amc_to_date")+""+
								"</td></tr>"+
								"</table>"+
							    "<h3 style='color:red;'>https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h3><br>" +
							    "<h3 style='color:red;'>https://neinsoft1.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp</h3>" +
								"<br></body></html>";
						
						String query2 = "SELECT full_name,email FROM leavemanagement.`user` WHERE department_id='12' AND branch_id='1' AND `emp_grade` IN ('MM-03','OL-02')  AND employee_status='yes'";
						
						
				        st1 = (Statement) con.createStatement();
						rs1 = st.executeQuery(query2);
						
	                           try {
								PreparedStatement statement1 = con.prepareStatement(query2);
						
							rs1 = statement1.executeQuery();
						//String CCList = rs1.getString("email")+",venkatesh.a@nittsu.co.in";
						while(rs1.next()){
							//GA to be addeddddddddddddddd
							String CCList = rs1.getString("email");
							//String CCList ="soumya.a@nittsu.co.in";
						//	System.out.println("cclisttttttttt hardware IT========"+CCList);
						//System.out.println("clistttttttttttt==="+CCList);
						
					if((date1.equals(aa)) || (date2.equals(aa)) || (date3.equals(aa)) || (date4.equals(aa)) || (date5.equals(aa)) || (date6.equals(aa)) || (date7.equals(aa)) || (date8.equals(aa)) || (date9.equals(aa)) || (date10.equals(aa)) )
				
					{
							new NormalMail().sendMail("HARDWARE DETAILS",rs.getString("email"),CCList,body , "HARDWARE(IT) AMC Expiry reminder");
					  } 
						}
	                           } catch (SQLException e) {
	               				// TODO Auto-generated catch block
	               				e.printStackTrace();
	               			}
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	        }


	private void ReminderForAMCNonIt() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, UnsupportedEncodingException {
		
		
		//System.out.println("inside Non It AMC reminder jobs");
		
		
		Connection con = null;
		Connection2 dbConn = new Connection2();
		con = dbConn.getConnection2();
		
	    Statement st=null,st1=null;
	    ResultSet rs=null,rs1=null;
		
		/*SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		
		System.out.println("current date===="+sdf1);*/
	    
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String cdate = dateFormat.format(new Date());
		
		//System.out.println("current date===="+cdate);
		
		/*Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, +1);
		String date1 = dateFormat.format(cal.getTime());*/
		
		Calendar c = Calendar.getInstance();
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		Calendar c3 = Calendar.getInstance();
		Calendar c4 = Calendar.getInstance();
		Calendar c5 = Calendar.getInstance();
		Calendar c6 = Calendar.getInstance();
		Calendar c7 = Calendar.getInstance();
		Calendar c8 = Calendar.getInstance();
		Calendar c9 = Calendar.getInstance();
		
		c.setTime(new Date());
		c.add(Calendar.DATE,+6); 
		String date1 = dateFormat.format(c.getTime());
		
		
		
		
		c1.setTime(new Date()); 
		c1.add(Calendar.DATE, +12); 
		String date2 = dateFormat.format(c1.getTime());
		
		
		c2.setTime(new Date());
		c2.add(Calendar.DATE,+18); 
		String date3 = dateFormat.format(c2.getTime());
		
		
		c3.setTime(new Date());
		c3.add(Calendar.DATE,+24); 
		String date4 = dateFormat.format(c3.getTime());
		
		
		c4.setTime(new Date());
		c4.add(Calendar.DATE,+30); 
		String date5 = dateFormat.format(c4.getTime());
		
		
		c5.setTime(new Date());
		c5.add(Calendar.DATE,+36); 
		String date6 = dateFormat.format(c5.getTime());
		
		
		c6.setTime(new Date());
		c6.add(Calendar.DATE,+42); 
		String date7 = dateFormat.format(c6.getTime());
		
		
		c7.setTime(new Date());
		c7.add(Calendar.DATE,+48); 
		String date8 = dateFormat.format(c7.getTime());
		
		
		c8.setTime(new Date());
		c8.add(Calendar.DATE,+54); 
		String date9 = dateFormat.format(c8.getTime());
		
		
		c9.setTime(new Date());
		c9.add(Calendar.DATE,+60); 
		String date10 = dateFormat.format(c9.getTime());
		
		
			String query1 = "SELECT *,u.email,mb.m_b_name,sb.b_name FROM `hardware_amc_nonit` s INNER JOIN leavemanagement.user u ON u.emp_id=s.initiator_empid INNER JOIN `branch_master_main` mb ON mb.m_b_no=s.branch INNER JOIN `branch_master` sb on sb.id=s.sub_branch";
			
			
	        st = (Statement) con.createStatement();
			rs = st.executeQuery(query1);
			  
				try {
					
				//	System.out.println("in query non IT trrrrrrrrrrrrryyyyyyyyyy");
					
					PreparedStatement statement = con.prepareStatement(query1);
				
					rs = statement.executeQuery();
					while(rs.next()){
						
					//	System.out.println("in whileeeeeeeeeeeeeeeeeeeeeeeeee");
						
						 String aa=rs.getString("amc_exp_date");
						 
					//	 System.out.println("amc expiry date===="+aa);
						// aa = aa.substring(0,10);
						 
						
						String body ="<html><body>" +
						        "<p>Hi" +
								"<p> Product with following details getting expired on "+rs.getString("amc_exp_date")+".,</p>"+	
							     "<br><br><table border='10'>"+
								 "<tr><td>Asset Number</td><td>"+
								 ""+rs.getString("Asset_no")+""+
							    "</td>"+
								"<td></td><td>"+
								
								"</td></tr>"+
							     "<tr><td>AMC PO Number</td><td>"+
								""+rs.getString("amc_po")+""+
								"</td>"+
								"<td>Purchase Date</td><td>"+
								""+rs.getString("amc_podate")+""+
								"</td></tr>"+
							    "<tr><td>Vender</td><td>"+
							    ""+rs.getString("amc_vender")+""+
								"</td>"+
								"</tr>"+
								"<tr><td>Branch</td><td>"+
								""+rs.getString("m_b_name")+""+
								"</td>"+
								"<td>Sub Branch</td><td>"+
								""+rs.getString("b_name")+""+
								"</td></tr>"+
								"<tr><td>AMC From</td><td>"+
								""+rs.getString("amc_from_date")+""+
								"</td>"+
								"<td>AMC To</td><td>"+
								""+rs.getString("amc_to_date")+""+
								"</td></tr>"+
								"</table>"+
							    "<h3 style='color:red;'>https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h3><br>" +
							    "<h3 style='color:red;'>https://neinsoft1.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp</h3>" +
								"<br></body></html>";
						String CCList1 = null;
						//GA to be addeddddddddddddddd
						String query="SELECT DISTINCT m3.user_name AS manager_name,m3.email FROM user u INNER JOIN reporting_officers m1 ON m1.user_id = u.user_id INNER JOIN branchmaster b ON b.branch_id = u.branch_id INNER JOIN department d ON d.department_id = u.department_id INNER JOIN user m3 ON m3.user_id = m1.manager_id INNER JOIN user m4 ON m4.user_id = m1.manager2_id INNER JOIN csdb.hardware_amc_nonit s ON s.initiator_empid=u.emp_id WHERE (s.initiator_empid="+rs.getString("initiator_empid")+") AND u.employee_status = 'yes'"; 
						
						 st1 = (Statement) con.createStatement();
							rs1 = st.executeQuery(query);
							
		                           try {
								
								//System.out.println("in inner try");
								
								PreparedStatement statement1 = con.prepareStatement(query);
							
								rs1 = statement1.executeQuery();
							//String CCList = rs1.getString("email")+",prasanna.shetty@nittsu.co.in,it.ho@nittsu.co.in";
							while(rs1.next()){
						
								CCList1=rs1.getString("email");
				 
					}
							String CCList =CCList1 +",biju.m@nittsu.co.in"+",soumya.a@nittsu.co.in";
							   //String CCList ="soumya.a@nittsu.co.in";
								
								if((date1.equals(aa)) || (date2.equals(aa)) || (date3.equals(aa)) || (date4.equals(aa)) || (date5.equals(aa)) || (date6.equals(aa)) || (date7.equals(aa)) || (date8.equals(aa)) || (date9.equals(aa)) || (date10.equals(aa)) )
							{
								new NormalMail().sendMail("HARDWARE DETAILS",rs.getString("email"),CCList,body , "NEIN-C2IT: AMC(NON IT) Expiry reminder");
						    } 
		                           } catch (SQLException e) {
		                  				// TODO Auto-generated catch block
		                  				e.printStackTrace();
		                  			}
		   				}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}	
	        }
	
	
	
	
	////////////////////////////////////////// End Soumya ///////////////////////////////////////////
	
	private void ReminderForISP() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, UnsupportedEncodingException {
		
	       //System.out.println("Remainder for ISP OUTAGE");
	
			Connection con = null;
			Connection2 dbConn = new Connection2();
			con = dbConn.getConnection2();
			
		    Statement st=null;
		    ResultSet rs=null;
		    
		    Connection con1 = null;
			Connection2 dbConn1 = new Connection2();
			con1 = dbConn1.getConnection2();
			
		    Statement st1=null;
		    ResultSet rs1=null;
		    
		    String aa=null;
		    String initiatoraa=null,ini_bid=null;
		    String uemail=null;
		    
		    	
			SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy");
			Calendar c = Calendar.getInstance();
			Calendar c1 = Calendar.getInstance();
			
			c.setTime(new Date());
			c.add(Calendar.DATE,-1); 
			String output = sdf1.format(c.getTime());
			
			c1.setTime(new Date()); 
			c1.add(Calendar.DATE, -2); 
			String output1 = sdf1.format(c1.getTime());
						
					    	 
			String query2 = " SELECT Distinct c.initiator_id,u.user_name,u.branch_id FROM `circuitid_details` c  "+
				            " INNER JOIN leavemanagement.user u ON u.emp_id=c.initiator_id " ;
			
			    st1 = (Statement) con1.createStatement();
				rs1 = st1.executeQuery(query2);
				  
					try {
						PreparedStatement statement1 = con.prepareStatement(query2);					
						rs1 = statement1.executeQuery();
						
				while(rs1.next()){	
					int x=0;
					initiatoraa=rs1.getString("initiator_id");
					ini_bid=rs1.getString("branch_id");
					
					String body =" <html> <body> <p> Dear &nbsp&nbsp"+rs1.getString("user_name")+" <br>"+
				 	             " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
				 	             " You have bellow pending ISP OUTAGE Details Please update <br><br>";
					
					       body=body+" <table border='1'><tr><th colspan='10'>Pending ISP OUTAGE details</th><tr>"+
                                  " <tr> <th>ISPOUTAGE NO</th> <th>CIRCUIT ID</th><th>BRANCH</th><td>call Logged date</td> </tr> ";
			       
	
					String query1 = " SELECT *,u.email,b.b_name FROM `circuitid_details` c "+
					                " INNER JOIN leavemanagement.user u ON u.emp_id=c.initiator_id "+
					                " INNER JOIN branch_master b ON b.id=c.branch_id "+
					                " WHERE c.status='Pending' AND c.initiator_id='"+initiatoraa+"' ";
							
			        st = (Statement) con.createStatement();
					rs = st.executeQuery(query1);
					  
						try {
							PreparedStatement statement = con.prepareStatement(query1);
						
							rs = statement.executeQuery();
							while(rs.next()){
								 x=x+1;
						         aa=rs.getString("callLoggeddate");
								 aa = aa.substring(0,10);
								 uemail=rs.getString("email"); 
								 
								 
								 body=body+" <tr> <td>"+rs.getString("ispoutageno")+"</td> <td>"+rs.getString("circuit_Id")+"</td> "+
								           " <td>"+rs.getString("b_name")+"</td><td>"+rs.getString("callLoggeddate")+"  "+rs.getString("calllogtime")+"</td></tr>";
			             
							   }
							
							
							body=body+"</table> <br>";
							
							body=body+" <h4>https://ninsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h4><br>" +
								      " <h4>https://neinsoft.nittsu.co.in:8185/NEIN</h4>" +
									  " <br></body></html>" ;
							
							//String CCList = "venkatesh.a@nittsu.co.in";
							
						     String CCList = getEmailDetails(ini_bid,uemail);
						     String bname = getBranchName(ini_bid);
					if(x != 0){		
							if(output.equals(aa)){
								System.out.println("NEIN-C2IT: Remainder for ISP OUTAGE For ::"+uemail);
								new NormalMail().sendMail("NEIN-C2IT",uemail,CCList,body , "NEIN-C2IT: Pending ISP OUTAGE Reminder");
							  } 
						    else  if(output1.equals(aa)){
						    	System.out.println("Remainder for ISP OUTAGE For ::"+uemail);
								new NormalMail().sendMail("NEIN-C2IT",uemail,CCList,body , "NEIN-C2IT: Pending ISP OUTAGE Reminder");
							 } 
						    
						   else{
						    	System.out.println("Remainder for ISP OUTAGE");
						    	String CCList1 =CCList;
						    	
						    	new NormalMail().sendMail("NEIN-C2IT",uemail,CCList1,body , "NEIN-C2IT: Pending ISP OUTAGE Reminder For "+bname+" Branch");
						      }	
					}
							
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
			
			}
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				}	
		  }
  

private void ReminderForPhotoCopierInvoiceDetails() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException , ParseException, UnsupportedEncodingException {
	
	Connection con = null;
	Connection2 dbConn = new Connection2();
	con = dbConn.getConnection2();
	
 Statement st=null;
 ResultSet rs=null;
 
 Connection con1 = null;
	Connection2 dbConn1 = new Connection2();
	con1 = dbConn1.getConnection2();
	
 Statement st1=null;
 ResultSet rs1=null;
 
 String initiatoraa=null,ini_bid=null;
 String uemail=null;
 int diffInDays =0; 
	
	SimpleDateFormat sdf1 = new SimpleDateFormat("yy-MM-dd");
	Calendar c = Calendar.getInstance();
	
	c.setTime(new Date());
	c.add(Calendar.DATE,0); 
	String output1 = sdf1.format(c.getTime());
	String output=null;
	
	Calendar cal = Calendar.getInstance();
	cal.setTime(new Date());
	boolean TUESDAY = cal.get(Calendar.DAY_OF_WEEK) == Calendar.TUESDAY;
	//System.out.println("TUESDAY ::"+TUESDAY);
	
if(TUESDAY == true){
	     String query2 = " SELECT Distinct c.empid,u.user_name,u.branch_id FROM `photocopier_details` c  "+
                      " INNER JOIN leavemanagement.user u ON u.emp_id=c.empid ";

		st1 = (Statement) con1.createStatement();
		rs1 = st1.executeQuery(query2);
		
		try {
		PreparedStatement statement1 = con.prepareStatement(query2);
		
		rs1 = statement1.executeQuery();
		
		while(rs1.next()){	
	    int x=0;
		initiatoraa=rs1.getString("empid");
		ini_bid=rs1.getString("branch_id");
		
		String body =" <html> <body> <p> Dear &nbsp&nbsp"+rs1.getString("user_name")+" <br>"+
		             " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
		             " You have bellow pending Photo Copier Invoice Details Please update <br><br>";
		
		   body=body+" <table border='1'><tr><th colspan='10'>Pending Photo Copier Invoice Details</th><tr>"+
		             " <tr><th>Initiator Name</th><th>Location Name</th> <th>MODEL NO</th> <th>Serial no</th><th>Machine type</th><td>Month Of Payment</td> </tr> ";


	
		String query1 = " SELECT DISTINCT p.modelno,p.serialno,p.machinetype,p.month_of_payment,b.b_name,u.email,u.user_name,c.createddate FROM `photocopy_summary` c "+
		                " INNER JOIN photocopier_details p ON p.ph_id=c.ph_id "+
		                " INNER JOIN branch_master b ON b.id=p.branch_id "+
		                " INNER JOIN leavemanagement.user u ON u.emp_id=p.empid "+
		                " WHERE p.empid='"+initiatoraa+"' AND (c.status='Pending' OR (c.`filepath` NOT LIKE '%.%' AND  c.invoice_amt != '0') OR p.`rinvoice_file` NOT LIKE '%.%') ";
		
     st = (Statement) con.createStatement();
		rs = st.executeQuery(query1);
		  
			try {
				PreparedStatement statement = con.prepareStatement(query1);
			
				rs = statement.executeQuery();
				while(rs.next()){
					x=x+1;
					output	 =rs.getString("createddate");
					uemail=rs.getString("email");
					
					
					SimpleDateFormat df = new SimpleDateFormat("yy-MM-dd");
					Date startDate = df.parse(output);
					Date enddate = df.parse(output1);
					
					 diffInDays = (int)( (enddate.getTime() - startDate.getTime())/ (1000 * 60 * 60 * 24) );
					
					
					 body=body+" <tr> <td>"+rs.getString("user_name")+"</td> <td>"+rs.getString("b_name")+"</td><td>"+rs.getString("modelno")+"</td> <td>"+rs.getString("serialno")+"</td> "+
					           " <td>"+rs.getString("machinetype")+"</td><td>"+rs.getString("month_of_payment")+"</td></tr>";
					 
				   }
				body=body+"</table> <br>";
				
				body=body+" <h4>https://ninsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h4><br>" +
					      " <h4>https://neinsoft.nittsu.co.in:8185/NEIN</h4>" +
						  " <br></body></html>" ;
				   
				String CCList = getEmailDetails(ini_bid,uemail);
				String bname = getBranchName(ini_bid);
					
				if(x != 0){	
					if(diffInDays > 15 && !(diffInDays > 25)){
						//System.out.println("Remainder For Photo Copier Invoice Details");
				    	new NormalMail().sendMail("NEIN-C2IT",uemail,CCList,body , "NEIN-C2IT: Pending Photo Copier Invoice details Reminder");
						}
					if(diffInDays > 25){
						String CCList1 =CCList;
						//System.out.println("Remainder For Photo Copier Invoice Details");
				    	new NormalMail().sendMail("NEIN-C2IT",uemail,CCList1,body , "NEIN-C2IT: Pending Photo Copier Invoice details Reminder For "+bname+" Branch");
						}
				}
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		    }
		   } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		 }	
    }
 }

private void ReminderForPhotoCopierCheckDetails1() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, ParseException, UnsupportedEncodingException {
	
	Connection con = null;
	Connection2 dbConn = new Connection2();
	con = dbConn.getConnection2();
	
 Statement st=null;
 ResultSet rs=null;
	
 Connection con1 = null;
	Connection2 dbConn1 = new Connection2();
	con1 = dbConn1.getConnection2();
	
 Statement st1=null;
 ResultSet rs1=null;
 
 String initiatoraa=null,ini_bid=null;
 String uemail=null;
 int diffInDays =0; 
 
	SimpleDateFormat sdf1 = new SimpleDateFormat("yy-MM-dd");
	Calendar c = Calendar.getInstance();
	
	c.setTime(new Date());
	c.add(Calendar.DATE,0); 
	String output1 = sdf1.format(c.getTime());
	String output=null;
	
	Calendar cal = Calendar.getInstance();
	cal.setTime(new Date());
	boolean TUESDAY = cal.get(Calendar.DAY_OF_WEEK) == Calendar.TUESDAY;
	//System.out.println("TUESDAY ::"+TUESDAY);
	
if(TUESDAY == true){
			String query2 = " SELECT Distinct c.empid,u.user_name,u.branch_id FROM `photocopier_details` c  "+
		                    " INNER JOIN leavemanagement.user u ON u.emp_id=c.empid ";
		
			st1 = (Statement) con1.createStatement();
			rs1 = st1.executeQuery(query2);
			
			try {
			PreparedStatement statement1 = con.prepareStatement(query2);
			
			rs1 = statement1.executeQuery();
			
			while(rs1.next()){	
				int x=0;
			initiatoraa=rs1.getString("empid");
			ini_bid=rs1.getString("branch_id");
			
			String body =" <html> <body> <p> Dear &nbsp&nbsp"+rs1.getString("user_name")+" <br>"+
						 " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
						 " You have bellow pending Photo Copier Cheque Details Please update <br><br>";
			
			body=body+" <table border='1'><tr><th colspan='10'>Pending Photo Copier Cheque Details</th><tr>"+
			          " <tr><th>Initiator Name</th><th>Location Name</th> <th>MODEL NO</th> <th>Serial no</th><th>Machine type</th><td>Month Of Payment</td> </tr> ";



		String query1 = " SELECT *,b.b_name,u.email,u.user_name FROM `photocopier_details` c "+
		                " INNER JOIN branch_master b ON b.id=c.branch_id "+
		                " INNER JOIN leavemanagement.user u ON u.emp_id=c.empid "+
		                " WHERE c.empid='"+initiatoraa+"' AND c.status='Pending'";
		
		
     st = (Statement) con.createStatement();
		rs = st.executeQuery(query1);
		  
			try {
				PreparedStatement statement = con.prepareStatement(query1);
			
				rs = statement.executeQuery();
				while(rs.next()){
					x=x+1;
					output	 =rs.getString("createddate");
					uemail=rs.getString("email");
					
					
					SimpleDateFormat df = new SimpleDateFormat("yy-MM-dd");
					Date startDate = df.parse(output);
					Date enddate = df.parse(output1);
					
				    diffInDays = (int)( (enddate.getTime() - startDate.getTime())/ (1000 * 60 * 60 * 24) );
					
					body=body+" <tr><td>"+rs.getString("user_name")+"</td> <td>"+rs.getString("b_name")+"</td> <td>"+rs.getString("modelno")+"</td> <td>"+rs.getString("serialno")+"</td> "+
			                  " <td>"+rs.getString("machinetype")+"</td><td>"+rs.getString("month_of_payment")+"</td></tr>";

			      }
					body=body+"</table> <br>";
					
					body=body+" <h4>https://ninsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h4><br>" +
						      " <h4>https://neinsoft.nittsu.co.in:8185/NEIN</h4>" +
							  " <br></body></html>" ;
				
					String CCList = getEmailDetails(ini_bid,uemail);
					String bname = getBranchName(ini_bid);
					
					if(x != 0){
					if(diffInDays > 30 && !(diffInDays > 45)){
						//System.out.println("Remainder For Photo Copier Cheque Details");
				    	new NormalMail().sendMail("NEIN-C2IT",uemail,CCList,body , "NEIN-C2IT: Pending Photo Copier Cheque details Reminder");
						}
					if(diffInDays > 45){
						String CCList1 =CCList;						
						//System.out.println("Remainder For Photo Copier Cheque Details");
				    	new NormalMail().sendMail("NEIN-C2IT",uemail,CCList1,body , "NEIN-C2IT: Pending Photo Copier Cheque details Reminder For "+bname+" Branch");
						}
					}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
     }
}
private void ReminderForCatridgeCheque() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, ParseException, UnsupportedEncodingException {
	
	Connection con = null;
	Connection2 dbConn = new Connection2();
	con = dbConn.getConnection2();
	
 Statement st=null;
 ResultSet rs=null;
 
 Connection con1 = null;
	Connection2 dbConn1 = new Connection2();
	con1 = dbConn1.getConnection2();
	
 Statement st1=null;
 ResultSet rs1=null;
 
 String initiatoraa=null,ini_bid=null;
 String uemail=null;
 int diffInDays =0; 
	
	SimpleDateFormat sdf1 = new SimpleDateFormat("yy-MM-dd");
	Calendar c = Calendar.getInstance();
	
	c.setTime(new Date());
	c.add(Calendar.DATE,0); 
	String output1 = sdf1.format(c.getTime());
	String output=null;

	Calendar cal = Calendar.getInstance();
	cal.setTime(new Date());
	boolean TUESDAY = cal.get(Calendar.DAY_OF_WEEK) == Calendar.TUESDAY;
	//System.out.println("TUESDAY ::"+TUESDAY);
	
if(TUESDAY == true){
	 String query2 = " SELECT Distinct c.empid,u.user_name,u.branch_id FROM `catridge_details` c  "+
		             " INNER JOIN leavemanagement.user u ON u.emp_id=c.empid ";
		
		st1 = (Statement) con1.createStatement();
		rs1 = st1.executeQuery(query2);
		
		try {
		PreparedStatement statement1 = con.prepareStatement(query2);
		
		rs1 = statement1.executeQuery();
		
		while(rs1.next()){	
			int x=0;
		initiatoraa=rs1.getString("empid");
		ini_bid=rs1.getString("branch_id");
		
		String body =" <html> <body> <p> Dear &nbsp&nbsp"+rs1.getString("user_name")+" <br>"+
					 " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
					 " You have bellow pending Catridge Cheque Details Please update <br><br>";
		
		body=body+" <table border='1'><tr><th colspan='10'>Pending Catridge Cheque Details</th><tr>"+
		          " <tr> <th>Location</th><th>Vendor Name</th><th>MONTH OF PAYMENT</th><th>TOTAL AMOUNT</th></tr> ";
			
	   String  query1 = " SELECT Distinct c.id,c.month_of_payment,c.totalAmt,b.b_name,u.email,"+
					    " u.user_name,c.vendor_name,c.createddate FROM `csdb`.`catridge_details` c "+
					    " INNER JOIN `csdb`.`branch_master` b ON b.id=c.`branch_id` "+
					    " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`empid` "+
					    " WHERE c.empid='"+initiatoraa+"' AND (`chequeno`='' OR `cheque_date`='') ";
		
		
                 st = (Statement) con.createStatement();
		            rs = st.executeQuery(query1);
		  
			try {
				PreparedStatement statement = con.prepareStatement(query1);
			
				rs = statement.executeQuery();
				while(rs.next()){
					x=x+1;
					output	 =rs.getString("createddate");
                 uemail=rs.getString("email");
                 
                 
                 SimpleDateFormat df = new SimpleDateFormat("yy-MM-dd");
					Date startDate = df.parse(output);
					Date enddate = df.parse(output1);
					
					diffInDays = (int)( (enddate.getTime() - startDate.getTime())/ (1000 * 60 * 60 * 24) );
					
					body=body+" <tr> <td>"+rs.getString("b_name")+"</td> <td>"+rs.getString("vendor_name")+"</td> "+
			                  " <td>"+rs.getString("month_of_payment")+"</td><td>"+rs.getString("totalAmt")+"</td></tr>";

			      }
					body=body+"</table> <br>";
					
					body=body+" <h4>https://ninsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h4><br>" +
						      " <h4>https://neinsoft.nittsu.co.in:8185/NEIN</h4>" +
							  " <br></body></html>" ;					
					 
					String CCList = getEmailDetails(ini_bid,uemail);
					String bname = getBranchName(ini_bid);

                 if(x != 0){
					if(diffInDays > 30 && !(diffInDays > 45)){
						//System.out.println("Remainder For Cartridge Cheque Details");
				    	new NormalMail().sendMail("NEIN-C2IT",uemail,CCList,body , "NEIN-C2IT: Pending Cartridge Cheque details Reminder");
						}
					if(diffInDays > 45){
						String CCList1 =CCList;
					    //	System.out.println("Remainder For Cartridge Cheque Details");
				    	new NormalMail().sendMail("NEIN-C2IT",uemail,CCList1,body , "NEIN-C2IT: Pending Cartridge Cheque details Reminder For "+bname+" Branch");
						}
                 }
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
	    	}
      } catch (SQLException e) {
	      // TODO Auto-generated catch block
	       e.printStackTrace();
       }	
     }
}
private void ReminderForConsumptionCheque() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, ParseException, UnsupportedEncodingException {
	
					Connection con = null;
					Connection2 dbConn = new Connection2();
					con = dbConn.getConnection2();
					
				    Statement st=null;
				    ResultSet rs=null;
					
				    Connection con1 = null;
					Connection2 dbConn1 = new Connection2();
					con1 = dbConn1.getConnection2();
					
				    Statement st1=null;
				    ResultSet rs1=null;
				    
				    String initiatoraa=null,ini_bid=null;
				    String uemail=null;
				    int diffInDays =0; 
				    
					SimpleDateFormat sdf1 = new SimpleDateFormat("yy-MM-dd");
					Calendar c = Calendar.getInstance();
					
					c.setTime(new Date());
					c.add(Calendar.DATE,0); 
					String output1 = sdf1.format(c.getTime());
					String output=null;
		
					Calendar cal = Calendar.getInstance();
				 	cal.setTime(new Date());
				 	boolean TUESDAY = cal.get(Calendar.DAY_OF_WEEK) == Calendar.TUESDAY;
				 	//System.out.println("TUESDAY ::"+TUESDAY);
				 	
				 if(TUESDAY == true){
					  
					String query2 = " SELECT Distinct c.initiatorId,u.user_name,u.branch_id FROM `consumption_report_details` c  "+
		                            " INNER JOIN leavemanagement.user u ON u.emp_id=c.initiatorId ";
			
					st1 = (Statement) con1.createStatement();
					rs1 = st1.executeQuery(query2);
					
					try {
					PreparedStatement statement1 = con.prepareStatement(query2);
					
					rs1 = statement1.executeQuery();
					
					while(rs1.next()){	
						int x=0;
					initiatoraa=rs1.getString("initiatorId");
					ini_bid=rs1.getString("branch_id");
					
					String body =" <html> <body> <p> Dear &nbsp&nbsp"+rs1.getString("user_name")+" <br>"+
								 " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
								 " You have bellow pending Consumption Cheque Details Please update <br><br>";
					
					body=body+" <table border='1'><tr><th colspan='10'>Pending Consumption Cheque Details</th><tr>"+
					          " <tr> <th>Location</th><th>Number</th><th>Relation Number</th><th>ISP NetWork Type</th><th>Month Of Payment</th></tr> ";
					
					String query1 = " SELECT *,b.b_name,u.email,u.user_name FROM `consumption_report_details` c "+
								    " INNER JOIN branch_master b ON b.id=c.branchid "+
								    " INNER JOIN leavemanagement.user u ON u.emp_id=c.initiatorId "+
								    " WHERE c.initiatorId='"+initiatoraa+"' AND c.status='Pending'";
		
		
		        st = (Statement) con.createStatement();
				rs = st.executeQuery(query1);
				  
			try {
				PreparedStatement statement = con.prepareStatement(query1);
			
				rs = statement.executeQuery();
				while(rs.next()){
					x=x+1;
					output	 =rs.getString("invoicedate");
                 uemail=rs.getString("email");
                 
                 
                 SimpleDateFormat df = new SimpleDateFormat("yy-MM-dd");
					Date startDate = df.parse(output);
					Date enddate = df.parse(output1);
					
					diffInDays = (int)( (enddate.getTime() - startDate.getTime())/ (1000 * 60 * 60 * 24) );
					
					
					body=body+" <tr> <td>"+rs.getString("b_name")+"</td> <td>"+rs.getString("number")+"</td> "+
			                  " <td>"+rs.getString("relationnumber")+"</td><td>"+rs.getString("isptype")+"</td><td>"+rs.getString("monthofpayment")+"</td></tr>";

			       }
					body=body+"</table> <br>";
					
					body=body+" <h4>https://ninsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h4><br>" +
						      " <h4>https://neinsoft.nittsu.co.in:8185/NEIN</h4>" +
							  " <br></body></html>" ;		
					
					String CCList = getEmailDetails(ini_bid,uemail);
					String bname = getBranchName(ini_bid);
					
					if(x !=0 ){
					if(diffInDays > 30 && !(diffInDays > 45)){
						//System.out.println("Remainder For Consumption Cheque Details");
				    	new NormalMail().sendMail("NEIN-C2IT",uemail,CCList,body , "NEIN-C2IT: Pending Consumption Cheque details Reminder");
						}
					if(diffInDays > 45){
						String CCList1 =CCList;
						//System.out.println("Remainder For Consumption Cheque Details");
				    	new NormalMail().sendMail("NEIN-C2IT",uemail,CCList1,body , "NEIN-C2IT: Pending Consumption Cheque details Reminder For "+bname+" Branch");
						}
					}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
     }
}
private void ReminderForMplsCheque() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, ParseException, UnsupportedEncodingException {
	
		Connection con = null;
		Connection2 dbConn = new Connection2();
		con = dbConn.getConnection2();
		
	    Statement st=null;
	    ResultSet rs=null;
	    
	    Connection con1 = null;
		Connection2 dbConn1 = new Connection2();
		con1 = dbConn1.getConnection2();
		
	    Statement st1=null;
	    ResultSet rs1=null;
	    
	    String initiatoraa=null,ini_bid=null;
	    String uemail=null;
	    int diffInDays =0; 
		
		SimpleDateFormat sdf1 = new SimpleDateFormat("yy-MM-dd");
		Calendar c = Calendar.getInstance();
		
		c.setTime(new Date());
		c.add(Calendar.DATE,0); 
		String output1 = sdf1.format(c.getTime());
		String output=null;
		
		Calendar cal = Calendar.getInstance();
	 	cal.setTime(new Date());
	 	boolean TUESDAY = cal.get(Calendar.DAY_OF_WEEK) == Calendar.TUESDAY;
	 	//System.out.println("TUESDAY ::"+TUESDAY);
	 	
	 if(TUESDAY == true){
		String query2 = " SELECT Distinct c.emp_id,u.user_name,u.branch_id FROM `mpls_details` c  "+
                     " INNER JOIN leavemanagement.user u ON u.emp_id=c.emp_id ";

			st1 = (Statement) con1.createStatement();
			rs1 = st1.executeQuery(query2);
			
			try {
			PreparedStatement statement1 = con.prepareStatement(query2);
			
			rs1 = statement1.executeQuery();
			
			while(rs1.next()){
				int x=0;
			initiatoraa=rs1.getString("emp_id");
			ini_bid=rs1.getString("branch_id");
			
			String body =" <html> <body> <p> Dear &nbsp&nbsp"+rs1.getString("user_name")+" <br>"+
						 " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
						 " You have bellow pending Mpls Cheque Details Please update <br><br>";
			
			body=body+" <table border='1'><tr><th colspan='10'>Pending Mpls Cheque Details</th><tr>"+
			          " <tr> <th>Location</th><th>circuit Id</th><th>Bandwidth</th><th>Bill Reference No</th>"+
			          " <th>Bill Date</th><th>Total Payment Amount</th></tr> ";

	
	    String query = " SELECT c.`mpls_id`,c.`circuit_Id`,c.`bandwidth`,c.`bill_refno`,c.`bill_date`,c.`bill_fdate`, "+
				       " c.`bill_tdate`,c.`total_pay_amt`,b.b_name,u.full_name,u.`email`,c.`created_date` FROM `mpls_details` c "+
				       " INNER JOIN `csdb`.`branch_master` b ON b.id=c.`branch_id` "+ 
				       " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`emp_id` "+
				       " WHERE c.`emp_id`='"+initiatoraa+"' AND (`cheque_date`='' OR `cheque_no`='' OR `invoice_file` NOT LIKE '%.%') ";

			try {
				st = (Statement) con.createStatement();
	            rs = st.executeQuery(query);
	            
				while(rs.next()){
					x=x+1;
					output	 =rs.getString("created_date");
                 uemail=rs.getString("email");
                 
                 
                 SimpleDateFormat df = new SimpleDateFormat("yy-MM-dd");
					Date startDate = df.parse(output);
					Date enddate = df.parse(output1);
					
					diffInDays = (int)( (enddate.getTime() - startDate.getTime())/ (1000 * 60 * 60 * 24) );
					
					body=body+" <tr> <td>"+rs.getString("b_name")+"</td> <td>"+rs.getString("circuit_Id")+"</td> "+
			                  " <td>"+rs.getString("bandwidth")+"</td><td>"+rs.getString("bill_refno")+"</td>"+
			                  " <td>"+rs.getString("bill_date")+"</td><td>"+rs.getString("total_pay_amt")+"</td></tr>";

			       }
					body=body+"</table> <br>";
					
					body=body+" <h4>https://ninsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h4><br>" +
						      " <h4>https://neinsoft.nittsu.co.in:8185/NEIN</h4>" +
							  " <br></body></html>";
								
					String CCList = getEmailDetails(ini_bid,uemail);
					String bname = getBranchName(ini_bid);
					
					if(x != 0){
					if(diffInDays > 30 && !(diffInDays > 35)){
						//System.out.println("Remainder For Mpls Cheque Details");
				    	new NormalMail().sendMail("NEIN-C2IT",uemail,CCList,body , "NEIN-C2IT: Pending Mpls Cheque details Reminder");
						}
					if(diffInDays > 35){
						String CCList1 =CCList;
						//System.out.println("Remainder For Mpls Cheque Details");
				    	new NormalMail().sendMail("NEIN-C2IT",uemail,CCList,body , "NEIN-C2IT: Pending Mpls Cheque details Reminder For "+bname+" Branch");
						}
					}
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace(); 
			}
			}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace(); 
			}	
     }
}
private void ReminderForPaymentCheque() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, ParseException, UnsupportedEncodingException {
	
		Connection con = null;
		Connection2 dbConn = new Connection2();
		con = dbConn.getConnection2();
		
	    Statement st=null;
	    ResultSet rs=null;
	    
	    Connection con1 = null;
		Connection2 dbConn1 = new Connection2();
		con1 = dbConn1.getConnection2();
		
	    Statement st1=null;
	    ResultSet rs1=null;
	    
	    String initiatoraa=null,ini_bid=null;
	    String uemail=null;
	    int diffInDays =0;
	    
		SimpleDateFormat sdf1 = new SimpleDateFormat("yy-MM-dd");
		Calendar c = Calendar.getInstance();
		
		c.setTime(new Date());
		c.add(Calendar.DATE,0); 
		String output1 = sdf1.format(c.getTime());
		String output=null;

		Calendar cal = Calendar.getInstance();
	 	cal.setTime(new Date());
	 	boolean TUESDAY = cal.get(Calendar.DAY_OF_WEEK) == Calendar.TUESDAY;
	 	//System.out.println("TUESDAY ::"+TUESDAY);
	 	
	 if(TUESDAY == true){
		String query2 = " SELECT Distinct c.initiator,u.user_name,u.branch_id FROM `procurement_payment` c  "+
		                " INNER JOIN leavemanagement.user u ON u.emp_id=c.initiator ";
		
		st1 = (Statement) con1.createStatement();
		rs1 = st1.executeQuery(query2);
		
		try {
		PreparedStatement statement1 = con.prepareStatement(query2);
		
		rs1 = statement1.executeQuery();
		
		while(rs1.next()){
			int x=0;
		initiatoraa=rs1.getString("initiator");
		ini_bid=rs1.getString("branch_id");
		
		String body =" <html> <body> <p> Dear &nbsp&nbsp"+rs1.getString("user_name")+" <br>"+
				     " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
				     " You have bellow pending Payment Cheque Details Please update <br><br>";
		
		body=body+" <table border='1'><tr><th colspan='10'>Pending Payment Cheque Details</th><tr>"+
			      " <tr> <th>Location</th><th>PO Number</th><th>Item Name</th><th>Quantity</th>"+
			      " <th>Total Amount</th></tr> ";

     String query = " SELECT c.id,c.po_number,c.item_name,c.quantity,c.total_amt,b.b_name,u.full_name,u.email,c.`created_date` FROM `procurement_payment` c"+
				       " INNER JOIN `csdb`.`branch_master` b ON b.id=c.`branchId` "+ 
				       " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`initiator` "+
				       " WHERE c.`initiator`='"+initiatoraa+"' AND (`cheque_no`='' OR `payment_date`='' )";

		try {
			st = (Statement) con.createStatement();
         rs = st.executeQuery(query);
         
			while(rs.next()){
				x=x+1;
				 output	 =rs.getString("created_date");
				 uemail=rs.getString("email");
				 
				 
				    SimpleDateFormat df = new SimpleDateFormat("yy-MM-dd");
					Date startDate = df.parse(output);
					Date enddate = df.parse(output1);
					
				    diffInDays = (int)( (enddate.getTime() - startDate.getTime())/ (1000 * 60 * 60 * 24) );
					
					
					body=body+" <tr> <td>"+rs.getString("b_name")+"</td> <td>"+rs.getString("po_number")+"</td> "+
			                  " <td>"+rs.getString("item_name")+"</td><td>"+rs.getString("quantity")+"</td>"+
			                  " <td>"+rs.getString("total_amt")+"</td></tr>";

			       }
					body=body+"</table> <br>";
					
					body=body+" <h4>https://ninsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h4><br>" +
						      " <h4>https://neinsoft.nittsu.co.in:8185/NEIN</h4>" +
							  " <br></body></html>";
							
					String CCList = getEmailDetails(ini_bid,uemail);
					String bname = getBranchName(ini_bid);
				
				if(x != 0){
				if(diffInDays > 30 && !(diffInDays > 45)){
					//System.out.println("Remainder For Procurement Payment Cheque Details");
			    	new NormalMail().sendMail("NEIN-C2IT",uemail,CCList,body , "NEIN-C2IT: Pending Procurement Payment Cheque details Reminder");
					}
				if(diffInDays > 45){
					String CCList1 =CCList;
					//System.out.println("Remainder For Procurement Payment Cheque Details");
			    	new NormalMail().sendMail("NEIN-C2IT",uemail,CCList1,body , "NEIN-C2IT: Pending Procurement Payment Cheque details Reminder For "+bname+" Branch");
					}
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace(); 
		}
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace(); 
		}	
 }
}
private void ReminderForPaymentInvoice() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, ParseException, UnsupportedEncodingException {
	
	
	Connection con = null;
	Connection2 dbConn = new Connection2();
	con = dbConn.getConnection2();
	
 Statement st=null;
 ResultSet rs=null;
 
 Connection con1 = null;
	Connection2 dbConn1 = new Connection2();
	con1 = dbConn1.getConnection2();
	
 Statement st1=null;
 ResultSet rs1=null;
 
 String initiatoraa=null,ini_bid=null;
 String uemail=null;
 int diffInDays =0;
	
	SimpleDateFormat sdf1 = new SimpleDateFormat("yy-MM-dd");
	Calendar c = Calendar.getInstance();
	
	c.setTime(new Date());
	c.add(Calendar.DATE,0); 
	String output1 = sdf1.format(c.getTime());
	String output=null;
	
	Calendar cal = Calendar.getInstance();
	cal.setTime(new Date());
	boolean TUESDAY = cal.get(Calendar.DAY_OF_WEEK) == Calendar.TUESDAY;
	//System.out.println("TUESDAY ::"+TUESDAY);
	
if(TUESDAY == true){
			String query2 = " SELECT Distinct c.initiator,u.user_name,u.branch_id FROM `procurement_payment` c  "+
				            " INNER JOIN leavemanagement.user u ON u.emp_id=c.initiator ";
				
				st1 = (Statement) con1.createStatement();
				rs1 = st1.executeQuery(query2);
				
			try {
				PreparedStatement statement1 = con.prepareStatement(query2);
				
				rs1 = statement1.executeQuery();
				
			while(rs1.next()){	
				int x=0;
				initiatoraa=rs1.getString("initiator");
				ini_bid=rs1.getString("branch_id");
				
				String body =" <html> <body> <p> Dear &nbsp&nbsp"+rs1.getString("user_name")+" <br>"+
							 " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
							 " You have bellow pending Payment Invoice Details Please update <br><br>";
				
				body=body+" <table border='1'><tr><th colspan='10'>Pending Payment Invoice Details</th><tr>"+
					   	  " <tr> <th>Location</th><th>PO Number</th><th>Item Name</th><th>Quantity</th>"+
						  " <th>Total Amount</th></tr> ";

	    String query = " SELECT c.id,c.po_number,c.item_name,c.quantity,c.total_amt,b.b_name,u.full_name,u.email,c.`created_date` FROM `procurement_payment` c"+
				       " INNER JOIN `csdb`.`branch_master` b ON b.id=c.`branchId` "+ 
				       " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`initiator` "+
				       " WHERE c.`initiator`='"+initiatoraa+"' AND (`delivery_date`='' OR `bill_no`='' OR `bill_date`='' OR `file_path` NOT LIKE '%.%') ";

	try {
		st = (Statement) con.createStatement();
     
     rs = st.executeQuery(query);
      
		while(rs.next()){			
			x=x+1;
			output	 =rs.getString("created_date");
			uemail=rs.getString("email");
			
			
			SimpleDateFormat df = new SimpleDateFormat("yy-MM-dd");
			Date startDate = df.parse(output);
			Date enddate = df.parse(output1);			
		    diffInDays = (int)( (enddate.getTime() - startDate.getTime())/ (1000 * 60 * 60 * 24) );
			
			
			body=body+" <tr> <td>"+rs.getString("b_name")+"</td> <td>"+rs.getString("po_number")+"</td> "+
	                  " <td>"+rs.getString("item_name")+"</td><td>"+rs.getString("quantity")+"</td>"+
	                  " <td>"+rs.getString("total_amt")+"</td></tr>";

	       }
		
			body=body+"</table> <br>";
			
			body=body+" <h4>https://ninsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h4><br>" +
				      " <h4>https://neinsoft.nittsu.co.in:8185/NEIN</h4>" +
					  " <br></body></html>";
					
			String CCList = getEmailDetails(ini_bid,uemail);
			String bname = getBranchName(ini_bid);
		    
		if(x != 0){
		
			if(diffInDays > 15 && !(diffInDays > 35)){
				//System.out.println("Remainder For Procurement Payment Invoice Details");
		    	new NormalMail().sendMail("NEIN-C2IT",uemail,CCList,body , "NEIN-C2IT: Pending Procurement Payment Invoice details Reminder");
				}
			if(diffInDays > 35){
				String CCList1 =CCList;
			//	System.out.println("Remainder For Procurement Payment Invoice Details");
		    	new NormalMail().sendMail("NEIN-C2IT",uemail,CCList1,body , "NEIN-C2IT: Pending Procurement Payment Invoice details Reminder For "+bname+" Branch");
				}
		}
		
	    } catch (SQLException e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace(); 
	   }
		}
	    } catch (SQLException e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace(); 
	   }	
  }
}

private String getEmailDetails(String ini_bid,String email) throws SQLException{

		Connection con = null;
		Connection2 dbConn = new Connection2();
		con = dbConn.getConnection2();
	
		Statement st=null;
		ResultSet rs=null; 
		String userEmail=email;
	
		String query1 = " SELECT u.email from leavemanagement.user u "+
		                " WHERE u.branch_id='"+ini_bid+"' AND u.department_id='12' "+
		                " AND u.employee_status='yes' AND emp_id not in (2110,2076,2086,2126,2645,1945,2778) ";
		
		
	    st = (Statement) con.createStatement();
		rs = st.executeQuery(query1);
		  
			try {
				PreparedStatement statement = con.prepareStatement(query1);
			
				rs = statement.executeQuery();
				while(rs.next()){ 
					userEmail =userEmail+","+rs.getString("email");  
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
			return userEmail;
	    }

private String getBranchName(String ini_bid) throws SQLException{

	Connection con = null;
	Connection2 dbConn = new Connection2();
	con = dbConn.getConnection2();

	Statement st=null;
	ResultSet rs=null; 
	String branchName=null;

	String query1 = " SELECT `branch_name` FROM leavemanagement.`branchmaster` WHERE `branch_id`='"+ini_bid+"'";
	
	
 st = (Statement) con.createStatement();
	rs = st.executeQuery(query1);
	  
		try {
			PreparedStatement statement = con.prepareStatement(query1);
		
			rs = statement.executeQuery();
			while(rs.next()){ 
				branchName =rs.getString("branch_name");  
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return branchName;
 }
	
}