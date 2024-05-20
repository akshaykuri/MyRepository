package email;

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
	
public void sendMail(String From , String To , String CC , String body , String Subject){ 
	
		try {
			
			//String host ="203.124.152.3"; change from
			//String host ="10.206.10.10";//change to
			 
				 String host ="95.217.110.90";   //NEIN
				 From="c2it.neinsoft@nipponexpress.com";
				 final String password="Mypassword1234";
				 final String userName = "test";
			 
			    Properties properties = new Properties();
			    properties.put("mail.smtp.host", host);
				properties.put("mail.transport.protocol", "smtp");
		        properties.put("mail.smtp.port",  "25");
		        properties.put("mail.user", userName);
		        properties.put("mail.password", password);

			
		        /* properties.put("mail.smtp.auth", "true");
		        properties.put("mail.smtp.starttls.enable", "true");
		        properties.put("mail.smtp.reportsuccess","true");
		        properties.put("mail.smtp.reportsuccess", "false");*/

	 		
	     // creates a new session with an authenticator
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
		
		msg.setFrom(new InternetAddress(From));	 
		msg.setSubject(Subject, "UTF-8");
	 
		// msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(sendTo));

         InternetAddress[] toAddress = InternetAddress.parse(To);        
         msg.addRecipients(RecipientType.TO, toAddress);		 
         if(CC != null){
             InternetAddress[] ccAddress = InternetAddress.parse(CC);
             msg.addRecipients(RecipientType.CC, ccAddress);
             }
     	 
		  // Create the message body part
          BodyPart messageBodyPart = new MimeBodyPart();
         
         //  messageBodyPart.setContent(htmlText, "text/html");
          messageBodyPart.setContent(body,"text/html");
         //  messageBodyPart.setText(message);
         
        // Create a multipart message for attachment
         Multipart multipart = new MimeMultipart();

         // Set text message part
         multipart.addBodyPart(messageBodyPart); 
         // Send the complete message parts
         msg.setContent(multipart);	
         Transport.send(msg);	
            
		System.out.println("Mail Sent to " +To );			
	   } 
	   catch (MessagingException e) {		
		  e.printStackTrace();
    	}	
	}
	
}
