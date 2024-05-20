
package CON2;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;


import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.mysql.jdbc.Statement;

public class ReminderC2ITApplicationForm_Job implements Job
     {

	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException 
	     {
	 	 try 
	 	    {
	 		ReminderForApplicationForms();
				/*
				 * ReminderForLotusNotes(); ReminderForAccessCard(); ReminderForDomain(); //
				 * ReminderForLotusTraveler(); ReminderForShairedFloder();
				 * ReminderForNEINUserRegistration();
				 * 
				 * ReminderForNEWINS(); ReminderForNExAS(); ReminderForGSNET();
				 * ReminderForCCDUserRegi(); ReminderForCCDReportRequest();
				 * 
				 * ReminderForIncidentLog();
				 */
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
	private void ReminderForApplicationForms() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, ParseException, UnsupportedEncodingException
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
    String branch=null,initiatoraa=null,initatorname=null,initatoremail=null,gamail=null,ganame=null,gamail1=null,ganame1=null,formno=null,emp_code=null,full_name=null,designation=null,d_resignation=null,d_reliving=null;
    int x=0;
	int srno=0;
			try
			    {
				//SELECT DISTINCT i.form1_no FROM form1_it_clearance_item i INNER JOIN form1_it_clearance f ON(f.form1_no=i.form1_no) WHERE i.emp='"+AdminName+"' and i.desg='"+desg+"' and i.status='Pending' AND f.deleted IS NULL AND i.form1_no LIKE 'NEIN/CS/IT%' ORDER BY i.form1_no ASC
				
				//SELECT form_name,form1_no,i_name,i_desg,branch,Approval_empp,Approval_desgg,Approval_remarks,DATE_FORMAT(f_date,'%d/%m/%Y'),requestOption,full_name,Approval_f_date as detu FROM form1_it_clearance WHERE Approval_sttatuss='Pending' AND deleted IS NULL AND Approval_emp='"+SessionName+"' AND Approval_desg='"+Sessiondesg+"'
				String  query1 = "SELECT DISTINCT i.emp, i.mail,i.empid FROM neinapplicationform_item i "+
				                 "WHERE i.status='Pending' "+
				                 "AND i.presence='now' and i.empid!='NULL' ORDER BY i.form2_no ASC";

				
                st = (Statement) con.createStatement();
                rs1 = st.executeQuery(query1);
				PreparedStatement statement = con.prepareStatement(query1);
				rs1 = statement.executeQuery();
				
				
				//String CCList = "chintu.kumar@nittsu.co.in";
				String CCList = "";
			   
			    while(rs1.next())
				    { 
			    	 body =" <html> <body> <p> Dear Sir,<br>"+
					   " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
					   " You have below given Application Form list pending, Request you to please Approve. <br><br>";
                    body=body+" <table border='1' width='600'><tr align='center'><td colspan='9'>Pending Application Form List</td></tr>";
		               
		            body=body+" <tr><td>SrNo</td> <td >Form No</td><td>Branch</td> <td>EmpCode</td> <td>EmpName</td> "+
		                         " <td>EmpDesignation</td><td>InitiatorName</td></tr>";
	   	
					srno=0;
					x=0;
					gamail1=rs1.getString("mail");
                    ganame1=rs1.getString("emp");
                    //System.out.println("#######################################################################################################");
                    //System.out.println("Pending person :"+ganame1);
                    //System.out.println("Pending person :"+gamail1);
                    
				    String  query2 = "SELECT DISTINCT i.form2_no, i.mail,i.emp,f.i_name,f.i_email_id,f.employee_code,f.full_name,f.designation,f.branch FROM neinapplicationform_item i "+
	                                 "INNER JOIN neinapplicationform f ON(f.applicationNo=i.form2_no) "+
	                                 "WHERE i.status='Pending' and i.emp='"+ganame1+"' and i.mail='"+gamail1+"' "+
	                                 "ORDER BY i.form2_no ASC";

                    st2 = (Statement) con.createStatement();
                    rs = st2.executeQuery(query2);
    				PreparedStatement statement1 = con.prepareStatement(query2);
    				rs = statement1.executeQuery();
    				while(rs.next())
				        { 
    					x++;
    					formno=rs.getString("form2_no");
					    initatorname=rs.getString("i_name");
                        initatoremail=rs.getString("i_email_id");
                        branch=rs.getString("branch");
                        emp_code=rs.getString("employee_code");
                        full_name=rs.getString("full_name");
                        designation=rs.getString("designation");
                       
                        /*System.out.println("formno :"+formno);
                        System.out.println("emp_code :"+emp_code);
                        System.out.println("full_name :"+full_name);
                        System.out.println("branch :"+branch);*/
                        srno=srno+1;
				        body=body+" <tr> <td>"+srno+"</td><td>"+rs.getString("form2_no")+"</td><td>"+rs.getString("branch")+"</td> <td>"+rs.getString("employee_code")+"</td> "+
				                  " <td>"+rs.getString("full_name")+"</td><td>"+rs.getString("designation")+"</td><td>"+rs.getString("i_name")+"</td></tr>";
				         }
			    body=body+"</table> <br>";
			    if(x!=0)
			        {
			        body=body+" <h4>https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h4><br>" +
						       " <br></body></html>" ;	
			        
			        new NormalMail().sendMail("Application Forms",gamail1,CCList,body , "NEIN-C2IT: Pending Application Form Reminder");
			        body="";
			        }  
				}
			
			} catch (SQLException e) 
			    {
				e.printStackTrace();
			    }	
			System.out.println("######################################## Application forms ###############################################################");
    }


/////////////////////////////////////////////////////////////////////////

	
	
private void ReminderForLotusNotes() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, ParseException, UnsupportedEncodingException
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
    String branch=null,initiatoraa=null,initatorname=null,initatoremail=null,gamail=null,ganame=null,gamail1=null,ganame1=null,formno=null,emp_code=null,full_name=null,designation=null,d_resignation=null,d_reliving=null;
    int x=0;
	int srno=0;
			try
			    {
				//SELECT DISTINCT i.form1_no FROM form1_it_clearance_item i INNER JOIN form1_it_clearance f ON(f.form1_no=i.form1_no) WHERE i.emp='"+AdminName+"' and i.desg='"+desg+"' and i.status='Pending' AND f.deleted IS NULL AND i.form1_no LIKE 'NEIN/CS/IT%' ORDER BY i.form1_no ASC
				
				//SELECT form_name,form1_no,i_name,i_desg,branch,Approval_empp,Approval_desgg,Approval_remarks,DATE_FORMAT(f_date,'%d/%m/%Y'),requestOption,full_name,Approval_f_date as detu FROM form1_it_clearance WHERE Approval_sttatuss='Pending' AND deleted IS NULL AND Approval_emp='"+SessionName+"' AND Approval_desg='"+Sessiondesg+"'
				String  query1 = "SELECT DISTINCT i.emp, i.mail,i.empid FROM form3_lotus_item i "+
				                 "WHERE i.status='Pending' "+
				                 "AND i.presence='now' and i.empid!='NULL' ORDER BY i.form3_no ASC";

				
                st = (Statement) con.createStatement();
                rs1 = st.executeQuery(query1);
				PreparedStatement statement = con.prepareStatement(query1);
				rs1 = statement.executeQuery();
				
				
				//String CCList = "chintu.kumar@nittsu.co.in";
				String CCList = "";
			   
			    while(rs1.next())
				    { 
			    	 body =" <html> <body> <p> Dear Sir,<br>"+
					   " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
					   " You have below given Outlook 365 mail Form list pending, Request you to please Approve. <br><br>";
                    body=body+" <table border='1' width='600'><tr align='center'><td colspan='9'>Pending Outlook 365 mail Form List</td></tr>";
		               
		            body=body+" <tr><td>SrNo</td> <td >Form No</td><td>Branch</td> <td>EmpCode</td> <td>EmpName</td> "+
		                         " <td>EmpDesignation</td><td>InitiatorName</td></tr>";
	   	
					srno=0;
					x=0;
					gamail1=rs1.getString("mail");
                    ganame1=rs1.getString("emp");
                    //System.out.println("#######################################################################################################");
                    //System.out.println("Pending person :"+ganame1);
                    //System.out.println("Pending person :"+gamail1);
                    
				    String  query2 = "SELECT DISTINCT i.form3_no, i.mail,i.emp,f.i_name,f.i_email_id,f.emp_code,f.full_name,f.designation,f.branch FROM form3_lotus_item i "+
	                                 "INNER JOIN form3_lotus f ON(f.form3_no=i.form3_no) "+
	                                 "WHERE i.status='Pending' and i.emp='"+ganame1+"' and i.mail='"+gamail1+"' "+
	                                 "ORDER BY i.form3_no ASC";

                    st2 = (Statement) con.createStatement();
                    rs = st2.executeQuery(query2);
    				PreparedStatement statement1 = con.prepareStatement(query2);
    				rs = statement1.executeQuery();
    				while(rs.next())
				        { 
    					x++;
    					formno=rs.getString("form3_no");
					    initatorname=rs.getString("i_name");
                        initatoremail=rs.getString("i_email_id");
                        branch=rs.getString("branch");
                        emp_code=rs.getString("emp_code");
                        full_name=rs.getString("full_name");
                        designation=rs.getString("designation");
                       
                        /*System.out.println("formno :"+formno);
                        System.out.println("emp_code :"+emp_code);
                        System.out.println("full_name :"+full_name);
                        System.out.println("branch :"+branch);*/
                        srno=srno+1;
				        body=body+" <tr> <td>"+srno+"</td><td>"+rs.getString("form3_no")+"</td><td>"+rs.getString("branch")+"</td> <td>"+rs.getString("emp_code")+"</td> "+
				                  " <td>"+rs.getString("full_name")+"</td><td>"+rs.getString("designation")+"</td><td>"+rs.getString("i_name")+"</td></tr>";
				         }
			    body=body+"</table> <br>";
			    if(x!=0)
			        {
			        body=body+" <h4>https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h4><br>" +
						       " <br></body></html>" ;	
			        
			        new NormalMail().sendMail("LotusNotes",gamail1,CCList,body , "NEIN-C2IT: Pending Outlook 365 mail Form Reminder");
			        body="";
			        }  
				}
			
			} catch (SQLException e) 
			    {
				e.printStackTrace();
			    }	
			System.out.println("######################################## Lotus Notes ###############################################################");
    }


/////////////////////////////////////////////////////////////////////////

private void ReminderForAccessCard() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, ParseException, UnsupportedEncodingException
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
String branch=null,initiatoraa=null,initatorname=null,initatoremail=null,gamail=null,ganame=null,gamail1=null,ganame1=null,formno=null,emp_code=null,full_name=null,designation=null,d_resignation=null,d_reliving=null;
int x=0;
int srno=0;
		try
		    {
			//SELECT DISTINCT i.form1_no FROM form1_it_clearance_item i INNER JOIN form1_it_clearance f ON(f.form1_no=i.form1_no) WHERE i.emp='"+AdminName+"' and i.desg='"+desg+"' and i.status='Pending' AND f.deleted IS NULL AND i.form1_no LIKE 'NEIN/CS/IT%' ORDER BY i.form1_no ASC
			
			//SELECT form_name,form1_no,i_name,i_desg,branch,Approval_empp,Approval_desgg,Approval_remarks,DATE_FORMAT(f_date,'%d/%m/%Y'),requestOption,full_name,Approval_f_date as detu FROM form1_it_clearance WHERE Approval_sttatuss='Pending' AND deleted IS NULL AND Approval_emp='"+SessionName+"' AND Approval_desg='"+Sessiondesg+"'
			String  query1 = "SELECT DISTINCT i.emp, i.mail,i.empid FROM form4_accesscard_item i "+
			                 "WHERE i.status='Pending' "+
			                 "AND i.presence='now' and i.empid!='NULL' ORDER BY i.form4_no ASC";

			
            st = (Statement) con.createStatement();
            rs1 = st.executeQuery(query1);
			PreparedStatement statement = con.prepareStatement(query1);
			rs1 = statement.executeQuery();
			
			
			//String CCList = "chintu.kumar@nittsu.co.in";
			String CCList = "";
		    while(rs1.next())
			    { 
		    	 body =" <html> <body> <p> Dear Sir,<br>"+
				   " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
				   " You have below given Access Card Form list pending, Request you to please Approve. <br><br>";
                body=body+" <table border='1' width='600'><tr align='center'><td colspan='9'>Pending Access Card Form List</td></tr>";
	               
	            body=body+" <tr><td>SrNo</td> <td >Form No</td><td>Branch</td> <td>EmpCode</td> <td>EmpName</td> "+
	                         " <td>EmpDesignation</td><td>InitiatorName</td></tr>";
   	
				srno=0;
				x=0;
				gamail1=rs1.getString("mail");
                ganame1=rs1.getString("emp");
                //System.out.println("#######################################################################################################");
                //System.out.println("Pending person :"+ganame1);
                //System.out.println("Pending person :"+gamail1);
                
			    String  query2 = "SELECT DISTINCT i.form4_no, i.mail,i.emp,f.i_name,f.i_email_id,f.emp_code,f.full_name,f.designation,f.branch FROM form4_accesscard_item i "+
                                 "INNER JOIN form4_accesscard f ON(f.form4_no=i.form4_no) "+
                                 "WHERE i.status='Pending' and i.emp='"+ganame1+"' and i.mail='"+gamail1+"' "+
                                 "ORDER BY i.form4_no ASC";

                st2 = (Statement) con.createStatement();
                rs = st2.executeQuery(query2);
				PreparedStatement statement1 = con.prepareStatement(query2);
				rs = statement1.executeQuery();
				while(rs.next())
			        { 
					x++;
					formno=rs.getString("form4_no");
				    initatorname=rs.getString("i_name");
                    initatoremail=rs.getString("i_email_id");
                    branch=rs.getString("branch");
                    emp_code=rs.getString("emp_code");
                    full_name=rs.getString("full_name");
                    designation=rs.getString("designation");
                   
                    /*System.out.println("formno :"+formno);
                    System.out.println("emp_code :"+emp_code);
                    System.out.println("full_name :"+full_name);
                    System.out.println("branch :"+branch);*/
                    srno=srno+1;
			        body=body+" <tr> <td>"+srno+"</td><td>"+rs.getString("form4_no")+"</td><td>"+rs.getString("branch")+"</td> <td>"+rs.getString("emp_code")+"</td> "+
			                  " <td>"+rs.getString("full_name")+"</td><td>"+rs.getString("designation")+"</td><td>"+rs.getString("i_name")+"</td></tr>";
			         }
		    body=body+"</table> <br>";
		    if(x!=0)
		        {
		        body=body+" <h4>https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h4><br>" +
					       " <br></body></html>" ;	
		        new NormalMail().sendMail("Access Card",gamail1,CCList,body , "NEIN-C2IT: Pending Access Card Form Reminder");
		        body="";
		        }  
			}
		
		} catch (SQLException e) 
		    {
			e.printStackTrace();
		    }
		System.out.println("######################################## Access Card ###############################################################");
}
////////////////////////////////////////////////////////////////////////////////
private void ReminderForDomain() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, ParseException, UnsupportedEncodingException
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
String branch=null,initiatoraa=null,initatorname=null,initatoremail=null,gamail=null,ganame=null,gamail1=null,ganame1=null,formno=null,emp_code=null,full_name=null,designation=null,d_resignation=null,d_reliving=null;
int x=0;
int srno=0;
		try
		    {
			//SELECT DISTINCT i.form1_no FROM form1_it_clearance_item i INNER JOIN form1_it_clearance f ON(f.form1_no=i.form1_no) WHERE i.emp='"+AdminName+"' and i.desg='"+desg+"' and i.status='Pending' AND f.deleted IS NULL AND i.form1_no LIKE 'NEIN/CS/IT%' ORDER BY i.form1_no ASC
			
			//SELECT form_name,form1_no,i_name,i_desg,branch,Approval_empp,Approval_desgg,Approval_remarks,DATE_FORMAT(f_date,'%d/%m/%Y'),requestOption,full_name,Approval_f_date as detu FROM form1_it_clearance WHERE Approval_sttatuss='Pending' AND deleted IS NULL AND Approval_emp='"+SessionName+"' AND Approval_desg='"+Sessiondesg+"'
			String  query1 = "SELECT DISTINCT i.emp, i.mail,i.empid FROM form2_domain_item i "+
			                 "WHERE i.status='Pending' "+
			                 "AND i.presence='now' and i.empid!='NULL' ORDER BY i.form2_no ASC";

			
            st = (Statement) con.createStatement();
            rs1 = st.executeQuery(query1);
			PreparedStatement statement = con.prepareStatement(query1);
			rs1 = statement.executeQuery();
			
			
			//String CCList = "chintu.kumar@nittsu.co.in";
			String CCList = "";
		    while(rs1.next())
			    { 
		    	 body =" <html> <body> <p> Dear Sir,<br>"+
				   " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
				   " You have below given Domain Form list pending, Request you to please Approve. <br><br>";
                body=body+" <table border='1' width='600'><tr align='center'><td colspan='9'>Pending Domain Form List</td></tr>";
	               
	            body=body+" <tr><td>SrNo</td> <td >Form No</td><td>Branch</td> <td>EmpCode</td> <td>EmpName</td> "+
	                         " <td>EmpDesignation</td><td>InitiatorName</td></tr>";
   	
				srno=0;
				x=0;
				gamail1=rs1.getString("mail");
                ganame1=rs1.getString("emp");
                //System.out.println("#######################################################################################################");
                //System.out.println("Pending person :"+ganame1);
                //System.out.println("Pending person :"+gamail1);
                
			    String  query2 = "SELECT DISTINCT i.form2_no, i.mail,i.emp,f.i_name,f.i_email_id,f.emp_code,f.full_name,f.designation,f.branch FROM form2_domain_item i "+
                                 "INNER JOIN form2_domain f ON(f.form2_no=i.form2_no) "+
                                 "WHERE i.status='Pending' and i.emp='"+ganame1+"' and i.mail='"+gamail1+"' "+
                                 "ORDER BY i.form2_no ASC";

                st2 = (Statement) con.createStatement();
                rs = st2.executeQuery(query2);
				PreparedStatement statement1 = con.prepareStatement(query2);
				rs = statement1.executeQuery();
				while(rs.next())
			        { 
					x++;
					formno=rs.getString("form2_no");
				    initatorname=rs.getString("i_name");
                    initatoremail=rs.getString("i_email_id");
                    branch=rs.getString("branch");
                    emp_code=rs.getString("emp_code");
                    full_name=rs.getString("full_name");
                    designation=rs.getString("designation");
                   
                    /*System.out.println("formno :"+formno);
                    System.out.println("emp_code :"+emp_code);
                    System.out.println("full_name :"+full_name);
                    System.out.println("branch :"+branch);*/
                    srno=srno+1;
			        body=body+" <tr> <td>"+srno+"</td><td>"+rs.getString("form2_no")+"</td><td>"+rs.getString("branch")+"</td> <td>"+rs.getString("emp_code")+"</td> "+
			                  " <td>"+rs.getString("full_name")+"</td><td>"+rs.getString("designation")+"</td><td>"+rs.getString("i_name")+"</td></tr>";
			         }
		    body=body+"</table> <br>";
		    if(x!=0)
		        {
		        body=body+" <h4>https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h4><br>" +
					       " <br></body></html>" ;	
		        new NormalMail().sendMail("Domain",gamail1,CCList,body , "NEIN-C2IT: Pending Domain Form Reminder");
		        body="";
		        }  
			}
		
		} catch (SQLException e) 
		    {
			e.printStackTrace();
		    }	
		System.out.println("######################################## Domain ###############################################################");
}
////////////////////////////////////////////////////////////////////////////////////
private void ReminderForLotusTraveler() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, ParseException, UnsupportedEncodingException
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
String branch=null,initiatoraa=null,initatorname=null,initatoremail=null,gamail=null,ganame=null,gamail1=null,ganame1=null,formno=null,emp_code=null,full_name=null,designation=null,d_resignation=null,d_reliving=null;
int x=0;
int srno=0;
		try
		    {
			//SELECT DISTINCT i.form1_no FROM form1_it_clearance_item i INNER JOIN form1_it_clearance f ON(f.form1_no=i.form1_no) WHERE i.emp='"+AdminName+"' and i.desg='"+desg+"' and i.status='Pending' AND f.deleted IS NULL AND i.form1_no LIKE 'NEIN/CS/IT%' ORDER BY i.form1_no ASC
			
			//SELECT form_name,form1_no,i_name,i_desg,branch,Approval_empp,Approval_desgg,Approval_remarks,DATE_FORMAT(f_date,'%d/%m/%Y'),requestOption,full_name,Approval_f_date as detu FROM form1_it_clearance WHERE Approval_sttatuss='Pending' AND deleted IS NULL AND Approval_emp='"+SessionName+"' AND Approval_desg='"+Sessiondesg+"'
			String  query1 = "SELECT DISTINCT i.emp, i.mail,i.empid FROM form8_lotus_traveler_item i "+
			                 "WHERE i.status='Pending' "+
			                 "AND i.presence='now' and i.empid!='NULL' ORDER BY i.form8_no ASC";

			
            st = (Statement) con.createStatement();
            rs1 = st.executeQuery(query1);
			PreparedStatement statement = con.prepareStatement(query1);
			rs1 = statement.executeQuery();
			
			
			//String CCList = "chintu.kumar@nittsu.co.in";
			String CCList = "";
		    while(rs1.next())
			    { 
		    	 body =" <html> <body> <p> Dear Sir,<br>"+
				   " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
				   " You have below given Lotus Traveler Form list pending, Request you to please Approve. <br><br>";
                body=body+" <table border='1' width='600'><tr align='center'><td colspan='9'>Pending LotusTraveler Form List</td></tr>";
	               
	            body=body+" <tr><td>SrNo</td> <td >Form No</td><td>Branch</td> <td>EmpCode</td> <td>EmpName</td> "+
	                         " <td>EmpDesignation</td><td>InitiatorName</td></tr>";
   	
				srno=0;
				x=0;
				gamail1=rs1.getString("mail");
                ganame1=rs1.getString("emp");
                //System.out.println("#######################################################################################################");
                //System.out.println("Pending person :"+ganame1);
                //System.out.println("Pending person :"+gamail1);
                
			    String  query2 = "SELECT DISTINCT i.form8_no, i.mail,i.emp,f.i_name,f.i_email_id,f.empid,f.full_name,f.designation,f.branch FROM form8_lotus_traveler_item i "+
                                 "INNER JOIN form8_lotus_traveler f ON(f.form8_no=i.form8_no) "+
                                 "WHERE i.status='Pending' and i.emp='"+ganame1+"' and i.mail='"+gamail1+"' "+
                                 "ORDER BY i.form8_no ASC";

                st2 = (Statement) con.createStatement();
                rs = st2.executeQuery(query2);
				PreparedStatement statement1 = con.prepareStatement(query2);
				rs = statement1.executeQuery();
				while(rs.next())
			        { 
					x++;
					formno=rs.getString("form8_no");
				    initatorname=rs.getString("i_name");
                    initatoremail=rs.getString("i_email_id");
                    branch=rs.getString("branch");
                    emp_code=rs.getString("empid");
                    full_name=rs.getString("full_name");
                    designation=rs.getString("designation");
                   
                    /*System.out.println("formno :"+formno);
                    System.out.println("emp_code :"+emp_code);
                    System.out.println("full_name :"+full_name);
                    System.out.println("branch :"+branch);*/
                    srno=srno+1;
			        body=body+" <tr> <td>"+srno+"</td><td>"+rs.getString("form8_no")+"</td><td>"+rs.getString("branch")+"</td> <td>"+rs.getString("empid")+"</td> "+
			                  " <td>"+rs.getString("full_name")+"</td><td>"+rs.getString("designation")+"</td><td>"+rs.getString("i_name")+"</td></tr>";
			         }
		    body=body+"</table> <br>";
		    if(x!=0)
		        {
		        body=body+" <h4>https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h4><br>" +
					       " <br></body></html>" ;	
		        new NormalMail().sendMail("LotusTraveler",gamail1,CCList,body , "NEIN-C2IT: Pending LotusTraveler Form Reminder");
		        body="";
		        }  
			}
		
		} catch (SQLException e) 
		    {
			e.printStackTrace();
		    }
		System.out.println("######################################## Lotus Traveler ###############################################################");
}

