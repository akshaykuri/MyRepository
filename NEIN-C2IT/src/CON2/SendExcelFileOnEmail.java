package CON2;

import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import javax.mail.internet.MimeMultipart;


public class SendExcelFileOnEmail {

	
	public int sendEmail(String From , String To , DataSource fds,String sub,String body,String filename){
		
		    System.out.println("Sending EMail fumcion");
		
		    //String host ="10.206.10.10";
		     String host ="95.217.110.90";   //NEIN
			 From="c2it.neinsoft@nipponexpress.com";
			 final String password="Mypassword1234";
			 final String userName = "test";
			 
			 
		/*    Properties props = System.getProperties();
		    props.put("mail.smtp.host",host);
		    props.put("mail.smtp.port", "25");*/
		  
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
           int result=0;
		   for (int i = 1; i <= 1; i++) { // retrying
		         try {
		           
		           MimeMessage message = new MimeMessage(session);
		           message.setFrom(new InternetAddress(From));
		           message.addRecipient(RecipientType.TO,new InternetAddress(To));
		           message.setSubject(sub);
		           
		           //String CC="prasanna.kumar@nittsu.co.in";
		           String CC="";
		            if(CC != null){
		            	InternetAddress[] ccAddress = InternetAddress.parse(CC);		          
		            	message.addRecipients(RecipientType.CC, ccAddress);
		            }
		            // Create the message part
		            BodyPart messageBodyPart = new MimeBodyPart();

		            // Fill the message
		            messageBodyPart.setText(body);

		            Multipart multipart = new MimeMultipart();
		            multipart.addBodyPart(messageBodyPart);
			        /* addAttachment(multipart, fileLocation, file);*/
		            messageBodyPart = new MimeBodyPart();
		            DataSource source = new FileDataSource(filename);
		            messageBodyPart.setDataHandler(new DataHandler(fds));
		            messageBodyPart.setFileName(filename);
		            multipart.addBodyPart(messageBodyPart);
	     
		            message.setContent(multipart);
		            System.out.println("***mail send to **********:: "+To);
		            Transport.send(message)	;
		            result++;
		          
		            System.out.println("**************Mail Sent**********::"+result);
		           break;
		         } catch (Exception ex) {
		            // log exception
		        }
        }
		
		return result;	
	}

}
