package CON2;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
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
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeMultipart;

//@WebServlet("/PostMail")

public class PostMail {
	
	
	class GMailAuthenticator extends Authenticator {
	   String user;
	    String pw;
	    public GMailAuthenticator (String username, String password)
	    {  
	      super();
	       this.user = username;
	       this.pw = password;
	    }
	   public PasswordAuthentication getPasswordAuthentication()
	   {
	     return new PasswordAuthentication(user, pw);
	   }
	}

	
    String host ="95.217.110.90"; 
    String port="25";
    
	
	public void postMail(String m_from,String m_fromName,String m_pass,String m_to,String m_subject,String m_body)throws UnsupportedEncodingException{
		 
	      try {
	    	//String host ="10.206.10.10";
	    	  
	    	  System.out.println("TOooooooooooooooooo111 Adderess log :"+m_to);
	    	  
	    	  
	    	  m_from="c2it.neinsoft@nipponexpress.com";
				String host ="95.217.110.90";
				String port="25";
				final String userName = "test";
				final String password = "Mypassword1234";

				Properties properties = new Properties();
		 		properties.put("mail.smtp.host", host);
		 		properties.put("mail.smtp.port",  port); //"25"
		 	  	 		
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
			    
			    msg.setFrom(new InternetAddress(m_from,""));	 
			  //  msg.setFrom(new InternetAddress("Testing"));
			    msg.setSubject(m_subject, "UTF-8"); 
	            //String CC="";
	            
	            InternetAddress[] toAddress = InternetAddress.parse(m_to);        
	            msg.addRecipients(RecipientType.TO, toAddress);	
	          
	            BodyPart messageBodyPart = new MimeBodyPart();
	             
	             messageBodyPart.setContent(m_body,"text/html"); 
	             Multipart multipart = new MimeMultipart(); 
	             multipart.addBodyPart(messageBodyPart);  
	             msg.setContent(multipart);	
	             
	             Transport.send(msg);	
	              
			     System.out.println("Mail Sent from " +m_from+" to :::"+m_to );			

	    }
	        catch (Exception e) {
				// TODO: handle exception
	        	
	        	e.printStackTrace();
			}
	    }
	
	
	
	
	 public void postMailCCDReportAttachedFile(String m_from,String m_fromName,String m_pass,String m_to,String m_subject,String m_body,String imsId)throws UnsupportedEncodingException
     {
	   try 
	      {
		   System.out.println("creating directory: small for imsId " +imsId);
  	        	       
  	     m_from="c2it.neinsoft@nipponexpress.com";
   	     m_pass="Mypassword1234";
   	  
   	     Properties m_properties  = System.getProperties();
   	     m_properties.put("mail.smtp.host", host);
   	     m_properties.put("mail.transport.protocol", "smtp");
         m_properties.put("mail.smtp.port", port);
         m_properties.put("mail.smtp.localhost","nittsu.co.in");
  	       
         
  	 
        File folder = new File("E:\\neinSoft\\files\\C2IT\\CCDReport\\"+imsId+"\\");
        File[] listOfFiles = folder.listFiles();
        if((!folder.exists())||listOfFiles==null)
            {
            System.out.println("creating directory: small for ");
            System.out.println("Files length--------------------------: " +listOfFiles);
            }
        else
            {
		      for (File file : listOfFiles) 
		            {
		            if (file.isFile()) 
		                {
		                System.out.println(file.getName());
		                } 
		            }
              }  
       Session m_Session = Session.getInstance(m_properties, new GMailAuthenticator(m_from, m_pass));
       Message  m_simpleMessage  =   new MimeMessage(m_Session);
       InternetAddress m_fromAddress    =   new InternetAddress(m_from,"");
       InternetAddress m_toAddress      =   new InternetAddress(m_to);
       m_simpleMessage.setFrom(m_fromAddress);
       m_simpleMessage.setRecipient(RecipientType.TO, m_toAddress);
       m_simpleMessage.setSubject(m_subject);
       Multipart mp = new MimeMultipart();
       BodyPart msgBody = new MimeBodyPart();
       msgBody.setContent(m_body, "text/html");
       mp.addBodyPart(msgBody);
       if((!folder.exists())||listOfFiles==null)
            {
            System.out.println("creating directory: FOR ");
            System.out.println("Files length--------------------------: " +listOfFiles);
            }
        else
            {
            for (File file : listOfFiles) 
                  { 
          	    if (file.isFile()) 
          	         {
           	         MimeBodyPart messageBodyPart2 = new MimeBodyPart();
                       DataSource source = new FileDataSource(file);
                       messageBodyPart2.setDataHandler(new DataHandler(source));
                       messageBodyPart2.setFileName(file.getName());
                       mp.addBodyPart(messageBodyPart2);
          	         }
                 }
            }
         
          m_simpleMessage.setContent(mp);              
          Transport.send(m_simpleMessage);
   } catch (MessagingException ex) 
          {
          ex.printStackTrace();
          }
     catch (Exception e) 
          {
	    	e.printStackTrace();
		    }
  }
	public void sendMailWithAttachment(String From ,String m_fromName , String To , String Subject , String body , String form_no) throws UnsupportedEncodingException{ 
	     //Lotus Notes for IT manager 

		
		try {
			System.out.println("form_no  ::::::::::::::::: in post mail "+form_no);
	
			
			From="c2it.neinsoft@nipponexpress.com";
			final String userName = "test";
			final String password = "Mypassword1234";
	   	  
	   	     Properties properties  = System.getProperties();
	   	     properties.put("mail.smtp.host", host);
	      	 properties.put("mail.transport.protocol", "smtp");
	     	 properties.put("mail.smtp.port", port);
	     	 properties.put("mail.smtp.localhost","nittsu.co.in");
	     	 properties.put("mail.user", userName);
	 		 properties.put("mail.password", password);
			
		
	 		
	 		
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
		 File folder = new File("E:\\neinSoft\\files\\C2IT\\LotusSupportingFile\\"+form_no+"\\");
				File[] listOfFiles = folder.listFiles();
		 if((!folder.exists())||listOfFiles==null)
	     {
	       System.out.println("creating directory: small for ");
	       System.out.println("Files length--------------------------: " +listOfFiles);
	     }
	     else{
		            for (File file : listOfFiles) {
		                if (file.isFile()) {
		                    System.out.println("File attached Names : "+file.getName());
		                } }
	         }  
	
		 InternetAddress m_fromAddress    =   new InternetAddress(From,"");
         msg.setFrom(m_fromAddress);
		 msg.setSubject(Subject, "UTF-8");
		 InternetAddress[] toAddress = InternetAddress.parse(To);        
	     msg.addRecipients(RecipientType.TO, toAddress);
	   
	     
	     BodyPart msgBody = new MimeBodyPart();
	     msgBody.setContent(body, "text/html");
	  
	     Multipart multipart = new MimeMultipart();
	     multipart.addBodyPart(msgBody); 
	     if((!folder.exists())||listOfFiles==null)
	     {
	       System.out.println("creating directory: FOR ");
	       System.out.println("Files length--------------------------: " +listOfFiles);
	     }else{
	     for (File file : listOfFiles) 
	     { 
	     	if (file.isFile()) {
	   
	     	MimeBodyPart messageBodyPart2 = new MimeBodyPart();
	         DataSource source = new FileDataSource(file);
	         messageBodyPart2.setDataHandler(new DataHandler(source));
	         messageBodyPart2.setFileName(file.getName());
	         multipart.addBodyPart(messageBodyPart2);
	     	}
	     }}
	    // Set text message part
	    
	     // Send the complete message parts
	     
	     msg.setContent(multipart);	
	   Transport.send(msg);	

			System.out.println("Mail Sent to " +To );
	} 

	catch (MessagingException e) {
		
		e.printStackTrace();
	}

	}
    
