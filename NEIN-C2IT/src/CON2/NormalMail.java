package CON2;

import java.io.UnsupportedEncodingException;

import java.util.Properties;
 
import javax.mail.Authenticator;
import javax.mail.BodyPart; 
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import javax.mail.internet.MimeMultipart;


public class NormalMail {
	
public void sendMail(String From , String To , String CC , String body , String Subject)throws UnsupportedEncodingException { 
	
	try {  
		//String host ="10.206.10.10";
		From="c2it.neinsoft@nipponexpress.com";
		String host ="95.217.110.90";
		String port="25";
		final String userName = "test";
		final String password = "Mypassword1234";

		Properties properties = new Properties();
 		properties.put("mail.smtp.host", host);
 		properties.put("mail.smtp.port",  port); //"25"
 	    
    	/*properties.put("mail.smtp.auth", "true");
 		properties.put("mail.smtp.starttls.enable", "true");*/
 		
 		properties.put("mail.smtp.reportsuccess","true");
 		properties.put("mail.user", userName);
 		properties.put("mail.password", password);
 		properties.put("mail.smtp.reportsuccess", "false");
 		
 		properties.put("mail.smtp.localhost","nittsu.co.in");
 	 
        Authenticator auth = new Authenticator() {
          public PasswordAuthentication getPasswordAuthentication() {
               return new PasswordAuthentication(userName, password);
           }
        };
        
        Session session = Session.getInstance(properties, auth);
        
	    MimeMessage msg = new MimeMessage(session);
	    msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
	    msg.addHeader("formate","flowed");
	    msg.addHeader("Content-Transfer-Encoding", "8bit");
	    
	    msg.setFrom(new InternetAddress(From,""));	 
	  //  msg.setFrom(new InternetAddress("Testing"));
	    msg.setSubject(Subject, "UTF-8"); 
        //String CC="";
        
        InternetAddress[] toAddress = InternetAddress.parse(To);        
        msg.addRecipients(RecipientType.TO, toAddress);	
       // msg.setRecipient(RecipientType.TO, new InternetAddress(To));
        
        if(CC != null){
         InternetAddress[] ccAddress = InternetAddress.parse(CC);
         msg.addRecipients(RecipientType.CC, ccAddress);
         } 
     
         BodyPart messageBodyPart = new MimeBodyPart();
         
         messageBodyPart.setContent(body,"text/html"); 
         Multipart multipart = new MimeMultipart(); 
         multipart.addBodyPart(messageBodyPart);  
         msg.setContent(multipart);	
         
         Transport.send(msg);	
          
	     System.out.println("Mail Sent from " +From+" to :::"+To );			
      } 
      catch (MessagingException e) {		
	    e.printStackTrace();
	  }
	   
  }
	
}