///////////////////////////////////////////////////////////////////////////////ReminderForShairedFloder/////////////////////////////////


private void ReminderForShairedFloder() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, ParseException, UnsupportedEncodingException
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
String branch=null,initiatoraa=null,initatorname=null,initatoremail=null,gamail=null,ganame=null,gamail1=null,ganame1=null,formno=null,emp_code=null,full_name=null,designation=null,d_resignation=null,d_reliving=null;
int x=0;
int srno=0;
		try
		    {
			//SELECT DISTINCT i.form1_no FROM form1_it_clearance_item i INNER JOIN form1_it_clearance f ON(f.form1_no=i.form1_no) WHERE i.emp='"+AdminName+"' and i.desg='"+desg+"' and i.status='Pending' AND f.deleted IS NULL AND i.form1_no LIKE 'NEIN/CS/IT%' ORDER BY i.form1_no ASC
			
			//SELECT form_name,form1_no,i_name,i_desg,branch,Approval_empp,Approval_desgg,Approval_remarks,DATE_FORMAT(f_date,'%d/%m/%Y'),requestOption,full_name,Approval_f_date as detu FROM form1_it_clearance WHERE Approval_sttatuss='Pending' AND deleted IS NULL AND Approval_emp='"+SessionName+"' AND Approval_desg='"+Sessiondesg+"'
			String  query1 = "SELECT DISTINCT i.emp, i.mail,i.empid FROM form5_folder_item i "+
			                 "WHERE i.status='Pending' "+
			                 "AND i.presence='now' and i.empid!='NULL' ORDER BY i.form5_no ASC";

			
            st = (Statement) con.createStatement();
            rs1 = st.executeQuery(query1);
			PreparedStatement statement = con.prepareStatement(query1);
			rs1 = statement.executeQuery();
			
			
			//String CCList = "chintu.kumar@nittsu.co.in";
			String CCList = "";
		    while(rs1.next())
			    { 
		    	 body =" <html> <body> <p> Dear Sir,<br>"+
				   " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
				   " You have below given Shared Folder Form list pending, Request you to please Approve. <br><br>";
                body=body+" <table border='1' width='600'><tr align='center'><td colspan='9'>Pending Shared Folder Form List</td></tr>";
	               
	            body=body+" <tr><td>SrNo</td> <td >Form No</td><td>Branch</td> <td>EmpCode</td> <td>EmpName</td> "+
	                         " <td>EmpDesignation</td><td>InitiatorName</td></tr>";
   	
				srno=0;
				x=0;
				gamail1=rs1.getString("mail");
                ganame1=rs1.getString("emp");
                //System.out.println("#######################################################################################################");
                //System.out.println("Pending person :"+ganame1);
                //System.out.println("Pending person :"+gamail1);
                
			    String  query2 = "SELECT DISTINCT i.form5_no, i.mail,i.emp,f.i_name,f.i_email_id,f.emp_code,f.full_name,f.designation,f.branch FROM form5_folder_item i "+
                                 "INNER JOIN form5_folder f ON(f.form5_no=i.form5_no) "+
                                 "WHERE i.status='Pending' and i.emp='"+ganame1+"' and i.mail='"+gamail1+"' "+
                                 "ORDER BY i.form5_no ASC";

                st2 = (Statement) con.createStatement();
                rs = st2.executeQuery(query2);
				PreparedStatement statement1 = con.prepareStatement(query2);
				rs = statement1.executeQuery();
				while(rs.next())
			        { 
					x++;
					formno=rs.getString("form5_no");
				    initatorname=rs.getString("i_name");
                    initatoremail=rs.getString("i_email_id");
                    branch=rs.getString("branch");
                    emp_code=rs.getString("emp_code");
                    full_name=rs.getString("full_name");
                    designation=rs.getString("designation");
                   
                    /*System.out.println("formno :"+formno);
                    System.out.println("emp_code :"+emp_code);
                    System.out.println("full_name :"+full_name);
                    System.out.println("branch :"+branch);*/
                    srno=srno+1;
			        body=body+" <tr> <td>"+srno+"</td><td>"+rs.getString("form5_no")+"</td><td>"+rs.getString("branch")+"</td> <td>"+rs.getString("emp_code")+"</td> "+
			                  " <td>"+rs.getString("full_name")+"</td><td>"+rs.getString("designation")+"</td><td>"+rs.getString("i_name")+"</td></tr>";
			         }
		    body=body+"</table> <br>";
		    if(x!=0)
		        {
		        body=body+" <h4>https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h4><br>" +
					       " <br></body></html>" ;	
		        new NormalMail().sendMail("Shared Folder",gamail1,CCList,body , "NEIN-C2IT: Pending Shared Folder Form Reminder");
		        body="";
		        }  
			}
		
		} catch (SQLException e) 
		    {
			e.printStackTrace();
		    }	
		System.out.println("######################################## Shared Folder ###############################################################");
}

