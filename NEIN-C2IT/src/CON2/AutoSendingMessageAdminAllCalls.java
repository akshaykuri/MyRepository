package CON2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AutoSendingMessageAdminAllCalls {
String driver;
	
	//Date gdate = null;
	String gdate = null;
	public String getMailAutoSendingMessageAllCalls(String dateeee,String depart)
	{
	
StringBuffer stringBuffer = new StringBuffer();
                System.out.println("Sending Auto reminder of ALL complaints ");
				System.out.println("Dateee :"+dateeee);
				System.out.println("Depart :"+depart);
		Connection con = null;
		
		PreparedStatement pst = null,pst2=null,pstCal=null;//,pst3=null,pst4=null;   
		ResultSet resultSet = null,rs = null,rsCal=null;//,rs5 = null,rs4=null;
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
		    						  "<tr><td  bgcolor=\"lightgrey\" align=center class=\"fonter\" colspan=\"9\"><font size=\"2\"><b>ALL COMPLAINTS</b></font></td></tr>"+
		    						  "<td  bgcolor=\"lightgrey\" align=center class=\"fonter\"><font size=\"2\"><font size=\"2\"><b>COMPLAINT NO.</font></b></td>"+
		    						  "<td  bgcolor=\"lightgrey\" align=center class=\"fonter\"><font size=\"2\"><b>SENDER</b></font></td>"+
		"<td  bgcolor=\"lightgrey\" align=center class=\"fonter\"><font size=\"2\"><b>LOCATION</b></font></td>"+
		"<td  bgcolor=\"lightgrey\" align=center class=\"fonter\"><font size=\"2\"><b>PROBLEM TYPE</b></font></td>"+
		"<td  bgcolor=\"lightgrey\" align=center class=\"fonter\"><font size=\"2\"><b>PROBLEM DECRIPTION</b></font></td>"+
		"<td  bgcolor=\"lightgrey\" align=center class=\"fonter\"><font size=\"2\"><b>RAISED ON</b></font></td>"+
		"<td  bgcolor=\"lightgrey\" align=center class=\"fonter\"><font size=\"2\"><b>PROBLEM STATUS</b></font></td>"+
		"<td  bgcolor=\"lightgrey\" align=center class=\"fonter\"><font size=\"2\"><b>ADMIN</b></font></td>"+
		"<td  bgcolor=\"lightgrey\"  align=center class=\"fonter\"><font size=\"2\"><b>RESENT COUNT</b></font></td>"+
	
		
		"</tr>");
		    int i = 0;
		    // System.out.println("date in mail message 2nd value "+gdate);
		   // pst2 = con.prepareStatement("SELECT complain_id,DATE_FORMAT(cm_time,'%e/%m/%Y,%h:%i') as datu,cm_name,emp,cm_type,cm_problem,cm_location,cm_status,cm_date,cm_mail,mail,counting FROM complain_master_item WHERE cm_time < NOW() - INTERVAL 8 HOUR  ORDER BY cm_date DESC");
		    //SELECT * FROM complain_master_item WHERE cm_date = DATE(now() - INTERVAL 1 DAY) ORDER BY cm_date DESC
		    //pst2 = con.prepareStatement("SELECT complain_id,DATE_FORMAT(cm_time,'%e/%m/%Y,%h:%i') as datu,cm_name,emp,cm_type,cm_problem,cm_location,cm_status,cm_date,cm_mail,mail,counting FROM complain_master_item WHERE cm_date = DATE(now() - INTERVAL 1 DAY) ORDER BY cm_date DESC");
		    pstCal = con.prepareStatement("SELECT complain_id,DATE_FORMAT(cm_time,'%e/%m/%Y,%h:%i') as datu,cm_name,emp,cm_type,cm_problem,cm_location,cm_status,cm_date,cm_mail,mail,counting FROM complain_master_item WHERE cm_date = ? AND reportTo=? ORDER BY cm_date DESC");
		    pstCal.setString(1,dateeee);
		    pstCal.setString(2,depart);
		    rsCal = pstCal.executeQuery();
		    if(rsCal.next())
		    {
		    	System.out.println("IF statement executed");
		    	 pst2 = con.prepareStatement("SELECT complain_id,DATE_FORMAT(cm_time,'%e/%m/%Y,%h:%i') as datu,cm_name,emp,cm_type,cm_problem,cm_location,cm_status,cm_date,cm_mail,mail,counting FROM complain_master_item WHERE cm_date = ? AND reportTo=? ORDER BY cm_date DESC");
				   // pst2 = con.prepareStatement("SELECT Nname,Nmail,(select count(complain_master_item.emp) as Numb FROM complain_master_item where  complain_master_item.emp=nentryho.Nname AND complain_master_item.cm_date=? AND complain_master_item.cm_status='Pending') as count_comp,(select count(complain_master_item.emp) as Numb FROM complain_master_item where  complain_master_item.emp=nentryho.Nname AND complain_master_item.cm_date=? AND complain_master_item.cm_status='Resolved') as count_comp2,(select count(complain_master_item.emp) as Numbee FROM complain_master_item where  complain_master_item.emp=nentryho.Nname AND complain_master_item.cm_status='Pending' AND complain_master_item.cm_date <> ?) as allPending  FROM nentryho WHERE DESG_NO ='2' ORDER BY Nname ASC");
		    	 pst2.setString(1,dateeee);
		    	 pst2.setString(2,depart);
				   // pst2.setString(2,dateeee);
				   // pst2.setString(3,dateeee);
				    //pst2.setString(1,"Pending");
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
				    						      "<td  align=center><font size=\"1\">"+counting+"</font></td></tr>");
				    						     
				    						     
				    						     
				    						     }
		            stringBuffer.append("</table>");
		    	
		    	
		    	 }
		    else
		    {
		    	System.out.println("Else statement executed");
		    	 pst2 = con.prepareStatement("SELECT complain_id,DATE_FORMAT(cm_time,'%e/%m/%Y,%h:%i') as datu,cm_name,emp,cm_type,cm_problem,cm_location,cm_status,cm_date,cm_mail,mail,counting FROM complain_master_item WHERE cm_date = DATE(now() - INTERVAL 1 DAY) AND reportTo=? ORDER BY cm_date DESC");
				   // pst2 = con.prepareStatement("SELECT Nname,Nmail,(select count(complain_master_item.emp) as Numb FROM complain_master_item where  complain_master_item.emp=nentryho.Nname AND complain_master_item.cm_date=? AND complain_master_item.cm_status='Pending') as count_comp,(select count(complain_master_item.emp) as Numb FROM complain_master_item where  complain_master_item.emp=nentryho.Nname AND complain_master_item.cm_date=? AND complain_master_item.cm_status='Resolved') as count_comp2,(select count(complain_master_item.emp) as Numbee FROM complain_master_item where  complain_master_item.emp=nentryho.Nname AND complain_master_item.cm_status='Pending' AND complain_master_item.cm_date <> ?) as allPending  FROM nentryho WHERE DESG_NO ='2' ORDER BY Nname ASC");
				    pst2.setString(1,depart);
				   // pst2.setString(2,dateeee);
				   // pst2.setString(3,dateeee);
				    //pst2.setString(1,"Pending");
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
				    						      "<td  align=center><font size=\"1\">"+counting+"</font></td></tr>");
				    						     
				    						     
				    						     
				    						     }
		            stringBuffer.append("</table>");
		    }
		   
					          
            		stringBuffer.append("<br><br>"+
						           		
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
