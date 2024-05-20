package email;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.Properties;
 
import javax.mail.Authenticator;

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
public class EmailUtilityForEmployeeLta {
     
    /**
     * Sends an e-mail message from a SMTP host with a list of attached files.
     *
     */
    public static void sendEmailWithAttachment(EmailEntity emailEntity)throws AddressException, MessagingException {
    	
    	// sets SMTP server properties ;
    		if(emailEntity != null && emailEntity.validate()) return;
    		final String userName = emailEntity.getUserName();
    		final String password = emailEntity.getPassword();
        
    		
    		Properties properties = new Properties();
    		properties.put("mail.smtp.host", emailEntity.getHost());
        properties.put("mail.smtp.port", emailEntity.getPort());
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        //properties.put("mail.smtp.reportsuccess","true");
        properties.put("mail.smtp.reportsuccess","false");
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
      try {
		msg.setFrom(new InternetAddress(emailEntity.getFromAddress(), userName));
	} catch (UnsupportedEncodingException e) {
		e.printStackTrace();
	}
        msg.setSentDate(new Date());
         
        // creates message part
        MimeBodyPart messageBodyPart = new MimeBodyPart();
    
        messageBodyPart.setContent(emailEntity.getMessage(), "text/html");
        
      
     
      // for medical in mail
    
      /* BodyPart partLta = new MimeBodyPart();
       partLta.setContent(emailEntity.getLtaTableMsg(), "text/html");
       
       */
       
    
        // creates multi-part
        Multipart multipart = new MimeMultipart();
        multipart.addBodyPart(messageBodyPart);
       // multipart.addBodyPart(partLta);
       
        
        // adds attachments
        
        List<String> attachedFiles = emailEntity.getAttachedFilesUpload();
        if (attachedFiles != null && !attachedFiles.isEmpty()) {
            for (String aFile : attachedFiles) {
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
    }
}