/////////////////////////////////////////////////////////////////////////////ReminderForNEINUserRegistration/////////////
private void ReminderForNEINUserRegistration() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, ParseException, UnsupportedEncodingException
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
String branch=null,initiatoraa=null,initatorname=null,initatoremail=null,gamail=null,ganame=null,gamail1=null,ganame1=null,formno=null,emp_code=null,full_name=null,designation=null,d_resignation=null,d_reliving=null;
int x=0;
int srno=0;
		try
		    {
			//SELECT DISTINCT i.form1_no FROM form1_it_clearance_item i INNER JOIN form1_it_clearance f ON(f.form1_no=i.form1_no) WHERE i.emp='"+AdminName+"' and i.desg='"+desg+"' and i.status='Pending' AND f.deleted IS NULL AND i.form1_no LIKE 'NEIN/CS/IT%' ORDER BY i.form1_no ASC
			
			//SELECT form_name,form1_no,i_name,i_desg,branch,Approval_empp,Approval_desgg,Approval_remarks,DATE_FORMAT(f_date,'%d/%m/%Y'),requestOption,full_name,Approval_f_date as detu FROM form1_it_clearance WHERE Approval_sttatuss='Pending' AND deleted IS NULL AND Approval_emp='"+SessionName+"' AND Approval_desg='"+Sessiondesg+"'
			String  query1 = "SELECT DISTINCT i.emp, i.mail,i.empid FROM form10_registration_item i "+
			                 "WHERE i.status='Pending' "+
			                 "AND i.presence='now' and i.empid!='NULL' ORDER BY i.form10_no ASC";

			
            st = (Statement) con.createStatement();
            rs1 = st.executeQuery(query1);
			PreparedStatement statement = con.prepareStatement(query1);
			rs1 = statement.executeQuery();
			
			
			//String CCList = "chintu.kumar@nittsu.co.in";
			String CCList = "";
		    while(rs1.next())
			    { 
		    	 body =" <html> <body> <p> Dear Sir,<br>"+
				   " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
				   " You have below given NEIN new user registration Form list pending, Request you to please Approve. <br><br>";
                body=body+" <table border='1' width='600'><tr align='center'><td colspan='9'>Pending NEIN new user registration Form List</td></tr>";
	               
	            body=body+" <tr><td>SrNo</td> <td >Form No</td><td>Branch</td> <td>EmpCode</td> <td>EmpName</td> "+
	                         " <td>EmpDesignation</td><td>InitiatorName</td></tr>";
   	
				srno=0;
				x=0;
				gamail1=rs1.getString("mail");
                ganame1=rs1.getString("emp");
                //System.out.println("#######################################################################################################");
                //System.out.println("Pending person :"+ganame1);
                //System.out.println("Pending person :"+gamail1);
                
			    String  query2 = "SELECT DISTINCT i.form10_no, i.mail,i.emp,f.i_name,f.i_email_id,f.emp_code,f.full_name,f.designation,f.branch FROM form10_registration_item i "+
                                 "INNER JOIN form10_registration f ON(f.form10_no=i.form10_no) "+
                                 "WHERE i.status='Pending' and i.emp='"+ganame1+"' and i.mail='"+gamail1+"' "+
                                 "ORDER BY i.form10_no ASC";

                st2 = (Statement) con.createStatement();
                rs = st2.executeQuery(query2);
				PreparedStatement statement1 = con.prepareStatement(query2);
				rs = statement1.executeQuery();
				while(rs.next())
			        { 
					x++;
					formno=rs.getString("form10_no");
				    initatorname=rs.getString("i_name");
                    initatoremail=rs.getString("i_email_id");
                    branch=rs.getString("branch");
                    emp_code=rs.getString("emp_code");
                    full_name=rs.getString("full_name");
                    designation=rs.getString("designation");
                   
                    /*System.out.println("formno :"+formno);
                    System.out.println("emp_code :"+emp_code);
                    System.out.println("full_name :"+full_name);
                    System.out.println("branch :"+branch);*/
                    srno=srno+1;
			        body=body+" <tr> <td>"+srno+"</td><td>"+rs.getString("form10_no")+"</td><td>"+rs.getString("branch")+"</td> <td>"+rs.getString("emp_code")+"</td> "+
			                  " <td>"+rs.getString("full_name")+"</td><td>"+rs.getString("designation")+"</td><td>"+rs.getString("i_name")+"</td></tr>";
			         }
		    body=body+"</table> <br>";
		    if(x!=0)
		        {
		        body=body+" <h4>https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h4><br>" +
					       " <br></body></html>" ;	
		        new NormalMail().sendMail("NEIN New User registration",gamail1,CCList,body , "NEIN-C2IT: Pending NEIN new user registration Form Reminder");
		        body="";
		        }  
			}
		
		} catch (SQLException e) 
		    {
			e.printStackTrace();
		    }
		System.out.println("######################################## NEIN New User Registration ###############################################################");
}



