package CON2;


import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NonApprovMail
 */
//@WebServlet("/NonApprovMail")
public class NonApprovMail {
Connection con = null;
	
	PreparedStatement pst = null;
	ResultSet resultSet = null;
	
	Connection2 dbConn = new Connection2();
	
	//Connection1 dbConn = new Connection1();
   // con = dbConn.getConnection1();
	PostMail postMail = new PostMail();
	
	public String sendNonApprovMail(String form2_no) throws SQLException, UnsupportedEncodingException
	{
		String msg = null;
		
		String initiater = getInitiaterId(form2_no);
		//postMail.postMail("frksh27@gmail.com","farooq!@12", initiater,
			postMail.postMail("frksh27@gmail.com","NEIN-C2IT","farooq!@12", "farooqsha27@gmail.com",
				" FORM IS NON APPROVED" ,"The FORM NO. "+form2_no+" is rejected");
		
		    con = dbConn.getConnection2();
		    
		    pst = con.prepareStatement("select form2_no from form2_domain where form2_no=?");
		    
		    pst.setString(1, form2_no);
		    
		    resultSet = pst.executeQuery();
		    
		    while(resultSet.next())
		    {
		    	
		    	if(resultSet.getString(1)!=null)
		    	{
		    		postMail.postMail("NEIN-C2IT@NITTSU.CO.IN","NEIN-C2IT","pass1234", resultSet.getString(1),
		    	//	postMail.postMail("P2PSOFT@NITTSU.CO.IN","pass1234","sys.admin@nittsu.co.in",
		    				" Domain User Form No. :  "+form2_no+" has been Not Approved" ,"The requested DOmain User form : "+form2_no+" has been NOT APPROVED, request you to login to NEIN-C2IT for further details. <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.18:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.5:8185/NEIN-C2IT/HOME.jsp  <br>");
		    		
		    		
		    	}
		    }
		    
		    msg = "Mail sent successfully.";
		  

		return msg;
		
	}
	
	public String getInitiaterId(String form2_no) throws SQLException
	
	{
		String mailId = null;
		
		 con = dbConn.getConnection2();
		    
		    pst = con.prepareStatement("select nentryho.Nmail, form2_domain.form2_no from nentryho," +
		    		" form2_domain where nentryho.Nname=form2_domain.i_name and form2_domain.form2_no=?");
		    
		    pst.setString(1, form2_no);
		    
		    
		    resultSet=pst.executeQuery();
		    
		    while(resultSet.next())
		    {
		    	mailId = resultSet.getString(1);
		    }
		
		return mailId;
	
	}
		
	
}
