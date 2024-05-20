package CON2;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MailMessageLotus {
	String driver;
	Date gdate = null;
	public String getMailMessageLotus(String form3_no)
	{
	StringBuffer stringBuffer = new StringBuffer();
		Connection con = null;
		PreparedStatement pst = null,pst2=null,pst3=null,pst4=null;   
		ResultSet resultSet = null,rs = null,rs2 = null,rs3=null,rs4=null;
		try{ 
		System.out.println("FORM 3 "+form3_no);
		Connection2 dbConn = new Connection2();
		con = dbConn.getConnection2();
		pst= con.prepareStatement("SELECT form3_no,f_date FROM form3_lotus where form3_no=?");
		pst.setString(1,form3_no);
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
		    		             "<label><font color=\"black\"><u><b>EMAIL FORM</b></u></font></label> <br />"+
		    		             "</center></td></tr></table>"+
		    						"<br><br>");
		    						
		    						 pst2 = con.prepareStatement("SELECT ITusername,ITpassword,ITcreated,ITremark,branch,depart,full_name,emp_code,designation,reporting_officer,scopeOfWork,requestBy,requestOption,New_email,password,notesid,groupName,intune FROM form3_lotus WHERE form3_no=?");
		    			            pst2.setString(1, form3_no);
		    			            System.out.println("form3_no : "+form3_no);
		    			            rs2 = pst2.executeQuery();
		    			            System.out.println("hhhhhhhhh"+form3_no);
		    			           String scopeOfWork=null,requestBy=null,requestOption=null,New_email=null,password=null;
		    			           String ITusername=null,ITpassword=null,ITcreated=null,ITremark=null,ITnotesid=null,ITgroup=null,intune="";
		    			           if(rs2.next()){
		    							
		    							
		    							String branch = rs2.getString("branch");
		    							String depart = rs2.getString("depart");
		    							String full_name = rs2.getString("full_name");
		    							String emp_code = rs2.getString("emp_code");
		    							String designation = rs2.getString("designation");
		    							String r_officer = rs2.getString("reporting_officer");
		    							scopeOfWork = rs2.getString("scopeOfWork");
		   							 requestBy = rs2.getString("requestBy");
		   							 requestOption = rs2.getString("requestOption");
		   							New_email = rs2.getString("New_email");
		   							password = rs2.getString("password");
		   							ITusername = rs2.getString("ITusername");
		   							ITpassword = rs2.getString("ITpassword");
		   							ITcreated = rs2.getString("ITcreated");
		   							ITremark = rs2.getString("ITremark");
		   							ITnotesid=rs2.getString("notesid");
		   							ITgroup=rs2.getString("groupName");
		   							intune=rs2.getString("intune");
		   							
		   							
		    							System.out.println("Branch : "+branch);
		    							System.out.println("depart : "+depart);
		    							System.out.println("full_name : "+full_name);
		    							System.out.println("emp_code : "+emp_code);
		    							System.out.println("designation : "+designation);
		    							System.out.println("r_officer : "+r_officer);

		    							


		    							        stringBuffer.append(
		    							        		"<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
		    							        			"<tr>"+
		    							        			"<td>"+
		    							        			"<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
		    							        			"<tr><td bgcolor=\"grey\">FORMNUMBER</td>"+
		    							        			"<td bgcolor=\"white\" colspan=\"3\">"+form3_no+"</td>"+
		    							        			"</tr>"+
		    							        			
		    							        			"<tr><td>Branch :</td>"+
		    							        			"<td bgcolor=\"white\">"+branch+"</td>"+
		    							        			"<td>Department :</td>"+
		    							        			"<td bgcolor=\"white\">"+depart+"</td> "+
		    							        			"</tr>"+
		    							        			
		    							        			"<tr>"+
		    							        			"<td>Full Name :</td>"+
		    							        			"<td bgcolor=\"white\">"+full_name+"</td>"+
		    							        			"<td>Scope Of Work :</td>"+
		    							        			"<td bgcolor=\"white\">"+scopeOfWork+"</td>"+
		    							        			"</tr>"+
		    							        			"<tr>"+
		    							        			"<td>Designation :</td>"+
		    							        			"<td bgcolor=\"white\">"+designation+"</td>"+
		    							        			"<td>Reporting Officer  :</td>"+
		    							        			"<td bgcolor=\"white\">"+r_officer+"</td>"+
		    							        			"</tr>"+
		    							        			"<tr>"+
		    							        			"<td>Employee Code:</td>"+
		    							        			"<td bgcolor=\"white\">"+emp_code+"</td>"+
		    							        			"<td>Requested By :</td>"+
		    							        			"<td bgcolor=\"white\">"+requestBy+"</td>"+
		    							        			"</tr>"+
		    							        			"<tr>"+
		    							        			"<td>Request To:</td>"+
		    							        			"<td bgcolor=\"white\">"+requestOption+"</td>"+
		    							        			
		    							        			"</tr>"+
		    							        			"<tr>"+
		    							        			"<td>Requested E-Mail Id:</td>"+
		    							        			"<td bgcolor=\"white\">"+New_email+"</td>"+
		    							        			"<td>Mobile Access (Intune):</td>"+
		    							        			"<td bgcolor=\"white\">"+intune+"</td>"+
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
		    							        		
		    							        pst3 = con.prepareStatement("SELECT form3_no,desg,emp,status,remarks,f_date,mail FROM form3_lotus_item WHERE form3_no=? AND desg <> 'none' ORDER BY id ASC");
		    							        pst3.setString(1, form3_no);
		    							        System.out.println("form3_no : "+form3_no);
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
							  						"<td>  Notes ID:</td>"+
							  						"<td width=\"230\"><font size=\"2\"  color=\"black\">"+ITnotesid+"</font></td>"+
							  						/*"<td> <input type=\"text\" readonly=\"readonly\" name=\"ITnotesid\" id=\"code\" maxlength=\"65\" value="+ITnotesid+"></td>"+*/
							  						"</tr>"+
							  						"<tr>"+
							  						"<td>  E-mail Address:</td>"+
							  						"<td width=\"230\"><font size=\"2\"  color=\"black\">"+ITusername+"</font></td>"+
							  						/*"<td> <input type=\"text\" readonly=\"readonly\" name=\"ITdcode\" id=\"code\" maxlength=\"65\" value="+ITusername+"></td>"+*/
							  						"</tr>"+

							  						"<tr>"+
							  						"<td> Password :</td>"+
							  						"<td width=\"230\"><font size=\"2\"  color=\"black\">"+ITpassword+"</font></td>"+
							  						/*"<td> <input type=\"text\" readonly=\"readonly\" name=\"ITdpassword\" id=\"pwd\" maxlength=\"65\" value="+ITpassword+"></td></tr>"+*/
							  						
							  						
							  						"<tr>"+
							  						"<td>  Group:</td>"+
							  						"<td width=\"230\"><font size=\"2\"  color=\"black\">"+ITgroup+"</font></td>"+
							  						/*"<td> <input type=\"text\" readonly=\"readonly\" name=\"ITgroup\" id=\"code\" maxlength=\"65\" value="+ITgroup+"></td>"+*/
							  						"</tr>"+
							  						
							  						"<tr>"+
							  						"<td> ID File :</td>"+
							  						"<td width=\"230\"><font size=\"2\"  color=\"black\">"+ITcreated+"</font></td>"+
							  						/*"<td> <input type=\"text\" readonly=\"readonly\" name=\"ITdlevel\" id=\"cud\" maxlength=\"65\" value="+ITcreated+"></td></tr>"+*/
							  						
							  						"<tr>"+
							  						"<td > Remarks :</td>"+
							  						"<td width=\"230\"><font size=\"2\"  color=\"black\">"+ITremark+"</font></td>"+
							  						/*"<td > <input type=\"text\" readonly=\"readonly\" name=\"ITdremark\" id=\"rem\" size=\"60\" maxlength=\"500\" value="+ITremark+"></td></tr>"+*/
							  						"</table>"+
							  						"<br />"+                       
							  								
							  								
							  								"	</br>");
		    						            
		    					stringBuffer.append("</table>"+

		    							
 
		    						"	</br>"+
                                                                
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
