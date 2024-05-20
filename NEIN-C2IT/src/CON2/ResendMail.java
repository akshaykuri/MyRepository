package CON2;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ResendMail
 */
//@WebServlet("/ResendMail")
public class ResendMail extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {

	 static final long serialVersionUID = 1L;
	  
	    /* (non-Java-doc)
		 * @see javax.servlet.http.HttpServlet#HttpServlet()
		 */
		 	
		
		/* (non-Java-doc)
		 * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			System.out.println("BEFORE RESEND READING MAIL 1:");
		}  	
		
		/* (non-Java-doc)
		 * @see javax.servlet.http.HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			// TODO Auto-generated method stub
			System.out.println("BEFORE READING MAIL :");
			String mr_date=null;
			System.out.println("BEFORE RESEND READING MAIL 2:");
			
			MailMessageITclearance mailMessage = new MailMessageITclearance();
			
			
			
			
			String mail = request.getParameter("mail");
			System.out.println("Mail value...) "+mail);
			String values[] = mail.split(",");
			
			String message = mailMessage.getMailMessage(values[1]);
			
			
			PostMail postmail = new PostMail();
			
			//postmail.postMail(m_from, m_pass, m_to, m_subject, m_body)
			try{
			//postmail.postMail("frksh27@gmail.com","farooq!@12","farooqsha27@gmail.com",mr_id+" Report",e_name+  " "+  "Resent u a mail , GO for the Above M.R ID \n Local LAN - http://10.206.10.18:8085/nepl1/HOME.jsp \n public domain - http://http://203.124.152.5:8085/nepl1/HOME.jsp ");
			//postmail.postMail("NEIN-C2IT@NITTSU.CO.IN",values[0],"pass1234",values[0],values[1]," "+  "Resent u a mail" + " GO for the Above Form Number <br><br> Local LAN - http://10.206.10.18:8185/NEIN-C2IT/HOME.jsp <br> public domain - http://203.124.152.5:8185/NEIN-C2IT/HOME.jsp</br>"+message+"");
			postmail.postMail(values[0],values[3],"pass1234",values[2],"NEIN-C2IT ACCESS CARD No. : "+values[1]," "+  "Resent u a mail OF ACCESS CARD APPROVAL : " + " GO for the Above Form Number <br><br> Local LAN - https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp</br>"+message+"");
				//postmail.postMail("P2PSOFT@NITTSU.CO.IN","pass1234",mail, "Resent u a mail:  " ,mr_id," "+  " GO for the Above M.R ID <br><br> Local LAN - http://10.206.10.18:8185/nepl1/HOME.jsp <br> public domain - http://203.124.152.5:8185/nepl1/HOME.jsp ");
			// postmail.postMail("P2PSOFT@NITTSU.CO.IN","pass1234",mail," REEEEE Material Requisition Request :  " +mr_id+ " ",e_name+  " "+  "request your approval for the following Material Requisition." +mr_id+ "  <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.18:8185/nepl1/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.5:8185/nepl1/HOME.jsp  <br><br><br><br>");
			          mr_date = "mail sent sucessfully";
			}
			catch (Exception e) {
				// TODO: handle exception
			}
			
			response.getWriter().print(mr_date);
			
		}   	  	    
	}