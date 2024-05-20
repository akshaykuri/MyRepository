package CON2;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import CON2.Connection2;
import CON2.MailMessage;
public class MailMessage {
	String driver;
	
	//Date gdate = null;
	String gdate = null;
	public String getMailMessage(String cmId)
	{
	
StringBuffer stringBuffer = new StringBuffer();
		
		Connection con = null;
		
		PreparedStatement pst = null,pst2=null;//,pst3=null,pst4=null;   
		ResultSet resultSet = null,rs = null;//,rs5 = null,rs4=null;
		try{ 
		//	 MimeMessage message = new MimeMessage(session);
			
			
			///...........................http://www.tutorialspoint.com/java/java_sending_email.htm.......................
			///
			
			System.out.println("value of MR ID "+cmId);
		Connection2 dbConn = new Connection2();
		con = dbConn.getConnection2();
		//pst= con.prepareStatement("SELECT mr_date FROM mr_master where mr_id=?");
		pst= con.prepareStatement("SELECT DATE_FORMAT(cm_date, '%e %M %Y') as datu,cm_date FROM complain_master_item where complain_id=? ORDER BY id ASC");
		pst.setString(1,cmId);
		
		//pst.setString(1,"NEIN/MR/90-171");
		 
		resultSet = pst.executeQuery();
		System.out.println("before while");
		while(resultSet.next()){
			
			
			System.out.println("inside while");
			//driver = resultSet.getString(1);
			
			//gdate = resultSet.getDate(1);
			gdate = resultSet.getString(1);
			System.out.println("date in mail message"+gdate);
			  
		}
	 
       

      // String textArea1,textArea2,textArea3,textArea4,VendorText,rupes,taxes,desg,emp,po_date,theName,delivery,paytrm,warranty,orderval,vat1,vat2,totalcon,vattext,abcvat1,vat3,nmrupees,abc1,abc2,abc3,abc4,termscond,tarea2,tarea22,tarea3,tarea33,tarea4,tarea44,transid,itemhead;
      //String idextend,mr_id,mr_name,mr_approved,mr_discuss,mr_date,e_name,e_designation,totalcon,desg,emp,theName,transid,mr_remarks,mr_remarks2,mr_remarks3,mr_remarks4,emp2,desg2,emp3,desg3,emp4,desg4,stauts;
      //String idextend,mr_id,mr_name,mr_approved,mr_date,mr_discuss,e_name,e_designation,totalcon,mr_itemName,mr_asset,mr_itemQuantity,mr_abbreviation,mr_itemRate,desg,emp,theName,transid,mr_remarks,stauts,mail;
		//String cm_date,idextend,complain_id,cm_name,cm_location,cm_type,cm_problem,desg,emp,transid;
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
		    						  
		    						  "<table align=\"center\" width=\"60%\" bgcolor=\"lightgrey\">" +
			    						"<tr height=\"25\"><td height=\"25\" align=\"center\" width=\"100%\"><b>COMPLAINT PAGE </b></td></tr></table>"+
			    						
		    						"<table align=\"center\" width=\"60%\" bgcolor=\"lightgrey\">" +
		    						
		    						"<tr height=\"35\">" +
		    						"<td align=\"left\">Complaint No. : <font color=\"blue\"><b>"+cmId+"</b></font></td>" +
		    								"<td align=\"right\">Date : <font color=\"blue\"><b>"+gdate+"</b></font>" +
		    								
		    								"</td>");
		    int i = 0;
			  String InitiatorRemarksEscalateSsaRemarks =null;  
			   String FirstSysAdminEscalateSaName=null,SecondSystemAdminEscalateSsaName=null,ThirdSysAdminEscalateSssaName=null,FourthSysAdminEscalateItManagerName=null;
			   String FirstSysAdminEscalateSaDate=null,SecondSysAdminEscalateSsaDate=null,ThirdSysAdminEscalateSssaDate=null,FourthSysAdminEscalateItManagerDate=null;
			   String FirstSysAdminEscalateSaRemarks=null,SecondSysAdminEscalateSsaRemarks=null,ThirdSysAdminEscalateSssaRemarks=null,FourthSysAdminEscalateItManagerRemarks=null;
			String StatusEscalate =null,reportTo=null;
		    System.out.println("date in mail message 2nd value "+gdate);
		    //pst2 = con.prepareStatement("select cm_date,cm_time,DATE_FORMAT(cm_time, '%M %e, %Y %h:%i %p') as datu,DATE_FORMAT(cm_time2, '%M %e, %Y %h:%i %p') as datu2,idextend,complain_id,cm_name,cm_location,cm_type,cm_problem,desg,emp,transid,mail,admin_remarks,EscalateSsaRemarks,EscalateSsaName,EscalateSssaName,EscalateSsaRemarks,EscalateSsaName,DATE_FORMAT(EscalateSsaDate, '%d %b %Y') as EscalateSsaDate,EscalateSsaRemarks,EscalateSssaName,DATE_FORMAT(EscalateSssaDate, '%d %b %Y') as EscalateSssaDate,EscalateSssaRemarks,EscalateItManagerName,DATE_FORMAT(EscalateItManagerDate, '%d %b %Y') as EscalateItManagerDate,EscalateItManagerRemarks,EscalateSaName,DATE_FORMAT(EscalateSaDate, '%d %b %Y') as EscalateSaDate,EscalateSaRemarks,StatusEscalate,reportTo  from complain_master_item where complain_master_item.complain_id =? ORDER BY id ASC");
            
		    
	/*chintu*/	    pst2 = con.prepareStatement("select cm_date,cm_time,DATE_FORMAT(cm_time, '%M %e, %Y %h:%i %p') as datu,DATE_FORMAT(cm_time2, '%M %e, %Y %h:%i %p') as datu2,idextend,complain_id,cm_mail,cm_name,phoneNo,cm_location,cm_type,pType,cm_problem,desg,emp,transid,mail,admin_remarks,EscalateSsaRemarks,EscalateSsaName,EscalateSssaName,EscalateSsaRemarks,EscalateSsaName,DATE_FORMAT(EscalateSsaDate, '%d %b %Y') as EscalateSsaDate,EscalateSsaRemarks,EscalateSssaName,DATE_FORMAT(EscalateSssaDate, '%d %b %Y') as EscalateSssaDate,EscalateSssaRemarks,EscalateItManagerName,DATE_FORMAT(EscalateItManagerDate, '%d %b %Y') as EscalateItManagerDate,EscalateItManagerRemarks,EscalateSaName,DATE_FORMAT(EscalateSaDate, '%d %b %Y') as EscalateSaDate,EscalateSaRemarks,StatusEscalate,reportTo  from complain_master_item where complain_master_item.complain_id =? ORDER BY id ASC");
		    
		    pst2.setString(1, cmId);
            rs = pst2.executeQuery();
            while(rs.next()){
            		   
            	
            	 System.out.println("cmId...................... value:"+cmId);
            	 String complain_id=rs.getString("complain_id");
            	 System.out.println("complain_id.............."+complain_id);
            	// String cm_date=rs.getString("cm_date");
            	// String desg=rs.getString("desg");
            	 //System.out.println("desg.............."+desg);
            	 String emp=rs.getString("emp");
            	System.out.println("emp.................."+emp);
            	// String mail = rs.getString("mail");
            	 //String cm_time = rs.getString("cm_time");
            	 String cm_time = rs.getString(3);
            	 String cm_time2 = rs.getString(4);
            	 
            	 String cm_mail = rs.getString("cm_mail");  //chintu
            	 
            	 String cm_name = rs.getString("cm_name");
            	 
            	 String phoneNo = rs.getString("phoneNo");  //chintu

            	 String pType=rs.getString("pType");   //chintu
            	 
            	 
            	 
            	 System.out.println("cm_name Name ******************** "+cm_name);
            	// String transId=rs.getString("transid");
            	 String cm_location=rs.getString("cm_location");
            	 //System.out.println("transid...................."+transId);
            	 String cm_type=rs.getString("cm_type");
            	 String cm_problem=rs.getString("cm_problem");
            	 //System.out.println("mr_remarks..........."+mr_remarks);
            	String admin_remarks = rs.getString("admin_remarks");
            	
            	StatusEscalate  = rs.getString("StatusEscalate");
            	 InitiatorRemarksEscalateSsaRemarks = rs.getString("EscalateSsaRemarks");
          	   
          	   
          	   FirstSysAdminEscalateSaName = rs.getString("EscalateSaName");
          	   FirstSysAdminEscalateSaDate = rs.getString("EscalateSaDate");
          	   FirstSysAdminEscalateSaRemarks = rs.getString("EscalateSaRemarks");
          	 
          	   SecondSystemAdminEscalateSsaName = rs.getString("EscalateSsaName");
          	   SecondSysAdminEscalateSsaDate = rs.getString("EscalateSsaDate"); 
          	   SecondSysAdminEscalateSsaRemarks = rs.getString("EscalateSsaRemarks");
          	   
          	   ThirdSysAdminEscalateSssaName = rs.getString("EscalateSssaName");
          	   ThirdSysAdminEscalateSssaDate = rs.getString("EscalateSssaDate");
          	   ThirdSysAdminEscalateSssaRemarks = rs.getString("EscalateSssaRemarks");
          	   
          	   FourthSysAdminEscalateItManagerName = rs.getString("EscalateItManagerName");
          	   FourthSysAdminEscalateItManagerDate = rs.getString("EscalateItManagerDate");
          	   FourthSysAdminEscalateItManagerRemarks = rs.getString("EscalateItManagerRemarks");
          	 reportTo = rs.getString("reportTo");
            	        i++;
		    				
		    				stringBuffer.append(
		    						"</tr></table>"+
		    						
		    						
		    						"<table align=\"center\" border=\"2\" cellspacing=\"1\" width=\"60%\">"+

		    						"<tr>" +
		    						//"<td style=\"visibility: hidden; display: none\"><input type=\"hidden\" name=\"idextend\" value= /></td>"+
		    									
		    						"<td width=\"5%\" align=\"center\" height=\"5\" colspan=\"2\"><center><font size=\"2\">1</font></center></td>"+

		    						"<td width=\"25%\">&nbsp;<font size=\"2\">USER NAME </font></td><td width=\"30%\"><font size=\"2\">"+cm_name+"</font></td></tr>"+
		    						
		    						
		    /*CHINTU*/						 "<tr><td width=\"25\" align=\"center\" height=\"5\" colspan=\"2\"><center><font size=\"2\">2</font></center></td>"+
			/*CHINTU */   					 "<td>&nbsp;<font size=\"2\">MAIL ID</font></td><td width=\"100\"><font size=\"2\">"+cm_mail+"</font></td></tr>"+
			    					
  	    	/*CHINTU*/					     "<tr><td width=\"25\" align=\"center\" height=\"5\" colspan=\"2\"><center><font size=\"2\">3</font></center></td>"+
			/*CHINTU */   					 "<td>&nbsp;<font size=\"2\">CONTACT NO</font></td><td width=\"100\"><font size=\"2\">"+phoneNo+"</font></td></tr>"+
				    					
		    						
		    						
		    						
		    						
		    						
		    						
		    						"<tr><td width=\"25\" align=\"center\" height=\"5\" colspan=\"2\"><center><font size=\"2\">4</font></center></td>"+

		    						"<td>&nbsp;<font size=\"2\">LOCATION</font></td><td width=\"100\"><font size=\"2\">"+cm_location+"</font></td></tr>"+
		    						"<tr><td width=\"25\" align=\"center\" height=\"5\" colspan=\"2\"><center><font size=\"2\">5</font></center></td>"+
		    						"<td>&nbsp;<font size=\"2\">TYPE</font></td><td width=\"100\"><font size=\"2\">"+cm_type+"</font></td></tr>"+
		    						
		    						
		/*CHINTU*/				   "<tr><td width=\"25\" align=\"center\" height=\"5\" colspan=\"2\"><center><font size=\"2\">6</font></center></td>"+
		/*CHINTU*/			       "<td>&nbsp;<font size=\"2\">TYPE CATEGORY</font></td><td width=\"100\"><font size=\"2\">"+pType+"</font></td></tr>"+
		    					
		    						
		    						
		    				       /*"<tr><td width=\"25\" align=\"center\" height=\"5\" colspan=\"2\"><center><font size=\"2\">7</font></center></td>"+
		    				       "<td>&nbsp;<font size=\"2\">SUB TYPE</font></td><td width=\"100\"><textarea name=\"cm_problem\" id=\"cm_problem\" readonly=\"readonly\" rows=\"2\" cols=\"60\">"+pType+"</textarea> </td></tr>"+
		    						*/
		                            "<tr><td width=\"25\" align=\"center\" height=\"5\" colspan=\"2\"><center><font size=\"2\">7</font></center></td>"+
		    						"<td>&nbsp;<font size=\"2\">REPORT REMARKS</font></td><td width=\"100\"><textarea name=\"cm_problem\" id=\"cm_problem\" readonly=\"readonly\" rows=\"2\" cols=\"60\">"+cm_problem+"</textarea> </td></tr>"+
		    						"<tr><td width=\"25\" align=\"center\" height=\"5\" colspan=\"2\"><center><font size=\"2\">8</font></center></td>"+
		    						"<td>&nbsp;<font size=\"2\">COMPLAINT TO</font></td><td width=\"100\"><font size=\"2\">"+emp+"</font></td>"+"</tr>" +
		    						"<tr><td width=\"25\" align=\"center\" height=\"6\" colspan=\"2\"><center><font size=\"2\">9</font></center></td>"+
		    						"<td>&nbsp;<font size=\"2\">COMPLAINT DATE AND TIME</font></td><td width=\"100\"><font size=\"2\">"+cm_time+"</font></td>"+"</tr>");
		    				if(cm_time!=null && admin_remarks==null || admin_remarks.equals(null)){
		    				stringBuffer.append("<tr><td width=\"25\" align=\"center\" height=\"6\" colspan=\"2\"><center><font size=\"2\">10</font></center></td>"+
		    						"<td>&nbsp;<font size=\"2\">"+reportTo+" REMARKS</font></td><td width=\"100\"><font size=\"2\">Pending</font></td>"+"</tr>"+
		    						"<tr><td width=\"25\" align=\"center\" height=\"6\" colspan=\"2\"><center><font size=\"2\">11</font></center></td>"+
		    						"<td>&nbsp;<font size=\"2\">RESOLVED DATE AND TIME</font></td><td width=\"100\"><font size=\"2\">Pending</font></td>"+"</tr>");
	    					
		    				}else{
		    					stringBuffer.append("<tr><td width=\"25\" align=\"center\" height=\"6\" colspan=\"2\"><center><font size=\"2\">10</font></center></td>"+
			    						"<td>&nbsp;<font size=\"2\"> "+reportTo+" REMARKS</font></td><td width=\"100\"><textarea name=\"emp\" readonly=\"readonly\" rows=\"2\" cols=\"60\">"+admin_remarks+"</textarea> </td>"+"</tr>"+
			    						"<tr><td width=\"25\" align=\"center\" height=\"6\" colspan=\"2\"><center><font size=\"2\">11</font></center></td>"+
			    						"<td>&nbsp;<font size=\"2\">RESOLVED DATE AND TIME</font></td><td width=\"100\"><font size=\"2\">"+cm_time2+"</font></td>"+"</tr>");
			    				
		    				      }
					           
					           
					           stringBuffer.append("</table>" +
					        		   "<br><br>");
					           if((StatusEscalate!=null) && (StatusEscalate.equals("Escalated"))){
					          stringBuffer.append(
		    						"<table align=\"center\" border=\"2\" cellspacing=\"1\" width=\"60%\">" +
		    						"<tr>"+
		    						"<td colspan=\"4\">"+

		    						"<label> <font color=\"Grey\">Escalation Comments:</font></label><br /></td></tr>"+
		    						
		    						"<tr><td width=\"15%\"><font size=\"2\"> "+reportTo+"</font></td><td width=\"10%\"><font size=\"2\">DATE</font></td><td width=\"35%\"><font size=\"2\">REMARKS<font></td></tr>"+
		    						"");
		    						if((FirstSysAdminEscalateSaName!=null)){
		    							stringBuffer.append("<tr><td>"+
		    						//INITIATOR :- "+cm_name+"              &nbsp;INITIATOR REMARKS :- "+FirstSysAdminEscalateSaRemarks+"<br />"+
		    						"<font color=\"blue\">"+FirstSysAdminEscalateSaName+"</font></td><td><font color=\"blue\" size=\"2\">"+FirstSysAdminEscalateSaDate+"</font></td><td><font color=\"blue\">"+FirstSysAdminEscalateSaRemarks+"</font></td></tr>"+
		    						"");
		    						}if((SecondSystemAdminEscalateSsaName!=null)){
		    						stringBuffer.append("<tr><td>"+
		    						
		    						"<font color=\"blue\">"+SecondSystemAdminEscalateSsaName+"</font></td><td><font color=\"blue\" size=\"2\">"+SecondSysAdminEscalateSsaDate+"</font></td><td> <font color=\"blue\">"+SecondSysAdminEscalateSsaRemarks+"</font></td></tr>"+
		    						"");
		    						}if((ThirdSysAdminEscalateSssaName!=null)){
		    						
		    						stringBuffer.append("<tr><td>"+
		    						"<font color=\"blue\">"+ThirdSysAdminEscalateSssaName +"</font></td><td> <font color=\"blue\" size=\"2\">"+ThirdSysAdminEscalateSssaDate+"</font></td><td> <font color=\"blue\">"+ThirdSysAdminEscalateSssaRemarks+"</font></td></tr>"+
		    						"");}
		    						if((FourthSysAdminEscalateItManagerName!=null)){
		    						stringBuffer.append("<tr><td>"+
		    						"<font color=\"blue\">"+FourthSysAdminEscalateItManagerName+"</font></td><td> <font color=\"blue\" size=\"2\">"+FourthSysAdminEscalateItManagerDate+"</font></td><td><font color=\"blue\">"+FourthSysAdminEscalateItManagerRemarks+"</font></td></tr>"+
		    						"");}
		    						stringBuffer.append("</table>"+
		    						
		    						"<br/>");
		    						//"</td></tr>"+
		    						//"");
		    				//  stringBuffer.append("</table>");
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
