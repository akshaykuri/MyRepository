package email;

import java.io.UnsupportedEncodingException;
import java.util.Date;
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

public class SendInlineImagesInEmail {
	
	
	
	  public static void sendEmailWithImage(EmailEntity emailEntity)throws AddressException, MessagingException {

		  
		  if(emailEntity != null && emailEntity.validate()) return;
  		final String userName = emailEntity.getUserName();
  		final String password = emailEntity.getPassword();
      
  		Properties properties = new Properties();
  		properties.put("mail.smtp.host", emailEntity.getHost());
        properties.put("mail.smtp.port", emailEntity.getPort());
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
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
      //try {
      // creates a new e-mail message
      Message msg = new MimeMessage(session);
      msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailEntity.getToAddress()));
      
      if(emailEntity.getCcAddress()!=null){
    	  msg.addRecipients(Message.RecipientType.CC, InternetAddress.parse(emailEntity.getCcAddress()));
      }
    msg.setSubject(emailEntity.getSubject());
    if(emailEntity.getFromAddress() == null){
  	  
  	  try {
  			msg.setFrom(new InternetAddress("HRMS.nittsu.co.in", "HRMS-BirthDay Wishes"));
  		} catch (UnsupportedEncodingException e) {
  			e.printStackTrace();
  		}
    }
    else{
    try {
		msg.setFrom(new InternetAddress(emailEntity.getFromAddress(), "HRMS"));
	} catch (UnsupportedEncodingException e) {
		e.printStackTrace();
	}
    }
      msg.setSentDate(new Date());
       
      // creates message part
      MimeBodyPart messageBodyPart = new MimeBodyPart();
		  
		  String htmlText = "<html><body>" +
		  		/*"" +*/
		  		
		  		"<table><tr>" +
		  		" <td style='color:#CD5C5C'> <font face=' Calibri, Candara, Segoe, 'Segoe UI', Optima, Arial, sans-serif' size=4 style='font-weight: bold;'>Dear "+userName+",</font></td>" +
		  		" </tr>" +
		  		" <tr style='margin-left:8%;'>" +
		  		" <td style='line-height: 22.4px;color:#4682B4;margin-left:8%;font-style:italic;'> <font face='Calibri'  size='5'>May this coming year be filled with good health ,happiness and both personal and professional growth for you</font> </td>" +
		  		" </tr>" +
		  		" <tr style='margin-left:12%;'><td style='line-height: 22.4px;color:#4682B4;margin-left:12%;font-style:italic;'><font face='Calibri'  size='5'>Have a wonderful Birthday</font></td></tr>" +
		  		" </table>" +
		  		" <br><br>" +
		  		" <div width='20%' style='float:left;margin-top:2%;'><img src=\"cid:image\"></div>" +
		  		" <br><br>" +
		  		" <table style='margin-top:5%;'>" +
		  		" <tr> <td style='color:#4682B4;margin-top:5%;font-style:italic;'><font face='Calibri'  size='5'>Best Wishes Always,</font></td></tr>" +
		  		" <tr> <td style='color:#4682B4;margin-top:5%;font-style:italic;'><font face='Calibri'  size='5'>From</font></td> </tr>" +
		  		" <tr><td width='20%'><img src=\"cid:imageLogo\" width='20%'></td></tr> " +
		  		
		  		"  </table>" +
		  		
		  		
		  		
		  	/*	" <div width='30%' style='float:left;mrgin-left:30%'>" +*/
		  		" </body></html>";
         messageBodyPart.setContent(htmlText, "text/html");
   
         Multipart multipart = new MimeMultipart();
         multipart.addBodyPart(messageBodyPart);

         // second part (the image)
         messageBodyPart = new MimeBodyPart();
         DataSource fds = new FileDataSource(
           // "D:\\bday\\Birthday-Cake-Pictures-Images-Photos.jpg");
           "E:\\PROJECTS\\HRMS\\bday\\bday12.jpg");
       

         messageBodyPart.setDataHandler(new DataHandler(fds));
         messageBodyPart.setHeader("Content-ID", "<image>");
         
        
         

         // add image to the multipart
         multipart.addBodyPart(messageBodyPart);
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
         //adding second image in mail
         messageBodyPart = new MimeBodyPart();
         DataSource fdsLogo = new FileDataSource(
        "E:\\PROJECTS\\HRMS\\bday\\logo1.jpg");
         messageBodyPart.setDataHandler(new DataHandler(fdsLogo));
         messageBodyPart.addHeader("Content-ID","<imageLogo>");
         // add it
         multipart.addBodyPart(messageBodyPart);
   //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++      
         // put everything together
         msg.setContent(multipart);
         // Send message
         Transport.send(msg);

         System.out.println("Sent message successfully....");

      }
      
	  //}
}