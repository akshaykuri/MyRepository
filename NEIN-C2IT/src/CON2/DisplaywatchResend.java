package CON2;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class ResendMail
 */
//@WebServlet("/DisplaywatchResend")
public class DisplaywatchResend extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
	   static final long serialVersionUID = 1L;
	   
	    /* (non-Java-doc)
		 * @see javax.servlet.http.HttpServlet#HttpServlet()
		 */
		 	
		
		/* (non-Java-doc)
		 * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
		}  	
		
		/* (non-Java-doc)
		 * @see javax.servlet.http.HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
		
			String mr_date=null;
			
			System.out.println("BEFORE READING MAIL :");
			MailMessage mailMessage = new MailMessage();
		   
			
			String mail = request.getParameter("mail");
			System.out.println("mail id "+mail);
			String cm_mail = request.getParameter("cm_mail");
		    System.out.println("cm_mail : "+cm_mail);
		    Connection con = null;
			
			PreparedStatement pst = null,pst2=null,pst3=null;
			ResultSet rs3 = null,rs4=null,rs5=null;
			Connection2 dbConn = new Connection2();
			con = dbConn.getConnection2();
	
		    
		    String values[] = mail.split(",");
			
			String message = mailMessage.getMailMessage(values[1]);
			System.out.println("val 1 To Mail: "+values[0]);//farooq.s@nittsu.co.in
			System.out.println("val 2 : "+values[1]);//NEIN/CM-71
			System.out.println("val 3 From Name: "+values[2]);// ddd
			System.out.println("val 4 From Mail id: "+values[3]);//farooq.s@nittsu.co.in 
			System.out.println("val 5 Location: "+values[4]);//cm_location
			
			System.out.println("val 6 Location seccc: "+values[5]);//cm_location
			System.out.println("val 7 IP address: "+values[6]);//cm_location
			System.out.println("val 8 Department: "+values[7]);// Department
			System.out.println("val 9 reportingOffMail: "+values[8]);//reportingOffMail
			PostMail postmail = new PostMail();
			int id=0;int countt =0;
			//postmail.postMail(m_from, m_pass, m_to, m_subject, m_body)
			try{
				
				pst= con.prepareStatement("SELECT max(counting) FROM complain_master_item where complain_id=?");
				pst.setString(1,values[1]);
				
				rs3 = pst.executeQuery();
				
				
			    //For Counting resent
				 if(rs3.next()){
						id=rs3.getInt(1);
						if(id==0)
						{	id=1; }
							System.out.println("ID VALUE "+id);
							 countt = id+1;     
								//new_id = id2+String.valueOf(id);
								System.out.println("countt "  +countt);
								
								pst2= con.prepareStatement("UPDATE complain_master_item SET counting=? where complain_id=?");
								pst2.setInt(1,countt);
								pst2.setString(2,values[1]);
								//rs4 = pst2.executeQuery();
								int b = pst2.executeUpdate(); 
								System.out.println("After prepare stat countt "  +countt);
						}
				 	pst3= con.prepareStatement("select Locname,assignedLocation,nentryho.Nmail from  assigned_master INNER JOIN nentryho ON(assigned_master.Locname=nentryho.Nname) WHERE assignedLocation=? AND Npost=? AND depart=?");
				 	pst3.setString(1,values[5]);
				 	pst3.setString(2,"IT SUPPORT");
				 	pst3.setString(3,values[7]);
					
					rs5= pst3.executeQuery();
			//postmail.postMail("frksh27@gmail.com","farooq!@12","farooqsha27@gmail.com",mr_id+" Report",e_name+  " "+  "Resent u a mail , GO for the Above M.R ID \n Local LAN - http://10.206.10.18:8085/nepl1/HOME.jsp \n public domain - http://http://203.124.152.5:8085/nepl1/HOME.jsp ");
			 while(rs5.next())
					  {
				 String mailIdds = rs5.getString(3);
				        postmail.postMail(values[3],values[2],"pass1234",mailIdds,"NEIN-C2IT Complaint No. : "+values[1],""+ values[2]+ "<font color=red> - Reminder mail on the compliant : " +values[1]+  " , request you to resolve this problem / issue at the earliest.</font><br>FROM IP ADDRESS :"+values[6]+"<br><br> C2IT - http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp <br> Common link - http://neinsoft.nittsu.co.in:8185/NEIN</br>"+message+"");
					  }
			 			//postmail.postMail(values[3],values[2],"pass1234","prasanna.v@nittsu.co.in","NEIN-C2IT Complaint No. : "+values[1],""+ values[2]+ "<font color=red> - Reminder mail on the compliant : " +values[1]+" , request you to resolve this problem / issue at the earliest.</font><br>FROM IP ADDRESS :"+values[6]+"<br><br> C2IT - http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp <br> common link - http://neinsoft.nittsu.co.in:8185/NEIN</br>"+message+"");
			              postmail.postMail(values[3],values[2],"pass1234",values[8],"NEIN-C2IT Complaint No. : "+values[1],""+ values[2]+ "<font color=red> - Reminder mail on the compliant : " +values[1]+" , request you to resolve this problem / issue at the earliest.</font><br>FROM IP ADDRESS :"+values[6]+"<br><br> C2IT - http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp <br> common link - http://neinsoft.nittsu.co.in:8185/NEIN</br>"+message+"");
			 			mr_date = "mail sent sucessfully";
			}
			catch (Exception e) {
				// TODO: handle exception
			}
			finally{
				DbUtil.closeDBResources(rs3,pst,con);
				DbUtil.closeDBResources(rs4,pst2,con);
				DbUtil.closeDBResources(rs5,pst3,con);
				}
			response.getWriter().print(mr_date);
			
		}   	  	    
	}