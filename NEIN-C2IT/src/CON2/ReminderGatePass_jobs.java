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

public class ReminderGatePass_jobs implements Job
     {

	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException 
	      {
		
	   // System.out.println("==============calling ReminderFor Pending ISPOUTAGE===================");
		try {
			  ReminderForGatePass();
			
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

	
	
private void ReminderForGatePass() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, ParseException, UnsupportedEncodingException
    {
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
    String body ="";
    String initiatoraa=null,initatorname=null,initatoremail=null,gamail=null,ganame=null,formno=null,itnonit=null;
   
    int diffInDays =0;
    int x=0;
	
	SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yy");
	Calendar c = Calendar.getInstance();
	
	c.setTime(new Date());
	c.add(Calendar.DATE,0); 
	String output1 = sdf1.format(c.getTime());
	String output=null;
	int srno=0;
		  
			try
			    {
				String  query1 = "Select formno,expRetDate,createdBy,createrEmailid,gamail,ganame,itnonit "+
				                 "from gatepassform where reminderUpdateFlag='0' and approvalStatus='Approved' and passType='RETURNABLE' ";

				
                st = (Statement) con.createStatement();
                rs = st.executeQuery(query1);
				PreparedStatement statement = con.prepareStatement(query1);
				rs = statement.executeQuery();
				 
				while(rs.next())
				    { 
					srno=0;
					x=x+1;
					formno	 =rs.getString("formno");
					output	 =rs.getString("expRetDate");
					initatorname=rs.getString("createdBy");
                    initatoremail=rs.getString("createrEmailid");
                    gamail=rs.getString("gamail");
                    ganame=rs.getString("ganame");
                    itnonit=rs.getString("itnonit");
                    SimpleDateFormat df = new SimpleDateFormat("dd-MM-yy");
					Date startDate = df.parse(output);
					Date enddate = df.parse(output1);
					
					System.out.println("startDate ::"+startDate);
					System.out.println("enddate ::"+enddate);
					
					diffInDays = (int)( (enddate.getTime() - startDate.getTime())/ (1000 * 60 * 60 * 24) );
					
					System.out.println("diffInDays ::"+diffInDays);
					String CCList = "chintu.kumar@nipponexpress.com";
				    if(x != 0)
                         {
					     if(diffInDays > 2 && !(diffInDays > 6))
					           {
					    	   body =" <html> <body> <p> Dear &nbsp&nbsp"+rs.getString("createdBy")+" <br>"+
							   " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
							   " You have bellow pending Gate Pass Asset Return Please update <br><br>";
                               body=body+" <table border='1' width='500'><tr align='center'><td colspan='5'>Pending Gate Pass Asset Details</td></tr>";
				               
				               body=body+" <tr> <td >Form No</td><td colspan='4'>"+rs.getString("formno")+"</td></tr>";
				               
				               body=body+" <tr><td>SrNo</td> <td>Item Desc</td> <td>Asset No</td> "+
				                         " <td>Quantity</td><td>Remarks</td></tr>";
				                
				               String  query2 = "Select descItems,assetNo,qty,remarks "+
				                                "from gatepassitem where formno='"+formno+"' ";
                               st1 = (Statement) con.createStatement();
                               rs1 = st1.executeQuery(query1);
				               PreparedStatement statement1 = con.prepareStatement(query2);
				               rs1 = statement1.executeQuery();
				               while(rs1.next())
							         { 
				            	   srno=srno+1;
				                   body=body+" <tr> <td>"+srno+"</td><td>"+rs1.getString("descItems")+"</td> <td>"+rs1.getString("assetNo")+"</td> "+
				                               " <td>"+rs1.getString("qty")+"</td><td>"+rs1.getString("remarks")+"</td></tr>";
							        }
	                  	       body=body+"</table> <br>";
					 	 
						       new NormalMail().sendMail("Gate Pass",initatoremail,CCList,body , "Pending Gate Pass Reminder");
						       }
					     if(diffInDays > 6 && !(diffInDays > 15))
					           {
						       String CCList1 =initatoremail+","+"chintu.kumar@nipponexpress.com";
						       body =" <html> <body> <p> Dear &nbsp&nbsp"+rs.getString("ganame")+", <br>"+
						       " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
							   " Bellow given asset details still not return back from vendor. <br><br>";
				               body=body+" <table border='1' width='500'><tr align='center'><td colspan='5'>Pending Gate Pass Asset Details</td></tr>";
				               
				               body=body+" <tr> <td >Form No</td><td colspan='4'>"+rs.getString("formno")+"</td></tr>";
				               
				               body=body+" <tr><td>SrNo</td> <td>Item Desc</td> <td>Asset No</td> "+
				                         " <td>Quantity</td><td>Remarks</td></tr>";
				               
				               String  query2 = "Select descItems,assetNo,qty,remarks "+
				                                "from gatepassitem where formno='"+formno+"' ";
                               st1 = (Statement) con.createStatement();
                               rs1 = st1.executeQuery(query1);
				               PreparedStatement statement1 = con.prepareStatement(query2);
				               rs1 = statement1.executeQuery();
				               while(rs1.next())
							         { 
				            	     srno=srno+1;
				                     body=body+" <tr> <td>"+srno+"</td><td>"+rs1.getString("descItems")+"</td> <td>"+rs1.getString("assetNo")+"</td> "+
				                               " <td>"+rs1.getString("qty")+"</td><td>"+rs1.getString("remarks")+"</td></tr>";
							         }
	                  	       body=body+"</table> <br>";     new NormalMail().sendMail("Gate Pass",gamail,CCList1,body , "Pending Gate Pass Reminder");
					        
					           }
					     if(diffInDays > 15)
				           {
					       String tomail="";	 
					       if(itnonit.equals("IT"))
					    	     tomail="prasanna.v@nittsu.co.in";
					       else
					    	     tomail="vani.shree@nittsu.co.in"; 
					       String CCList1 =gamail+","+initatoremail+","+"chintu.kumar@nipponexpress.com";
					       body =" <html> <body> <p> Dear &nbsp&nbsp Sir/Madam, <br>"+
					       " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
						   " Bellow given asset details still not return back from vendor. <br><br>";
			               body=body+" <table border='1' width='500'><tr align='center'><td colspan='5'>Pending Gate Pass Asset Details</td></tr>";
			               
			               body=body+" <tr> <td >Form No</td><td colspan='4'>"+rs.getString("formno")+"</td></tr>";
			               
			               body=body+" <tr><td>SrNo</td> <td>Item Desc</td> <td>Asset No</td> "+
			                         " <td>Quantity</td><td>Remarks</td></tr>";
			               
			               String  query2 = "Select descItems,assetNo,qty,remarks "+
			                                "from gatepassitem where formno='"+formno+"' ";
                         st1 = (Statement) con.createStatement();
                         rs1 = st1.executeQuery(query1);
			               PreparedStatement statement1 = con.prepareStatement(query2);
			               rs1 = statement1.executeQuery();
			               while(rs1.next())
						         { 
			            	     srno=srno+1;
			                     body=body+" <tr> <td>"+srno+"</td><td>"+rs1.getString("descItems")+"</td> <td>"+rs1.getString("assetNo")+"</td> "+
			                               " <td>"+rs1.getString("qty")+"</td><td>"+rs1.getString("remarks")+"</td></tr>";
						         }
                	       body=body+"</table> <br>";   
                	       new NormalMail().sendMail("Gate Pass",tomail,CCList1,body , "Pending Gate Pass Reminder");
				           }
					     
					     
					     
					     
					     
					     
					           body=body+" <h4>https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h4><br>" +
							      " <h4>https://neinsoft1.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp</h4>" +
								  " <br></body></html>" ;					
					
                         }
				    }
			} catch (SQLException e) 
			    {
				// TODO Auto-generated catch block
				e.printStackTrace();
			    }	
    }
}