	 public  void postMailAttachedFile(String ccmail,String m_from,String m_fromName,String m_pass,String m_to,String m_subject,String m_body,String csId)throws UnsupportedEncodingException{
    	 
	        try {
	        
	        	System.out.println("call mail sending method 1111");
	      	  
	      	m_from="c2it.neinsoft@nipponexpress.com";
			final String userName = "test";
			final String password = "Mypassword1234";
	   	  
	   	     Properties properties  = System.getProperties();
	   	     properties.put("mail.smtp.host", host);
	      	 properties.put("mail.transport.protocol", "smtp");
	     	 properties.put("mail.smtp.port", port);
	       	 properties.put("mail.smtp.localhost","nittsu.co.in");
	     	 properties.put("mail.user", userName);
	 		 properties.put("mail.password", password);    
	              
	           
	              
	              File is = new File("C:\\workspace\\CheckSheet\\JRXML\\"+csId+".pdf");
	              
	               
	              Session m_Session = Session.getInstance(properties, new GMailAuthenticator(m_from, m_pass));
	               
	              Message  m_simpleMessage  =   new MimeMessage(m_Session);
	              
	              InternetAddress m_fromAddress    =   new InternetAddress(m_from,"");
	             InternetAddress m_toAddress      =   new InternetAddress(m_to);
	   
	   
	              m_simpleMessage.setFrom(m_fromAddress);
	              m_simpleMessage.setRecipient(RecipientType.TO, m_toAddress);
	              m_simpleMessage.setSubject(m_subject);
	              if(ccmail != null){
		            	
		            	InternetAddress[] ccAddress = InternetAddress.parse(ccmail);		          
		            	 m_simpleMessage.addRecipients(RecipientType.CC, ccAddress);
		            
		            }
	              Multipart mp = new MimeMultipart();
	              

	              MimeBodyPart mbpMessage = new MimeBodyPart();
	            //  mbpMessage.setText(message);
	              BodyPart msgBody = new MimeBodyPart();
	              
	              msgBody.setContent(m_body,"text/html");
	              
	              mbpMessage.setContent(m_body, "text/html");
	             // mp.setContent(m_body, "text/html");
	              mbpMessage.attachFile(is);
	              
	              mp.addBodyPart(msgBody);
	              
	              mp.addBodyPart(mbpMessage);
	             // mp.addBodyPart(attachement);
	              
	              m_simpleMessage.setContent(mp);              
	              
	              Transport.send(m_simpleMessage);
	              
	              
	              is.delete();// to delete file after sending as attachment
	   
	          } catch (MessagingException ex) {
	              ex.printStackTrace();
	          }
	          catch (Exception e) {
	  			// TODO: handle exception
	          	
	          	e.printStackTrace();
	  		}
	          
	          
	      }
    
    
    public  void postMailAttachedFile(String m_from,String m_fromName,String m_pass,String m_to,String m_subject,String m_body,String csId)throws UnsupportedEncodingException{
    	 
        try {
        	m_from="c2it.neinsoft@nipponexpress.com";
			final String userName = "test";
			final String password = "Mypassword1234";
	   	  
	   	     Properties properties  = System.getProperties();
	   	     properties.put("mail.smtp.host", host);
	      	 properties.put("mail.transport.protocol", "smtp");
	     	 properties.put("mail.smtp.port", port);
	     	properties.put("mail.smtp.localhost","nittsu.co.in");
	     	 properties.put("mail.user", userName);
	 		 properties.put("mail.password", password);    
                
              File is = new File("C:\\workspace\\CheckSheet\\JRXML\\"+csId+".pdf");
              
               Session m_Session = Session.getInstance(properties, new GMailAuthenticator(m_from, m_pass));
               
              Message  m_simpleMessage  =   new MimeMessage(m_Session);
              InternetAddress m_fromAddress    =   new InternetAddress(m_from,"");
             InternetAddress m_toAddress      =   new InternetAddress(m_to);
   
             System.out.println("call mail sending method 22222");
              m_simpleMessage.setFrom(m_fromAddress);
              m_simpleMessage.setRecipient(RecipientType.TO, m_toAddress);
              m_simpleMessage.setSubject(m_subject);
               Multipart mp = new MimeMultipart();
              

              MimeBodyPart mbpMessage = new MimeBodyPart();
            //  mbpMessage.setText(message);
              BodyPart msgBody = new MimeBodyPart();
              
              msgBody.setContent(m_body,"text/html");
              
              mbpMessage.setContent(m_body, "text/html");
             // mp.setContent(m_body, "text/html");
              mbpMessage.attachFile(is);
              System.out.println("call mail sending method 333333");
              mp.addBodyPart(msgBody);
              
              mp.addBodyPart(mbpMessage);
             // mp.addBodyPart(attachement);
              
              m_simpleMessage.setContent(mp);              
              
              Transport.send(m_simpleMessage);
              
              System.out.println("call mail sending method 444444");
              is.delete();// to delete file after sending as attachment
   
          } catch (MessagingException ex) {
              ex.printStackTrace();
          }
          catch (Exception e) {
  			// TODO: handle exception
          	
          	e.printStackTrace();
  		}
          
          
      }
    
    
    
    
    
    
    
