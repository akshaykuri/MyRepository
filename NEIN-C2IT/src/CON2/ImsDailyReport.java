package CON2;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import CON2.Connection2;
import CON2.MailMessage;
import CON2.CheckSheetUtils;

public class ImsDailyReport {
String driver;
	
Date gdate = null;
	
	
	
	public String getMailMessagePayment(String ims_id)
	{
		StringBuffer stringBuffer = new StringBuffer();
		Connection con = null;
		
		PreparedStatement pst = null,pst6=null,pstforstart=null;   
		ResultSet resultSet = null,rs6=null,rsf=null;
		try{ 
		//	 MimeMessage message = new MimeMessage(session);
			//new_id
			
			///...........................http://www.tutorialspoint.com/java/java_sending_email.htm.......................
			///
			CheckSheetUtils neplUtils = new CheckSheetUtils();	
			System.out.println("value of MR ID "+ims_id);
		Connection2 dbConn = new Connection2();
		con = dbConn.getConnection2();
		//pst= con.prepareStatement("SELECT mr_date FROM mr_master where mr_id=?");
		pst= con.prepareStatement("SELECT Send_date FROM ims_master where ims_id=?");
		pst.setString(1,ims_id);
		
		//pst.setString(1,"NEIN/MR/90-171");
		
		
		resultSet = pst.executeQuery();
		System.out.println("before while");
		while(resultSet.next()){
			
			
			System.out.println("inside while");
			//driver = resultSet.getString(1);
			
			gdate = resultSet.getDate(1);
			//gdate = resultSet.getString(1);
			System.out.println("date "+gdate);
               
		}
				
		    stringBuffer.append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">" +
		    					"<html xmlns=\"http://www.w3.org/1999/xhtml\">"+
		    		             "<head >"+
		    		             "<jsp:useBean id =con class=CON2.Connection2 />"+
		    		            "__________________________________________________________________________________________________________________________________________________"+
		    		            // "<br><br>"+
		    		            // "<br><br>"+
		    		             " "+
		    		            
		    						"<br><br>"
		    		             );
		    						  
		    pstforstart = con.prepareStatement("SELECT Send_date,admin_name,time_in,admin_city,time_out,ims_id,desg,emp,mail,idextend from ims_master WHERE ims_id=?");
			//pst2 = con.prepareStatement("SELECT p.po_no,p.mr_id,p.initiated_by,p.pay_date,p.cheque_favour,p.cheque_amt,p.pay_purpose,p.pay_remarks,p.desg,p.emp,p.mail,p.mdradio,p.city,p.Initiator_mail_id,p.status,p.mdRemarks,pp.po_date,mr.mr_date FROM mr_master mr ,po pp,payment_master p  WHERE mr.mr_id=p.mr_id AND p.po_no=pp.pordernon AND p.mdradio ='Status From Higher Authority' AND po_no=? ");
		    
		    System.out.println("First Query ");
            pstforstart.setString(1, ims_id);
            rsf = pstforstart.executeQuery();
            String Send_date,admin_name,time_in,admin_city,time_out,desg,emp,mail,idextend;
            while(rsf.next()){
            	Send_date = rsf.getString("Send_date");
         	   admin_name =rsf.getString("admin_name");
         	   time_in = rsf.getString("time_in");
         	   admin_city = rsf.getString("admin_city");
         	   time_out =rsf.getString("time_out");
         	   ims_id = rsf.getString("ims_id");
         	   desg = rsf.getString("desg");
         	   mail = rsf.getString("mail");
         	   emp = rsf.getString("emp"); 
						            	        
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
										   	    //select mr_item.mr_itemName,mr_item.mr_asset,mr_item.mr_itemQuantity,mr_item.mr_itemRate,mr_item.mr_abbreviation,mr_item.mr_itemAmount,mr_master.totalcon,mr_master.mr_date,mr_item.mr_DateByRegd from mr_item,mr_master where mr_item.transid=mr_master.transid and status='normal'and mr_item.mr_id = 'NEIN/MR/90-274'
											       
								           	       // String itemN = "iditemName";
								   	
								           	       // String itemN = "iditemName";
								           	        stringBuffer.append("<center><table border=\"1\" cellspacing=\"1\" width=\"800\" align=\"center\" background=\"images/s.jpg\">"+
								           	        		"<tr><td colspan=\"5\" align=\"left\"><center><b><font size=\"3\" style=\"font-size: medium;\">IMS DAILY WORK LOG</font></b></center></td></tr>"+
								           	        		"<tr><td colspan=\"4\"  class=\"meta-head\" align=\"left\">Client Name:NIPPON EXPRESS (INDIA) PRIVATE LIMITED</td>"+
								           	        		"<td colspan=\"\"  class=\"meta-head\" align=\"left\">DATE:<textarea id=\"temp_date\" name=\"Send_date\" readonly=\"readonly\" rows=\"1\" cols=\"15\"> "+Send_date+" </textarea></td></tr>"+
								           	        		"<tr><td colspan=\"4\" align=\"left\">SYSTEM ADMINISTRATOR NAME:<textarea rows=\"1\" cols=\"25\" readonly=\"readonly\" name=\"admin_name\">"+admin_name+"</textarea> </td>"+
								           	        		"<td class=\"meta-head\" width=\"100\" align=\"left\">Time IN : <textarea id=\"\" name=\"time_in\" readonly=\"readonly\" rows=\"1\" cols=\"10\">"+time_in+"</textarea></td></tr>"+
								           	        		"<tr><td colspan=\"3\" align=\"left\">Location Name :<textarea rows=\"1\" cols=\"15	\" readonly=\"readonly\" name=\"admin_city\">"+admin_city+"</textarea></td>"+
								           	        		"<td colspan=\"\" align=\"left\">IMS Number :<textarea rows=\"1\" cols=\"25	\" readonly=\"readonly\" name=\"ims_id\">"+ims_id+"</textarea></td>"+
								           	        		"<td class=\"meta-head\" width=\"100\" align=\"left\">Time OUT : <textarea id=\"\" readonly=\"readonly\" name=\"time_out\" rows=\"1\" cols=\"10\">"+time_out+"</textarea></td></tr>"+
								           	        		"</table>"+
								           	        		"<br />"+
								           	        		"<table  width=\"900\" border=\"1\" style=\"height: 150;\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"lightgrey\" align=\"center\">"+
			
								           	        		"<tr> <td width=\"\" align=\"center\"  height=\"21\" >Sl No</td>"+
								           	        		"<td width=\"67\" align=\"center\"  height=\"21\" >Complain ID </td>"+	
								           	        		"<td width=\"67\" align=\"center\"  height=\"21\" >User Name </td>"+	
								           	        		"<td width=\"67\" align=\"center\"  height=\"21\" >Module</td>"+				
								           	        		"<td width=\"67\" align=\"center\"  height=\"21\" >Problem Description</td>"+
								           	        		"<td width=\"67\" align=\"center\"  height=\"21\" >Report Time</td>"+
								           	        		"<td width=\"67\" align=\"center\"  height=\"21\" >Completed Time</td>"+
								           	        		"<td width=\"67\" align=\"center\"  height=\"21\" >Total Duration</td>"+
								           	        		"<td width=\"67\" align=\"center\"  height=\"21\" >Current status</td>"+
								           	        		"<td width=\"67\" align=\"center\"  height=\"21\" >Remarks</td></tr>"
								   				);
        
								   		
            }			           
										          // String idextend,mr_name,mr_approved,mr_date,mr_discuss,e_name,e_designation,totalcon,mr_itemName,mr_asset,mr_itemQuantity,mr_abbreviation,mr_itemRate,theName,transid,mr_remarks,stauts;
										           
								           	   String complain_id,cm_name,cm_location,cm_prob,cm_reported,cm_completed,cm_time_diff,cm_status,admin_remarks;
										   	    //pst6 = con.prepareStatement("select mr_item.mr_itemName,mr_item.mr_asset,mr_item.mr_itemQuantity,mr_item.mr_itemRate,mr_item.mr_abbreviation,mr_item.mr_itemAmount,mr_master.totalcon,mr_master.e_name,mr_master.e_designation,mr_master.mr_date,mr_master.mail,mr_item.mr_DateByRegd from mr_item,mr_master where mr_item.transid=mr_master.transid and status='normal' and mr_item.mr_id in(select mr_id from payment_master where po_no=?)");
										           pst6 = con.prepareStatement("SELECT complain_id,cm_name,cm_location,cm_prob,cm_reported,cm_completed,cm_time_diff,cm_status,admin_remarks from ims_item WHERE ims_id=?");
												    System.out.println("Second Query ");
										   	       // System.out.println("AFTER 1 NEW PSDT6.................................  ");
										           pst6.setString(1, ims_id);
										          // System.out.println("AFTER 222 NEW PSDT6.................................  ");
										           rs6 = pst6.executeQuery();
										           int i=0;
										          // System.out.println("AFTER 333 NEW PSDT6.................................  ");
										           while(rs6.next()){
										        	 //  System.out.println("INSIDE WHILE............ NEW PSDT6.................................  "); 
										           	
										           	// System.out.println("mrId...................... value:"+mr_id); 
										           	  // mr_itemName = rs6.getString("mr_itemName");
										        	  
										        	   complain_id = rs6.getString("complain_id");
												            	cm_name = rs6.getString("cm_name");
												            	cm_location=rs6.getString("cm_location");
												            	cm_prob=rs6.getString("cm_prob");
												            	
												            	cm_reported=rs6.getString("cm_reported");
												            	cm_completed=rs6.getString("cm_completed");
												            	cm_time_diff=rs6.getString("cm_time_diff");
												            	cm_status=rs6.getString("cm_status");
												            	admin_remarks=rs6.getString("admin_remarks");
												            	
												            	cm_prob=rs6.getString("cm_prob");
												            	        i++;
												            	        String tot_val=null;
												            	        String head = "ComplainId";
												            	        String itemN = "iditemName";
										           
										   		stringBuffer.append("<script>id++;</script>"+
							             "<tr><td width=\"67\" align=\"center\"  height=\"21\" ><input type=\"text\" name=\"id[]\" readonly=\"readonly\" value="+i+" size=1 class=\"id\" /></td>"+
								"<td><input type=\"text\" name=\"complain_id\" id=\"<%=head+i%>\" value="+complain_id+" readonly=\"readonly\" id=\"ComplainId\" class=\"incComplainId\" size=\"20\"/></td>"+
								"<td><textarea  name=\"cm_name\" id=\"\"  rows=\"1\" cols=\"25\" class=\"incUserName\" id=\"UserNameId\" readonly=\"readonly\">"+cm_name+"</textarea></td>"+
								"<td width=\"100\"><textarea  name=\"cm_location\" id=\"\"  rows=\"1\" cols=\"14\" class=\"incModule\" id=\"ModuleId\" readonly=\"readonly\" >"+cm_location+"</textarea></td>"+
								"<td width=\"67\" align=\"center\"  height=\"21\" ><textarea  name=\"cm_location\" id=\"\" readonly=\"readonly\" rows=\"1\" cols=\"14\" class=\"incModule\" id=\"ModuleId\" >"+cm_prob+"</textarea></td>"+
								"<td width=\"67\" align=\"center\"  height=\"21\" ><input type=\"text\" name=\"cm_reported\" readonly=\"readonly\" size=\"4\" id=\"TimeId\" class=\"incTime\" value="+cm_reported+"  /></td>"+
								"<td width=\"67\" align=\"center\"  height=\"21\" ><input type=\"text\" name=\"cm_completed\" readonly=\"readonly\" size=\"4\" id=\"Time2Id\" class=\"incTime2\" value="+cm_completed+" class=\"incRate\" /></td>"+
								"<td width=\"67\" align=\"center\"  height=\"21\" ><input type=\"text\" name=\"cm_time_diff\"readonly=\"readonly\" size=\"6\" id=\"TimeDiffId\" class=\"incTimeDiff\" value="+cm_time_diff+"  /></td>"+
								"<td width=\"100\"><textarea  name=\"cm_status\" id=\"StatusId\"  rows=\"1\" cols=\"15\" readonly=\"readonly\" class=\"incStatus\" >"+cm_status+"</textarea></td>"+
								"<td width=\"100\"><textarea  name=\"admin_remarks\" id=\"RemarksId\"  rows=\"2\" cols=\"40\" class=\"incRemarks\" readonly=\"readonly\" >"+admin_remarks+"</textarea></td></tr>");
										           }
										   	
										         
											      
					           
					           stringBuffer.append("</table>");
					           System.out.println("BEFORE NEW PSDT6.................................  ");
	   
					        		   
					        		   
					        		   
					           stringBuffer.append("<br><br>"+
						           		//"<br><br>"+
						           		//"<br><br>"+
						           		"<br>"+
						           		"<br>"+
						           		"__________________________________________________________________________________________________________________________________________________"+
						           		
						           		"<br><br>"+
						           	//	"<br><br>"+
						           	
						           		
						           	//	"<br><br>"+
						           		//"<br><br>"+
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
			DbUtil.closeDBResources(resultSet,pst,con);
			DbUtil.closeDBResources(rs6,pst6,null);
			DbUtil.closeDBResources(rsf,pstforstart,null);
	
		}
		return stringBuffer.toString();
	}
	
	
	public static void main(String[] args) {
		
		MailMessage mail = new  MailMessage();
		
	
		
		System.out.println(mail.getMailMessage("NEIN/CS/IMS/90-181"));
	}
}