/////////////////////////////////////////////////////////////////////////////ReminderForNEWINS/////////////
private void ReminderForNEWINS() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, ParseException, UnsupportedEncodingException
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
String branch=null,initiatoraa=null,initatorname=null,initatoremail=null,gamail=null,ganame=null,gamail1=null,ganame1=null,formno=null,emp_code=null,full_name=null,designation=null,d_resignation=null,d_reliving=null;
int x=0;
int srno=0;
		try
		    {
			//SELECT DISTINCT i.form1_no FROM form1_it_clearance_item i INNER JOIN form1_it_clearance f ON(f.form1_no=i.form1_no) WHERE i.emp='"+AdminName+"' and i.desg='"+desg+"' and i.status='Pending' AND f.deleted IS NULL AND i.form1_no LIKE 'NEIN/CS/IT%' ORDER BY i.form1_no ASC
			
			//SELECT form_name,form1_no,i_name,i_desg,branch,Approval_empp,Approval_desgg,Approval_remarks,DATE_FORMAT(f_date,'%d/%m/%Y'),requestOption,full_name,Approval_f_date as detu FROM form1_it_clearance WHERE Approval_sttatuss='Pending' AND deleted IS NULL AND Approval_emp='"+SessionName+"' AND Approval_desg='"+Sessiondesg+"'
			String  query1 = "SELECT DISTINCT i.emp, i.mail,i.empid FROM form7_newins_item i "+
			                 "WHERE i.status='Pending' "+
			                 "AND i.presence='now' and i.empid!='NULL' ORDER BY i.form7_no ASC";

			
            st = (Statement) con.createStatement();
            rs1 = st.executeQuery(query1);
			PreparedStatement statement = con.prepareStatement(query1);
			rs1 = statement.executeQuery();
			
			
			//String CCList = "chintu.kumar@nittsu.co.in";
			String CCList = "";
		    while(rs1.next())
			    { 
		    	 body =" <html> <body> <p> Dear Sir,<br>"+
				   " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
				   " You have below given NEWINS Form list pending, Request you to please Approve. <br><br>";
                body=body+" <table border='1' width='600'><tr align='center'><td colspan='9'>Pending NEWINS Form List</td></tr>";
	               
	            body=body+" <tr><td>SrNo</td> <td >Form No</td><td>Branch</td> <td>EmpCode</td> <td>EmpName</td> "+
	                         " <td>EmpDesignation</td><td>InitiatorName</td></tr>";
   	
				srno=0;
				x=0;
				gamail1=rs1.getString("mail");
                ganame1=rs1.getString("emp");
                //System.out.println("#######################################################################################################");
                //System.out.println("Pending person :"+ganame1);
                //System.out.println("Pending person :"+gamail1);
                
			    String  query2 = "SELECT DISTINCT i.form7_no, i.mail,i.emp,f.i_name,f.i_email_id,f.empid,f.full_name,f.designation,f.branch FROM form7_newins_item i "+
                                 "INNER JOIN form7_newins f ON(f.form7_no=i.form7_no) "+
                                 "WHERE i.status='Pending' and i.emp='"+ganame1+"' and i.mail='"+gamail1+"' "+
                                 "ORDER BY i.form7_no ASC";

                st2 = (Statement) con.createStatement();
                rs = st2.executeQuery(query2);
				PreparedStatement statement1 = con.prepareStatement(query2);
				rs = statement1.executeQuery();
				while(rs.next())
			        { 
					x++;
					formno=rs.getString("form7_no");
				    initatorname=rs.getString("i_name");
                    initatoremail=rs.getString("i_email_id");
                    branch=rs.getString("branch");
                    emp_code=rs.getString("empid");
                    full_name=rs.getString("full_name");
                    designation=rs.getString("designation");
                   
                    /*System.out.println("formno :"+formno);
                    System.out.println("emp_code :"+emp_code);
                    System.out.println("full_name :"+full_name);
                    System.out.println("branch :"+branch);*/
                    srno=srno+1;
			        body=body+" <tr> <td>"+srno+"</td><td>"+rs.getString("form7_no")+"</td><td>"+rs.getString("branch")+"</td> <td>"+rs.getString("empid")+"</td> "+
			                  " <td>"+rs.getString("full_name")+"</td><td>"+rs.getString("designation")+"</td><td>"+rs.getString("i_name")+"</td></tr>";
			         }
		    body=body+"</table> <br>";
		    if(x!=0)
		        {
		        body=body+" <h4>https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h4><br>" +
					       " <br></body></html>" ;	
		        new NormalMail().sendMail("NEWINS",gamail1,CCList,body , "NEIN-C2IT: Pending NEWINS Form Reminder");
		        body="";
		        }  
			}
		
		} catch (SQLException e) 
		    {
			e.printStackTrace();
		    }	
		System.out.println("######################################## NEWINS ###############################################################");
}


