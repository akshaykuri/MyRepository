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


public class audit_initiator implements Job{

	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		
		try 
 	    {
			 Branches_IT();
				
				  Initiator(); KeyPersons(); uatChanges(); pendingRequest();
				  pendingRequirements(); Development(); HardwareRemainders();
				 
		 
		
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
	
	private void Branches_IT() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, ParseException, UnsupportedEncodingException
	{
		System.out.println("Branch_It");
		String cdate=null;
		Connection con = null;
		Connection2 dbConn = new Connection2();
		con = dbConn.getConnection2();
		
	    Statement st=null;
	    ResultSet rs=null;
	    
	    Connection con1 = null;
		Connection2 dbConn1 = new Connection2();
		con1 = dbConn1.getConnection2();
		
		Connection con2 = null;
		Connection2 dbConn2 = new Connection2();
		con2 = dbConn2.getConnection2();
		
		Connection con3 = null;
		Connection2 dbConn3 = new Connection2();
		con3 = dbConn3.getConnection2();
		Statement st1=null,st2=null,st3=null;
	    ResultSet rs1=null,rs2=null,rs3=null;
	    
	    String body ="";
	    SimpleDateFormat formatter = new SimpleDateFormat("dd/MMM/yyyy");
		Date d1=new Date();
		cdate=formatter.format(d1);
	    String form_no=null,empName=null,empDesg=null,empMail=null,status=null,empid=null,branch=null,initiatorMail=null,i_name=null,i_desg=null,i_empid=null;
	    int x=0;
		int srno=0;
		String idate=null;
		
				try
				    {
					String  query1 =("SELECT * From auditform_item where Status='Initiator'");
					 st = (Statement) con.createStatement();
		                rs1 = st.executeQuery(query1);
						PreparedStatement statement = con.prepareStatement(query1);
						rs1 = statement.executeQuery();
						String CCList = "";
						   
					    while(rs1.next())
						    {
					    	
					    	x=0;
					    	idate=rs1.getString("Date");
					    	SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
					    	Date columnDate=dateFormat.parse(idate);
					    	
					    	Calendar calendar=Calendar.getInstance();
					    	calendar.setTime(columnDate);
					    	calendar.add(Calendar.DAY_OF_YEAR,2);
					    	Date targetDate=calendar.getTime();
					    	Date currentDate=new Date();
					    	
					    	String tdf=dateFormat.format(targetDate);
					    	String cdf=dateFormat.format(currentDate);
					    	
					    	Date tdf1=dateFormat.parse(tdf);
					    	Date cdf1=dateFormat.parse(cdf);
					    	
							/*
							 * System.out.println("the form iniated Date Is"+idate);
							 * System.out.println("The Two Days Added Date Is"+tdf);
							 * System.out.println("The Current  Date Is"+cdf);
							 */

					  if(cdf1.equals(tdf1) || cdf1.after(tdf1)) {
					    		
					    	form_no=rs1.getString("form_no");
					    	
					    
					    
					    	PreparedStatement psmt10=null;
					    	psmt10=con2.prepareStatement("UPDATE `branch_requirements` SET `Status`='Completed',`remarks`='Not Given' WHERE form_no='"+form_no+"' And levelno='00'  And Status='Pending'");
							int b=psmt10.executeUpdate();
					    	}
				    }
				    } catch (SQLException e) 
				    {
					e.printStackTrace();
				    }	
					
		
	}
	
	private void KeyPersons() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, ParseException, UnsupportedEncodingException
	{
		System.out.println("Key Persons");
		String cdate=null;
		Connection con = null;
		Connection2 dbConn = new Connection2();
		con = dbConn.getConnection2();
		
	    Statement st=null;
	    ResultSet rs=null;
	    
	    Connection con1 = null;
		Connection2 dbConn1 = new Connection2();
		con1 = dbConn1.getConnection2();
		
		Connection con2 = null;
		Connection2 dbConn2 = new Connection2();
		con2 = dbConn2.getConnection2();
		
		Connection con3 = null;
		Connection2 dbConn3 = new Connection2();
		con3 = dbConn3.getConnection2();
		Statement st1=null,st2=null,st3=null;
	    ResultSet rs1=null,rs2=null,rs3=null;
	    PostMail postmail=new PostMail();
	    String body ="";
	    SimpleDateFormat formatter = new SimpleDateFormat("dd/MMM/yyyy");
		Date d1=new Date();
		cdate=formatter.format(d1);
	    String form_no=null,empName=null,empDesg=null,empMail=null,status=null,empid=null,branch=null,initiatorMail=null,i_name=null,i_desg=null,i_empid=null;
	    int x=0;
		int srno=0;
		String idate=null;
		
				try
				    {
					String  query1 =("SELECT * From auditform_item where Status='Initiator'");
					 st = (Statement) con.createStatement();
		                rs1 = st.executeQuery(query1);
						PreparedStatement statement = con.prepareStatement(query1);
						rs1 = statement.executeQuery();
						String CCList = "";
						   
					    while(rs1.next())
						    {
					    	
					    	x=0;
					    	form_no=rs1.getString("form_no");
					    	initiatorMail=rs1.getString("Mail");
							/* System.out.println("The form number is"+form_no); */
					    		
					    	String query3=("SELECT * FROM `branch_requirements` where form_no='"+form_no+"' And levelno='01' And Status='Pending'");
					    	st3 = (Statement) con.createStatement();
		                    rs3 = st3.executeQuery(query3);
		    				PreparedStatement statement3 = con.prepareStatement(query3);
		    				rs3 = statement3.executeQuery();
		    				while(rs3.next()) {
		    					
		    					idate=rs3.getString("Date");
		    					SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
						    	Date columnDate=dateFormat.parse(idate);
						    	
						    	Calendar calendar=Calendar.getInstance();
						    	calendar.setTime(columnDate);
						    	calendar.add(Calendar.DAY_OF_YEAR,5);
						    	Date targetDate=calendar.getTime();
						    	Date currentDate=new Date();
						    	
						    	String tdf=dateFormat.format(targetDate);
						    	String cdf=dateFormat.format(currentDate);
						    	
						    	Date tdf1=dateFormat.parse(tdf);
						    	Date cdf1=dateFormat.parse(cdf);
						    	
							  if(cdf1.equals(tdf1)) {
								  System.out.println("Key Persons Time Completed"+form_no);
					    
					    	PreparedStatement psmt10=null;
					    	psmt10=con2.prepareStatement("UPDATE `branch_requirements` SET `Status`='Completed',`remarks`='Not Given' WHERE form_no='"+form_no+"' And levelno='01'  And Status='Pending'");
							int b=psmt10.executeUpdate();
					    	
							  body =" <html> <body> <p> Dear Sir,<br>"+
									   " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
									   " These are the requirements given by all branches, Request you to prepare final requirements and upload. <br><br>";
							    	 body=body+" <table border='1' width='600'><tr align='center'><td colspan='9'>REQUIREMENTS FROM BRANCH</td></tr>";
						               
							            body=body+" <tr><td>SrNo</td> <td >Form No</td><td>Branch</td> <td>EmpCode</td> <td>EmpName</td> "+
							                         " <td>EmpDesignation</td><td>remarks</td></tr>";
						   	
										srno=0;
										x=0;
					    	
					    	String  query2 =("SELECT * FROM `branch_requirements` where form_no='"+form_no+"' And levelno='01'");
							st2 = (Statement) con.createStatement();
		                    rs = st2.executeQuery(query2);
		    				PreparedStatement statement1 = con.prepareStatement(query2);
		    				rs = statement1.executeQuery();
		    				while(rs.next())
						        { 
		    					x++;
		    					form_no=rs.getString("form_no");
		    					empName=rs.getString("emp");
		    					empDesg=rs.getString("desg");
		                        branch=rs.getString("Branch");
		                        empid=rs.getString("empid");
		                        empMail=rs.getString("mail");
		                        status=rs.getString("Status");
		                        srno=srno+1;
						        body=body+" <tr> <td>"+srno+"</td><td>"+rs.getString("form_no")+"</td><td>"+rs.getString("Branch")+"</td> <td>"+rs.getString("empid")+"</td> "+
						                  " <td>"+rs.getString("emp")+"</td><td>"+rs.getString("desg")+"</td><td>"+rs.getString("remarks")+"</td></tr>";
						         }
							  }
					    body=body+"</table> <br>";
					    
					    if(x!=0)
				        {
		    	body=body+" <h4>https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h4><br>" +
							       " <br></body></html>" ;	
				      
				      postmail.AuditFormrequirements(empMail,empName,initiatorMail,"","Software Development Request :  " +form_no+ " ",body,form_no);
				      body="";
				        }
					    
					    }
		    				}
				    
				    
				    } catch (SQLException e) 
				    {
					e.printStackTrace();
				    }	
					
		
	}

	
	
	
	
	
	
	
	
	
	private void Initiator() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, ParseException, UnsupportedEncodingException
	{
		/* System.out.println("Audit Java page"); */
		String cdate=null;
		Connection con = null;
		Connection2 dbConn = new Connection2();
		con = dbConn.getConnection2();
		
	    Statement st=null;
	    ResultSet rs=null;
	    
	    Connection con1 = null;
		Connection2 dbConn1 = new Connection2();
		con1 = dbConn1.getConnection2();
		
		Connection con2 = null;
		Connection2 dbConn2 = new Connection2();
		con2 = dbConn2.getConnection2();
		
		Connection con3 = null;
		Connection2 dbConn3 = new Connection2();
		con3 = dbConn3.getConnection2();
		
		PostMail postmail=new PostMail();
		
	    Statement st1=null,st2=null,st3=null;
	    ResultSet rs1=null,rs2=null,rs3=null;
	    String body ="";
	    String count=null,idate=null;
	    SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
		Date d1=new Date();
		cdate=formatter.format(d1);
	    String form_no=null,empName=null,empDesg=null,empMail=null,status=null,empid=null,branch=null,initiatorMail=null,i_name=null,i_desg=null,i_empid=null;
	    int x=0,c=0;
		int srno=0;
		int tc=0;
		
				try
				    {
					String  query1 =("SELECT * FROM `auditform_item` where Status='Initiator'");
					 st = (Statement) con.createStatement();
		                rs1 = st.executeQuery(query1);
						PreparedStatement statement = con.prepareStatement(query1);
						rs1 = statement.executeQuery();
						String CCList = "";
						   
					    while(rs1.next())
						    {
					    	x=0;
					    	form_no=rs1.getString("form_no");
					    	i_name=rs1.getString("emp");
					    	i_desg=rs1.getString("desg");
					    	i_empid=rs1.getString("empid");
					    	initiatorMail=rs1.getString("Mail");
						    idate=rs1.getString("Date");
						    
						    SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
					    	Date columnDate=dateFormat.parse(idate);
					    	
					    	Calendar calendar=Calendar.getInstance();
					    	calendar.setTime(columnDate);
					    	calendar.add(Calendar.DAY_OF_YEAR,7);
					    	Date targetDate=calendar.getTime();
					    	Date currentDate=new Date();
					    	
					    	String tdf=dateFormat.format(targetDate);
					    	String cdf=dateFormat.format(currentDate);
					    	
					    	Date tdf1=dateFormat.parse(tdf);
					    	Date cdf1=dateFormat.parse(cdf);
						   if(cdf1.before(tdf1)) { 
						    
					    String  query3 =("SELECT COUNT(*) FROM `branch_requirements` where form_no='"+form_no+"' And Status='Pending'");
						 st3 = (Statement) con.createStatement();
			                rs3 = st3.executeQuery(query3);
							PreparedStatement statement3 = con.prepareStatement(query3);
							rs3 = statement3.executeQuery();
							
							/* System.out.println("The Value of tc is"+tc); */
						    while(rs3.next())
							    {
						    	count=rs3.getString(1);
						    	c=Integer.parseInt(count);
							    }
					    if(c==1) {
					    	
					    	body =" <html> <body> <p> Dear Sir,<br>"+
									   " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
									   " These are the requirements given by all branches, Request you to prepare final requirements and upload. <br><br>";
							    	 body=body+" <table border='1' width='600'><tr align='center'><td colspan='9'>REQUIREMENTS FROM BRANCH</td></tr>";
						               
							            body=body+" <tr><td>SrNo</td> <td >Form No</td><td>Branch</td> <td>EmpCode</td> <td>EmpName</td> "+
							                         " <td>EmpDesignation</td><td>Requirements</td></tr>";
						   	
										srno=0;
										x=0;
										/* System.out.println("sjdjhsshshjshhjsdhjshsdhjsjjhsd......"); */
					    	String  query2 =("SELECT * FROM `branch_requirements` where form_no='"+form_no+"' And levelno='01'");
							st2 = (Statement) con.createStatement();
		                    rs = st2.executeQuery(query2);
		    				PreparedStatement statement1 = con.prepareStatement(query2);
		    				rs = statement1.executeQuery();
		    				while(rs.next())
						        { 
		    					x++;
		    					form_no=rs.getString("form_no");
		    					empName=rs.getString("emp");
		    					empDesg=rs.getString("desg");
		                        branch=rs.getString("Branch");
		                        empid=rs.getString("empid");
		                        empMail=rs.getString("mail");
		                        status=rs.getString("Status");
		                        srno=srno+1;
						        body=body+" <tr> <td>"+srno+"</td><td>"+rs.getString("form_no")+"</td><td>"+rs.getString("Branch")+"</td> <td>"+rs.getString("empid")+"</td> "+
						                  " <td>"+rs.getString("emp")+"</td><td>"+rs.getString("desg")+"</td><td>"+rs.getString("remarks")+"</td></tr>";
						         }
					    body=body+"</table> <br>";
					    }
					    if(x!=0)
				        {
					    	
					    	PreparedStatement psmt10=null;
					    	psmt10=con2.prepareStatement("UPDATE `branch_requirements` SET `levelno`='02' WHERE form_no='"+form_no+"' And empid='"+i_empid+"' And Status='Pending'");
							int b=psmt10.executeUpdate();

				    	body=body+" <h4>https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h4><br>" +
							       " <br></body></html>" ;	
				      
				      postmail.AuditFormrequirements(empMail,empName,initiatorMail,"","Software Development Request :  " +form_no+ " ",body,form_no);
				      body="";
				        }
					    	
						    }
						    }
						} catch (SQLException e) 
						    {
							e.printStackTrace();
						    }	
						System.out.println("initiator Pending");
			                    
		
	}
	
	private void uatChanges() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, ParseException, UnsupportedEncodingException
	{
		Connection con = null;
		Connection2 dbConn = new Connection2();
		con = dbConn.getConnection2();

		Statement st=null;
		ResultSet rs=null;

		Connection con1 = null;
		Connection2 dbConn1 = new Connection2();
		con1 = dbConn1.getConnection2();

		Statement st1=null,st2=null;
		ResultSet rs1=null;
		
		Connection cn5=null;
		java.sql.Statement st5=null;
		ResultSet rs5=null;
		
		Connection cn6=null;
		ConnectionLMS lmsdb=new ConnectionLMS();
		cn6=lmsdb.getConnectionlms();
		
		
		 java.sql.Statement st6=null;
		ResultSet rs6=null;
		
		String body ="";
		String udate=null;
		String devName=null,devMail=null,form_no=null,uName=null,uDesg=null,uMail=null,Changes=null,uDate=null,formno=null,tomail=null;
		int x=0;
		int srno=0;
				try
				    {
					
					String  query1 = "SELECT timestampdiff(DAY, End_Date, now())as idate,form_no,Developer_Name,Developer_Mail From development_status where Stage='UAT' And Status='Pending'";

					
		            st = (Statement) con.createStatement();
		            rs1 = st.executeQuery(query1);
					PreparedStatement statement = con.prepareStatement(query1);
					rs1 = statement.executeQuery();
					
					cn5=dbConn.getConnection2();
					st5=cn5.createStatement();
					rs5 = st5.executeQuery("SELECT * FROM `branch_it` where Type='Manager'");
					if(rs5.next()) {
						 
                         st6=cn6.createStatement();
                  	   rs6 = st6.executeQuery("SELECT DISTINCT u.user_name,rr.role_code,b.branch_name,b.branch_type_code,d.department_name, m3.user_name AS manager_name,u.email,u.mobile_number FROM user u Inner Join user_role ur on ur.user_id=u.user_id INNER JOIN reporting_officers m1 ON m1.user_id = u.user_id INNER JOIN role rr ON ur.role_id =rr.role_id INNER JOIN branchmaster b ON b.branch_id = u.branch_id INNER JOIN department d ON d.department_id = u.department_id INNER JOIN user m3 ON m3.user_id = m1.manager_id INNER JOIN user m4 ON m4.user_id = m1.manager2_id WHERE ( m1.emp_id ='" + rs5.getString("empid") + "' ) AND u.employee_status = 'yes' ");
                  	     if(rs6.next())
                  	            {
					
					
					
					tomail = rs6.getString("email");
					}
					}
					
					
					
				    while(rs1.next())
					    { 
				    	udate=rs1.getString("idate");
				    	if(udate.equals("1")) {
				    	 body =" <html> <body> <p> Dear Sir,<br>"+
						   " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
						   "These are UAT Changes given by users. Request you to please Approve. <br><br>";
		                body=body+" <table border='1' width='600'><tr align='center'><td colspan='9'>UAT SUGGESTIONS</td></tr>";
			               
			            body=body+" <tr><td>SrNo</td> <td >Form No</td><td>EmpName</td> "+
			                         " <td>EmpDesignation</td><td>EmpMail</td><td>Suggestions/feedback</td><td>Date</td></tr>";
		   	
						srno=0;
						x=0;
						form_no=rs1.getString("Form_no");
						devName=rs1.getString("Developer_Name");
						devMail=rs1.getString("Developer_Mail");
		                //System.out.println("#######################################################################################################");
		                //System.out.println("Pending person :"+ganame1);
		                //System.out.println("Pending person :"+gamail1);
		                
					    String  query2 ="SELECT * FROM `uat_changes`  where form_no='"+form_no+"'";

		                st2 = (Statement) con.createStatement();
		                rs = st2.executeQuery(query2);
						PreparedStatement statement1 = con.prepareStatement(query2);
						rs = statement1.executeQuery();
						while(rs.next())
					        { 
							x++;
							formno=rs.getString("form_no");
							uName=rs.getString("empname");
							uDesg=rs.getString("empdesg");
							uMail=rs.getString("empmail");
							Changes=rs.getString("Changes");
							uDate=rs.getString("Date");
		                   
		                 
		                    srno=srno+1;
					        body=body+" <tr> <td>"+srno+"</td><td>"+rs.getString("form_no")+"</td>"+
					                  " <td>"+rs.getString("empname")+"</td><td>"+rs.getString("empdesg")+"</td><td>"+rs.getString("empmail")+"</td><td>"+rs.getString("Changes")+"</td><td>"+rs.getString("Date")+"</td></tr>";
					         }
						body=body+"</table> <br>";
				    	}
				    	
				    if(x>=0)
				        {
				    	PreparedStatement psmt2=null;
				    	psmt2=con1.prepareStatement("UPDATE `development_status` SET `Status`='Completed',remarks='Completed' WHERE form_no='"+form_no+"' AND Stage='UAT'");
				        int e=psmt2.executeUpdate();
				        
				        PreparedStatement psmt3=null;
				        psmt3=con1.prepareStatement("UPDATE auditform_item SET levelno='105' WHERE form_no='"+form_no+"' And levelno='104'");
				        int g=psmt3.executeUpdate();
				        }
				    	if(x==0) {
				    		new NormalMail().sendMail("UAT-SUGGESTIONS",tomail,devMail,"<p> Dear Sir,<br>There is no UAT Suggestion Or Feedback for form number <b>"+form_no+"</b> please  Proceed With Version Management.", "NEIN-C2IT: UAT Changes");
				    	}
				        if(x!=0) {
				    	body=body+" <h4>https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h4><br>" +
							       " <br></body></html>" ;	
				        new NormalMail().sendMail("UAT-SUGGESTIONS",tomail,devMail,body , "NEIN-C2IT: UAT Changes");
				        body="";
				        } 
				    x=0;
					}
				
				} catch (SQLException e) 
				    {
					e.printStackTrace();
				    }
				System.out.println("UAT Changes");
		}
	private void pendingRequirements() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, ParseException, UnsupportedEncodingException
	{
		Connection con = null;
		Connection2 dbConn = new Connection2();
		con = dbConn.getConnection2();

		Statement st=null;
		ResultSet rs=null;

		Connection con1 = null;
		Connection2 dbConn1 = new Connection2();
		con1 = dbConn1.getConnection2();

		Statement st1=null,st2=null;
		ResultSet rs1=null;
		String body ="";
		String form_no=null,mail,name=null,designation=null,empid=null,empname=null,empmail=null,i_name=null,i_branch=null;
		int x=0,srno=0;
		try
	    {
		
		String  query1 = "SELECT DISTINCT emp,Mail FROM `auditform_item` WHERE Status='Pending' And levelno NOT BETWEEN 99 AND 109";

		
        st = (Statement) con.createStatement();
        rs1 = st.executeQuery(query1);
		PreparedStatement statement = con.prepareStatement(query1);
		rs1 = statement.executeQuery();
		
		String CCList="";
		
		/*String tomail = "neinsoft.support@nipponexpress.com";*/
	    while(rs1.next())
		    { 
	    	 body =" <html> <body> <p> Dear Sir,<br>"+
			   " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
			   "The Development Form is Pending with you,request you to please approve.<br><br>";
            body=body+" <table border='1' width='600'><tr align='center'><td colspan='9'>Pending</td></tr>";
               
            body=body+" <tr><td>SrNo</td><td>Branch</td> <td >Form No</td><td>EmpID</td><td>EmpName</td> "+
                         " <td>EmpDesignation</td><td>Initiated By</td>";
            x=0;srno=0;
            
		empname=rs1.getString("emp");
		empmail=rs1.getString("Mail");
		String  query2 ="SELECT a.form_no,a.emp,a.desg,a.Mail,a.empid,b.empname,b.branch From auditform_item a INNER join audit_form b on a.form_no=b.form_no where a.Status='Pending' And a.emp='"+empname+"' And a.Mail='"+empmail+"' ";
		st2 = (Statement) con.createStatement();
        rs = st2.executeQuery(query2);
		PreparedStatement statement1 = con.prepareStatement(query2);
		rs = statement1.executeQuery();
		while(rs.next())
	        { 
			x++;
			form_no=rs.getString("form_no");
			name=rs.getString("emp");
			designation=rs.getString("desg");
			empid=rs.getString("empid");
			i_name=rs.getString("empname");
			i_branch=rs.getString("branch");
			
			 srno=srno+1;
		        body=body+" <tr> <td>"+srno+"</td><td>"+rs.getString("form_no")+"</td><td>"+rs.getString("branch")+"</td> <td>"+rs.getString("empid")+"</td> "+
		                  " <td>"+rs.getString("emp")+"</td><td>"+rs.getString("desg")+"</td><td>"+rs.getString("empname")+"</td></tr>";
		         }
	    body=body+"</table> <br>";
	    if(x!=0)
	        {
	        body=body+" <h4>https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h4><br>" +
				       " <br></body></html>" ;	
	        new NormalMail().sendMail("Audit_Form",empmail,CCList,body , "NEIN-C2IT: Pending request Form Reminder");
	        body="";
	        }  
		}
	
	} catch (SQLException e) 
	    {
		e.printStackTrace();
	    }	
		/*
		 * System.out.
		 * println("######################################## AUDIT ###############################################################"
		 * );
		 */
}
	
	private void pendingRequest() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, ParseException, UnsupportedEncodingException
	{
		Connection con = null;
		Connection2 dbConn = new Connection2();
		con = dbConn.getConnection2();

		Statement st=null;
		ResultSet rs=null;

		Connection con1 = null;
		Connection2 dbConn1 = new Connection2();
		con1 = dbConn1.getConnection2();

		Statement st1=null,st2=null;
		ResultSet rs1=null;
		String body ="";
		String form_no=null,mail,name=null,designation=null,empid=null,empname=null,empmail=null,i_name=null,i_branch=null;
		int x=0,srno=0;
		try
	    {
		
		String  query1 = "SELECT DISTINCT emp,mail FROM `branch_requirements` WHERE Status='Pending' And levelno IS NOT NULL";

		
        st = (Statement) con.createStatement();
        rs1 = st.executeQuery(query1);
		PreparedStatement statement = con.prepareStatement(query1);
		rs1 = statement.executeQuery();
		
		String CCList="";
		
		/*String tomail = "neinsoft.support@nipponexpress.com";*/
	    while(rs1.next())
		    { 
	    	 body =" <html> <body> <p> Dear Sir,<br>"+
			   " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
			   "The Development Form is Pending with you,request you to complete Requirements Process.<br><br>";
            body=body+" <table border='1' width='600'><tr align='center'><td colspan='9'>Pending</td></tr>";
               
            body=body+" <tr><td>SrNo</td><td>Branch</td> <td >Form No</td><td>EmpID</td><td>EmpName</td> "+
                         " <td>EmpDesignation</td><td>Initiated By</td>";
            x=0;srno=0;
            
		empname=rs1.getString("emp");
		empmail=rs1.getString("Mail");
		String  query2 ="SELECT a.form_no,a.emp,a.desg,a.mail,a.empid,b.empname,b.branch From branch_requirements a INNER join audit_form b on a.form_no=b.form_no where a.Status='Pending' And a.emp='"+empname+"' And a.mail='"+empmail+"' and a.levelno is not null ";
		st2 = (Statement) con.createStatement();
        rs = st2.executeQuery(query2);
		PreparedStatement statement1 = con.prepareStatement(query2);
		rs = statement1.executeQuery();
		while(rs.next())
	        { 
			x++;
			form_no=rs.getString("form_no");
			name=rs.getString("emp");
			designation=rs.getString("desg");
			empid=rs.getString("empid");
			i_name=rs.getString("empname");
			i_branch=rs.getString("branch");
			
			 srno=srno+1;
		        body=body+" <tr> <td>"+srno+"</td><td>"+rs.getString("branch")+"</td><td>"+rs.getString("form_no")+"</td> <td>"+rs.getString("empid")+"</td> "+
		                  " <td>"+rs.getString("emp")+"</td><td>"+rs.getString("desg")+"</td><td>"+rs.getString("empname")+"</td></tr>";
		         }
	    body=body+"</table> <br>";
	    if(x!=0)
	        {
	        body=body+" <h4>https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h4><br>" +
				       " <br></body></html>" ;	
	        new NormalMail().sendMail("Audit_Form",empmail,CCList,body , "NEIN-C2IT: Pending request Form Reminder");
	        body="";
	        }  
		}
	
	} catch (SQLException e) 
	    {
		e.printStackTrace();
	    }	
		/*
		 * System.out.
		 * println("######################################## AUDIT REQUIREMENTS ###############################################################"
		 * );
		 */
}
	
	
	private void Development() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, ParseException, UnsupportedEncodingException
	{
		System.out.println("Development");
		Connection con = null;
		Connection2 dbConn = new Connection2();
		con = dbConn.getConnection2();

		Statement st=null;
		ResultSet rs=null;

		Connection con1 = null;
		Connection2 dbConn1 = new Connection2();
		con1 = dbConn1.getConnection2();
		
		Connection cn5=null;
		java.sql.Statement st5=null;
		ResultSet rs5=null;
		
		Connection cn6=null;
		ConnectionLMS lmsdb=new ConnectionLMS();
		cn6=lmsdb.getConnectionlms();
		
		
		 java.sql.Statement st6=null;
		ResultSet rs6=null;
		

		Statement st1=null,st2=null;
		ResultSet rs1=null;
		String body ="",body1="";
		String form_no=null,mail=null,name=null,Stage=null,Start_Date=null,End_Date=null;
		String form_no1=null,mail1=null,name1=null,Stage1=null,Start_Date1=null,End_Date1=null;
		int x=0,y=0,srno=0;
		try
	    {
		
		String  query1 = "SELECT * FROM `development_status` where Status='Pending' ";

		
        st = (Statement) con.createStatement();
        rs1 = st.executeQuery(query1);
		PreparedStatement statement = con.prepareStatement(query1);
		rs1 = statement.executeQuery();
		
		
		
		
		
		
		String CCList="";
		
	    while(rs1.next())
	    {
	    	x++;
	    	 
            
           form_no=rs1.getString("Form_no");
           name=rs1.getString("Developer_Name");
           mail=rs1.getString("Developer_Mail");
           Stage=rs1.getString("Stage");
           Start_Date=rs1.getString("Start_Date");
           End_Date=rs1.getString("End_Date");
           srno=srno+1;
           
           
           SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
	    	Date columnDate=dateFormat.parse(End_Date);
	    	
	    	Calendar calendar=Calendar.getInstance();
	    	calendar.setTime(columnDate);
	    	calendar.add(Calendar.DAY_OF_YEAR,-5);
	    	Date targetDate=calendar.getTime();
	    	Date currentDate=new Date();
	    	
	    	String tdf=dateFormat.format(targetDate);
	    	String cdf=dateFormat.format(currentDate);
	    	
	    	Date tdf1=dateFormat.parse(tdf);
	    	Date cdf1=dateFormat.parse(cdf);
           
           if(tdf1.equals(cdf1)) {
        	   body =" <html> <body> <p> Dear Sir,<br>"+
        			   " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
        			   "The Project your developing is near completion date, Please Complete within given date. <br><br>";
        	     body=body+" <table border='1' width='600'><tr align='center'><td colspan='9'>Pending</td></tr>";
        	        
        	     body=body+" <tr><td>SrNo</td><td >Form No</td><td>DeveloperName</td> "+
        	                  " <td>DeveloperMail</td><td>Stage</td><td>Start Date</td><td>Completion Date</td>";
	        body=body+" <tr> <td>"+srno+"</td><td>"+rs1.getString("Form_no")+"</td><td>"+rs1.getString("Developer_Name")+"</td> <td>"+rs1.getString("Developer_Mail")+"</td> "+
	                  " <td>"+rs1.getString("Stage")+"</td><td>"+rs1.getString("Start_Date")+"</td><td>"+rs1.getString("End_Date")+"</td></tr>";
		
	    
	    
	    body=body+"</table> <br>";
	    if(x!=0){
	    	body=body+" <h4>https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h4><br>" +
		       " <br></body></html>" ;	
 new NormalMail().sendMail("Audit_Form",mail,CCList,body , "Software Development Status");
 
  
	    	
	    }
           }
           body="";
	    }
	    
	    srno=0;
	   
	    cn5=dbConn.getConnection2();
		st5=cn5.createStatement();
		rs5 = st5.executeQuery("SELECT * FROM `branch_it` where Type='Manager'");
		if(rs5.next()) {
			 
             st6=cn6.createStatement();
      	   rs6 = st6.executeQuery("SELECT DISTINCT u.user_name,rr.role_code,b.branch_name,b.branch_type_code,d.department_name, m3.user_name AS manager_name,u.email,u.mobile_number FROM user u Inner Join user_role ur on ur.user_id=u.user_id INNER JOIN reporting_officers m1 ON m1.user_id = u.user_id INNER JOIN role rr ON ur.role_id =rr.role_id INNER JOIN branchmaster b ON b.branch_id = u.branch_id INNER JOIN department d ON d.department_id = u.department_id INNER JOIN user m3 ON m3.user_id = m1.manager_id INNER JOIN user m4 ON m4.user_id = m1.manager2_id WHERE ( m1.emp_id ='" + rs5.getString("empid") + "' ) AND u.employee_status = 'yes' ");
      	     if(rs6.next())
      	            {
		
		
		
      	    	CCList = rs6.getString("email");
		}
		}
	    
	    
	    
	    
		String  query2 ="SELECT * FROM `development_status` WHERE Status='Pending'";
		st2 = (Statement) con.createStatement();
        rs = st2.executeQuery(query2);
		PreparedStatement statement1 = con.prepareStatement(query2);
		rs = statement1.executeQuery();
		while(rs.next()){
		y++;
   	 
       
      form_no=rs.getString("Form_no");
      name=rs.getString("Developer_Name");
      mail=rs.getString("Developer_Mail");
      Stage=rs.getString("Stage");
      Start_Date=rs.getString("Start_Date");
      End_Date=rs.getString("End_Date");
      srno=srno+1;
      
      SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
      Date columnDate=dateFormat.parse(End_Date);	
	  System.out.println("The initiated Date for development"+columnDate);
	  Date currentDate=new Date();
	  if(currentDate.after(columnDate)) {
		  System.out.println("Yes");
		  body1 =" <html> <body> <p> Dear Sir,<br>"+
				   " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
				   "The date you given is completed,request you login through application and give reasons for not completing.<br><br>";
		    body1=body1+" <table border='1' width='600'><tr align='center'><td colspan='9'>Pending</td></tr>";
		       
		    body1=body1+" <tr><td>SrNo</td><td >Form No</td><td>DeveloperName</td> "+
		                 " <td>DeveloperMail</td><td>Stage</td><td>Start Date</td><td>Completion Date</td>";
       body1=body1+" <tr> <td>"+srno+"</td><td>"+rs.getString("Form_no")+"</td><td>"+rs.getString("Developer_Name")+"</td> <td>"+rs.getString("Developer_Mail")+"</td> "+
                 " <td>"+rs.getString("Stage")+"</td><td>"+rs.getString("Start_Date")+"</td><td>"+rs.getString("End_Date")+"</td></tr>";
	
		
       body1=body1+"</table> <br>";
	    
	    if(y!=0)
	        {
	        body1=body1+" <h4>https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h4><br>" +
				       " <br></body></html>" ;	
	        new NormalMail().sendMail("Audit_Form",mail,CCList,body1 , "NEIN-C2IT: Pending request Form Reminder");
	        
	        } 
	  }
	  body1="";
		}
		
	
		
		
	
	} catch (SQLException e) 
	    {
		e.printStackTrace();
	    }	
	System.out.println("######################################## AUDIT REQUIREMENTS ###############################################################");
}
	
	
	
	private void HardwareRemainders() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, ParseException, UnsupportedEncodingException
	{
		System.out.println("Hardware remainders");
		Connection con = null;
		Connection2 dbConn = new Connection2();
		con = dbConn.getConnection2();

		Statement st=null;
		ResultSet rs=null;

		Connection con1 = null;
		Connection2 dbConn1 = new Connection2();
		con1 = dbConn1.getConnection2();
		
		Connection cn5=null;
		java.sql.Statement st5=null;
		ResultSet rs5=null;
		
		Connection cn6=null;
		ConnectionLMS lmsdb=new ConnectionLMS();
		cn6=lmsdb.getConnectionlms();
		
		
		 java.sql.Statement st6=null;
		ResultSet rs6=null;

		Statement st1=null,st2=null;
		ResultSet rs1=null;
		String body ="",body1="";
		String form_no=null,mail=null,name=null,Stage=null,Start_Date=null,End_Date=null,CCList=null;
		String form_no1=null,mail1=null,name1=null,Stage1=null,Start_Date1=null,End_Date1=null;
		int x=0,y=0,srno=0;
		try
	    {
		
		String  query1 = "SELECT a.form_no,b.emp,b.Mail,c.Stage,c.Start_Date,c.Completion_Date FROM `auditform_item` b INNER join audit_form a on a.form_no=b.form_no  INNER JOIN audit_hardware_flow  c on b.form_no=c.form_no where a.type='Hardware' And b.Status='Pending' and c.Status='Pending' ";

		
        st = (Statement) con.createStatement();
        rs1 = st.executeQuery(query1);
		PreparedStatement statement = con.prepareStatement(query1);
		rs1 = statement.executeQuery();
		
		cn5=dbConn.getConnection2();
		st5=cn5.createStatement();
		rs5 = st5.executeQuery("SELECT * FROM `branch_it` where Type='Manager'");
		if(rs5.next()) {
			 
             st6=cn6.createStatement();
      	   rs6 = st6.executeQuery("SELECT DISTINCT u.user_name,rr.role_code,b.branch_name,b.branch_type_code,d.department_name, m3.user_name AS manager_name,u.email,u.mobile_number FROM user u Inner Join user_role ur on ur.user_id=u.user_id INNER JOIN reporting_officers m1 ON m1.user_id = u.user_id INNER JOIN role rr ON ur.role_id =rr.role_id INNER JOIN branchmaster b ON b.branch_id = u.branch_id INNER JOIN department d ON d.department_id = u.department_id INNER JOIN user m3 ON m3.user_id = m1.manager_id INNER JOIN user m4 ON m4.user_id = m1.manager2_id WHERE ( m1.emp_id ='" + rs5.getString("empid") + "' ) AND u.employee_status = 'yes' ");
      	     if(rs6.next())
      	            {
		
		
		
      	    	CCList = rs6.getString("email");
		}
		}
		
	    while(rs1.next())
	    {
	    	x++;
	    	 
            
           form_no=rs1.getString("form_no");
           name=rs1.getString("emp");
           mail=rs1.getString("Mail");
           Stage=rs1.getString("Stage");
           Start_Date=rs1.getString("Start_Date");
           End_Date=rs1.getString("Completion_Date");
           srno=srno+1;
           
         
      
           SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
           Date columnDate=dateFormat.parse(End_Date);	
     	  System.out.println("The initiated Date for development"+columnDate);
     	  Date currentDate=new Date();
	  if(currentDate.after(columnDate)) {
		  body1 =" <html> <body> <p> Dear Sir,<br>"+
				   " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
				   "The date you given is completed,request you login through application and give reasons for not completing.<br><br>";
    body1=body1+" <table border='1' width='600'><tr align='center'><td colspan='9'>Pending</td></tr>";
       
    body1=body1+" <tr><td>SrNo</td><td >Form No</td><td>AdminName</td> "+
                 " <td>AdminMail</td><td>Stage</td><td>Start Date</td><td>Completion Date</td>";
		  System.out.println("task Completion date completed form"+form_no);
      
       body1=body1+" <tr> <td>"+srno+"</td><td>"+rs1.getString("form_no")+"</td><td>"+rs1.getString("emp")+"</td> <td>"+rs1.getString("Mail")+"</td> "+
                 " <td>"+rs1.getString("Stage")+"</td><td>"+rs1.getString("Start_Date")+"</td><td>"+rs1.getString("Completion_Date")+"</td></tr>";
	
		
	    body1=body1+"</table> <br>";
	    
	    if(x!=0)
	        {
	        body1=body1+" <h4>https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h4><br>" +
				       " <br></body></html>" ;	
	        new NormalMail().sendMail("Hardware Request",mail,CCList,body1 , "NEIN-C2IT: Pending request Form Reminder");
	        body1="";
	        } 
	  }
		}
		srno=0;
		
	
	} catch (SQLException e) 
	    {
		e.printStackTrace();
	    }	
	System.out.println("######################################## AUDIT REQUIREMENTS ###############################################################");
}
	
		
	}


