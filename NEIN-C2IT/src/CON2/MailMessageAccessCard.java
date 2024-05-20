package CON2;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.annotation.WebServlet;
//@WebServlet("/MailMessageAccessCard")
public class MailMessageAccessCard {
	String driver;
	Date gdate = null;
	public String getMailMessageCard(String form4_no)
	{
	StringBuffer stringBuffer = new StringBuffer();
		Connection con = null;
		PreparedStatement pst = null,pst2=null,pst3=null;   
		ResultSet resultSet = null,rs2 = null,rs3=null;
		try{ 
		System.out.println("value of MR ID "+form4_no);
		Connection2 dbConn = new Connection2();
		con = dbConn.getConnection2();
		//pst= con.prepareStatement("SELECT mr_date FROM mr_master where mr_id=?");
		pst= con.prepareStatement("SELECT form4_no,f_date FROM form4_accesscard where form4_no=?");
		pst.setString(1,form4_no);
		
		//pst.setString(1,"NEIN/MR/90-171");
	
		resultSet = pst.executeQuery();
		System.out.println("before while");
		while(resultSet.next()){
			
			
     System.out.println("inside while");
			//driver = resultSet.getString(1);
			
			gdate = resultSet.getDate(2);
			//gdate = resultSet.getString(1);
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
		             "<label><font color=\"black\"><u><b>ISSUE OF ACCESS CARD FORM</b></u></font></label> <br />"+
		             "</center></td></tr></table>"+
						"<br><br>");
						pst2 = con.prepareStatement("select ITusername,ITpassword,ITcreated,ITremark,branch,depart,full_name,designation,scopeOfWork,emp_code,reporting_officer,requestOption,requestBy from form4_accesscard where form4_no=?");
			            pst2.setString(1, form4_no);
			            rs2 = pst2.executeQuery();
			            System.out.println("hhhhhhhhh : ****** ACCESS CARD   :"+form4_no);
			           while(rs2.next()){
			        	   String branch = rs2.getString("branch");
			        	   String depart = rs2.getString("depart");
			        	   String full_name = rs2.getString("full_name");
			        	   String designation = rs2.getString("designation");
			        	   String scopeOfWork = rs2.getString("scopeOfWork");
			        	   String emp_code = rs2.getString("emp_code");
			        	   String r_officer = rs2.getString("reporting_officer");
			        	   String requestOption = rs2.getString("requestOption");
			        	   String requestBy = rs2.getString("requestBy");
			        	
			        			   String ITusername = rs2.getString("ITusername");
			        	   String ITpassword = rs2.getString("ITpassword");
			        	   String ITcreated = rs2.getString("ITcreated");
			        	   String ITremark = rs2.getString("ITremark");
							        stringBuffer.append(
							        		"<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
							        			"<tr>"+
							        			"<td>"+

							        			"<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
							        			"<tr><td bgcolor=\"grey\">FORMNUMBER</td>"+
							        			"<td bgcolor=\"white\" colspan=\"3\">"+form4_no+"</td>"+
							        			"</tr>"+
							        			"<tr>"+
							        			"<td>Employee Code:</td>"+
							        			"<td bgcolor=\"white\">"+emp_code+"</td>"+
							        			"<td>Full Name :</td>"+
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
							        			"<td>Reporting Officer  :</td>"+
							        			"<td bgcolor=\"white\">"+r_officer+"</td>"+
							        			"</tr>"+
							        			"<tr>"+
							        			"<td>Scope Of Work :</td>"+
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


							        			"<label><center> <font color=\"black\"><u><b>Approval Routine</b></u></font></center> </label> "+
							        			


							        		
							        			"<br />"+
							        			"<table width=\"80%\" border=\"1\" align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
							        			"<tr>"+
							        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">NAME</font></td>"+
							        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">DESIGNATION</font></td>"+
							        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">STATUS</font></td>"+
							        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">REMARKS</font></td>"+
							        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">DATE</font></td>"+
							        			"</tr>");
							        		
							        pst3 = con.prepareStatement("select form4_no,desg,emp,status,remarks,f_date,mail from form4_accesscard_item  WHERE form4_no=? AND desg <> 'none' ORDER BY id ASC");
							        pst3.setString(1, form4_no);
							        rs3 = pst3.executeQuery();
							  	  while(rs3.next())
							  	  {
							  		 // String form1_noD= rs3.getString("form1_no");
							  		  String desgD= rs3.getString("desg");
							  		  String empD= rs3.getString("emp");
							  		  String statusD= rs3.getString("status");
							  		  String remarksD= rs3.getString("remarks");
							  		  String f_dateD= rs3.getString("f_date");
							  		  String mailD= rs3.getString("mail");	        		
							        	
							        		
							       
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
				  						"<td> Access Card No.:</td>"+
				  						"<td> <input type=\"text\" readonly=\"readonly\" name=\"ITdcode\" id=\"code\" maxlength=\"65\" value="+ITusername+"></td>"+
				  						"</tr>"+

				  						"<tr>"+
				  						"<td>Issued Date :</td>"+
				  						"<td> <input type=\"text\" readonly=\"readonly\" name=\"ITdpassword\" id=\"pwd\" maxlength=\"65\" value="+ITpassword+"></td></tr>"+

				  					
				  						"<td > Remarks :</td>"+
				  						"<td > <input type=\"text\" readonly=\"readonly\" name=\"ITdremark\" id=\"rem\" size=\"60\" maxlength=\"500\" value="+ITremark+"></td>"+
				  						"</table>"+
				  						"<br />"+                       
				  								
				  								
				  								"	</br>"); 
						            
					stringBuffer.append("</table>"+



						"	</br>"+
                                                 
							"</td>"+

							"</tr>"+
							"</table>"); 
						           
						           
						          		      				
				
		           stringBuffer.append("</center><br><br>"+
			           		
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
		DbUtil.closeDBResources(rs2,pst,con);
		DbUtil.closeDBResources(resultSet,pst2,null);
		DbUtil.closeDBResources(rs3,pst3,null);
		
		
	}	
	//stringBuffer.delete(0, stringBuffer.length());
	//stringBuffer.setLength(0);
	//stringBuffer.setLength(1);
	return stringBuffer.toString();	
}
}