/////////////////////////////////////////////////////////////////////////////ReminderForNExAS/////////////
private void ReminderForNExAS() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, ParseException, UnsupportedEncodingException
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
String branch=null,initiatoraa=null,initatorname=null,initatoremail=null,gamail=null,ganame=null,gamail1=null,ganame1=null,formno=null,emp_code=null,full_name=null,designation=null,d_resignation=null,d_reliving=null;
int x=0;
int srno=0;
		try
		    {
			//SELECT DISTINCT i.form1_no FROM form1_it_clearance_item i INNER JOIN form1_it_clearance f ON(f.form1_no=i.form1_no) WHERE i.emp='"+AdminName+"' and i.desg='"+desg+"' and i.status='Pending' AND f.deleted IS NULL AND i.form1_no LIKE 'NEIN/CS/IT%' ORDER BY i.form1_no ASC
			
			//SELECT form_name,form1_no,i_name,i_desg,branch,Approval_empp,Approval_desgg,Approval_remarks,DATE_FORMAT(f_date,'%d/%m/%Y'),requestOption,full_name,Approval_f_date as detu FROM form1_it_clearance WHERE Approval_sttatuss='Pending' AND deleted IS NULL AND Approval_emp='"+SessionName+"' AND Approval_desg='"+Sessiondesg+"'
			String  query1 = "SELECT DISTINCT i.emp, i.mail,i.empid FROM form12_nexas_item i "+
			                 "WHERE i.status='Pending' "+
			                 "and i.empid!='NULL' ORDER BY i.form_no ASC";

			
            st = (Statement) con.createStatement();
            rs1 = st.executeQuery(query1);
			PreparedStatement statement = con.prepareStatement(query1);
			rs1 = statement.executeQuery();
			
			
			//String CCList = "chintu.kumar@nittsu.co.in";
			String CCList = "";
		    while(rs1.next())
			    { 
		    	 body =" <html> <body> <p> Dear Sir,<br>"+
				   " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
				   " You have below given NExAS Form list pending, Request you to please Approve. <br><br>";
                body=body+" <table border='1' width='600'><tr align='center'><td colspan='9'>Pending NExAS Form List</td></tr>";
	               
	            body=body+" <tr><td>SrNo</td> <td >Form No</td><td>Branch</td> <td>EmpCode</td> <td>EmpName</td> "+
	                         " <td>EmpDesignation</td><td>InitiatorName</td></tr>";
   	
				srno=0;
				x=0;
				gamail1=rs1.getString("mail");
                ganame1=rs1.getString("emp");
                //System.out.println("#######################################################################################################");
                //System.out.println("Pending person :"+ganame1);
                //System.out.println("Pending person :"+gamail1);
                
			    String  query2 = "SELECT DISTINCT i.form_no, i.mail,i.emp,f.requestBy,f.empid,f.full_name,f.designation,f.empBranch FROM form12_nexas_item i "+
                                 "INNER JOIN form12_nexas f ON(f.form_no=i.form_no) "+
                                 "WHERE i.status='Pending' and i.emp='"+ganame1+"' and i.mail='"+gamail1+"' "+
                                 "ORDER BY i.form_no ASC";

                st2 = (Statement) con.createStatement();
                rs = st2.executeQuery(query2);
				PreparedStatement statement1 = con.prepareStatement(query2);
				rs = statement1.executeQuery();
				while(rs.next())
			        { 
					x++;
					formno=rs.getString("form_no");
				    initatorname=rs.getString("requestBy");
                    //initatoremail=rs.getString("i_email_id");
                    branch=rs.getString("empBranch");
                    emp_code=rs.getString("empid");
                    full_name=rs.getString("full_name");
                    designation=rs.getString("designation");
                   
                    /*System.out.println("formno :"+formno);
                    System.out.println("emp_code :"+emp_code);
                    System.out.println("full_name :"+full_name);
                    System.out.println("branch :"+branch);*/
                    srno=srno+1;
			        body=body+" <tr> <td>"+srno+"</td><td>"+rs.getString("form_no")+"</td><td>"+rs.getString("empBranch")+"</td> <td>"+rs.getString("empid")+"</td> "+
			                  " <td>"+rs.getString("full_name")+"</td><td>"+rs.getString("designation")+"</td><td>"+rs.getString("requestBy")+"</td></tr>";
			         }
		    body=body+"</table> <br>";
		    if(x!=0)
		        {
		        body=body+" <h4>https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h4><br>" +
					       " <br></body></html>" ;	
		        new NormalMail().sendMail("NExAS",gamail1,CCList,body , "NEIN-C2IT: Pending NExAS Form Reminder");
		        body="";
		        }  
			}
		
		} catch (SQLException e) 
		    {
			e.printStackTrace();
		    }	
		System.out.println("######################################## NExAS ###############################################################");
}


