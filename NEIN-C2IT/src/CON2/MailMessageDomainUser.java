package CON2;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.annotation.WebServlet;
//@WebServlet("/MailMessageDomainUser")
public class MailMessageDomainUser {
	String driver;
	Date gdate = null;
	//String form2_no="NEIN/CS/Domain/90-127";
 public String getMailMessageDomain(String form)
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
		pst= con.prepareStatement("SELECT form2_no,f_date FROM form2_domain where form2_no=?");
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
		             "<label><font color=\"black\"><u><b>DOMAIN USER REQUEST FORM</b></u></font></label> <br />"+
		             "</center></td></tr></table>"+
						"<br><br>");
						
						 pst2 = con.prepareStatement("select ITusername,ITpassword,ITcreated,ITremark,branch,depart,full_name,emp_code,designation,reporting_officer,scopeOfWork,requestBy,requestOption from form2_domain where form2_no=?");
			            pst2.setString(1, form);
			            rs2 = pst2.executeQuery();
			            System.out.println("hhhhhhhhh"+form);
			            String ITusername=null,ITpassword=null,ITcreated=null,ITremark=null;
			            String branch=null,depart=null,full_name=null,emp_code=null,designation=null,r_officer=null,scopeOfWork=null,requestBy=null,requestOption=null;
			           while(rs2.next()){
							
							 branch = rs2.getString("branch");
							 depart = rs2.getString("depart");
							 full_name = rs2.getString("full_name");
							 emp_code = rs2.getString("emp_code");
							 designation = rs2.getString("designation");
							 r_officer = rs2.getString("reporting_officer");
							 scopeOfWork = rs2.getString("scopeOfWork");
							 requestBy = rs2.getString("requestBy");
							 requestOption = rs2.getString("requestOption");
							 ITusername = rs2.getString("ITusername");
							 ITpassword = rs2.getString("ITpassword");
							 ITcreated = rs2.getString("ITcreated");
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
							        
							        
							      
							        
							        pst3 = con.prepareStatement("select form2_no,desg,emp,status,remarks,f_date from form2_domain_item WHERE form2_no=? AND desg <> 'none' ORDER BY id ASC");
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
							  						"<td> <input type=\"text\" readonly=\"readonly\" name=\"ITdcode\" id=\"code\" maxlength=\"65\" value="+ITusername+"></td>"+
							  						"</tr>"+

							  						"<tr>"+
							  						"<td>Password :</td>"+
							  						"<td> <input type=\"text\" readonly=\"readonly\" name=\"ITdpassword\" id=\"pwd\" maxlength=\"65\" value="+ITpassword+"></td></tr>"+

							  						"<tr>"+
							  						"<td>Created Under Group :</td>"+
							  						"<td> <input type=\"text\" readonly=\"readonly\" name=\"ITdlevel\" id=\"cud\" maxlength=\"65\" value="+ITcreated+"></td></tr>"+
							  						"<tr>"+
							  						"<td > Remarks :</td>"+
							  						"<td width=\"230\"><font size=\"2\"  color=\"black\">"+ITremark+"</font></td>"+
							  						/*"<td > <input type=\"text\" readonly=\"readonly\" name=\"ITdremark\" id=\"rem\" size=\"60\" maxlength=\"500\" value="+ITremark+"></td>"+*/
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
}
