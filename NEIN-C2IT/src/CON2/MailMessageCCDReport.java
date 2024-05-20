

package CON2;

import java.sql.Connection;
import java.sql.*;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MailMessageCCDReport {
	String driver;
	//Date gdate = null;
	public String getMailMessageCCDReport(String form7_no)
	{
	StringBuffer stringBuffer = new StringBuffer();
		Connection con = null;
		PreparedStatement pst = null,pst2=null,pst3=null,pst4=null;   
		Statement st0=null; 
		ResultSet resultSet = null,rs = null,rs2 = null,rs3=null,rs4=null,rsO=null;
		try{ 
		//System.out.println("value of MR ID "+form7_no);
		Connection2 dbConn = new Connection2();
		con = dbConn.getConnection2();
/////////////////////////////////////////////////////////
        
        
        String selBranch="",selOption1="",selOption1Txt="",selOption2="",selOption2Txt="",fromDate="",toDate="";
        st0=con.createStatement();
        rsO= st0.executeQuery("select * from form13_ccdreport_otherval WHERE form_no='"+form7_no+"'"); 
        while(rsO.next())
                {
        	    selBranch = rsO.getString("selBranch");
        		selOption1 = rsO.getString("selOption1");
        		selOption1Txt = rsO.getString("selOption1Txt");
        		selOption2 = rsO.getString("selOption2");
        		selOption2Txt = rsO.getString("selOption2Txt");
        	 	fromDate = rsO.getString("fromDate");
        		toDate = rsO.getString("toDate");
        	    }
        System.out.println("selBranch value  *************:"+selBranch);
        /*String [] selBranchArr = selBranch.split(",");
        int l=selBranchArr.length;
        //System.out.println("L :"+l);
        String [] selBranchArr1= new String[13];
        int k=0;
        String [] selBranchArr2={"paymentProp","paymentAppr","openCloseSch","voidCheq","issueCheq","taxRepo","ExchangRateMa","offsetAc","addfreeMaster","paymentOpeBranch","batchInput","SEPABACS"};
        for(int f=0;f<=13;f++)
            {
          	if(selBranchArr2[f].equals(selBranchArr[k]))
        	   {
          	   selBranchArr1[f]=selBranchArr[k];	
        	   if(k<l-1)
        	   k++;
        	   }
        	else
        	   {
        		selBranchArr1[f]=" ";
        	   }
           }
        	*/
/////////////////////////////////////////
        
	    stringBuffer.append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">" +
					"<html xmlns=\"http://www.w3.org/1999/xhtml\">"+
		             "<head >"+
		             "<jsp:useBean id =con class=CON2.Connection2 />"+
		             "<center>"+
		             " "+
		             "__________________________________________________________________________________________________________________________________________________"+
		           		
		             "<table border=\"0\" align=\"center\" width=\"80%\"><tr><td>"+
		             "<center>"+
		             "<label><font color=\"black\"><u><b>CCD REPOT APPLICATION FORM</b></u></font></label> <br />"+
		             "</center></td></tr></table>"+
						"<br>");
						pst2 = con.prepareStatement("select * from form13_ccdreport where form_no=?");
			            pst2.setString(1, form7_no);
			            rs2 = pst2.executeQuery();
			            //System.out.println("hhhhhhhhh : ****** NEWINS   :"+form7_no);
			            //String ITdcode=null,ITdpassword=null,ITdlevel=null,ITdremark=null;
			           while(rs2.next()){
			        	   String empid = rs2.getString("empid");
			        	   String full_name = rs2.getString("full_name");
			        	   String branch = rs2.getString("empBranch");
			        	   String depart = rs2.getString("depart");
			        	   String designation = rs2.getString("designation");
			        	   String r_officer = rs2.getString("r_officer");
			        	   String empmail = rs2.getString("empmail");
			        	   String emp_mob = rs2.getString("emp_mob");
			        	   String requestOption = rs2.getString("requestOption");
			        	   String requestBy = rs2.getString("requestBy");
			         	   String reqbrcode = rs2.getString("req_Branch");
			               stringBuffer.append(
							        		"<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
						        			"<tr>"+
						        			"<td>"+

						        			"<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
						        			"<tr>" +
						        			"<td bgcolor=\"grey\">FORMNUMBER</td>"+
						        			"<td bgcolor=\"white\" colspan=\"3\">"+form7_no+"</td>"+
						        			"</tr>"+ 
						        			"<tr>" +
						        			"<td>Emp ID :</td>"+
						        			"<td bgcolor=\"white\">"+empid+"</td>"+
						        			"<td>Full Name :</td>"+
						        			"<td bgcolor=\"white\">"+full_name+"</td>"+
						        			"</tr>"+
						        			"<tr>" +
						        			"<td>Branch :</td>"+
						        			"<td bgcolor=\"white\">"+branch+"</td>"+
						        			"<td>Department :</td>"+
						        			"<td bgcolor=\"white\">"+depart+"</td> "+
						        			"</tr>"+
						        			"<tr>" +
						        			"<td>Designation :</td>"+
						        			"<td bgcolor=\"white\">"+designation+"</td>"+
						        			"<td>Reporting Officer  :</td>"+
						        			"<td bgcolor=\"white\">"+r_officer+"</td>"+
						        			"</tr>"+
						        			"<tr>" +
						        			"<td>Emp Contact No :</td>"+
						        			"<td bgcolor=\"white\">"+emp_mob+"</td>"+
						        			"<td>Emp Mail-ID :</td>"+
						        			"<td bgcolor=\"white\">"+empmail+"</td>"+
						        			"</tr>"+
                                    		"<tr>" +
						        			"<td>Requested Branch Code :</td>"+
						        			"<td bgcolor=\"white\">"+reqbrcode+"</td> "+
						        			"<td>Requested By :</td>"+
						        			"<td bgcolor=\"white\">"+requestBy+"</td>"+
						        			"</tr>"+
						        			"<tr>" +
						        			"<td>Request :</td>"+
						        			"<td bgcolor=\"white\">"+requestOption+"</td>"+
						        			"<td></td>"+
						        			"<td bgcolor=\"white\"></td>"+
						        			"</tr>"+
						        			"</table>"+
						         			"<br>"+
						         			//selOption1Txt,selOption2,selOption2Txt,fromDate,toDate
						         			"<table width=\"80%\" border=\"1\" align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
						         			"<tr>" +
						         			
						         			"<tr>" +
						        			"<td bgcolor=\"grey\">Requested Branch :</td>"+
						        			"<td bgcolor=\"white\" colspan=\"3\">"+selBranch+"</td>"+
						        			"</tr>"+
						         									         			
						        			"<tr>" +
						        			"<td>Search ON1 :</td>"+
						        			"<td bgcolor=\"white\">"+selOption1+"</td> "+
						        			"<td>Value of Serach ON1 :</td>"+
						        			"<td bgcolor=\"white\">"+selOption1Txt+"</td>"+
						        			"</tr>"+
						        			"<tr>" +
						        			"<td>Search ON2 :</td>"+
						        			"<td bgcolor=\"white\">"+selOption2+"</td> "+
						        			"<td>Value of Serach ON2 :</td>"+
						        			"<td bgcolor=\"white\">"+selOption2Txt+"</td>"+
						        			"</tr>"+
						        			"<tr>" +
						        			"<td>From Date :</td>"+
						        			"<td bgcolor=\"white\">"+fromDate+"</td> "+
						        			"<td>To Date :</td>"+
						        			"<td bgcolor=\"white\">"+toDate+"</td>"+
						        			"</tr>"+
						         			"</table>"+
						         			
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
							       
			              
			               
			               
							        pst3 = con.prepareStatement("select * from form13_ccdreport_item  WHERE form_no=? AND desg <> 'none' ORDER BY id ASC");
							        pst3.setString(1, form7_no);
							        rs3 = pst3.executeQuery();
							  	  while(rs3.next())
							  	  {
							  		 // String form1_noD= rs3.getString("form1_no");
							  		  String desgD= rs3.getString("desg");
							  		  String empD= rs3.getString("emp");
							  		  String statusD= rs3.getString("status");
							  		  String remarksD= rs3.getString("remarks");
							  		  String f_dateD= rs3.getString("form_date");
							  		 // String mailD= rs3.getString("mail");	        		
							       // System.out.println("Second query running ! "+desgD);
							        		
							       
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
						       
							 
					stringBuffer.append("</table>"+
					"	</br>"+
					"</table>"
						); 
		           stringBuffer.append("</center><br><br>"+
			           		
			           		
			           		"</center>"+
			           		"__________________________________________________________________________________________________________________________________________________"+
			           		"</center>"+
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