/////////////////////////////////////////////////////////////////////////////ReminderForGSNET/////////////
private void ReminderForGSNET() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, ParseException, UnsupportedEncodingException
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
String branch=null,initiatoraa=null,initatorname=null,initatoremail=null,gamail=null,ganame=null,gamail1=null,ganame1=null,formno=null,emp_code=null,full_name=null,designation=null,d_resignation=null,d_reliving=null;
int x=0;
int srno=0;
		try
		    {
			String  query1 = "SELECT DISTINCT i.emp, i.mail,i.empid FROM form15_gsnet_item i "+
			                 "WHERE i.status='Pending' "+
			                 "and i.empid!='NULL' ORDER BY i.form_no ASC";

			
            st = (Statement) con.createStatement();
            rs1 = st.executeQuery(query1);
			PreparedStatement statement = con.prepareStatement(query1);
			rs1 = statement.executeQuery();
			
			
			//String CCList = "chintu.kumar@nittsu.co.in";
			String CCList = "";
		    while(rs1.next())
			    { 
		    	 body =" <html> <body> <p> Dear Sir,<br>"+
				   " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
				   " You have below given GSNET Form list pending, Request you to please Approve. <br><br>";
                body=body+" <table border='1' width='600'><tr align='center'><td colspan='9'>Pending GSNET Form List</td></tr>";
	               
	            body=body+" <tr><td>SrNo</td> <td >Form No</td><td>Branch</td> <td>EmpCode</td> <td>EmpName</td> "+
	                         " <td>EmpDesignation</td><td>InitiatorName</td></tr>";
   	
				srno=0;
				x=0;
				gamail1=rs1.getString("mail");
                ganame1=rs1.getString("emp");
                //System.out.println("#######################################################################################################");
                //System.out.println("Pending person :"+ganame1);
                //System.out.println("Pending person :"+gamail1);
                
			    String  query2 = "SELECT DISTINCT i.form_no, i.mail,i.emp,f.requestBy,f.empid,f.full_name,f.designation,f.empBranch FROM form15_gsnet_item i "+
                                 "INNER JOIN form15_gsnet f ON(f.form_no=i.form_no) "+
                                 "WHERE i.status='Pending' and i.emp='"+ganame1+"' and i.mail='"+gamail1+"' "+
                                 "ORDER BY i.form_no ASC";

                st2 = (Statement) con.createStatement();
                rs = st2.executeQuery(query2);
				PreparedStatement statement1 = con.prepareStatement(query2);
				rs = statement1.executeQuery();
				while(rs.next())
			        { 
					x++;
					formno=rs.getString("form_no");
				    initatorname=rs.getString("requestBy");
                    //initatoremail=rs.getString("i_email_id");
                    branch=rs.getString("empBranch");
                    emp_code=rs.getString("empid");
                    full_name=rs.getString("full_name");
                    designation=rs.getString("designation");
                   
                    /*System.out.println("formno :"+formno);
                    System.out.println("emp_code :"+emp_code);
                    System.out.println("full_name :"+full_name);
                    System.out.println("branch :"+branch);*/
                    srno=srno+1;
			        body=body+" <tr> <td>"+srno+"</td><td>"+rs.getString("form_no")+"</td><td>"+rs.getString("empBranch")+"</td> <td>"+rs.getString("empid")+"</td> "+
			                  " <td>"+rs.getString("full_name")+"</td><td>"+rs.getString("designation")+"</td><td>"+rs.getString("requestBy")+"</td></tr>";
			         }
		    body=body+"</table> <br>";
		    if(x!=0)
		        {
		        body=body+" <h4>https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h4><br>" +
					       " <br></body></html>" ;	
		        new NormalMail().sendMail("GSNET",gamail1,CCList,body , "NEIN-C2IT: Pending GSNET Form Reminder");
		        body="";
		        }  
			}
		
		} catch (SQLException e) 
		    {
			e.printStackTrace();
		    }	
		System.out.println("######################################## GSNET ###############################################################");
}





