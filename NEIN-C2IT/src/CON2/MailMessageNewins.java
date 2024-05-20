package CON2;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MailMessageNewins {
	String driver;
	Date gdate = null;
	public String getMailMessageNewins(String form7_no)
	{
	StringBuffer stringBuffer = new StringBuffer();
		Connection con = null;
		PreparedStatement pst = null,pst2=null,pst3=null,pst4=null;   
		ResultSet resultSet = null,rs = null,rs2 = null,rs3=null,rs4=null;
		try{ 
		System.out.println("value of MR ID "+form7_no);
		Connection2 dbConn = new Connection2();
		con = dbConn.getConnection2();
		//pst= con.prepareStatement("SELECT mr_date FROM mr_master where mr_id=?");
		pst= con.prepareStatement("SELECT DISTINCT form7_no,f_date FROM form7_newins_item where form7_no=? ORDER BY id ASC");
		pst.setString(1,form7_no);
		
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
		             "<label><font color=\"black\"><u><b>NEWINS USERS APPLICATION FORM</b></u></font></label> <br />"+
		             "</center></td></tr></table>"+
						"<br><br>");
						pst2 = con.prepareStatement("select ITdcode,ITdpassword,ITdlevel,ITdremark,branch,depart,full_name,designation,scopeOfWork,emp_code,reporting_officer,requestOption,requestBy,groupName,accessallbranch,empid,requBranchCode from form7_newins where form7_no=?");
			            pst2.setString(1, form7_no);
			            rs2 = pst2.executeQuery();
			            System.out.println("hhhhhhhhh : ****** NEWINS   :"+form7_no);
			            String ITdcode=null,ITdpassword=null,ITdlevel=null,ITdremark=null;
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
			        	  
			        	   String empid = rs2.getString("empid");
			        	   String reqbrcode = rs2.getString("requBranchCode");
			        	   
			        	   ITdcode = rs2.getString("ITdcode");
			        	    ITdpassword = rs2.getString("ITdpassword");
			        	    ITdlevel = rs2.getString("ITdlevel");
			        	    ITdremark = rs2.getString("ITdremark");
			        	    String ITgroup=rs2.getString("groupName");
			        	    String ITaccessbr=rs2.getString("accessallbranch");
							        stringBuffer.append(
							        		"<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
						        			"<tr>"+
						        			"<td>"+

						        			"<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
						        			"<tr><td bgcolor=\"grey\">FORMNUMBER</td>"+
						        			"<td bgcolor=\"white\" colspan=\"3\">"+form7_no+"</td>"+
						        			"</tr>"+
						        			"<tr><td>Emp ID :</td>"+
						        			"<td bgcolor=\"white\">"+empid+"</td>"+
						        			"<td>Requested Branch Code :</td>"+
						        			"<td bgcolor=\"white\">"+reqbrcode+"</td> "+
						        			"</tr>"+
						        			
						        			"<tr><td>Branch :</td>"+
						        			"<td bgcolor=\"white\">"+branch+"</td>"+
						        			"<td>Department :</td>"+
						        			"<td bgcolor=\"white\">"+depart+"</td> "+
						        			"</tr>"+
						        			
						        			"<tr><td>Full Name :</td>"+
						        			"<td bgcolor=\"white\">"+full_name+"</td>"+
						        			"<td>Scope Of Work :</td>"+
						        			"<td bgcolor=\"white\">"+scopeOfWork+"</td>"+
						        			"</tr>"+

						        			"<tr><td>Designation :</td>"+
						        			"<td bgcolor=\"white\">"+designation+"</td>"+
						        			"<td>Reporting Officer  :</td>"+
						        			"<td bgcolor=\"white\">"+r_officer+"</td>"+
						        			"</tr>"+
						        			"<tr>" +
						        			"<td>Requested NEWINS ID/Operator code :</td>"+
						        			"<td bgcolor=\"white\">"+emp_code+"</td>"+
						        			"<td>Requested By :</td>"+
						        			"<td bgcolor=\"white\">"+requestBy+"</td>"+
						        			
						        			"</tr>"+
						        			"<tr><td>Request  :</td>"+
						        			"<td bgcolor=\"white\">"+requestOption+"</td>"+
						        			"</tr>"+
						        			"</table>"+
						         			"<br>"+


						        			"<label><center> <font color=\"black\"><u><b>Approval Routine</b></u></font></center> </label> "+
						        			


						        		
						        			"<br />"+
						        			"<table width=\"80%\" border=\"1\" align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
						        			"<tr>"+
						        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\">NAME</td>"+
						        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\">DESIGNATION</td>"+
						        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\">STATUS</td>"+
						        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\">REMARKS</td>"+
						        			"<td bgcolor=\"grey\" width=\"120\" align=\"center\">DATE</td>"+
						        			"</tr>");
							        		
							        pst3 = con.prepareStatement("select form7_no,desg,emp,status,remarks,f_date,mail from form7_newins_item  WHERE form7_no=? AND desg <> 'none' ORDER BY id ASC");
							        pst3.setString(1, form7_no);
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
							        System.out.println("Second query running ! "+desgD);
							        		
							       
							  		stringBuffer.append("<tr>"+
								    		   "<td>"+empD+"</td>"+
								    		   "<td>"+desgD+"</td>");
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
					            stringBuffer.append("<td>"+remarksD+"</td>"+
								    		   "<td>"+f_dateD+"</td>"+
								    		   "</tr>");      
							  	  }
						       
							  	String ProgAllowed=null,ProgBlocked=null,ProgAllowedIT=null,ProgBlockedIT=null;
							  	PreparedStatement psmt5=null,psmt6=null,psmt5IT=null,psmt6IT=null;
							  	psmt5 = con.prepareStatement("SELECT form7_no,desg,name,progAllowed FROM form7_allowed WHERE form7_no=?");
							  	psmt5.setString(1,form7_no);
							  	ResultSet rsp = psmt5.executeQuery();
							  	psmt5IT = con.prepareStatement("SELECT form7_no,desg,name,progAllowed FROM form7_allowed WHERE form7_no=?");
							  	psmt5IT.setString(1,form7_no);
							  	ResultSet rspIT = psmt5IT.executeQuery();
						
							  	
							  	
							  	
								psmt6 = con.prepareStatement("SELECT form7_no,progBlocked FROM form7_blocked WHERE form7_no=?");
							  	psmt6.setString(1,form7_no);
							  	ResultSet rsb = psmt6.executeQuery();
								psmt6IT = con.prepareStatement("SELECT form7_no,progBlocked FROM form7_blocked WHERE form7_no=?");
							  	psmt6IT.setString(1,form7_no);
							  	ResultSet rsbIT = psmt6IT.executeQuery();
					stringBuffer.append("</table>"+



						"	</br>"+
						
						"<table  border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
						"<tr><td bgcolor=\"grey\"><font size=\"2\" color=\"black\"><u>HO Finance & A/C:</u></font></td></tr>"+
						"<tr>"+
						"<td><font size=\"2\" color=\"black\"><b>Program To be Blocked</b></font></td>");
						while(rsb.next())
						{ ProgBlocked = rsb.getString("progBlocked");
						
						stringBuffer.append("<td bgcolor=\"#F0F0F0\">"+ProgBlocked+"</td>");
						}
						stringBuffer.append("</tr>"+
						"<tr>"+
						"<td><font size=\"2\" color=\"black\"><b>Program To be Allowed</b></font></td>");
						while(rsp.next())
						{ ProgAllowed = rsp.getString("progAllowed");
						stringBuffer.append("<td bgcolor=\"#F0F0F0\">"+ProgAllowed+"</td>");
						}
						stringBuffer.append("</tr>"+
						"</table>"+
						"<br>"+
						"" +
						"" +
						"<table  border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
					"<tr><td id=\"ita\" bgcolor=\"grey\">IT Dept Use Only</td></tr>"+
					"</table>"+
//ITdcode,ITdpassword,ITdlevel,ITdremark
					"<table  border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
					"<tr>"+
					"<td> Operator Code:</td>"+
					"<td> <input type=\"text\" readonly=\"readonly\" name=\"ITdcode\" id=\"code\" maxlength=\"65\" value="+ITdcode+"></td>"+
					"</tr>"+

					"<tr>"+
					"<td>Password :</td>"+
					"<td> <input type=\"text\" readonly=\"readonly\" name=\"ITdpassword\" id=\"pwd\" maxlength=\"65\" value="+ITdpassword+"></td></tr>"+

					"<tr>"+
					"<td>Level :</td>"+
					"<td> <input type=\"text\" readonly=\"readonly\" name=\"ITdlevel\" id=\"cud\" maxlength=\"65\" value="+ITdlevel+"></td></tr>"+
					"<tr>"+
					"<td>Group :</td>"+
					"<td> <input type=\"text\" readonly=\"readonly\" name=\"ITdlevel\" id=\"cud\" maxlength=\"65\" value="+ITgroup+"></td></tr>"+
					"<tr>"+
					"<td>Access to all Branches :</td>"+
					"<td> <input type=\"text\" readonly=\"readonly\" name=\"ITdlevel\" id=\"cud\" maxlength=\"65\" value="+ITaccessbr+"></td></tr>"+
					"<tr>"+
					"<td > Remarks :</td>"+
					"<td width=\"230\"><font size=\"2\"  color=\"black\">"+ITdremark+"</font></td>"+
					/*"<td > <input type=\"text\" readonly=\"readonly\" name=\"ITdremark\" id=\"rem\" size=\"60\" maxlength=\"500\" value="+ITdremark+"></td>"+*/
					"</table>"+
					"<br />"+                       
							
							
							"	</br>"+
							
							"<table  border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
							"<tr><td bgcolor=\"grey\"><font size=\"2\" color=\"black\"><u>FROM IT Dept:</u></font></td></tr>"+
							"<tr>"+
							"<td><font size=\"2\" color=\"black\"><b>Program To be Blocked</b></font></td>");
							while(rsbIT.next())
							{ ProgBlockedIT = rsbIT.getString("progBlocked");
							
							stringBuffer.append("<td bgcolor=\"#F0F0F0\">"+ProgBlockedIT+"</td>");
							}
							stringBuffer.append("</tr>"+
							"<tr>"+
							"<td><font size=\"2\" color=\"black\"><b>Program To be Allowed</b></font></td>");
							while(rspIT.next())
							{ ProgAllowedIT = rspIT.getString("progAllowed");
							stringBuffer.append("<td bgcolor=\"#F0F0F0\">"+ProgAllowedIT+"</td>");
							}
							stringBuffer.append("</tr>"+
							"</table>"+
							"<br>"+
							"</td>"+

							"</tr>"+
							"</table>"
						); 
						           
						           
						          		      				
				
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
