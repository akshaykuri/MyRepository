package email;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.Properties;
 
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;


 
/**
 * A utility class for sending e-mail message with attachment.
 * @author www.codejava.net
 *
 */
public class EmailUtility {
     
    /**
     * Sends an e-mail message from a SMTP host with a list of attached files.
     *
     */
    public static void sendEmailWithAttachment(EmailEntity emailEntity)throws AddressException, MessagingException {
    	
    	// sets SMTP server properties ;
    		if(emailEntity != null && emailEntity.validate()) return;
    		final String userName = emailEntity.getUserName();
    		final String password = emailEntity.getPassword();
        
    		//System.out.println("avs,avs,avs,avs,avs13246464745679");
    		Properties properties = new Properties();
    		properties.put("mail.smtp.host", emailEntity.getHost());
        properties.put("mail.smtp.port", emailEntity.getPort());
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        //properties.put("mail.smtp.reportsuccess","true");
        properties.put("mail.smtp.reportsuccess","true");
       properties.put("mail.user", userName);
        properties.put("mail.password", password);
 
        // creates a new session with an authenticator
      Authenticator auth = new Authenticator() {
           public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userName, password);
            }
        };
        
       
        Session session = Session.getInstance(properties, auth);
        // creates a new e-mail message
        Message msg = new MimeMessage(session);
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailEntity.getToAddress()));
        
        if(emailEntity.getCcAddress()!=null){
      	  msg.addRecipients(Message.RecipientType.CC, InternetAddress.parse(emailEntity.getCcAddress()));
        }
      msg.setSubject(emailEntity.getSubject());
      if(emailEntity.getFromAddress() == null){
    	  
    	  try {
    			msg.setFrom(new InternetAddress("support.itho@nittsu.co.in", userName));
    		} catch (UnsupportedEncodingException e) {
    			e.printStackTrace();
    		}
      }
      else{
      try {
		msg.setFrom(new InternetAddress(emailEntity.getFromAddress(), userName));
	} catch (UnsupportedEncodingException e) {
		e.printStackTrace();
	}
      }
        msg.setSentDate(new Date());
         
        // creates message part
        MimeBodyPart messageBodyPart = new MimeBodyPart();
        messageBodyPart.setContent(emailEntity.getMessage(), "text/html");
      
        
        
       
        // creates multi-part
        Multipart multipart = new MimeMultipart();
        multipart.addBodyPart(messageBodyPart);
       /* 
        String  fileLocation="D:\\neinSoft\\files\\Nippon-HRMS\\ResignationLetter\\20-05-2017\\1665\\IT.jpg";
        String  file="Resignation Letter";
        
        addAttachment(multipart, fileLocation, file);
        
      */
        // adds attachments
        List<File> attachedFiles = emailEntity.getAttachedFiles();
        
        if (attachedFiles == null || attachedFiles.isEmpty()) {
        	//System.out.println("avs,avs,avs,avs,avs");
            for (File aFile : attachedFiles) {
            	
                MimeBodyPart attachPart = new MimeBodyPart();
 
                try {
                    attachPart.attachFile(aFile);
                } catch (IOException ex) {
                    ex.printStackTrace();
                }
 
                multipart.addBodyPart(attachPart);
            }
        }
 
        //sets the multi-part as e-mail's content
            msg.setContent(multipart);
 
        // sends the e-mail
        Transport.send(msg);
        System.out.println("MAIL SENT ");
    }
   private static void addAttachment(final Multipart multipart, final String filepath, final String filename) throws MessagingException {
	    DataSource source = new FileDataSource(filepath);
	    BodyPart messageBodyPart = new MimeBodyPart();
	    try {
			messageBodyPart.setDataHandler(new DataHandler(source));
			messageBodyPart.setFileName(filename);
			multipart.addBodyPart(messageBodyPart);
			    
		} catch (javax.mail.MessagingException e) {
		
			e.printStackTrace();
		}
	}

 public static void sendEmailWithAttachment1(EmailEntity emailEntity, String fileName)throws AddressException, MessagingException {
 		// sets SMTP server properties ;
		if(emailEntity != null && emailEntity.validate()) return;
		final String userName = emailEntity.getUserName();
		final String password = emailEntity.getPassword();
 
		//System.out.println("avs,avs,avs,avs,avs13246464745679");
		Properties properties = new Properties();
		properties.put("mail.smtp.host", emailEntity.getHost());
        properties.put("mail.smtp.port", emailEntity.getPort());
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
       //properties.put("mail.smtp.reportsuccess","true");
        properties.put("mail.smtp.reportsuccess","true");
        properties.put("mail.user", userName);
        properties.put("mail.password", password);

 // creates a new session with an authenticator
        Authenticator auth = new Authenticator() {
        public PasswordAuthentication getPasswordAuthentication() {
         return new PasswordAuthentication(userName, password);
      }
 };
 

 Session session = Session.getInstance(properties, auth);
 // creates a new e-mail message
 Message msg = new MimeMessage(session);
 msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailEntity.getToAddress()));
 
 if(emailEntity.getCcAddress()!=null){
	  msg.addRecipients(Message.RecipientType.CC, InternetAddress.parse(emailEntity.getCcAddress()));
 }
msg.setSubject(emailEntity.getSubject());
if(emailEntity.getFromAddress() == null){
	  
	  try {
			msg.setFrom(new InternetAddress("support.itho@nittsu.co.in", userName));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
}
else{
try {
	msg.setFrom(new InternetAddress(emailEntity.getFromAddress(), userName));
} catch (UnsupportedEncodingException e) {
	e.printStackTrace();
}
}
 msg.setSentDate(new Date());
  
 // creates message part
 MimeBodyPart messageBodyPart = new MimeBodyPart();
 messageBodyPart.setContent(emailEntity.getMessage(), "text/html");

 // creates multi-part
 Multipart multipart = new MimeMultipart();
 multipart.addBodyPart(messageBodyPart);
 
 String  fileLocation=fileName;
 String  file="Resignation Letter";
 
 addAttachment(multipart, fileLocation, file);
 
 //sets the multi-part as e-mail's content
     msg.setContent(multipart);

 // sends the e-mail
 Transport.send(msg);
 System.out.println("MAIL SENT ");
       }    
    }