/////////////////////////////////////////////////////////////////////////////ReminderForCCDUserRegi/////////////
private void ReminderForCCDUserRegi() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, ParseException, UnsupportedEncodingException
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
String branch=null,initiatoraa=null,initatorname=null,initatoremail=null,gamail=null,ganame=null,gamail1=null,ganame1=null,formno=null,emp_code=null,full_name=null,designation=null,d_resignation=null,d_reliving=null;
int x=0;
int srno=0;
		try
		    {
			//SELECT DISTINCT i.form1_no FROM form1_it_clearance_item i INNER JOIN form1_it_clearance f ON(f.form1_no=i.form1_no) WHERE i.emp='"+AdminName+"' and i.desg='"+desg+"' and i.status='Pending' AND f.deleted IS NULL AND i.form1_no LIKE 'NEIN/CS/IT%' ORDER BY i.form1_no ASC
			
			//SELECT form_name,form1_no,i_name,i_desg,branch,Approval_empp,Approval_desgg,Approval_remarks,DATE_FORMAT(f_date,'%d/%m/%Y'),requestOption,full_name,Approval_f_date as detu FROM form1_it_clearance WHERE Approval_sttatuss='Pending' AND deleted IS NULL AND Approval_emp='"+SessionName+"' AND Approval_desg='"+Sessiondesg+"'
			String  query1 = "SELECT DISTINCT i.emp, i.mail,i.empid FROM form14_ccdregistration_item i "+
			                 "WHERE i.status='Pending' "+
			                 "AND i.presence='now' and i.empid!='NULL' ORDER BY i.form10_no ASC";

			
            st = (Statement) con.createStatement();
            rs1 = st.executeQuery(query1);
			PreparedStatement statement = con.prepareStatement(query1);
			rs1 = statement.executeQuery();
			
			
			//String CCList = "chintu.kumar@nittsu.co.in";
			String CCList = "";
		    while(rs1.next())
			    { 
		    	 body =" <html> <body> <p> Dear Sir,<br>"+
				   " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
				   " You have below given CCD new user registration Form list pending, Request you to please Approve. <br><br>";
                body=body+" <table border='1' width='600'><tr align='center'><td colspan='9'>Pending CCD new user registration Form List</td></tr>";
	               
	            body=body+" <tr><td>SrNo</td> <td >Form No</td><td>Branch</td> <td>EmpCode</td> <td>EmpName</td> "+
	                         " <td>EmpDesignation</td><td>InitiatorName</td></tr>";
   	
				srno=0;
				x=0;
				gamail1=rs1.getString("mail");
                ganame1=rs1.getString("emp");
                //System.out.println("#######################################################################################################");
                //System.out.println("Pending person :"+ganame1);
                //System.out.println("Pending person :"+gamail1);
                
			    String  query2 = "SELECT DISTINCT i.form10_no, i.mail,i.emp,f.requestBy,f.i_email_id,f.emp_code,f.full_name,f.designation,f.branch FROM form14_ccdregistration_item i "+
                                 "INNER JOIN form14_ccdregistration f ON(f.form10_no=i.form10_no) "+
                                 "WHERE i.status='Pending' and i.emp='"+ganame1+"' and i.mail='"+gamail1+"' "+
                                 "ORDER BY i.form10_no ASC";

                st2 = (Statement) con.createStatement();
                rs = st2.executeQuery(query2);
				PreparedStatement statement1 = con.prepareStatement(query2);
				rs = statement1.executeQuery();
				while(rs.next())
			        { 
					x++;
					formno=rs.getString("form10_no");
				    initatorname=rs.getString("requestBy");
                    initatoremail=rs.getString("i_email_id");
                    branch=rs.getString("branch");
                    emp_code=rs.getString("emp_code");
                    full_name=rs.getString("full_name");
                    designation=rs.getString("designation");
                   
                    /*System.out.println("formno :"+formno);
                    System.out.println("emp_code :"+emp_code);
                    System.out.println("full_name :"+full_name);
                    System.out.println("branch :"+branch);*/
                    srno=srno+1;
			        body=body+" <tr> <td>"+srno+"</td><td>"+rs.getString("form10_no")+"</td><td>"+rs.getString("branch")+"</td> <td>"+rs.getString("emp_code")+"</td> "+
			                  " <td>"+rs.getString("full_name")+"</td><td>"+rs.getString("designation")+"</td><td>"+rs.getString("requestBy")+"</td></tr>";
			         }
		    body=body+"</table> <br>";
		    if(x!=0)
		        {
		        body=body+" <h4>https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h4><br>" +
					       " <br></body></html>" ;	
		        new NormalMail().sendMail("CCD New User registration",gamail1,CCList,body , "NEIN-C2IT: Pending CCD new user registration Form Reminder");
		        body="";
		        }  
			}
		
		} catch (SQLException e) 
		    {
			e.printStackTrace();
		    }	
		System.out.println("######################################## CCD User Registration ###############################################################");
}

