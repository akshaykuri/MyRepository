package CON2;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MailMessageLotusTraveler {
	String driver;
	Date gdate = null;
	public String getMailMessageLotusTraveler(String form8_no)
	{
	StringBuffer stringBuffer = new StringBuffer();
		Connection con = null;
		PreparedStatement pst = null,pst2=null,pst3=null,pst4=null;   
		ResultSet resultSet = null,rs = null,rs2 = null,rs3=null,rs4=null;
		try{ 
		System.out.println("FORM 3 "+form8_no);
		Connection2 dbConn = new Connection2();
		con = dbConn.getConnection2();
		pst= con.prepareStatement("SELECT form8_no,f_date FROM form8_lotus_traveler where form8_no=?");
		pst.setString(1,form8_no);
		resultSet = pst.executeQuery();
		System.out.println("before while");
		if(resultSet.next()){
			System.out.println("inside while");
			gdate = resultSet.getDate(2);
			System.out.println("date in mail message"+gdate);
			  
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
		    		             "<label><font color=\"black\"><u><b>LOTUS TRAVELER FORM</b></u></font></label> <br />"+
		    		             "</center></td></tr></table>"+
		    						"<br><br>");
		    						
		    						 //pst2 = con.prepareStatement("SELECT ITusername,ITpassword,ITcreated,ITremark,branch,depart,full_name,emp_code,designation,reporting_officer,scopeOfWork,requestBy,requestOption,New_email,password FROM form8_lotus_traveler WHERE form8_no=?");
    								pst2 = con.prepareStatement("SELECT * FROM form8_lotus_traveler WHERE form8_no=?");
		    			            pst2.setString(1, form8_no);
		    			            System.out.println("form8_no : "+form8_no);
		    			            rs2 = pst2.executeQuery();
		    			            System.out.println("hhhhhhhhh"+form8_no);
		    			           String scopeOfWork=null,requestBy=null,requestOption=null,New_email=null,password=null;
		    			           String ITusername=null,ITpassword=null,ITcreated=null,ITremark=null;
		    			           String emp_email=null,emp_contact=null,d_model=null,d_phone_no=null,owner=null,lotusAddress=null;
		    			           String co_name=null,remarks=null;
		    			           if(rs2.next()){
		    							
		    			        	    String empid = rs2.getString("empid");
		    							String ro = rs2.getString("repooff");
		    							String branch = rs2.getString("branch");
		    							String depart = rs2.getString("depart");
		    							String full_name = rs2.getString("full_name");
		    							//String emp_code = rs2.getString("emp_code");
		    							String designation = rs2.getString("designation");
		    							   co_name = rs2.getString("co_name");
		    							     emp_email = rs2.getString("emp_email");
		    							     emp_contact = rs2.getString("emp_contact");
		    							     d_model = rs2.getString("d_model");
		    							     d_phone_no = rs2.getString("d_phone_no");
		    							     owner = rs2.getString("owner");
		    							     lotusAddress = rs2.getString("lotusAddress");
		    							    remarks = rs2.getString("remarks");
		   							
		   						
		    							    ITusername = rs2.getString("ITusername");
		    							    ITpassword = rs2.getString("ITpassword");
		    							    ITremark = rs2.getString("ITremark");
		   							
		   							
		    							System.out.println("Branch : "+branch);
		    							System.out.println("depart : "+depart);
		    							System.out.println("full_name : "+full_name);
		    							//System.out.println("emp_code : "+emp_code);
		    							System.out.println("designation : "+designation);
		    							

		    							


		    							        stringBuffer.append(
		    							        		"<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
		    							        			"<tr>"+
		    							        			"<td>"+
		    							        			"<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
		    							        			"<tr><td bgcolor=\"grey\">FORM NUMBER</td>"+
		    							        			"<td bgcolor=\"white\" colspan=\"3\">"+form8_no+"</td>"+
		    							        			"</tr>"+
		    							        			
		    							        			"<tr><td colspan=\"4\"><b>Application's Information</b></td></tr>"+
		    							        			"<tr><td>Company Name :</td>"+
		    							        			"<td bgcolor=\"white\" colspan=\"3\" >"+co_name+"</td>"+
		    							        			
		    							        			"</tr>"+
		    							        			"<tr>"+
		    							        			"<td>Empid :</td>"+
		    							        			"<td bgcolor=\"white\">"+empid+"</td>"+
		    							        			"<td>User Full Name :</td>"+
		    							        			"<td bgcolor=\"white\">"+full_name+"</td>"+
		    							        			"</tr>"+
		    							        			
		    							        			"<tr><td>Branch :</td>"+
		    							        			"<td bgcolor=\"white\">"+branch+"</td>"+
		    							        			"<td>Department :</td>"+
		    							        			"<td bgcolor=\"white\">"+depart+"</td> "+
		    							        			"</tr>"+
		    							        			
		    							        			"<tr>"+
		    							        			"<td>Designation :</td>"+
		    							        			"<td bgcolor=\"white\">"+designation+"</td>"+
		    							        			"<td>Reporting Officer :</td>"+
		    							        			"<td bgcolor=\"white\">"+ro+"</td>"+
		    							        			"</tr>"+
		    							        			"<tr>"+
		    							        			"<td>Email Address :</td>"+
		    							        			"<td bgcolor=\"white\">"+emp_email+"</td>"+
		    							        			"<td>Contact Number  :</td>"+
		    							        			"<td bgcolor=\"white\">"+emp_contact+"</td>"+
		    							        			"</tr>"+
		    							        			"<tr><td colspan=\"4\"><b>Mobile Device Information</b></td></tr>"+
		    							        			"<tr>"+
		    							        			"<td>Device Model:</td>"+
		    							        			"<td bgcolor=\"white\">"+d_model+"</td>"+
		    							        			"<td>Phone Number :</td>"+
		    							        			"<td bgcolor=\"white\">"+d_phone_no+"</td>"+
		    							        			"</tr>"+
		    							        			"<tr>"+
		    							        			"<td>Device Owner:</td>"+
		    							        			"<td bgcolor=\"white\" colspan=\"3\" >"+owner+"</td>"+
		    							        			
		    							        			"</tr>"+
		    							        			"<tr>"+
		    							        			"<td>Lotus Notes Address:</td>"+
		    							        			"<td bgcolor=\"white\">"+lotusAddress+"</td>"+
		    							        			"<td>Password:</td>"+
		    							        			"<td bgcolor=\"white\">Will be set by HO IT </td>"+
		    							        			"</tr>"+
		    							        			"</table>"+
		    							        			"<br>"+


		    							        			"<label><center> <font color=\"black\"><u><b>Approval Routine</b></u></font></center> </label> "+
		    							        			
		    							        			"<br />"+
		    							        			"<table width=\"80%\" border=\"1\" align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
		    							        			"<tr>"+
		    							        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">NAME</font></td>"+
		    							        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">DESIGNATION</font></td>"+
		    							        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">STATUS</font></td>"+
		    							        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">REMARKS</font></td>"+
		    							        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">DATE</font></td>"+
		    							        			"<td>"+
		    							        			"</td>"+
		    							        			"</tr>");
		    							        		
		    							        pst3 = con.prepareStatement("SELECT form8_no,desg,emp,status,remarks,f_date,mail FROM form8_lotus_traveler_item WHERE form8_no=? AND desg <> 'none' ORDER BY id ASC");
		    							        pst3.setString(1, form8_no);
		    							        System.out.println("form8_no : "+form8_no);
		    							        rs3 = pst3.executeQuery();
		    							  	  while(rs3.next())
		    							  	  {
		    							  		 
		    							  		  String desgD= rs3.getString("desg");
		    							  		  String empD= rs3.getString("emp");
		    							  		  String statusD= rs3.getString("status");
		    							  		  String remarksD= rs3.getString("remarks");
		    							  		  String f_dateD= rs3.getString("f_date");
		    							  		  System.out.println("desgD : "+desgD);
		    							  		  System.out.println("empD : "+empD);
		    							  		  System.out.println("statusD : "+statusD);
		    							  		  System.out.println("remarksD : "+remarksD);
		    							  		  System.out.println("f_dateD : "+f_dateD);
		    							        		
		    							        		
		    							       
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
							  						"<td>  E-mail Address:</td>"+
							  						"<td> <input type=\"text\" readonly=\"readonly\" name=\"ITdcode\" id=\"code\" maxlength=\"65\" value="+ITusername+"></td>"+
							  						"</tr>"+

							  						"<tr>"+
							  						"<td> Password :</td>"+
							  						"<td> <input type=\"text\" readonly=\"readonly\" name=\"ITdpassword\" id=\"pwd\" maxlength=\"65\" value="+ITpassword+"></td></tr>"+

							  						/*"<tr>"+
							  						"<td> ID File :</td>"+
							  						"<td> <input type=\"text\" readonly=\"readonly\" name=\"ITdlevel\" id=\"cud\" maxlength=\"65\" value="+ITcreated+"></td></tr>"+
							  						"<tr>"+*/
							  						"<td > Remarks :</td>"+
							  						"<td > <input type=\"text\" readonly=\"readonly\" name=\"ITdremark\" id=\"rem\" size=\"60\" maxlength=\"500\" value="+ITremark+"></td>"+
							  						"</table>"+
							  						
							  						
							  						
							  						
							  						"<br />"+ 
							  						"<table width=\"80%\" border=\"1\" align=\"center\" bgcolor=\"\" bordercolor=\"white\">"+
    							        			"<tr>"+
    							        			"<td bgcolor=\"\" width=\"80%\" align=\"center\">"+
							  						"<font size=\"2\" color=\"black\"><b>Lotus Traveler : Rules (Do's and Don't)</b>"+



					    							"<p align=\"justify\"><b>1.Who can apply</b>"+
					    							"   <b>(a)</b>The mobile device (and the SIM if applicable) must be provided by the company."+
					    							"   <b>(b)</b>Nippon Express staffs only. NOT for customer, temporary or Contract Workers.</p>"+

					    							"<p align=\"justify\"><b>2.Mobile device requirements</b>"+
					    							"   <b>(a)</b>iPhone 3G or higher, iPad 1 or higher."+
					    							"   <b>(b)</b>Android 2.x or higher."+
					    							"   <b>(c)</b>Jail-broker or rooted devices are NOT allowed </p>"+

					    							"<p align=\"justify\"><b>3.User's responsibilities</b>"+
					    							"   <b>(a)</b>Will NOT install on any other devices that are NOT provided by the company."+
					    							"   <b>(b)</b>Protect the device from loss or unauthorized access."+
					    							"   <b>(c)</b>The device must have keylock enabled. "+
					    							"   <b>(d)</b>In case of device lost or stolen, please report to NEIN IT immediately. "+
					    							"   <b>(e)</b>For lost or stolen device, NEIN IT will erase the data remotely, that may include private data."+
					    							"   <b>(f)</b>Aware of data access or service charges by carrier."+
					    							"   <b>(g)</b>When the staff leave the company, please inform NEIN IT in advance.</p>"+

					    							"<p align=\"justify\"><b>4.NEIN IT is NOT responsible for</b>"+
					    							"   <b>(a)</b>Software installation. (Installation manual and assistant will be provided.)"+
					    							"   <b>(b)</b>Guarantee works on any specific type, model or OS version of device."+
					    							"   <b>(c)</b>Apple account, Google account or any 3rd party account management."+
					    							"   <b>(d)</b>Data access charges by carrier."+
					    							"   <b>(e)</b>Data backup or restore for device."+
					    							"   <b>(f)</b>Data extraction or retrieval from device.</p>"+

					    							"<p align=\"justify\"><b>5.Inactive User</b>"+
					    							"   <b>(a)</b>If the account has to activity for 3 months, NEIN IT may disable the account."+
					    							"   <b>(b)</b>Request for reactivation may required.</p></font></td></tr></table>"+
			 
					    						    "	</br>"+              
							  								
							  								
							  								"	</br>");
		    						            
		    					stringBuffer.append("</table>"+

		    							
                                                                
		    							"</td>"+
		
		    							"</tr>"+
		    							"</table></center><br><br>"+
		    						
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
		}finally{
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
