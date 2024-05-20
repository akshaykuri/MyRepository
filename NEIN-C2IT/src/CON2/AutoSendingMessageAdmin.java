package CON2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.annotation.WebServlet;
//@WebServlet("/AutoSendingMessageAdmin")
public class AutoSendingMessageAdmin {
String driver;
	
	//Date gdate = null;
	String gdate = null;
	public String getMailAutoSendingMessageAdmin(String EMP)
	{
	
StringBuffer stringBuffer = new StringBuffer();
		
		Connection con = null;
		
		PreparedStatement pst = null,pst2=null;//,pst3=null,pst4=null;   
		ResultSet resultSet = null,rs = null;//,rs5 = null,rs4=null;
		try{ 
		//	 MimeMessage message = new MimeMessage(session);
			
			
			///...........................http://www.tutorialspoint.com/java/java_sending_email.htm.......................
			///
			
			//System.out.println("AUTO SENDING MAIL :::::: "+Pending);
		Connection2 dbConn = new Connection2();
		con = dbConn.getConnection2();
	
	     stringBuffer.append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">" +
		    					"<html xmlns=\"http://www.w3.org/1999/xhtml\">"+
		    		             "<head >"+
		    		             "<jsp:useBean id =con class=CON1.Connection1 />"+
		    		             "<jsp:useBean id =\"neplUtil\" class=\"CON1.NeplUtils\" /> "+
		    		           
		    		             /*"<center>--------------------------------------------------------------</center>"+*/
		    		             "__________________________________________________________________________________________________________________________________________________"+
		    		             "<br>"+
		    		          
		    		             " "+
		    		            
		    						"<br><br>"+
		    						  
		    						  "<table border=\"1\" width=\"90%\" align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
		    						  "<tr><td  bgcolor=\"lightgrey\" align=center class=\"fonter\" colspan=\"9\"><font size=\"2\"><b>ALL PENDING COMPLAINTS</b></font></td></tr>"+
		    						  "<td  bgcolor=\"lightgrey\" align=center class=\"fonter\"><font size=\"2\"><font size=\"2\"><b>COMPLAINT NO.</font></b></td>"+
		    						  "<td  bgcolor=\"lightgrey\" align=center class=\"fonter\"><font size=\"2\"><b>SENDER</b></font></td>"+
		"<td  bgcolor=\"lightgrey\" align=center class=\"fonter\"><font size=\"2\"><b>LOCATION</b></font></td>"+
		"<td  bgcolor=\"lightgrey\" align=center class=\"fonter\"><font size=\"2\"><b>PROBLEM TYPE</b></font></td>"+
		"<td  bgcolor=\"lightgrey\" align=center class=\"fonter\"><font size=\"2\"><b>PROBLEM DECRIPTION</b></font></td>"+
		"<td  bgcolor=\"lightgrey\" align=center class=\"fonter\"><font size=\"2\"><b>RAISED ON</b></font></td>"+
		"<td  bgcolor=\"lightgrey\" align=center class=\"fonter\"><font size=\"2\"><b>PROBLEM STATUS</b></font></td>"+
		"<td  bgcolor=\"lightgrey\" align=center class=\"fonter\"><font size=\"2\"><b>SYSTEM ADMIN</b></font></td>"+
		"<td  bgcolor=\"lightgrey\"  align=center class=\"fonter\"><font size=\"2\"><b>RESENT COUNT</b></font></td>"+
	
		
		"</tr>");
		    int i = 0;
		    // System.out.println("date in mail message 2nd value "+gdate);
		    pst2 = con.prepareStatement("SELECT complain_id,DATE_FORMAT(cm_time,'%e/%m/%Y,%h:%i') as datu,cm_name,emp,cm_type,cm_problem,cm_location,cm_status,cm_date,cm_mail,mail,counting FROM complain_master_item WHERE cm_time < NOW() - INTERVAL 8 HOUR AND cm_status=? ORDER BY cm_date DESC");
		    //pst2.setString(1,EMP);
		    pst2.setString(1,"Pending");
            rs = pst2.executeQuery();
            while(rs.next()){
            		   
            	  String id = rs.getString(1);
            	  String cm_time = rs.getString(2);
            	  String cmsta=null;
            	  //System.out.println("cm_time  "+cm_time);
            	  String complain = rs.getString("complain_id");
            	  String cm_name = rs.getString("cm_name");
            	  String cm_location = rs.getString("cm_location");
            	  String cm_type = rs.getString("cm_type");
            	  String cm_problem=rs.getString("cm_problem");


            	  String emp = rs.getString("emp");
            	  String cm_date = rs.getString("cm_date");
            	  String cm_status = rs.getString("cm_status");
            	  String cm_mail = rs.getString("cm_mail");
            	  String mail = rs.getString("mail");
            	  String counting = rs.getString("counting");
		    				stringBuffer.append(
		    						"<tr><td align=center><font size=\"1\">"+complain+"</font></td>"+
		    						      "<td  align=center><font size=\"1\">"+cm_name+"</font></td>"+
		    						     " <td  align=center><font size=\"1\">"+cm_location+"</font></td>"+
		    						      "<td  align=center><font size=\"1\">"+cm_type+"</font></td>"+
		    						      "<td ><font size=\"1\">"+cm_problem+"</font></td>"+
		    						      "<td  align=center><font size=\"1\">"+cm_time+"</font></td>"+
		    						      "<td  align=center><font size=\"1\">"+cm_status+"</font></td>"+
		    						      "<td  align=center><font size=\"1\">"+emp+"</font></td>"+
		    						      "<td  align=center><font size=\"1\">"+counting+"</font></td>");
		    						     
		    						     
		    						     
		    						     }
            stringBuffer.append("</table>"+
					          
					        		   "<br><br>"+
						           		
						           		"<br>"+
						           		"<br>"+
						           		"__________________________________________________________________________________________________________________________________________________"+
						           		
						           		"<br><br>"+
						           		"<br><br>"+
						           	
						           		
						           		"<br><br>"+
						           		"<br><br>"+
						           		"</head>"+
						           		"</html>");   	
					           
				    				
		
		}
		catch (Exception e) {
			// TODO: handle exception
			
			System.out.println("catch   ---");
			  e.printStackTrace();
			  
			  System.out.println(e.toString());
		}
		
	finally{
			DbUtil.closeDBResources(rs,pst,con);
			DbUtil.closeDBResources(resultSet,pst2,null);
			
			
		}	
		//stringBuffer.delete(0, stringBuffer.length());
		//stringBuffer.setLength(0);
		//stringBuffer.setLength(1);
		return stringBuffer.toString();
	}
	
	
	public static void main(String[] args) {
		
		MailMessage mail = new  MailMessage();
		
	
		
		System.out.println(mail.getMailMessage("NEIN/CS-1"));
	}
}
