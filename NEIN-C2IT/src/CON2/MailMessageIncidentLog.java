/*package CON2;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MailMessageIncidentLog {
	String driver;
	Date gdate = null;
	//String form2_no="NEIN/CS/Domain/90-127";
 public String getMailMessageIncidentLog(String form)
	{
	StringBuffer stringBuffer = new StringBuffer();
		Connection con = null;
		PreparedStatement pst = null,pst2=null,pst3=null,pst4=null;   
		ResultSet resultSet = null,rs = null,rs2 = null,rs3=null,rs4=null;
		try{ 
		System.out.println("value of Incident Id "+form);
		Connection2 dbConn = new Connection2();
		con = dbConn.getConnection2();
		//pst= con.prepareStatement("SELECT mr_date FROM mr_master where mr_id=?");
		pst= con.prepareStatement("SELECT form9_no,Created_date FROM form9_incident_log where form9_no=?");
		pst.setString(1,form);
		
		//pst.setString(1,"NEIN/MR/90-171");
		
		resultSet = pst.executeQuery();
		System.out.println("before while");
		while(resultSet.next()){
			
	
	//	System.out.println("inside while");
			//driver = resultSet.getString(1);
			
			gdate = resultSet.getDate(2);
			//gdate = resultSet.getString(1);
		//	System.out.println("date in mail message"+gdate);
			  
			
			//System.out.println("form2 *******************  value : "+resultSet.getString("form2_no"));
			//System.out.println("date  value : "+resultSet.getDate("f_date"));
		}
	 
       
// String textArea1,textArea2,textArea3,textArea4,VendorText,rupes,taxes,desg,emp,po_date,theName,delivery,paytrm,warranty,orderval,vat1,vat2,totalcon,vattext,abcvat1,vat3,nmrupees,abc1,abc2,abc3,abc4,termscond,tarea2,tarea22,tarea3,tarea33,tarea4,tarea44,transid,itemhead;
      //String idextend,mr_id,mr_name,mr_approved,mr_discuss,mr_date,e_name,e_designation,totalcon,desg,emp,theName,transid,mr_remarks,mr_remarks2,mr_remarks3,mr_remarks4,emp2,desg2,emp3,desg3,emp4,desg4,stauts;
      //String idextend,mr_id,mr_name,mr_approved,mr_date,mr_discuss,e_name,e_designation,totalcon,mr_itemName,mr_asset,mr_itemQuantity,mr_abbreviation,mr_itemRate,desg,emp,theName,transid,mr_remarks,stauts,mail;
		//String cm_date,idextend,complain_id,cm_name,cm_location,cm_type,cm_problem,desg,emp,transid;
		 stringBuffer.append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">" +
					"<html xmlns=\"http://www.w3.org/1999/xhtml\">"+
		             "<head >"+
		             "<jsp:useBean id =con class=CON2.Connection2 />"+
		             "<center>"+
		             " "+
		             "____________________________________________________________________________________________________________________"+
		           		
		             "<table border=\"0\" align=\"center\" width=\"80%\"><tr><td>"+
		             "<center>"+
		             "<label><font color=\"black\"><u><b>CCTV Surveillance & Security Systems</b></u></font></label> <br />"+
		             "<label><font color=\"black\"><u><b>INCIDENT LOG FORM</b></u></font></label> <br />"+
		             "</center></td></tr></table>"+
						"<br><br>");
						
						 pst2 = con.prepareStatement("select form9_no,SessionName,SessionDesg,SessionCity,SessionCityNo,SessionEmail,Created_date,from_date,to_date from  form9_incident_log where form9_no=?");
			            pst2.setString(1,form);
			            rs2 = pst2.executeQuery();
			            String form9_no=null,SessionName=null,SessionDesg=null,SessionCity=null,SessionCityNo=null,SessionEmail=null,Created_date=null,from_date=null,to_date=null;
			           while(rs2.next()){
							
			        	   SessionName = rs2.getString("SessionName");
			        	   SessionDesg = rs2.getString("SessionDesg");
			        	   SessionCity = rs2.getString("SessionCity");
			        	   SessionCityNo = rs2.getString("SessionCityNo");
			        	   SessionEmail = rs2.getString("SessionEmail");
			        	   Created_date = rs2.getString("Created_date");
			        	   from_date = rs2.getString("from_date");
			        	   to_date = rs2.getString("to_date");
							
			           }
			          
							        stringBuffer.append(
							        		"<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
							        			"<tr>"+
							        			
							        			"<td>");
							        stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+

						        			

							        			"<tr>"+
								        		
							        			"<td bgcolor=\"grey\" >FORM NUMBER:</td>"+
							        			"<td align=\"center\">"+form+"</td> "+
							        			"</tr>"+
							        			"<tr>"+
							        			"<td>Department:</td>"+
							        			"<td>"+SessionCity+"</td> "+
							        			"</tr>"+
							        			
							        			"<tr>"+
							        			"<td width=\"20%\">From Date :</td>"+
							        			"<td bgcolor=\"white\" width=\"20%\">"+from_date+"</td>"+
							        			"<td width=\"20%\">To Date :</td>"+
							        			"<td bgcolor=\"white\" width=\"20%\">"+to_date+"</td>"+
							        			"</tr>"+
							        			
							        			"</table>"+
							        			"<br>");
							        
							        
							        
							        
							        stringBuffer.append("<table width=\"80%\" border=\"1\" align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
						        			"<tr>"+
						        			"<td bgcolor=\"grey\" width=\"20%\" align=\"center\"><font size=\"2\" color=\"black\">DATE</font></td>"+
						        			"<td bgcolor=\"grey\" width=\"20%\" align=\"center\"><font size=\"2\" color=\"black\">TIME</font></td>"+
						        			"<td bgcolor=\"grey\" width=\"20%\" align=\"center\"><font size=\"2\" color=\"black\">VIEWEED BY</font></td>"+
						        			"<td bgcolor=\"grey\" width=\"20%\" align=\"center\"><font size=\"2\" color=\"black\">INCIDENT STATUS</font></td>"+
						        			"<td bgcolor=\"grey\" width=\"20%\" align=\"center\"><font size=\"2\" color=\"black\">REMARKS</font></td>"+
						        			
						        			"</tr>");
						        
						        
						      
						        
									        pst3 = con.prepareStatement("select form9_no,I_date,I_time,I_viewedBy,I_Remarks,Created_Date,Incident_Reported from form9_incident_item WHERE form9_no=?");
									        pst3.setString(1,form);
									      
									        rs3 = pst3.executeQuery();
									        String I_date=null,I_time=null,I_viewedBy=null,I_Remarks=null,Incident_Reported=null;
									  	  while(rs3.next())
									  	  {
									  	// String form1_noD= rs3.getString("form1_no");
									  		  
									  		
									  		I_date= rs3.getString("I_date");
									  		I_time= rs3.getString("I_time");
									  		I_viewedBy= rs3.getString("I_viewedBy");
									  		I_Remarks= rs3.getString("I_Remarks");
									  		Incident_Reported = rs3.getString("Incident_Reported");
						  		  
						  	   stringBuffer.append("<tr>"+
									    		   "<td><font size=\"2\" color=\"black\">"+I_date+"</font></td>"+
									    		   "<td><font size=\"2\" color=\"black\">"+I_time+"</font></td>"+
									    		   "<td><font size=\"2\" color=\"black\">"+I_viewedBy+"</font></td>"+
									    		   "<td><font size=\"2\" color=\"black\">"+Incident_Reported+"</font></td>"+
									    		   "<td><font size=\"2\" color=\"black\">"+I_Remarks+"</font></td>"+
									    		   "</tr>");     
									  	  }
							   stringBuffer.append("</table></br>"+
							        
							        
							        
							"<label><center> <font color=\"black\"><u><b>ApprovalRoutine</b></u></font></center> </label>");
							   					stringBuffer.append("<table width=\"80%\" border=\"1\" align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
							        			"<tr>"+
							        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">NAME</font></td>"+
							        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">DESIGNATION</font></td>"+
							        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">STATUS</font></td>"+
							        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">REMARKS</font></td>"+
							        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">DATE</font></td>"+
							        		
							        			"</tr>");
							        
							        
							      
							        
							        pst4 = con.prepareStatement("select form9_no,desg,emp,status,remarks,f_date from form9_incident_log_item WHERE form9_no=? AND desg <> 'none' ORDER BY id ASC");
							        pst4.setString(1,form);
							      
							        rs4 = pst4.executeQuery();
							  	  while(rs4.next())
							  	  {
							  	// String form1_noD= rs3.getString("form1_no");
							  		String desgD=null,empD=null,statusD=null,remarksD=null,f_dateD=null;
							  		   desgD= rs4.getString("desg");
							  		   empD= rs4.getString("emp");
							  		   statusD= rs4.getString("status");
							  		   remarksD= rs4.getString("remarks");
							  		   f_dateD= rs4.getString("f_date");
							  	
							  		
							       stringBuffer.append("<tr>"+
							    		   "<td><font size=\"2\" color=\"black\">"+empD+"</font></td>"+
							    		   "<td><font size=\"2\" color=\"black\">"+desgD+"</font></td>");
					            	if(statusD.equals("Approved")){	
					                    stringBuffer.append("<td bgcolor=\"green\" width=\"100\"><font size=\"2\" color=\"black\">"+statusD+"</font></td>");
					            	}
					            	else if(statusD.equals("Not Approved")){	
    						            stringBuffer.append("<td bgcolor=\"red\" width=\"100\"><font size=\"2\" color=\"black\">"+statusD+"</font></td>");
    						            	}
					            	else if(statusD.equals("Pending")){	
    						            stringBuffer.append("<td bgcolor=\"orange\" width=\"100\"><font size=\"2\" color=\"black\">"+statusD+"</font></td>");
    						            	}
					            	else{
					            		stringBuffer.append("<td bgcolor=\"yellow\" width=\"100\"><font size=\"2\" color=\"black\">"+statusD+"</font></td>");
					            	}
					            stringBuffer.append("<td><font size=\"2\" color=\"black\">"+remarksD+"</font></td>"+
							    		   "<td><font size=\"2\" color=\"black\">"+f_dateD+"</font></td>"+
							    		   "</tr>");     
							  	  }


							  	 stringBuffer.append("<br>");
						           
			 stringBuffer.append("</table></br>"+
                                                 
							"</td>"+

							"</tr>"+
							"</table>"+
							"</center>"+
			           		
			           		"<br>"+
			           		"<br>"+
			           		"__________________________________________________________________________________________________________________________________________________"+
			           		
			           		"<br><br>"+
			           		
			           		"</head>"+
			           		"</html>");   	
		           
				    				
	
		}
		catch (Exception e) {
			// TODO: handle exception
			
			System.out.println("catch   ---");
			  e.printStackTrace();
			  
			  System.out.println("Tracing : "+e.toString());
		}
		finally{
			DbUtil.closeDBResources(null,pst,con);
			DbUtil.closeDBResources(rs2,pst2,null);
			DbUtil.closeDBResources(rs3,pst3,null);
			DbUtil.closeDBResources(rs4,pst4,null);
			
			
		}
		//stringBuffer.delete(0, stringBuffer.length());
		//stringBuffer.setLength(0);
		//stringBuffer.setLength(1);
		return stringBuffer.toString();	
	}
}
*/


