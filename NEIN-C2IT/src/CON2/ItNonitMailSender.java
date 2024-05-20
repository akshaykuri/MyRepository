package CON2;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 * Servlet implementation class ItNonitMailSender
 */
//@WebServlet("/ItNonitMailSender")
public class ItNonitMailSender  {
	

	MailMessage mailMessage = new MailMessage();
	
	
	Connection con = null;
		
		PreparedStatement pst = null,pst2=null;
		ResultSet resultSet = null,rs2=null;	
		Connection2 dbConn = new Connection2();
		PostMail postMail = new PostMail();
		
		String sql = null;

		public void successpoMailSender(String to,String form_no,String location) throws SQLException
		{
			//String msg = null;  !=
			try{
			System.out.println("It non it mail is woring .. values are : ?  "+to+"  mr id :"+form_no+"  location :"+location);
			String message = mailMessage.getMailMessage(form_no);
			postMail.postMail("NEIN-C2IT@gmail.com","NEIN-C2IT","farooq!@12", "farooqsha27@gmail.com",
					"Domain User Form has been Approved ","Domain User Form <font color=blue>" +form_no+ "</font>  has been approved,  your are requested to login to C2IT .<br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.18:8185/P2P-SOFT/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.5:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>"+message);
			con = dbConn.getConnection2();
			
			
    
			if(!to.equals("IT"))
				       to="NON";
			
			
			
			if(to.equals("IT"))
			{
			postMail.postMail("NEIN-C2IT@NITTSU.CO.IN","NEIN-C2IT","pass1234", "prasanna.v@nittsu.co.in",
    				"Domain User has been Approved ","Domain User <font color=blue>" +form_no+ "</font>  has been approved,  your are requested to login to C2IT.<br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.18:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.5:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>"+message);
			}
			else if(to.equals("NON"))
			{
				postMail.postMail("NEIN-C2IT@NITTSU.CO.IN","NEIN-C2IT","pass1234", "vani.shree@nittsu.co.in",
						"Domain User has been Approved ","Domain User <font color=blue>" +form_no+ "</font>  has been approved,  your are requested to login to C2IT.<br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.18:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.5:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>"+message);
		    }
				
			
				
			    pst = con.prepareStatement("select mail from mailmaster where	department=? and branch_name = ?");
			   //pst = con.prepareStatement("select mrmailho.mail as mail,city from mrmailho,mr_master where department=? and mr_master.city=mrmailho.branch_name = ? and mr_master.idextend IS NOT null");
			    System.out.println("success mail sender");
			    
			    pst.setString(1, to);
			    pst.setString(2, location);
			  
			    resultSet = pst.executeQuery();
			    
			    
			    while(resultSet.next())
			    {
			    	if(resultSet.getString(1)!=null)
			    	{
			    		System.out.println("getting mail value :"+resultSet.getString(1));
			    		//here add mail , and sending mail to IT and NON it    
			    		postMail.postMail("NEIN-C2IT@NITTSU.CO.IN","NEIN-C2IT","pass1234", resultSet.getString(1),
			    				"Domain User has been Approved ","Domain User <font color=blue>" +form_no+ "</font>  has been approved,  your are requested to login to C2IT.<br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.18:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.5:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>"+message);
			    		//postMail.postMail("P2PSOFT@NITTSU.CO.IN","pass1234",mail," Material Requisition Request :  " +mr_id+ " ",e_name+  " "+  "request your approval for the following Material Requisition." +mr_id+ "  <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.18:8185/nepl1/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.5:8185/nepl1/HOME.jsp  <br><br><br><br>"+message);
			    	}
			    }
			    
			    
			    
			    
			    
			    
			    
			    
			    
				   pst2 = con.prepareStatement("select mail from form2_domain_item where form2_no='"+form_no+"' AND status='Initiator' ORDER BY id ASC");
				   //pst = con.prepareStatement("select mrmailho.mail as mail,city from mrmailho,mr_master where department=? and mr_master.city=mrmailho.branch_name = ? and mr_master.idextend IS NOT null");
				    System.out.println("success mail 22222222222222222sender");
				    
				 //  pst2.setString(1, mrId);
				  
				    rs2 = pst2.executeQuery();
				    
				    
				    while(rs2.next())
				    {
				    	if(rs2.getString(1)!=null)
				    	{
				    		System.out.println("getting mail value-------- :   "+rs2.getString(1));
				    		//here add mail , and sending mail to IT and NON it    
				    		postMail.postMail("NEIN-C2IT@NITTSU.CO.IN","NEIN-C2IT","pass1234", rs2.getString(1),
				    				"Copy Of Mail To Initiator : Domain User has been Approved ","Material Requisition <font color=blue>" +form_no+ "</font><br><br><br><br>"+message);
				    		//postMail.postMail("P2PSOFT@NITTSU.CO.IN","pass1234",mail," Material Requisition Request :  " +mr_id+ " ",e_name+  " "+  "request your approval for the following Material Requisition." +mr_id+ "  <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.18:8185/nepl1/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.5:8185/nepl1/HOME.jsp  <br><br><br><br>"+message);
				    	}
				    }
			
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		finally{
			DbUtil.closeDBResources(rs2,pst,con);
			DbUtil.closeDBResources(resultSet,pst2,null);
			
			
		}	    
				    
				    
		}
		
		
	}
