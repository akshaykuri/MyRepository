
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

public class ReminderITClearancePending_job implements Job
     {

	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException 
	      {
		
	   // System.out.println("==============calling ReminderFor Pending Outstanding Dues and Handover Report===================");
		try {
			  ReminderForITClearance();
			  
					
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


	
	
	
private void ReminderForITClearance() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, ParseException, UnsupportedEncodingException
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
				String  query1 = "SELECT DISTINCT  i.mail FROM form1_it_clearance_item i "+
				                 "INNER JOIN form1_it_clearance f ON(f.form1_no=i.form1_no) "+
				                 "WHERE i.status='Pending' AND f.f_date>'2021-01-01' "+
				                 "AND f.deleted IS NULL AND i.form1_no LIKE 'NEIN/CS/IT%' ORDER BY i.form1_no ASC";
                st = (Statement) con.createStatement();
                rs1 = st.executeQuery(query1);
				PreparedStatement statement = con.prepareStatement(query1);
				rs1 = statement.executeQuery();
				String CCList = "";
			   
			    while(rs1.next())
				    { 
			    	 body =" <html> <body> <p> Dear Sir,<br>"+
					       " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
					       " You have bellow given Outstanding Dues & Handover Form list pending, Request you to please approve. <br><br>";
                     body=body+" <table border='1' width='500'><tr align='center'><td colspan='9'>Pending Outstanding Dues & Handover Report List</td></tr>";
		               
		             body=body+" <tr><td>SrNo</td> <td >Form No</td><td>Branch</td> <td>EmpCode</td> <td>EmpName</td> "+
		                         " <td>EmpDesignation</td><td>InitiatorName</td><td>DateOfResignation</td><td>DateOfReliving</td></tr>";
	   	
					srno=0;
					x=0;
					gamail1=rs1.getString("mail");
                   // ganame1=rs1.getString("emp");
                    //System.out.println("#######################################################################################################");
                    String  query2 = "SELECT DISTINCT i.form1_no, i.mail,i.emp,f.i_name,f.i_email_id,f.emp_code,f.full_name,f.designation,f.d_resignation,f.d_reliving,f.branch FROM form1_it_clearance_item i "+
	                                 "INNER JOIN form1_it_clearance f ON(f.form1_no=i.form1_no) "+
	                                 "WHERE i.status='Pending'  and i.mail='"+gamail1+"' "+
	                                 "AND f.deleted IS NULL AND i.form1_no LIKE 'NEIN/CS/IT%' ORDER BY i.form1_no ASC";

                    st2 = (Statement) con.createStatement();
                    rs = st2.executeQuery(query2);
    				PreparedStatement statement1 = con.prepareStatement(query2);
    				rs = statement1.executeQuery();
    				while(rs.next())
				        { 
    					x++;
    					formno=rs.getString("form1_no");
					    initatorname=rs.getString("i_name");
                        initatoremail=rs.getString("i_email_id");
                        branch=rs.getString("branch");
                        emp_code=rs.getString("emp_code");
                        full_name=rs.getString("full_name");
                        designation=rs.getString("designation");
                        d_resignation=rs.getString("d_resignation");
                        d_reliving=rs.getString("d_reliving");
                        /*System.out.println("formno :"+formno);
                        System.out.println("emp_code :"+emp_code);
                        System.out.println("full_name :"+full_name);
                        System.out.println("branch :"+branch);*/
                        srno=srno+1;
				        body=body+" <tr> <td>"+srno+"</td><td>"+rs.getString("form1_no")+"</td><td>"+rs.getString("branch")+"</td> <td>"+rs.getString("emp_code")+"</td> "+
				                  " <td>"+rs.getString("full_name")+"</td><td>"+rs.getString("designation")+"</td><td>"+rs.getString("i_name")+"</td><td>"+rs.getString("d_resignation")+"</td><td>"+rs.getString("d_reliving")+"</td></tr>";
				         }
			    body=body+"</table> <br>";
			    if(x!=0)
			        {
			        body=body+" <h4>https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h4><br>" +
						       " <br></body></html>" ;	
			        new NormalMail().sendMail("Outstanding Dues & Handover Report",gamail1,CCList,body , "NEIN-C2IT: Pending Outstanding Dues & Handover Report Reminder");
			        body="";
			        }  
				}
			
			} catch (SQLException e) 
			    {
				e.printStackTrace();
			    }	
    }






}
