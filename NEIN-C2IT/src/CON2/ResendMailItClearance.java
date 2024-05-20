
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
//@WebServlet("/ResendMailItClearance")
public class ResendMailItClearance extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
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
			
			System.out.println("BEFORE READING MAIL ITTTTTTt:");
			MailMessageITclearance mailMessage = new MailMessageITclearance();
		   
			
			String mail = request.getParameter("mail");
			System.out.println("mail id "+mail);
			String form1_no = request.getParameter("form1_no");
		    System.out.println("form1_no : "+form1_no);
			/*
		    String empD = request.getParameter("empD");
		    System.out.println("empD : "+empD);
			String SessionName = request.getParameter("SessionName");
			System.out.println("SessionName : "+SessionName);*/
		    
			String values[] = mail.split(",");
			
			String message = mailMessage.getMailMessage(values[1]);
			System.out.println("val 1 : "+values[0].replaceAll(" ", ""));
			System.out.println("val 2 : "+values[1].replaceAll(" ", ""));
			//System.out.println("val 3 : "+values[2].replaceAll(" ", ""));
			System.out.println("val 3 : "+values[2]);
			System.out.println("val 4 : "+values[3]);
			
			
			PostMail postmail = new PostMail();
			
			//postmail.postMail(m_from, m_pass, m_to, m_subject, m_body)
			try{
			//postmail.postMail("frksh27@gmail.com","farooq!@12","farooqsha27@gmail.com",mr_id+" Report",e_name+  " "+  "Resent u a mail , GO for the Above M.R ID \n Local LAN - http://10.206.10.18:8085/nepl1/HOME.jsp \n public domain - http://http://203.124.152.5:8085/nepl1/HOME.jsp ");
			postmail.postMail(values[0],values[3],"pass1234",values[2].replaceAll(" ", ""),"NEIN-C2IT  IT CLEARANCE No. : "+values[1].replaceAll(" ", "")," "+  "Resent u a mail OF IT CLEARANCE APPROVAL" + " GO for the Above CS ID <br><br> C2IT LINK - https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </br>"+message+"");
			 mr_date = "mail sent sucessfully";
			}
			catch (Exception e) {
				// TODO: handle exception
			}
			
			response.getWriter().print(mr_date);
			
		}   	  	    
	}