    public  void postMailAttachedFileITClerance(String m_from,String m_fromName,String m_pass,String m_to,String m_subject,String m_body,String formno)throws UnsupportedEncodingException
         {
   	     try 
   	        {
   	    	m_from="c2it.neinsoft@nipponexpress.com";
			final String userName = "test";
			final String password = "Mypassword1234";
	   	  
	   	     Properties properties  = System.getProperties();
	   	     properties.put("mail.smtp.host", host);
	      	 properties.put("mail.transport.protocol", "smtp");
	     	 properties.put("mail.smtp.port", port);
	     	properties.put("mail.smtp.localhost","nittsu.co.in");
	     	 properties.put("mail.user", userName);
	 		 properties.put("mail.password", password);    
   	    	 
   	    	 
            File is = new File("C:\\workspace\\ITCLERANCE\\JRXML\\"+formno+".pdf");
            Session m_Session = Session.getInstance(properties, new GMailAuthenticator(m_from, m_pass));
            Message  m_simpleMessage  =   new MimeMessage(m_Session);
            InternetAddress m_fromAddress    =   new InternetAddress(m_from,"");
            InternetAddress m_toAddress      =   new InternetAddress(m_to);
            m_simpleMessage.setFrom(m_fromAddress);
            m_simpleMessage.setRecipient(RecipientType.TO, m_toAddress);
            m_simpleMessage.setSubject(m_subject);
            Multipart mp = new MimeMultipart();
            MimeBodyPart mbpMessage = new MimeBodyPart();
            BodyPart msgBody = new MimeBodyPart();
            msgBody.setContent(m_body,"text/html");
            mbpMessage.setContent(m_body, "text/html");
            mbpMessage.attachFile(is);
            mp.addBodyPart(msgBody);
            mp.addBodyPart(mbpMessage);
            m_simpleMessage.setContent(mp);              
            Transport.send(m_simpleMessage);
            is.delete();// to delete file after sending as attachment
            } catch (MessagingException ex) {
              ex.printStackTrace();
          }
          catch (Exception e) {
  			// TODO: handle exception
          	
          	e.printStackTrace();
  		}
          
          
      }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    public void postMailAttachedFileIMS(String m_from,String m_fromName,String m_pass,String m_to,String m_subject,String m_body,String imsId)throws UnsupportedEncodingException{
   	 
        try {
        	m_from="c2it.neinsoft@nipponexpress.com";
			final String userName = "test";
			final String password = "Mypassword1234";
	   	  
	   	     Properties properties  = System.getProperties();
	   	     properties.put("mail.smtp.host", host);
	      	 properties.put("mail.transport.protocol", "smtp");
	     	 properties.put("mail.smtp.port", port);
	     	properties.put("mail.smtp.localhost","nittsu.co.in");
	     	 properties.put("mail.user", userName);
	 		 properties.put("mail.password", password);    
              
            File is = new File("C:\\workspace\\CheckSheet\\JRXML\\"+imsId+".pdf");
              
             Session m_Session = Session.getInstance(properties, new GMailAuthenticator(m_from, m_pass));
               
              Message  m_simpleMessage  =   new MimeMessage(m_Session);
              
             // m_simpleMessage.setText(text, "utf-8", "html");
   
           //  InternetAddress m_fromAddress    =   new InternetAddress(m_from);
             InternetAddress m_fromAddress    =   new InternetAddress(m_from,"");
             InternetAddress m_toAddress      =   new InternetAddress(m_to);
   
   
              m_simpleMessage.setFrom(m_fromAddress);
              m_simpleMessage.setRecipient(RecipientType.TO, m_toAddress);
              m_simpleMessage.setSubject(m_subject);
             Multipart mp = new MimeMultipart();
              

              MimeBodyPart mbpMessage = new MimeBodyPart();
            //  mbpMessage.setText(message);
              BodyPart msgBody = new MimeBodyPart();
              
              msgBody.setContent(m_body,"text/html");
              
              mbpMessage.setContent(m_body, "text/html");
             // mp.setContent(m_body, "text/html");
              mbpMessage.attachFile(is);
              
              mp.addBodyPart(msgBody);
              
              mp.addBodyPart(mbpMessage);
             // mp.addBodyPart(attachement);
              
              m_simpleMessage.setContent(mp);              
              
              Transport.send(m_simpleMessage);
              
              
              is.delete();// to delete file after sending as attachment
   
          } catch (MessagingException ex) {
              ex.printStackTrace();
          }
          catch (Exception e) {
  			// TODO: handle exception
          	
          	e.printStackTrace();
  		}
          
          
      }
    public void postMailCC(String m_from,String m_fromName,String m_pass,String m_to,String CC,String m_subject,String m_body)throws UnsupportedEncodingException{
    	try {  
    		//String host ="10.206.10.10";
    		m_from="c2it.neinsoft@nipponexpress.com";
    		String host ="95.217.110.90";
    		String port="25";
    		final String userName = "test";
    		final String password = "Mypassword1234";

    		Properties properties = new Properties();
     		properties.put("mail.smtp.host", host);
     		properties.put("mail.smtp.port",  port); //"25"
     	    
        	   		
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
    	    
    	    msg.setFrom(new InternetAddress(m_from,""));	 
    	  //  msg.setFrom(new InternetAddress("Testing"));
    	    msg.setSubject(m_subject, "UTF-8"); 
            //String CC="";
            
            InternetAddress[] toAddress = InternetAddress.parse(m_to);        
            msg.addRecipients(RecipientType.TO, toAddress);	
           // msg.setRecipient(RecipientType.TO, new InternetAddress(To));
            
            if(CC != null){
             InternetAddress[] ccAddress = InternetAddress.parse(CC);
             msg.addRecipients(RecipientType.CC, ccAddress);
             } 
         
             BodyPart messageBodyPart = new MimeBodyPart();
             
             messageBodyPart.setContent(m_body,"text/html"); 
             Multipart multipart = new MimeMultipart(); 
             multipart.addBodyPart(messageBodyPart);  
             msg.setContent(multipart);	
             
             Transport.send(msg);	
              
    	     System.out.println("Mail Sent from " +m_from+" to :::"+m_to );			
          } 
          catch (MessagingException e) {		
    	    e.printStackTrace();
    	  } 
       
      }
//public void postMailCC(String m_from,String m_fromName,String m_pass,String m_to,String CC,String m_subject,String m_body)
public void sendMailCC(String From ,String m_fromName , String To , String CC , String Subject , String body) throws UnsupportedEncodingException{ 


		
		try {
			
			From="c2it.neinsoft@nipponexpress.com";
			final String userName = "test";
			final String password = "Mypassword1234";
	   	  
	   	     Properties properties  = System.getProperties();
	   	     properties.put("mail.smtp.host", host);
	      	 properties.put("mail.transport.protocol", "smtp");
	     	 properties.put("mail.smtp.port", port);
	     	properties.put("mail.smtp.localhost","nittsu.co.in");
	     	 properties.put("mail.user", userName);
	 		 properties.put("mail.password", password);    
	 		 
	 		 
	 		System.out.println("Mail Sent From " +From );
	 		System.out.println("Mail Sent To " +To );
	 		System.out.println("Mail Sent CC " +CC );
	 		 
	 		 
	 		
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
		InternetAddress m_fromAddress    =   new InternetAddress(From,"");
        
		//msg.setFrom(new InternetAddress("C2IT"));
		msg.setFrom(m_fromAddress);
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


public void sendMailCCWithAttachment(String From ,String m_fromName , String To , String CC , String Subject , String body , String form_no) throws UnsupportedEncodingException{ 
     //Lotus Notes for IT manager 

	
	try {
		System.out.println("form_no  ::::::::::::::::: in post mail "+form_no);
		From="c2it.neinsoft@nipponexpress.com";
		final String userName = "test";
		final String password = "Mypassword1234";
   	  
   	     Properties properties  = System.getProperties();
   	     properties.put("mail.smtp.host", host);
      	 properties.put("mail.transport.protocol", "smtp");
     	 properties.put("mail.smtp.port", port);
     	properties.put("mail.smtp.localhost","nittsu.co.in");
     	 properties.put("mail.user", userName);
 		 properties.put("mail.password", password);    
 		
 		
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
	 File folder = new File("E:\\neinSoft\\files\\C2IT\\LotusSupportingFile\\"+form_no+"\\");
	InternetAddress m_fromAddress    =   new InternetAddress(From,"");
	File[] listOfFiles = folder.listFiles();
	 if((!folder.exists())||listOfFiles==null)
     {
       System.out.println("creating directory: small for ");
       System.out.println("Files length--------------------------: " +listOfFiles);
     }
     else{
	            for (File file : listOfFiles) {
	                if (file.isFile()) {
	                    System.out.println("File attached Names : "+file.getName());
	                } }
         }  
	//msg.setFrom(new InternetAddress("C2IT"));
	msg.setFrom(m_fromAddress);
	 msg.setSubject(Subject, "UTF-8");
	 
	 
	// msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(sendTo));

     InternetAddress[] toAddress = InternetAddress.parse(To);        
     msg.addRecipients(RecipientType.TO, toAddress);
     
     if(CC != null){
         InternetAddress[] ccAddress = InternetAddress.parse(CC);
         msg.addRecipients(RecipientType.CC, ccAddress);
         }
    
	
	 
	// Create the message body part
/*     BodyPart messageBodyPart = new MimeBodyPart();
     
     
   //  messageBodyPart.setContent(htmlText, "text/html");
     messageBodyPart.setContent(body,"text/html");*/
     
     BodyPart msgBody = new MimeBodyPart();
     msgBody.setContent(body, "text/html");
   //  messageBodyPart.setText(message);
     
  // Create a multipart message for attachment
     Multipart multipart = new MimeMultipart();
     if((!folder.exists())||listOfFiles==null)
     {
       System.out.println("creating directory: FOR ");
       System.out.println("Files length--------------------------: " +listOfFiles);
     }else{
     for (File file : listOfFiles) 
     { 
     	if (file.isFile()) {
   
     	MimeBodyPart messageBodyPart2 = new MimeBodyPart();
         DataSource source = new FileDataSource(file);
         messageBodyPart2.setDataHandler(new DataHandler(source));
         messageBodyPart2.setFileName(file.getName());
         multipart.addBodyPart(messageBodyPart2);
     	}
     }}
    // Set text message part
     multipart.addBodyPart(msgBody); 
     // Send the complete message parts
     
     msg.setContent(multipart);	
   Transport.send(msg);	

		System.out.println("Mail Sent to " +To );
} 

catch (MessagingException e) {
	
	e.printStackTrace();
}

}



    public void sendEmailAttachment(String From ,String m_fromName , String To , String CC , List<String> FilesName , String BaseDirectory ,int NoOfFilesAttached ,String body)throws UnsupportedEncodingException
                 {
	
					System.out.println("Sending EMail fumcion");
					
					From="c2it.neinsoft@nipponexpress.com";
					final String userName = "test";
					final String password = "Mypassword1234";
			   	  
			   	     Properties properties  = System.getProperties();
			   	     properties.put("mail.smtp.host", host);
			      	 properties.put("mail.transport.protocol", "smtp");
			     	 properties.put("mail.smtp.port", port);
			     	properties.put("mail.smtp.localhost","nittsu.co.in");
			     	 properties.put("mail.user", userName);
			 		 properties.put("mail.password", password);    
				
				 // creates a new session with an authenticator
				Authenticator auth = new Authenticator() {
				    public PasswordAuthentication getPasswordAuthentication() {
				         return new PasswordAuthentication(userName, password);
				     }
				 };
				 Session session = Session.getInstance(properties, auth);
					 
					 
				 
					  //props.put("mail.smtp.host", host);
					 for (int i = 1; i <= 1; i++) { // retrying
					        try {
					           // Session session = Session.getInstance(props);
				
					            Multipart multipart = new MimeMultipart("related");
					            MimeBodyPart bodyPart= new MimeBodyPart();
					            
					            Message message = new MimeMessage(session);
					            
					        // System.out.println("*************************************TO Address:"+ To+ "From Address:"+ From+"BaseDirectory :"+BaseDirectory+"Noof Files:"+NoOfFilesAttached+"***********************");
					          //message.setFrom(new InternetAddress(From));
					            InternetAddress m_fromAddress    =   new InternetAddress(From,"");
					            
					    		//msg.setFrom(new InternetAddress("C2IT"));
					            message.setFrom(m_fromAddress);
					         
				
					         
					            InternetAddress[] toAddress = InternetAddress.parse(To);
					            message.addRecipients(RecipientType.TO, toAddress);
					            
					            if(CC != null){
					            	
					            	InternetAddress[] ccAddress = InternetAddress.parse(CC);		          
					            	message.addRecipients(RecipientType.CC, ccAddress);
					            
					            }
					            message.setSubject("Approval Request");
					           
					            bodyPart.setText(body, "UTF-8", "html");
					            
					            multipart.addBodyPart(bodyPart);
					            
					           if( NoOfFilesAttached !=0){
						            for (String file : FilesName) {
						                String fileLocation = BaseDirectory + "/" + file;
						               System.out.println("File Location:"+fileLocation);
						              
						                addAttachment(multipart, fileLocation, file);
						            }
						      }
					     
					           message.setContent(multipart);
					           System.out.println("***Mail is READY to Sent********** TO   "+ To + "  CC To : "+CC);
					            Transport.send(message)	;
				
					       System.out.println("**************Mail Sent**********");
					           break;
					        } catch (Exception ex) {
					            // log exception
					        }
					    }	
         }
    
    
    /****************************** ISP Outage Started ********************/
    public void SendMailToAllIspOutage(String m_from,String m_fromName,String m_pass,String ccmail,String m_subject,String m_body,String filename,String branchNo){
		 
	      try { 
	    	    m_from="c2it.neinsoft@nipponexpress.com";
				final String userName = "test";
				final String password = "Mypassword1234";
		   	  
		   	     Properties properties  = System.getProperties();
		   	     properties.put("mail.smtp.host", host);
		      	 properties.put("mail.transport.protocol", "smtp");
		     	 properties.put("mail.smtp.port", port);
		     	properties.put("mail.smtp.localhost","nittsu.co.in");
		     	 properties.put("mail.user", userName);
		 		 properties.put("mail.password", password);    

		         // creates a new session with an authenticator
		         Authenticator auth = new Authenticator() {
		         public PasswordAuthentication getPasswordAuthentication() {
		              return new PasswordAuthentication(userName, password);
		              }
	              };
	            Session session = Session.getInstance(properties, auth);
	 		 
	           int result=0; 

	 		            Multipart multipart = new MimeMultipart("related");
	 		            MimeBodyPart bodyPart= new MimeBodyPart(); 
	 		            Message message = new MimeMessage(session);
	 		            
	 		            message.setFrom(new InternetAddress(m_from,"")); 
	 		         
	 		            InternetAddress[] toAddress = InternetAddress.parse(m_from);
	 		            message.addRecipients(RecipientType.TO, toAddress);
	 		             
	 		            if(ccmail != null){
	 		            	
	 		            	InternetAddress[] ccAddress = InternetAddress.parse(ccmail);		          
	 		            	message.addRecipients(RecipientType.CC, ccAddress);
	 		            
	 		            }
	 		            message.setSubject("ISP OUTAGE");
	 		           
	 		            bodyPart.setText(m_body, "UTF-8", "html");
	 		            
	 		            multipart.addBodyPart(bodyPart);
	 		            	
	 		            String  fileLocation="E://neinSoft//files//C2IT//Ispoutage//NEIN//CID//"+branchNo+"//"+filename+".pdf ";
	 		            String  file=filename+".pdf";
	 		            
	 			        addAttachment(multipart, fileLocation, file);
	 		     
	 		            message.setContent(multipart);
	 		            System.out.println("***mail send to ********** TO   "+ m_from + "  CC To : "+ccmail);
	 		            Transport.send(message)	;
	 		            
	        } catch (MessagingException ex) {
	            ex.printStackTrace();
	        }
	        
	        catch (Exception e) {
				// TODO: handle exception  
	        	e.printStackTrace();
			}
	    }
    
    /****************************** ISP Outage ended ********************/


		private void addAttachment(final Multipart multipart, final String filepath, final String filename) throws MessagingException {
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
		
public void AuditFormWithAttachment(String From ,String m_fromName , String To ,String cc, String Subject , String body , String form,String pathType) throws UnsupportedEncodingException{ 
		      

			
			try {
				System.out.println("form_no  ::::::::::::::::: in post mail "+form);
		
				
				From="c2it.neinsoft@nipponexpress.com";
				final String userName = "test";
				final String password = "Mypassword1234";
		   	  
		   	     Properties properties  = System.getProperties();
		   	     properties.put("mail.smtp.host", host);
		      	 properties.put("mail.transport.protocol", "smtp");
		     	 properties.put("mail.smtp.port", port);
		     	 properties.put("mail.smtp.localhost","nittsu.co.in");
		     	 properties.put("mail.user", userName);
		 		 properties.put("mail.password", password);
				
			
		 		
		 		
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
			 File folder = new File(pathType);
					File[] listOfFiles = folder.listFiles();
			 if((!folder.exists())||listOfFiles==null)
		     {
		       System.out.println("creating directory: small for ");
		       System.out.println("Files length--------------------------: " +listOfFiles);
		     }
		     else{
			            for (File file : listOfFiles) {
			                if (file.isFile()) {
			                    System.out.println("File attached Names : "+file.getName());
			                } }
		         }  
		
			 InternetAddress m_fromAddress    =   new InternetAddress(From,"");
	         msg.setFrom(m_fromAddress);
			 msg.setSubject(Subject, "UTF-8");
			 InternetAddress[] toAddress = InternetAddress.parse(To);        
		     msg.addRecipients(RecipientType.TO, toAddress);
		     if(cc!=null && cc!="") {
		     InternetAddress[] ccAddress = InternetAddress.parse(cc);        
		     msg.addRecipients(RecipientType.CC, ccAddress);
		     }
		   
		     
		     BodyPart msgBody = new MimeBodyPart();
		     msgBody.setContent(body, "text/html");
		  
		     Multipart multipart = new MimeMultipart();
		     multipart.addBodyPart(msgBody); 
		     if((!folder.exists())||listOfFiles==null)
		     {
		       System.out.println("creating directory: FOR ");
		       System.out.println("Files length--------------------------: " +listOfFiles);
		     }else{
		     for (File file : listOfFiles) 
		     { 
		     	if (file.isFile()) {
		   
		     	MimeBodyPart messageBodyPart2 = new MimeBodyPart();
		         DataSource source = new FileDataSource(file);
		         messageBodyPart2.setDataHandler(new DataHandler(source));
		         messageBodyPart2.setFileName(file.getName());
		         multipart.addBodyPart(messageBodyPart2);
		     	}
		     }}
		    // Set text message part
		    
		     // Send the complete message parts
		     
		     msg.setContent(multipart);	
		   Transport.send(msg);	

				System.out.println("Mail Sent to " +To );
		} 

		catch (MessagingException e) {
			
			e.printStackTrace();
		}

		}
		
		
		
		public  void AuditFormrequirements(String From ,String m_fromName , String To ,String cc, String Subject , String body , String form) throws UnsupportedEncodingException, SQLException{ 
		      
			
			
			try {
				System.out.println("form_no  ::::::::::::::::: in post mail "+form);
		
				
				From="c2it.neinsoft@nipponexpress.com";
				final String userName = "test";
				final String password = "Mypassword1234";
		   	  
		   	     Properties properties  = System.getProperties();
		   	     properties.put("mail.smtp.host", host);
		      	 properties.put("mail.transport.protocol", "smtp");
		     	 properties.put("mail.smtp.port", port);
		     	 properties.put("mail.smtp.localhost","nittsu.co.in");
		     	 properties.put("mail.user", userName);
		 		 properties.put("mail.password", password);
				
			
		 		
		 		
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
			
			
			
			 File folder = new File("E://neinsoft//C2IT//AuditForm//"+form+"//Requirements\\");
					File[] listOfFiles = folder.listFiles();
			 if((!folder.exists())||listOfFiles==null)
		     {
		       System.out.println("creating directory: small for ");
		       System.out.println("Files length--------------------------: " +listOfFiles);
		     }
		     else{
			            for (File file : listOfFiles) {
			                if (file.isFile()) {
			                    System.out.println("File attached Names : "+file.getName());
			                } }
		         }  
		
			 InternetAddress m_fromAddress    =   new InternetAddress(From,"");
	         msg.setFrom(m_fromAddress);
			 msg.setSubject(Subject, "UTF-8");
			 InternetAddress[] toAddress = InternetAddress.parse(To);        
		     msg.addRecipients(RecipientType.TO, toAddress);
		     
		     InternetAddress[] ccAddress = InternetAddress.parse(cc);        
		     msg.addRecipients(RecipientType.CC, ccAddress);
		   
		     
		     BodyPart msgBody = new MimeBodyPart();
		     msgBody.setContent(body, "text/html");
		  
		     Multipart multipart = new MimeMultipart();
		     multipart.addBodyPart(msgBody); 
		     if((!folder.exists())||listOfFiles==null)
		     {
		       System.out.println("creating directory: FOR ");
		       System.out.println("Files length--------------------------: " +listOfFiles);
		     }else{
		     for (File file : listOfFiles) 
		     { 
		     	if (file.isFile()) {
		   
		     	MimeBodyPart messageBodyPart2 = new MimeBodyPart();
		         DataSource source = new FileDataSource(file);
		         messageBodyPart2.setDataHandler(new DataHandler(source));
		         messageBodyPart2.setFileName(file.getName());
		         multipart.addBodyPart(messageBodyPart2);
		     	}
		     }}
               
		    // Set text message part
		    
		     // Send the complete message parts
		     
		     msg.setContent(multipart);	
		   Transport.send(msg);
               

				System.out.println("Mail Sent to " +To );
		} 

		catch (MessagingException e) {
			
			e.printStackTrace();
		}

		}

		
		
//functon of the INCIDENT LOG
		
		public  void postMailIncidentLogReportAttachedFile(String From ,String m_fromName , String To ,String cc, String Subject , String body , String form) { 
		      
			
			
			try {
				System.out.println("form_no  ::::::::::::::::: in post mail "+form);
		
				
				From="c2it.neinsoft@nipponexpress.com";
				final String userName = "test";
				final String password = "Mypassword1234";
		   	  
		   	     Properties properties  = System.getProperties();
		   	     properties.put("mail.smtp.host", host);
		      	 properties.put("mail.transport.protocol", "smtp");
		     	 properties.put("mail.smtp.port", port);
		     	 properties.put("mail.smtp.localhost","nittsu.co.in");
		     	 properties.put("mail.user", userName);
		 		 properties.put("mail.password", password);
				
			
		 		
		 		
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
			
			
			
			 File folder = new File("E://neinsoft//C2IT//IncidentLog//"+form+"\\");
					File[] listOfFiles = folder.listFiles();
			 if((!folder.exists())||listOfFiles==null)
		     {
		       System.out.println("creating directory: small for ");
		       System.out.println("Files length--------------------------: " +listOfFiles);
		     }
		     else{
			            for (File file : listOfFiles) {
			                if (file.isFile()) {
			                    System.out.println("File attached Names : "+file.getName());
			                } }
		         }  
		
			// InternetAddress m_fromAddress    =   new InternetAddress(From,"");
			    msg.setFrom(new InternetAddress(From,"")); 
			 
			 
			// msg.setFrom(m_fromAddress);
	         
	         
	         
			 msg.setSubject(Subject, "UTF-8");
			 InternetAddress[] toAddress = InternetAddress.parse(To);        
		     msg.addRecipients(RecipientType.TO, toAddress);
		     
		     InternetAddress[] ccAddress = InternetAddress.parse(cc);        
		     msg.addRecipients(RecipientType.CC, ccAddress);
		   
		     
		     BodyPart msgBody = new MimeBodyPart();
		     msgBody.setContent(body, "text/html");
		  
		     Multipart multipart = new MimeMultipart();
		     multipart.addBodyPart(msgBody); 
		     if((!folder.exists())||listOfFiles==null)
		     {
		       System.out.println("creating directory: FOR ");
		       System.out.println("Files length--------------------------: " +listOfFiles);
		     }else{
		     for (File file : listOfFiles) 
		     { 
		     	if (file.isFile()) {
		   
		     	MimeBodyPart messageBodyPart2 = new MimeBodyPart();
		         DataSource source = new FileDataSource(file);
		         messageBodyPart2.setDataHandler(new DataHandler(source));
		         messageBodyPart2.setFileName(file.getName());
		         multipart.addBodyPart(messageBodyPart2);
		     	}
		     }}
               
		    // Set text message part
		    
		     // Send the complete message parts
		     
		     msg.setContent(multipart);	
		   Transport.send(msg);
               

				System.out.println("Mail Sent to " +To );
		} 

	 catch (MessagingException ex) {
	            ex.printStackTrace();
	        }
	        
	        catch (Exception e) {
				// TODO: handle exception  
	        	e.printStackTrace();
			}

		}	  


}