/////////////////////////////////////////////////////////////////////////////ReminderForCCDReportRequest/////////////
private void ReminderForCCDReportRequest() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, ParseException, UnsupportedEncodingException
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
String branch=null,initiatoraa=null,initatorname=null,initatoremail=null,gamail=null,ganame=null,gamail1=null,ganame1=null,formno=null,emp_code=null,full_name=null,designation=null,d_resignation=null,d_reliving=null;
int x=0;
int srno=0;
		try
		    {
			//SELECT DISTINCT i.form1_no FROM form1_it_clearance_item i INNER JOIN form1_it_clearance f ON(f.form1_no=i.form1_no) WHERE i.emp='"+AdminName+"' and i.desg='"+desg+"' and i.status='Pending' AND f.deleted IS NULL AND i.form1_no LIKE 'NEIN/CS/IT%' ORDER BY i.form1_no ASC
			
			//SELECT form_name,form1_no,i_name,i_desg,branch,Approval_empp,Approval_desgg,Approval_remarks,DATE_FORMAT(f_date,'%d/%m/%Y'),requestOption,full_name,Approval_f_date as detu FROM form1_it_clearance WHERE Approval_sttatuss='Pending' AND deleted IS NULL AND Approval_emp='"+SessionName+"' AND Approval_desg='"+Sessiondesg+"'
			String  query1 = "SELECT DISTINCT i.emp, i.mail,i.empid FROM form13_ccdreport_item i "+
			                 "WHERE i.status='Pending' "+
			                 "and i.empid!='NULL' ORDER BY i.form_no ASC";

			
            st = (Statement) con.createStatement();
            rs1 = st.executeQuery(query1);
			PreparedStatement statement = con.prepareStatement(query1);
			rs1 = statement.executeQuery();
			
			
			//String CCList = "chintu.kumar@nittsu.co.in";
			String CCList = "";
		    while(rs1.next())
			    { 
		    	 body =" <html> <body> <p> Dear Sir,<br>"+
				   " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
				   " You have below given CCD Report Request Form list pending, Request you to please Approve. <br><br>";
                body=body+" <table border='1' width='600'><tr align='center'><td colspan='9'>Pending CCD Report Request Form Form List</td></tr>";
	               
	            body=body+" <tr><td>SrNo</td> <td >Form No</td><td>Branch</td> <td>EmpCode</td> <td>EmpName</td> "+
	                         " <td>EmpDesignation</td><td>InitiatorName</td></tr>";
   	
				srno=0;
				x=0;
				gamail1=rs1.getString("mail");
                ganame1=rs1.getString("emp");
                //System.out.println("#######################################################################################################");
                //System.out.println("Pending person :"+ganame1);
                //System.out.println("Pending person :"+gamail1);
                
			    String  query2 = "SELECT DISTINCT i.form_no, i.mail,i.emp,f.requestBy,f.empid,f.full_name,f.designation,f.empBranch FROM form13_ccdreport_item i "+
                                 "INNER JOIN form13_ccdreport f ON(f.form_no=i.form_no) "+
                                 "WHERE i.status='Pending' and i.emp='"+ganame1+"' and i.mail='"+gamail1+"' "+
                                 "ORDER BY i.form_no ASC";

                st2 = (Statement) con.createStatement();
                rs = st2.executeQuery(query2);
				PreparedStatement statement1 = con.prepareStatement(query2);
				rs = statement1.executeQuery();
				while(rs.next())
			        { 
					x++;
					formno=rs.getString("form_no");
				    initatorname=rs.getString("requestBy");
                    //initatoremail=rs.getString("i_email_id");
                    branch=rs.getString("empBranch");
                    emp_code=rs.getString("empid");
                    full_name=rs.getString("full_name");
                    designation=rs.getString("designation");
                   
                    /*System.out.println("formno :"+formno);
                    System.out.println("emp_code :"+emp_code);
                    System.out.println("full_name :"+full_name);
                    System.out.println("branch :"+branch);*/
                    srno=srno+1;
			        body=body+" <tr> <td>"+srno+"</td><td>"+rs.getString("form_no")+"</td><td>"+rs.getString("empBranch")+"</td> <td>"+rs.getString("empid")+"</td> "+
			                  " <td>"+rs.getString("full_name")+"</td><td>"+rs.getString("designation")+"</td><td>"+rs.getString("requestBy")+"</td></tr>";
			         }
		    body=body+"</table> <br>";
		    if(x!=0)
		        {
		        body=body+" <h4>https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h4><br>" +
					       " <br></body></html>" ;	
		        new NormalMail().sendMail("CCD Report Request Form",gamail1,CCList,body , "NEIN-C2IT: Pending CCD Report Request Form Reminder");
		        body="";
		        }  
			}
		
		} catch (SQLException e) 
		    {
			e.printStackTrace();
		    }	
		System.out.println("######################################## CCD Report Request ###############################################################");
}


////////////////////////////////////////////////////////////////////////////////
private void ReminderForIncidentLog() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, ParseException, UnsupportedEncodingException
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
String branch=null,initiatoraa=null,initatorname=null,initatoremail=null,gamail=null,ganame=null,gamail1=null,ganame1=null,formno=null,emp_code=null,full_name=null,designation=null,d_resignation=null,d_reliving=null;
int x=0;
int srno=0;
		try
		    {
			String  query1 = "SELECT DISTINCT i.emp, i.mail FROM form9_incident_log_item i "+
			                 "WHERE i.status='Pending' "+
			                 "AND i.presence='now' ORDER BY i.form9_no ASC";

			
            st = (Statement) con.createStatement();
            rs1 = st.executeQuery(query1);
			PreparedStatement statement = con.prepareStatement(query1);
			rs1 = statement.executeQuery();
			
			
			//String CCList = "chintu.kumar@nittsu.co.in";
			String CCList = "";
		    while(rs1.next())
			    { 
		    	 body =" <html> <body> <p> Dear Sir,<br>"+
				   " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
				   " You have below given CCTV Incident Log Form list pending, Request you to please Approve. <br><br>";
                body=body+" <table border='1' width='600'><tr align='center'><td colspan='5'>Pending CCTV Incident Log Form List</td></tr>";
	               
	            body=body+" <tr><td>SrNo</td> <td >Form No</td><td>Branch</td>  <td>EmpName</td> "+
	                         " <td>EmpDesignation</td></tr>";
   	
				srno=0;
				x=0;
				gamail1=rs1.getString("mail");
                ganame1=rs1.getString("emp");
                //System.out.println("#######################################################################################################");
                //System.out.println("Pending person :"+ganame1);
                //System.out.println("Pending person :"+gamail1);
                
			    String  query2 = "SELECT DISTINCT i.form9_no,i.mail,i.emp,f.SessionName,f.SessionEmail,f.SessionDesg,f.SessionCity FROM form9_incident_log_item i "+
                                 "INNER JOIN form9_incident_log f ON(f.form9_no=i.form9_no) "+
                                 "WHERE i.status='Pending' and i.emp='"+ganame1+"' and i.mail='"+gamail1+"' "+
                                 "ORDER BY i.form9_no ASC";

                st2 = (Statement) con.createStatement();
                rs = st2.executeQuery(query2);
				PreparedStatement statement1 = con.prepareStatement(query2);
				rs = statement1.executeQuery();
				while(rs.next())
			        { 
					x++;
					formno=rs.getString("form9_no");
				    initatorname=rs.getString("SessionName");
                    initatoremail=rs.getString("SessionEmail");
                    branch=rs.getString("SessionCity");
                    designation=rs.getString("SessionDesg");
                   
                    /*System.out.println("formno :"+formno);
                    System.out.println("emp_code :"+emp_code);
                    System.out.println("full_name :"+full_name);
                    System.out.println("branch :"+branch);*/
                    srno=srno+1;
			        body=body+" <tr> <td>"+srno+"</td><td>"+rs.getString("form9_no")+"</td><td>"+rs.getString("SessionCity")+"</td> "+
			                  " <td>"+rs.getString("SessionName")+"</td><td>"+rs.getString("SessionDesg")+"</td></tr>";
			         }
		    body=body+"</table> <br>";
		    if(x!=0)
		        {
		        body=body+" <h4>https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h4><br>" +
					       " <br></body></html>" ;	
		        new NormalMail().sendMail("CCTV Incident Log",gamail1,CCList,body , "NEIN-C2IT: Pending CCTV Incident Log Form Reminder");
		        body="";
		        }  
			}
		
		} catch (SQLException e) 
		    {
			e.printStackTrace();
		    }	
		System.out.println("######################################## CCTV Incident Log Form ###############################################################");
}

}
