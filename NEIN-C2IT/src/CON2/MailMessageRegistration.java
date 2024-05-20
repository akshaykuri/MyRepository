package CON2;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MailMessageRegistration {
	String driver;
	Date gdate = null;
	//String form2_no="NEIN/CS/Domain/90-127";
 public String getMailMessageRegistration(String form)
	{
	StringBuffer stringBuffer = new StringBuffer();
		Connection con = null;
		PreparedStatement pst = null,pst2=null,pst3=null,pst4=null;   
		ResultSet resultSet = null,rs = null,rs2 = null,rs3=null,rs4=null;
		try{ 
		System.out.println("value of MR ID "+form);
		Connection2 dbConn = new Connection2();
		con = dbConn.getConnection2();
		//pst= con.prepareStatement("SELECT mr_date FROM mr_master where mr_id=?");
		pst= con.prepareStatement("SELECT form10_no,f_date FROM  form10_registration where form10_no=?");
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
		             "<label><font color=\"black\"><u><b>INTERNAL NEIN SOFTWARE USER - REGISTRATION FORM</b></u></font></label> <br />"+
		             "</center></td></tr></table>"+
						"<br><br>");	
						
						 pst2 = con.prepareStatement("SELECT ITusername,ITpassword,ITAssignedRights,ITremark,branch,depart,full_name,emp_code,designation,Software,regis_mail,requestBy,requestOption from  form10_registration where form10_no=?");
			            pst2.setString(1, form);
			            rs2 = pst2.executeQuery();
			            System.out.println("hhhhhhhhh"+form);
			            String ITusername=null,ITpassword=null,ITAssignedRights=null,ITremark=null;
			            String branch=null,depart=null,full_name=null,emp_code=null,designation=null,Software=null,scopeOfWork=null,requestBy=null,requestOption=null;
			           while(rs2.next()){
							
							 branch = rs2.getString("branch");
							 depart = rs2.getString("depart");
							 full_name = rs2.getString("full_name");
							 emp_code = rs2.getString("emp_code");
							 designation = rs2.getString("designation");
							 Software = rs2.getString("Software");
							 scopeOfWork = rs2.getString("regis_mail");
							 requestBy = rs2.getString("requestBy");
							 requestOption = rs2.getString("requestOption");
							 ITusername = rs2.getString("ITusername");
							 ITpassword = rs2.getString("ITpassword");
							 ITAssignedRights = rs2.getString("ITAssignedRights");
							 ITremark = rs2.getString("ITremark");
			           }
			          
							        stringBuffer.append(
							        		"<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
							        			"<tr>"+
							        			
							        			"<td>");
							        stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+

						        			"<tr>"+
						        			"<td bgcolor=\"grey\" align=\"center\">FORMNUMBER</td>"+
						        			"<td colspan=\"3\" align=\"center\">"+form+"</td>"+
						        			"</tr>"+

							        		 /* stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+

		    							        			"<tr>"+
		    							        			"&nbsp;&nbsp;&nbsp;<td style=\"text-align: right;width: 215px;\" bgcolor=\"grey\">FORMNUMBER</td>"+
		    							        			"<td style=\"text-align:left;\" bgcolor=\"white\" colspan=\"3\">"+form+"</td>"+
		    							        			"</tr></table>");*/
							        		  
						        			"<tr>"+
						        			"<td>Employee Code:</td>"+
						        			"<td bgcolor=\"white\">"+emp_code+"</td>"+
						        			"<td>Full Name :</td>"+
						        			"<td bgcolor=\"white\">"+full_name+"</td>"+
						        			
						        			"</tr>"+
						        			    "<tr>"+
							        			"<td>Branch</td>"+
							        			"<td bgcolor=\"white\">"+branch+"</td>"+
							        			"<td>Department:</td>"+
							        			"<td>"+depart+"</td> "+
							        			"</tr>"+
							        			
							        			"<tr>"+
							        			"<td>Designation :</td>"+
							        			"<td bgcolor=\"white\">"+designation+"</td>"+
							        			"<td>Software  :</td>"+
							        			"<td bgcolor=\"white\">"+Software+"</td>"+
							        			"</tr>"+
							        			"<tr>"+
							        			"<td>Mail ID  :</td>"+
							        			"<td bgcolor=\"white\">"+scopeOfWork+"</td>"+
							        			"<td>Requested By :</td>"+
							        			"<td bgcolor=\"white\">"+requestBy+"</td>"+
							        			"</tr>"+
							        			"<tr>"+
							        			"<td>Request To:</td>"+
							        			"<td bgcolor=\"white\">"+requestOption+"</td>"+
							        			
							        			"</tr>"+
							        			"</table>"+
							        			"<br>"+


							        			"<label><center> <font color=\"black\"><u><b>ApprovalRoutine</b></u></font></center> </label> "+
							        			
							        			"<br />");


							        			
		 										stringBuffer.append("<table width=\"80%\" border=\"1\" align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
							        			"<tr>"+
							        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">NAME</font></td>"+
							        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">DESIGNATION</font></td>"+
							        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">STATUS</font></td>"+
							        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">REMARKS</font></td>"+
							        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">DATE</font></td>"+
							        			"<td>"+
							        			"</td>"+
							        			"</tr>");
							        
							        
							      
							        
							        pst3 = con.prepareStatement("select form10_no,desg,emp,status,remarks,f_date from form10_registration_item WHERE form10_no=? AND desg <> 'none' ORDER BY id ASC");
							        pst3.setString(1,form);
							      
							        rs3 = pst3.executeQuery();
							  	  while(rs3.next())
							  	  {
							  	// String form1_noD= rs3.getString("form1_no");
							  		String desgD=null,empD=null,statusD=null,remarksD=null,f_dateD=null;
							  		   desgD= rs3.getString("desg");
							  		   empD= rs3.getString("emp");
							  		   statusD= rs3.getString("status");
							  		   remarksD= rs3.getString("remarks");
							  		   f_dateD= rs3.getString("f_date");
							  	
							  		
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


							  	 stringBuffer.append("<br>"+
							  							"<br>" +
							  							"" +
							  							"<table  border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
							  						"<tr><td id=\"ita\" bgcolor=\"grey\">IT Dept Use Only</td></tr>"+
							  						"</table>"+
							  						"<table  border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
							  						"<tr>"+
							  						"<td> User Name:</td>"+
							  						"<td> <input type=\"text\" readonly=\"readonly\" name=\"ID\" id=\"code\" maxlength=\"65\" value="+ITusername+"></td>"+
							  						"</tr>"+

							  						"<tr>"+
							  						"<td>Password :</td>"+
							  						"<td> <input type=\"text\" readonly=\"readonly\" name=\"Password\" id=\"pwd\" maxlength=\"65\" value="+ITpassword+"></td></tr>"+

							  						"<tr>"+
							  						"<td>Rights :</td>"+
							  						"<td> <input type=\"text\" readonly=\"readonly\" name=\"Rights\" id=\"cud\" maxlength=\"65\" value="+ITAssignedRights+"></td></tr>"+
							  						/*"<tr>"+
							  						"<td > Remarks :</td>"+
							  						"<td > <input type=\"text\" readonly=\"readonly\" name=\"ITdremark\" id=\"rem\" size=\"60\" maxlength=\"500\" value="+ITremark+"></td></tr>"+*/
							  						"</table>"+
							  						"<br />"+                       
							  								
							  								
							  								"	</br>");
						           
			 stringBuffer.append("</table></br>"+
                                                 
							"</td>"+

							"</tr>"+
							"</table>"+
							"</center><br><br>"+
			           		
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
 
 public String getMailMessageCCDRegistration(String form)
	{
	StringBuffer stringBuffer = new StringBuffer();
		Connection con = null;
		PreparedStatement pst = null,pst2=null,pst3=null,pst4=null;   
		ResultSet resultSet = null,rs = null,rs2 = null,rs3=null,rs4=null;
		try{ 
		System.out.println("value of MR ID "+form);
		Connection2 dbConn = new Connection2();
		con = dbConn.getConnection2();
		//pst= con.prepareStatement("SELECT mr_date FROM mr_master where mr_id=?");
		pst= con.prepareStatement("SELECT form10_no,f_date FROM  form14_ccdregistration where form10_no=?");
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
	 
 
//String textArea1,textArea2,textArea3,textArea4,VendorText,rupes,taxes,desg,emp,po_date,theName,delivery,paytrm,warranty,orderval,vat1,vat2,totalcon,vattext,abcvat1,vat3,nmrupees,abc1,abc2,abc3,abc4,termscond,tarea2,tarea22,tarea3,tarea33,tarea4,tarea44,transid,itemhead;
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
		             "<label><font color=\"black\"><u><b>CCD SOFTWARE USER - REGISTRATION FORM</b></u></font></label> <br />"+
		             "</center></td></tr></table>"+
						"<br><br>");	
						
						 pst2 = con.prepareStatement("SELECT ITusername,ITpassword,ITAssignedRights,ITremark,branch,depart,full_name,emp_code,designation,Software,regis_mail,requestBy,requestOption from  form14_ccdregistration where form10_no=?");
			            pst2.setString(1, form);
			            rs2 = pst2.executeQuery();
			            System.out.println("hhhhhhhhh"+form);
			            String ITusername=null,ITpassword=null,ITAssignedRights=null,ITremark=null;
			            String branch=null,depart=null,full_name=null,emp_code=null,designation=null,Software=null,scopeOfWork=null,requestBy=null,requestOption=null;
			           while(rs2.next()){
							
							 branch = rs2.getString("branch");
							 depart = rs2.getString("depart");
							 full_name = rs2.getString("full_name");
							 emp_code = rs2.getString("emp_code");
							 designation = rs2.getString("designation");
							 Software = rs2.getString("Software");
							 scopeOfWork = rs2.getString("regis_mail");
							 requestBy = rs2.getString("requestBy");
							 requestOption = rs2.getString("requestOption");
							 ITusername = rs2.getString("ITusername");
							 ITpassword = rs2.getString("ITpassword");
							 ITAssignedRights = rs2.getString("ITAssignedRights");
							 ITremark = rs2.getString("ITremark");
			           }
			          
							        stringBuffer.append(
							        		"<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
							        			"<tr>"+
							        			
							        			"<td>");
							        stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+

						        			"<tr>"+
						        			"<td bgcolor=\"grey\" align=\"center\">FORMNUMBER</td>"+
						        			"<td colspan=\"3\" align=\"center\">"+form+"</td>"+
						        			"</tr>"+

							        		 /* stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+

		    							        			"<tr>"+
		    							        			"&nbsp;&nbsp;&nbsp;<td style=\"text-align: right;width: 215px;\" bgcolor=\"grey\">FORMNUMBER</td>"+
		    							        			"<td style=\"text-align:left;\" bgcolor=\"white\" colspan=\"3\">"+form+"</td>"+
		    							        			"</tr></table>");*/
							        		  
						        			"<tr>"+
						        			"<td>Employee Code:</td>"+
						        			"<td bgcolor=\"white\">"+emp_code+"</td>"+
						        			"<td>Full Name :</td>"+
						        			"<td bgcolor=\"white\">"+full_name+"</td>"+
						        			
						        			"</tr>"+
						        			    "<tr>"+
							        			"<td>Branch</td>"+
							        			"<td bgcolor=\"white\">"+branch+"</td>"+
							        			"<td>Department:</td>"+
							        			"<td>"+depart+"</td> "+
							        			"</tr>"+
							        			
							        			"<tr>"+
							        			"<td>Designation :</td>"+
							        			"<td bgcolor=\"white\">"+designation+"</td>"+
							        			"<td>Software  :</td>"+
							        			"<td bgcolor=\"white\">"+Software+"</td>"+
							        			"</tr>"+
							        			"<tr>"+
							        			"<td>Mail ID  :</td>"+
							        			"<td bgcolor=\"white\">"+scopeOfWork+"</td>"+
							        			"<td>Requested By :</td>"+
							        			"<td bgcolor=\"white\">"+requestBy+"</td>"+
							        			"</tr>"+
							        			"<tr>"+
							        			"<td>Request To:</td>"+
							        			"<td bgcolor=\"white\">"+requestOption+"</td>"+
							        			
							        			"</tr>"+
							        			"</table>"+
							        			"<br>"+


							        			"<label><center> <font color=\"black\"><u><b>ApprovalRoutine</b></u></font></center> </label> "+
							        			
							        			"<br />");


							        			
		 										stringBuffer.append("<table width=\"80%\" border=\"1\" align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
							        			"<tr>"+
							        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">NAME</font></td>"+
							        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">DESIGNATION</font></td>"+
							        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">STATUS</font></td>"+
							        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">REMARKS</font></td>"+
							        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">DATE</font></td>"+
							        			"<td>"+
							        			"</td>"+
							        			"</tr>");
							        
							        
							      
							        
							        pst3 = con.prepareStatement("select form10_no,desg,emp,status,remarks,f_date from form14_ccdregistration_item WHERE form10_no=? AND desg <> 'none' ORDER BY id ASC");
							        pst3.setString(1,form);
							      
							        rs3 = pst3.executeQuery();
							  	  while(rs3.next())
							  	  {
							  	// String form1_noD= rs3.getString("form1_no");
							  		String desgD=null,empD=null,statusD=null,remarksD=null,f_dateD=null;
							  		   desgD= rs3.getString("desg");
							  		   empD= rs3.getString("emp");
							  		   statusD= rs3.getString("status");
							  		   remarksD= rs3.getString("remarks");
							  		   f_dateD= rs3.getString("f_date");
							  	
							  		
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
				           
			 stringBuffer.append("</table></br>"+
                                           
							"</td>"+

							"</tr>"+
							"</table>"+
							"</center><br><br>"+
			           		
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

 
 
 
 
 
 
 
 
 
 
 
 public String getMailMessageUSBAccess(String form)
	{
	StringBuffer stringBuffer = new StringBuffer();
		Connection con = null;
		PreparedStatement pst = null,pst2=null,pst3=null,pst4=null;   
		ResultSet resultSet = null,rs = null,rs2 = null,rs3=null,rs4=null;
		try{ 
		System.out.println("value of MR ID "+form);
		Connection2 dbConn = new Connection2();
		con = dbConn.getConnection2();
		//pst= con.prepareStatement("SELECT mr_date FROM mr_master where mr_id=?");
		pst= con.prepareStatement("SELECT form10_no,f_date FROM  form17_usb_access where form10_no=?");
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
	 

//String textArea1,textArea2,textArea3,textArea4,VendorText,rupes,taxes,desg,emp,po_date,theName,delivery,paytrm,warranty,orderval,vat1,vat2,totalcon,vattext,abcvat1,vat3,nmrupees,abc1,abc2,abc3,abc4,termscond,tarea2,tarea22,tarea3,tarea33,tarea4,tarea44,transid,itemhead;
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
		             "<label><font color=\"black\"><u><b>USB ACCESS REQUEST FORM</b></u></font></label> <br />"+
		             "</center></td></tr></table>"+
						"<br><br>");	
						
						 pst2 = con.prepareStatement("SELECT ITusername,ITpassword,ITAssignedRights,ITremark,branch,depart,full_name,emp_code,designation,Software,regis_mail,requestBy,requestOption from  form17_usb_access where form10_no=?");
			            pst2.setString(1, form);
			            rs2 = pst2.executeQuery();
			            //System.out.println("hhhhhhhhh"+form);
			            String ITusername=null,ITpassword=null,ITAssignedRights=null,ITremark=null;
			            String branch=null,depart=null,full_name=null,emp_code=null,designation=null,Software=null,scopeOfWork=null,requestBy=null,requestOption=null;
			           while(rs2.next()){
							
							 branch = rs2.getString("branch");
							 depart = rs2.getString("depart");
							 full_name = rs2.getString("full_name");
							 emp_code = rs2.getString("emp_code");
							 designation = rs2.getString("designation");
							 Software = rs2.getString("Software");
							 scopeOfWork = rs2.getString("regis_mail");
							 requestBy = rs2.getString("requestBy");
							 requestOption = rs2.getString("requestOption");
							 ITusername = rs2.getString("ITusername");
							 ITpassword = rs2.getString("ITpassword");
							 ITAssignedRights = rs2.getString("ITAssignedRights");
							 ITremark = rs2.getString("ITremark");
			           }
			          
							        stringBuffer.append(
							        		"<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
							        			"<tr>"+
							        			
							        			"<td>");
							        stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+

						        			"<tr>"+
						        			"<td bgcolor=\"grey\" align=\"center\">FORMNUMBER</td>"+
						        			"<td colspan=\"3\" align=\"center\">"+form+"</td>"+
						        			"</tr>"+

							        		 /* stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+

		    							        			"<tr>"+
		    							        			"&nbsp;&nbsp;&nbsp;<td style=\"text-align: right;width: 215px;\" bgcolor=\"grey\">FORMNUMBER</td>"+
		    							        			"<td style=\"text-align:left;\" bgcolor=\"white\" colspan=\"3\">"+form+"</td>"+
		    							        			"</tr></table>");*/
							        		  
						        			"<tr>"+
						        			"<td>Employee Code:</td>"+
						        			"<td bgcolor=\"white\">"+emp_code+"</td>"+
						        			"<td>Full Name :</td>"+
						        			"<td bgcolor=\"white\">"+full_name+"</td>"+
						        			
						        			"</tr>"+
						        			    "<tr>"+
							        			"<td>Branch</td>"+
							        			"<td bgcolor=\"white\">"+branch+"</td>"+
							        			"<td>Department:</td>"+
							        			"<td>"+depart+"</td> "+
							        			"</tr>"+
							        			
							        			"<tr>"+
							        			"<td>Designation :</td>"+
							        			"<td bgcolor=\"white\">"+designation+"</td>"+
							        			"<td>Software  :</td>"+
							        			"<td bgcolor=\"white\">"+Software+"</td>"+
							        			"</tr>"+
							        			"<tr>"+
							        			"<td>Mail ID  :</td>"+
							        			"<td bgcolor=\"white\">"+scopeOfWork+"</td>"+
							        			"<td>Requested By :</td>"+
							        			"<td bgcolor=\"white\">"+requestBy+"</td>"+
							        			"</tr>"+
							        			"<tr>"+
							        			"<td>Request To:</td>"+
							        			"<td bgcolor=\"white\">"+requestOption+"</td>"+
							        			
							        			"</tr>"+
							        			"</table>"+
							        			"<br>"+


							        			"<label><center> <font color=\"black\"><u><b>ApprovalRoutine</b></u></font></center> </label> "+
							        			
							        			"<br />");


							        			
		 										stringBuffer.append("<table width=\"80%\" border=\"1\" align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
							        			"<tr>"+
							        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">NAME</font></td>"+
							        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">DESIGNATION</font></td>"+
							        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">STATUS</font></td>"+
							        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">REMARKS</font></td>"+
							        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">DATE</font></td>"+
							        			"<td>"+
							        			"</td>"+
							        			"</tr>");
							        
							        
							      
							        
							        pst3 = con.prepareStatement("select form10_no,desg,emp,status,remarks,f_date from form17_usb_access_item WHERE form10_no=? AND desg <> 'none' ORDER BY id ASC");
							        pst3.setString(1,form);
							      
							        rs3 = pst3.executeQuery();
							  	  while(rs3.next())
							  	  {
							  	// String form1_noD= rs3.getString("form1_no");
							  		String desgD=null,empD=null,statusD=null,remarksD=null,f_dateD=null;
							  		   desgD= rs3.getString("desg");
							  		   empD= rs3.getString("emp");
							  		   statusD= rs3.getString("status");
							  		   remarksD= rs3.getString("remarks");
							  		   f_dateD= rs3.getString("f_date");
							  	
							  		
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
				           
			 stringBuffer.append("</table></br>"+
                                        
							"</td>"+

							"</tr>"+
							"</table>"+
							"</center><br><br>"+
			           		
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
 
 
 
 public String getAuditForm(String form){
	 StringBuffer stringBuffer = new StringBuffer();
		Connection con = null;
		PreparedStatement pst = null,pst2=null,pst3=null,pst4=null,ps5=null;   
		ResultSet resultSet = null,rs = null,rs2 = null,rs3=null,rs4=null,rs5=null;
		try{ 
		System.out.println("value of MR ID "+form);
		Connection2 dbConn = new Connection2();
		con = dbConn.getConnection2();
		pst= con.prepareStatement("SELECT form_no,Date FROM audit_form where form_no=?");
		pst.setString(1,form); 
		resultSet = pst.executeQuery();
		System.out.println("before while");
		while(resultSet.next()){
			gdate = resultSet.getDate("Date");
		}
		 stringBuffer.append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">" +
					"<html xmlns=\"http://www.w3.org/1999/xhtml\">"+
		             "<head >"+
		             "<jsp:useBean id =con class=CON2.Connection2 />"+
		             "<center>"+
		             " "+
		             "__________________________________________________________________________________________________________________________________________________"+
		           		
		             "<table border=\"0\" align=\"center\" width=\"80%\"><tr><td>"+
		             "<center>"+
		             "<label><font color=\"black\"><u><b>AUDIT FORM</b></u></font></label> <br />"+
		             "</center></td></tr></table>"+
						"<br><br>");	
						
						 pst2 = con.prepareStatement("SELECT * FROM audit_form where form_no=?");
			            pst2.setString(1, form);
			            rs2 = pst2.executeQuery();
			            
			            String empcode=null,branch=null,empdesg=null,empname=null,empdept=null,empmail=null,type=null,Subtype=null,NSApplicationName=null,NSDepartment=null,NSDescription=null,NCversion=null,CSApplicationName=null,
			            CSModule=null,CSDescription=null,CSPatchChange=null,CCversion=null,Hname=null,Hsname=null,Hbranch=null,Hdesc=null,Hpatch_change=null,Hattach=null,HCversion=null,levelno=null,Mlno=null;
			          int level=0;
			            while(rs2.next()){
			        	   empcode=rs2.getString("empcode");
			        	   branch=rs2.getString("branch");
			        	   empdesg=rs2.getString("empdesg");
			        	   empname=rs2.getString("empname");
			        	   empdept=rs2.getString("empdept");
			        	   empmail=rs2.getString("empmail");
			        	   type=rs2.getString("type");
			        	   Subtype=rs2.getString("Subtype");
			        	   stringBuffer.append(
					        		"<table width=\"60%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
					        			"<tr>"+
					        			
					        			"<td>");
					        stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+

				        			"<tr>"+
				        			"<td bgcolor=\"grey\" align=\"left\">FORMNUMBER</td>"+
				        			"<td colspan=\"1\" align=\"left\">"+form+"</td>"+
				        			"</tr>"+
				        			"<tr>"+
				        			"<td>Employee Code:</td>"+
				        			"<td bgcolor=\"white\">"+empcode+"</td>"+
				        			"<td>Full Name :</td>"+
				        			"<td bgcolor=\"white\">"+empname+"</td>"+
				        			
				        			"</tr>"+
				        			    "<tr>"+
					        			"<td>Branch</td>"+
					        			"<td bgcolor=\"white\">"+branch+"</td>"+
					        			"<td>Department:</td>"+
					        			"<td bgcolor=\"white\">"+empdept+"</td> "+
					        			"</tr>"+
					        			
					        			"<tr>"+
					        			"<td>Designation :</td>"+
					        			"<td bgcolor=\"white\">"+empdesg+"</td>"+
					  
					        			"<td>Mail ID  :</td>"+
					        			"<td bgcolor=\"white\">"+empmail+"</td>"+
					        			"</tr>"+
					        			"<tr>"+
					        			"<td>Type :</td>"+
					        			"<td bgcolor=\"white\">"+type+"</td>"
					        			);
					        			


			        if((type.equals("Software"))&&(Subtype.equals("New"))){
			        	   NSApplicationName=rs2.getString("NSApplicationName");
			        	   NSDepartment=rs2.getString("NSDepartment");
			        	   NSDescription=rs2.getString("NSDescription");
			        	   NCversion=rs2.getString("NSCurrentVersion");
			        	   stringBuffer.append(
			        			   "<td>SubType:</td>"+
			        			   "<td bgcolor=\"white\">"+Subtype+"</td>"+
			        			   "</tr>"+
			        			    "<tr>"+
				        			"<td>Application Name:</td>"+
				        			"<td bgcolor=\"white\">"+NSApplicationName+"</td>"+
				        			"<td>Department:</td>"+
				        			"<td bgcolor=\"white\">"+NSDepartment+"</td> "+
				        			"</tr>"+
				        			
				        			"<tr>"+
				        			"<td>Description:</td>"+
				        			"<td bgcolor=\"white\">"+NSDescription+"</td>"+
				        			"</tr>"+"</table>");
			        	   
			        	   
			        	   
			        	   
			           }else if(type.equals("Software")&&Subtype.equals("Changes")){
			        	   CSApplicationName=rs2.getString("CSApplicationName");
			        	   CSModule=rs2.getString("CSModule");
			        	   CSDescription=rs2.getString("CSDescription");
			        	   CSPatchChange=rs2.getString("CSPatchChange");
			        	   CCversion=rs2.getString("CSCurrentVersion");
			        	   
			        	   stringBuffer.append(
			        			   "<td>SubType:</td>"+
				        			"<td bgcolor=\"white\">"+Subtype+"</td>"+
				        			"</tr>"+
			        			    "<tr>"+
				        			"<td>Application Name:</td>"+
				        			"<td bgcolor=\"white\">"+CSApplicationName+"</td>"+
				        			"<td>Module:</td>"+
				        			"<td bgcolor=\"white\">"+CSModule+"</td> "+
				        			"</tr>"+
				        			
				        			"<tr>"+
				        			"<td>Patch/Change Management:</td>"+
				        			"<td bgcolor=\"white\">"+CSPatchChange+"</td>"+
				        			"<td>Description:</td>"+
				        			"<td bgcolor=\"white\">"+CSDescription+"</td>"+
				        			"</tr>"+
				        			"</table>");
			        	   
			        	   
			           }else{
			        	   Hname=rs2.getString("HardwareName");
			        	   Hsname=rs2.getString("Hardware_Sub");
			        	   Hbranch=rs2.getString("H_branch");
			        	   Hdesc=rs2.getString("H_description");
			        	   HCversion=rs2.getString("H_CurrentVersion");
			        	   Hpatch_change=rs2.getString("H_patch_change");
			        	   stringBuffer.append(
			        			    
				        			"<td>Hardware Category:</td>"+
				        			"<td bgcolor=\"white\">"+Hname+"</td>"+
				        			"</tr>"+
				        			"<tr>"+
				        			"<td>Hardware Sub_Category:</td>"+
				        			"<td bgcolor=\"white\">"+Hsname+"</td>"+
				        			"<td>Branch:</td>"+
				        			"<td bgcolor=\"white\">"+Hbranch+"</td> "+
				        			
				        			"</tr>"+
				        			"<tr>"+
				        			"<td>Patch/Change Management:</td>"+
				        			"<td bgcolor=\"white\">"+Hpatch_change+"</td>"+
				        			"<td>Description:</td>"+
				        			"<td bgcolor=\"white\">"+Hdesc+"</td> "+
				        			
				        			"</tr>"+
				        			"</table>"
				        			);
			        	   
			           }
			        
			           }
			      ps5 = con.prepareStatement("select levelno from auditform_item WHERE form_no=? AND id in(select max(id) From Auditform_item group by form_no)ORDER BY id ASC");
				    ps5.setString(1,form);
				    rs5 = ps5.executeQuery();
				    while(rs5.next()){
				    	Mlno=rs5.getString(1);
				    	
				    }
				    if(Mlno!=null) {
				    level=Integer.parseInt(Mlno);
				    }
				    if(level<=6){
			          
			           stringBuffer.append("<br>"+


	        			"<label><center> <font color=\"black\"><u><b>ApprovalRoutine</b></u></font></center> </label> "+
	        			
	        			"<br />");
			           stringBuffer.append("<table width=\"80%\" border=\"1\" align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
			        			"<tr>"+
			        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">NAME</font></td>"+
			        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">DESIGNATION</font></td>"+
			        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">STATUS</font></td>"+
			        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">REMARKS</font></td>"+
			        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">DATE</font></td>"+			        			
			        			"</tr>");
			        
			        
			      
			        
			        pst3 = con.prepareStatement("select * from auditform_item WHERE form_no=? AND desg <> 'none' ORDER BY id ASC");
			        pst3.setString(1,form);
			      
			        rs3 = pst3.executeQuery();
			  	  while(rs3.next()){
			  		String desg=null,emp=null,Status=null,Date=null,remarks=null;
			  		desg= rs3.getString("desg");
			  		emp= rs3.getString("emp");
			  		Status= rs3.getString("Status");
			  		remarks=rs3.getString("remarks");
			  		 Date= rs3.getString("Date");
			  		 
			  		stringBuffer.append("<tr>"+
				    		   "<td><font size=\"2\" color=\"black\">"+emp+"</font></td>"+
				    		   "<td><font size=\"2\" color=\"black\">"+desg+"</font></td>");
		            	if(Status.equals("Approved")){	
		                    stringBuffer.append("<td bgcolor=\"green\" width=\"100\"><font size=\"2\" color=\"black\">"+Status+"</font></td>");
		            	}
		            	else if(Status.equals("Not Approved")){	
			            stringBuffer.append("<td bgcolor=\"red\" width=\"100\"><font size=\"2\" color=\"black\">"+Status+"</font></td>");
			            	}
		            	else if(Status.equals("Pending")){	
			            stringBuffer.append("<td bgcolor=\"orange\" width=\"100\"><font size=\"2\" color=\"black\">"+Status+"</font></td>");
			            	}
		            	else{
		            		stringBuffer.append("<td bgcolor=\"yellow\" width=\"100\"><font size=\"2\" color=\"black\">"+Status+"</font></td>");
		            	}
		            stringBuffer.append(
		            		 "<td><font size=\"2\" color=\"black\">"+remarks+"</font></td>"+
				    		   "<td><font size=\"2\" color=\"black\">"+Date+"</font></td>"+
				    		   "</tr>");     
				  	  }
			  	  
				    
			  	  
			  	stringBuffer.append("</table></br>");
			  	
				    }
			  /*	ps5 = con.prepareStatement("select max(levelno) from auditform_item WHERE form_no=? ORDER BY id ASC");
		        ps5.setString(1,form);
		        rs5 = ps5.executeQuery();
		        while(rs5.next()){
		        	levelno=rs5.getString(1);
		        }
			  	level=Integer.parseInt(levelno)	;	
                       if(level>3){
                    	   
                    	   stringBuffer.append("<br>"+
                    	   "<label><center> <font color=\"black\"><u><b>Development Status</b></u></font></center> </label> "+
   	        			
   	        			"<br />");
   			           stringBuffer.append("<table width=\"80%\" border=\"1\" align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
   			        			"<tr>"+
   			        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">NAME</font></td>"+
   			        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">STAGE</font></td>"+
   			        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">STATUS</font></td>"+
   			        			
   			        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">START_DATE</font></td>"+
   			        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">END_DATE</font></td>"+
   			        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">REMARKS</font></td>"+
   			        			"</tr>");
   			        pst4 = con.prepareStatement("select * from development_status WHERE form_no=? ORDER BY id ASC");
			        pst4.setString(1,form);
			      
			        rs4 = pst4.executeQuery();
			  	  while(rs4.next()){
			  		String devname=null,devstatus=null,devstage=null,startdate=null,enddate=null,remarks=null;
			  		devname= rs4.getString("Developer_Name");
			  		devstatus= rs4.getString("Status");
			  		devstage= rs4.getString("Stage");
			  		startdate= rs4.getString("Start_Date");
			  		enddate=rs4.getString("End_Date");
			  		remarks=rs4.getString("remarks");
			  		stringBuffer.append("<tr>"+
				    		   "<td><font size=\"2\" color=\"black\">"+devname+"</font></td>"+
				    		   "<td><font size=\"2\" color=\"black\">"+devstatus+"</font></td>"+
				    		   "<td><font size=\"2\" color=\"black\">"+devstage+"</font></td>"+
				    		   "<td><font size=\"2\" color=\"black\">"+startdate+"</font></td>"+
				    		   "<td><font size=\"2\" color=\"black\">"+enddate+"</font></td>"+
				    		   "<td><font size=\"2\" color=\"black\">"+remarks+"</font></td>"+
				    		   "</tr>");
			  		
			  	  }
                       }
			  	stringBuffer.append("</table></br>");*/
   			        
                    	   
                    	   
                       
			  			stringBuffer.append("</td>"+

						"</tr>"+
						"</table>"+
						
		           		
		           		"<br>"+
		           		"<br>"+
		           		"__________________________________________________________________________________________________________________________________________________"+
		           		
		           		"<br><br>"+
		           		"<br><br>"+
		           		"</center><br><br>"+
		           		
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
		DbUtil.closeDBResources(null,pst,con);
		DbUtil.closeDBResources(rs2,pst2,null);
		DbUtil.closeDBResources(rs3,pst3,null);
		DbUtil.closeDBResources(rs4,pst4,null);
		
		
	}
	 
	return stringBuffer.toString();
	 
 }
 
}