package CON2;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MailMessageIncidentLog {
	String driver;
	Date gdate = null;
	//String form2_no="NEIN/CS/IL/10-631";
 public String getMailMessageIncidentLog(String form)
	{
	 //form=form2_no;
	StringBuffer stringBuffer = new StringBuffer();
		Connection con = null;
		PreparedStatement pst = null,pst2=null,pst3=null,pst4=null;   
		ResultSet resultSet = null,rs = null,rs2 = null,rs3=null,rs4=null;
		try{ 
		System.out.println("value of Incident Id "+form);
		Connection2 dbConn = new Connection2();
		con = dbConn.getConnection2();
		//pst= con.prepareStatement("SELECT mr_date FROM mr_master where mr_id=?");
		pst= con.prepareStatement("SELECT form9_no,Created_date FROM form9_incident_log where form9_no=?");
		pst.setString(1,form);
		
		//pst.setString(1,"NEIN/MR/90-171");
		
		resultSet = pst.executeQuery();
		System.out.println("before while");
		while(resultSet.next()){
			
	
	//	System.out.println("inside while");
			//driver = resultSet.getString(1);
			
			gdate = resultSet.getDate(2);
			//gdate = resultSet.getString(1);
		//	System.out.println("date in mail message"+gdate);
			  
			
			//System.out.println("form2 *******************  value : "+resultSet.getString("form2_no"));
			//System.out.println("date  value : "+resultSet.getDate("f_date"));
		}
	 
       
// String textArea1,textArea2,textArea3,textArea4,VendorText,rupes,taxes,desg,emp,po_date,theName,delivery,paytrm,warranty,orderval,vat1,vat2,totalcon,vattext,abcvat1,vat3,nmrupees,abc1,abc2,abc3,abc4,termscond,tarea2,tarea22,tarea3,tarea33,tarea4,tarea44,transid,itemhead;
      //String idextend,mr_id,mr_name,mr_approved,mr_discuss,mr_date,e_name,e_designation,totalcon,desg,emp,theName,transid,mr_remarks,mr_remarks2,mr_remarks3,mr_remarks4,emp2,desg2,emp3,desg3,emp4,desg4,stauts;
      //String idextend,mr_id,mr_name,mr_approved,mr_date,mr_discuss,e_name,e_designation,totalcon,mr_itemName,mr_asset,mr_itemQuantity,mr_abbreviation,mr_itemRate,desg,emp,theName,transid,mr_remarks,stauts,mail;
		//String cm_date,idextend,complain_id,cm_name,cm_location,cm_type,cm_problem,desg,emp,transid;
		 stringBuffer.append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">" +
					"<html xmlns=\"http://www.w3.org/1999/xhtml\">"+
		             "<head >"+
		             "<jsp:useBean id =con class=CON2.Connection2 />"+
		             "<center>"+
		             " "+
		             "____________________________________________________________________________________________________________________"+
		           		
		             "<table border=\"0\" align=\"center\" width=\"80%\"><tr><td>"+
		             "<center>"+
		             "<label><font color=\"black\"><u><b>CCTV Surveillance & Security Systems</b></u></font></label> <br />"+
		             "<label><font color=\"black\"><u><b>INCIDENT LOG FORM</b></u></font></label> <br />"+
		             "</center></td></tr></table>"+
						"<br><br>");
						
		 String form9_no=null,SessionName=null,SessionDesg=null,SessionCityNo=null,SessionEmail=null,Created_date=null,from_date=null,to_date=null;
						 pst2 = con.prepareStatement("select form9_no,SessionName,SessionDesg,SessionCityNo,SessionEmail,Created_date,from_date,to_date from  form9_incident_log where form9_no=?");
			            pst2.setString(1,form);
			            rs2 = pst2.executeQuery();
			           while(rs2.next()){
							
			        	   SessionName = rs2.getString("SessionName");
			        	   SessionDesg = rs2.getString("SessionDesg");
			        	  // SessionCity = rs2.getString("SessionCity");
			        	  // SessionCityNo = rs2.getString("SessionCityNo");
			        	   SessionEmail = rs2.getString("SessionEmail");
			        	   Created_date = rs2.getString("Created_date");
			        	   from_date = rs2.getString("from_date");
			        	   to_date = rs2.getString("to_date");
							
			           }
			          
							        stringBuffer.append(
							        		"<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
							        			"<tr>"+
							        			
							        			"<td>");
							        stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+

						        			

							        			"<tr>"+
								        		
							        			"<td bgcolor=\"grey\" >FORM NUMBER:</td>"+
							        			"<td align=\"center\">"+form+"</td> "+
							        			"</tr>"+
											/*
											 * "<tr>"+ "<td>Department:</td>"+ "<td>"+SessionCity+"</td> "+ "</tr>"+
											 */
							        			
							        			"<tr>"+
							        			"<td width=\"20%\">From Date :</td>"+
							        			"<td bgcolor=\"white\" width=\"20%\">"+from_date+"</td>"+
							        			"<td width=\"20%\">To Date :</td>"+
							        			"<td bgcolor=\"white\" width=\"20%\">"+to_date+"</td>"+
							        			"</tr>"+
							        			
							        			"</table>"+
							        			"<br>");
							        
							        
							        
							        
							        stringBuffer.append("<table width=\"80%\" border=\"1\" align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
						        			"<tr>"+
						        			"<td bgcolor=\"grey\" width=\"20%\" align=\"center\"><font size=\"2\" color=\"black\">DATE</font></td>"+
						        			"<td bgcolor=\"grey\" width=\"20%\" align=\"center\"><font size=\"2\" color=\"black\">LOCATION</font></td>"+
						        			"<td bgcolor=\"grey\" width=\"20%\" align=\"center\"><font size=\"2\" color=\"black\">TIME</font></td>"+
						        			"<td bgcolor=\"grey\" width=\"20%\" align=\"center\"><font size=\"2\" color=\"black\">VIEWEED BY</font></td>"+
						        			"<td bgcolor=\"grey\" width=\"20%\" align=\"center\"><font size=\"2\" color=\"black\">INCIDENT STATUS</font></td>"+
						        			"<td bgcolor=\"grey\" width=\"20%\" align=\"center\"><font size=\"2\" color=\"black\">REMARKS</font></td>"+
						        			
						        			"</tr>");
						        
						        
						      
						        
									      //  pst3 = con.prepareStatement("select form9_no,I_date,I_time,I_viewedBy,I_Remarks,Created_Date,Incident_Reported from form9_incident_item  WHERE form9_no=?");
							        pst3 = con.prepareStatement("SELECT f.form9_no,f.I_date,f.I_Location,f.I_time,f.I_viewedBy,f.I_Remarks,f.Created_Date,f.Incident_Reported,f1.SessionCity FROM `form9_incident_item`f INNER join form9_incident_log f1 on f.form9_no=f1.form9_no where f.form9_no=?"); 
							        pst3.setString(1,form);
									      
									        rs3 = pst3.executeQuery();
									        String I_date=null,SessionCity=null,I_time=null,I_viewedBy=null,I_Remarks=null,Incident_Reported=null;
									  	  while(rs3.next())
									  	  {
									  	// String form1_noD= rs3.getString("form1_no");
									  		  
									  		
									  		I_date= rs3.getString("I_date");
								        	SessionCity = rs3.getString("I_Location");
								        	System.out.println("SessionCity--->"+SessionCity);

									  		I_time= rs3.getString("I_time");
									  		I_viewedBy= rs3.getString("I_viewedBy");
									  		I_Remarks= rs3.getString("I_Remarks");
									  		Incident_Reported = rs3.getString("Incident_Reported");
						  		  
						  	   stringBuffer.append("<tr>"+
									    		   "<td><font size=\"2\" color=\"black\">"+I_date+"</font></td>"+
										          "<td><font size=\"2\" color=\"black\">"+SessionCity+"</font></td>"+ 
                                                   "<td><font size=\"2\" color=\"black\">"+I_time+"</font></td>"+
									    		   "<td><font size=\"2\" color=\"black\">"+I_viewedBy+"</font></td>"+
									    		   "<td><font size=\"2\" color=\"black\">"+Incident_Reported+"</font></td>"+
									    		   "<td><font size=\"2\" color=\"black\">"+I_Remarks+"</font></td>"+
									    		   "</tr>");     
									  	  }
							   stringBuffer.append("</table></br>"+
							        
							        
							        
							"<label><center> <font color=\"black\"><u><b>ApprovalRoutine</b></u></font></center> </label>");
							   					stringBuffer.append("<table width=\"80%\" border=\"1\" align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
							        			"<tr>"+
							        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">NAME</font></td>"+
							        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">DESIGNATION</font></td>"+
							        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">STATUS</font></td>"+
							        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">REMARKS</font></td>"+
							        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">DATE</font></td>"+
							        		
							        			"</tr>");
							        
							        
							      
							        
							        pst4 = con.prepareStatement("select form9_no,desg,emp,status,remarks,f_date from form9_incident_log_item WHERE form9_no=? AND desg <> 'none' ORDER BY id ASC");
							        pst4.setString(1,form);
							      
							        rs4 = pst4.executeQuery();
							  	  while(rs4.next())
							  	  {
							  	// String form1_noD= rs3.getString("form1_no");
							  		String desgD=null,empD=null,statusD=null,remarksD=null,f_dateD=null;
							  		   desgD= rs4.getString("desg");
							  		   empD= rs4.getString("emp");
							  		   statusD= rs4.getString("status");
							  		   remarksD= rs4.getString("remarks");
							  		   f_dateD= rs4.getString("f_date");
							  	
							  		
							       stringBuffer.append("<tr>"+
							    		   "<td><font size=\"2\" color=\"black\">"+empD+"</font></td>"+
							    		   "<td><font size=\"2\" color=\"black\">"+desgD+"</font></td>");
					            	if(statusD.equals("Approved")){	
					                    stringBuffer.append("<td bgcolor=\"green\" width=\"100\"><font size=\"2\" color=\"black\">"+statusD+"</font></td>");
					            	}
					            	else if(statusD.equals("Not Approved")){	
    						            stringBuffer.append("<td bgcolor=\"red\" width=\"100\"><font size=\"2\" color=\"black\">"+statusD+"</font></td>");
    						            	}
					            	else if(statusD.equals("Pending")){	
    						            stringBuffer.append("<td bgcolor=\"orange\" width=\"100\"><font size=\"2\" color=\"black\">"+statusD+"</font></td>");
    						            	}
					            	else{
					            		stringBuffer.append("<td bgcolor=\"yellow\" width=\"100\"><font size=\"2\" color=\"black\">"+statusD+"</font></td>");
					            	}
					            stringBuffer.append("<td><font size=\"2\" color=\"black\">"+remarksD+"</font></td>"+
							    		   "<td><font size=\"2\" color=\"black\">"+f_dateD+"</font></td>"+
							    		   "</tr>");     
							  	  }


							  	 stringBuffer.append("<br>");
						           
			 stringBuffer.append("</table></br>"+
                                                 
							"</td>"+

							"</tr>"+
							"</table>"+
							"</center>"+
			           		
			           		"<br>"+
			           		"<br>"+
			           		"__________________________________________________________________________________________________________________________________________________"+
			           		
			           		"<br><br>"+
			           		
			           		"</head>"+
			           		"</html>");   	
		           
				    				
	
		}
		catch (Exception e) {
			// TODO: handle exception
			
			System.out.println("catch   ---");
			  e.printStackTrace();
			  
			  System.out.println("Tracing : "+e.toString());
		}
		finally{
			DbUtil.closeDBResources(null,pst,con);
			DbUtil.closeDBResources(rs2,pst2,null);
			DbUtil.closeDBResources(rs3,pst3,null);
			DbUtil.closeDBResources(rs4,pst4,null);
			
			
		}
		//stringBuffer.delete(0, stringBuffer.length());
		//stringBuffer.setLength(0);
		//stringBuffer.setLength(1);
		return stringBuffer.toString();	
	}
}
