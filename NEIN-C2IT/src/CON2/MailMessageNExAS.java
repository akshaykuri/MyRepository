package CON2;

import java.sql.Connection;
import java.sql.*;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MailMessageNExAS {
	String driver;
	//Date gdate = null;
	public String getMailMessageNExAS(String form7_no)
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
        
        
        String userid="",username="",compCode="",costCCode="",costCName="",email="",position="",userKind="",opval="",operationUnit="",operationRangeOptional="";
        String dispUnit="",dispRange="",TVApp="",empType="",HRMenu="",date1="",opRange="";
        st0=con.createStatement();
        rsO= st0.executeQuery("select * from form12_nexas_otherval WHERE form_no='"+form7_no+"'"); 
        while(rsO.next())
                {
        	    /*userid = rsO.getString("userid");
        	    username = rsO.getString("username");*/
        	    compCode = rsO.getString("compCode");
        	    costCCode = rsO.getString("costCCode");
        	    costCName = rsO.getString("costCName");
        	    opRange = rsO.getString("operationRangeOptional");
        	    /*email = rsO.getString("email");
        	    position = rsO.getString("position");*/
        	
        	    userKind = rsO.getString("userKind");
        	    opval = rsO.getString("opval");
        	    //System.out.println("OP VAlue :"+opval);
        	    //operationUnit = rsO.getString("operationUnit");
        	    //operationRangeOptional = rsO.getString("operationRangeOptional");
        	    
        	   // dispUnit = rsO.getString("dispUnit");
        	   // dispRange = rsO.getString("dispRange");
        	    /*TVApp = rsO.getString("TVApp");
        	    empType = rsO.getString("empType");
        	    
        	    HRMenu = rsO.getString("HRMenu");
        	    date1 = rsO.getString("date1");
        	   */
        	    
                }
        //System.out.println("OP value :"+opval);
        String [] opval1 = opval.split(",");
        int l=opval1.length;
        //System.out.println("L :"+l);
        String [] opval3= new String[12];
        int k=0;
        String [] opval2={"paymentProp","paymentAppr","openCloseSch","voidCheq","issueCheq","taxRepo","ExchangRateMa","offsetAc","addfreeMaster","paymentOpeBranch","batchInput","SEPABACS"};
        for(int f=0;f<12;f++)
            {
            //System.out.println("F :"+f);
           //System.out.println("opval1 :"+opval1[k]);
            //System.out.println("opval2 :"+opval2[f]);
        	if(opval2[f].equals(opval1[k]))
        	   {
        	   opval3[f]=opval1[k];	
        	   if(k<l-1)
        	   k++;
        	   }
        	else
        	   {
        		opval3[f]=" ";
        	   }
           }
        	
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
		             "<label><font color=\"black\"><u><b>NExAS USERS APPLICATION FORM</b></u></font></label> <br />"+
		             "</center></td></tr></table>"+
						"<br>");
						pst2 = con.prepareStatement("select * from form12_nexas where form_no=?");
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
			        	   String currNExASID = rs2.getString("curr_NExASID");
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
						        			"<td bgcolor=\"white\">"+requestOption+"</td>");
						        			if(!requestOption.equals("New")){
						        				stringBuffer.append("<td>Current NExAS ID:</td><td bgcolor=\"white\">"+currNExASID+"</td>");
						        			}
						        			
			               stringBuffer.append("</tr>"+
						        			"</table>"+
						         			"<br>"+
           			                       					        			
						        			
						        			"<table width=\"80%\" border=\"1\" align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
						        			
						        			/*"<tr>"+
							        	      "<td align='left'><font color=red>*</font>(2)User ID(NExAS)  :</td>"+
							        	      "<td style='font-weight:bold;font-style:italic;width:23%;'  ><input type='text' name='userid'	id='iduserid' value="+userid+" size='28' maxlength='44' /></td>"+
							        	  "</tr>"+
							        	  "<tr>"+
							        	      "<td align='left'><font color=red>*</font>(3)User Name  :</td>"+
							        	      "<td style='font-weight:bold;font-style:italic;width:23%;' ><input type='text' name='username'	value="+username+" id='idusername' size='28' maxlength='44' /></td>"+
							        	 "</tr>"+
							 */       	  "<tr >"+
							        	     
							        	          "<td align='left'><font color=red>*</font>Company Code:	</td>"+
							        	          "<td colspan=2>"+
							        	             "<table>"+
							        	                "<tr>"+
							        	                  "<td >"+
							        	                    "<input type='text' name='username'	value="+compCode+" id='idusername' size='10' maxlength='44' />"+
							        	                   "</td>"+
							        	                  "<td align='left'><font color=red>*</font>Cost Center Code:</td>"+
							        	                  "<td style='text-align: left;'><input type='text' name='costCCode'	id='idcostCCode' size='10' maxlength='44' value="+costCCode+"></td>"+
							        	                  "<td align='left'><font color=red>*</font>Cost Center Name:</td>"+
							        	                  "<td style='text-align: left;'><input type='text' name='costCName'	id='idcostCName' size='28' maxlength='44' value="+costCName+"></td>"+
							        	                  "<td align='left'><font color=red>*</font>OPRange:</td>"+
							        	                  "<td style='text-align: left;'><input type='text' name='costCName'	id='idcostCName' size='28' maxlength='44' value="+opRange+"></td>"+
                                   	                  " </tr>"+
							        	            "</table>"+
							        	         "</td>"+
							        	     
							        	  "</tr>"+
							        	 /*" <tr>"+
							        	      "<td align='left'><font color=red>*</font>(7)E-mail address  :</td>"+
							        	      "<td style='text-align: left;' colspan='3'><input type='text' name='email'	id='idemail' size='28' maxlength='44' value="+email+"></td>"+
							        	 " </tr>"+
							        	  "<tr>"+
							        	     " <td align='left'><font color=red>*</font>(8)Position  :</td>"+
							        	     " <td style='text-align: left;' colspan='3'><input type='text' name='position'	id='idposition' size='28' maxlength='44' value="+position+"></td>"+
							        	 " </tr>"+
							 */       	 " <tr>"+
							        	     "<td align='left'><font color=red>*</font>Authority  :</td>"+
							        	     "<td colspan=2>"+
							        	            " <table border=1>"+
							        	              " <tr>"+
							        	                "  <td align='left'>Accounting Menu</td>"+
							        	                  " <td colspan=2>"+
							        	                   
							        	                 
							        	                     " <table border=1>"+
							        	                       "  <tr>"+
							        	                            " <td align='center'>User kind </td>"+
							        	                           "  <td>");
							        	                              if(userKind.equals("HOAcUser")){                                    
							        	                            	  stringBuffer.append("<input type='radio' name='userKind' id='userKind1' value='HOAcUser' checked></input>HO Acounting User" + "</br>");
							        	                                }else{ 
							        	                                	stringBuffer.append( " <input type='radio' name='userKind' id='userKind1' value='HOAcUser'></input>HO Acounting User" + "</br>");
							        	                               }if(userKind.equals("BRAcUser")){                                  
							        	                            	   stringBuffer.append( " <input type='radio' name='userKind' id='userKind2' value='BRAcUser' checked></input>Branch Acounting User" + "</br>");
							        	                             }else{  
							        	                            	 stringBuffer.append(  " <input type='radio' name='userKind' id='userKind2' value='BRAcUser' ></input>Branch Acounting User" + "</br>");
							        	                               }if(userKind.equals("ITUser")){                               
							        	                            	   stringBuffer.append( " <input type='radio' name='userKind' id='userKind3' value='ITUser' checked></input>IT User" + "</br>");
							        	                                 }else{ 
							        	                                	 stringBuffer.append( " <input type='radio' name='userKind' id='userKind3' value='ITUser' ></input>IT User" + "</br>");
							        	                               }if(userKind.equals("RepoDispOnly")){                                 
							        	                            	   stringBuffer.append( " <input type='radio' name='userKind' id='userKind4' value='RepoDispOnly' checked> </input>Report display only User " + "</br>");
							        	                                 }else{
							        	                                	 stringBuffer.append(  " <input type='radio' name='userKind' id='userKind4' value='RepoDispOnly'> </input>Report display only User " + "</br>");
							        	                              }
							        	                                 
							        	                                 
							        	                     stringBuffer.append( "</td>"+
							        	                         "</tr>"+
							        	                         "<tr>"+
							        	                            "<td align='center'>Optional menu</td>"+
							        	                            "<td>");
							        	                               if(opval3[0].equals("paymentProp")){
							        	                            	   stringBuffer.append( " <input type='checkbox' name='OptionalMenu[]' id='OptionalMenu1' value='paymentProp' checked></input>&nbsp;Payment Proposal" + "</br>");
							        	                              }else{
							        	                                 stringBuffer.append( "<input type='checkbox' name='OptionalMenu[]' id='OptionalMenu1' value='paymentProp' ></input>&nbsp;Payment Proposal" + "</br>");
							        	                             }if(opval3[1].equals("paymentAppr")){ 
							        	                                 stringBuffer.append( " <input type='checkbox' name='OptionalMenu[]' id='OptionalMenu2' value='paymentAppr' checked></input>&nbsp;Payment Approval " + "</br>");
							        	                              }else{
							        	                                 stringBuffer.append("<input type='checkbox' name='OptionalMenu[]' id='OptionalMenu2' value='paymentAppr'></input>&nbsp;Payment Approval" + "</br>");
							        	                               }if(opval3[2].equals("openCloseSch")){    
							        	                                 stringBuffer.append(  " <input type='checkbox' name='OptionalMenu[]' id='OptionalMenu3' value='openCloseSch' checked></input>&nbsp; Open/Close Schedule" + "</br>");
							        	                                }else{
							        	                                  stringBuffer.append( "<input type='checkbox' name='OptionalMenu[]' id='OptionalMenu3' value='openCloseSch'></input> &nbsp;Open/Close Schedule " + "</br>");
							        	                                }if(opval3[3].equals("voidCheq")){            
							        	                                  stringBuffer.append(  " <input type='checkbox' name='OptionalMenu[]' id='OptionalMenu4' value='voidCheq' checked></input>&nbsp; Void Cheque " + "</br>");
							        	                                }else{ 
							        	                                  stringBuffer.append( "<input type='checkbox' name='OptionalMenu[]' id='OptionalMenu4' value='voidCheq'></input>&nbsp; Void Cheque" + "</br>");
							        	                             }if(opval3[4].equals("issueCheq")){         
							        	                                  stringBuffer.append(  "<input type='checkbox' name='OptionalMenu[]' id='OptionalMenu5' value='issueCheq' checked></input>&nbsp;Issue Cheque" + "</br>");
							        	                            }else{
							        	                                   stringBuffer.append(  "<input type='checkbox' name='OptionalMenu[]' id='OptionalMenu5' value='issueCheq' ></input>&nbsp;Issue Cheque" + "</br>");
							        	                              }if(opval3[5].equals("taxRepo")){   
							        	                                 stringBuffer.append(   "<input type='checkbox' name='OptionalMenu[]' id='OptionalMenu6' value='taxRepo' checked></input>&nbsp;Tax Report " + "</br>");
							        	                            }else{
							        	                                stringBuffer.append( " <input type='checkbox' name='OptionalMenu[]' id='OptionalMenu6' value='taxRepo'></input>&nbsp;Tax Report " + "</br>");
							        	                                 }if(opval3[6].equals("ExchangRateMa")){             
							        	                                 stringBuffer.append(  "  <input type='checkbox' name='OptionalMenu[]' id='OptionalMenu7' value='ExchangRateMa' checked></input>&nbsp; Exchange Rate Maintainance" + "</br>");
							        	                                 }else{
							        	                                 stringBuffer.append(    "  <input type='checkbox' name='OptionalMenu[]' id='OptionalMenu7' value='ExchangRateMa'></input>&nbsp; Exchange Rate Maintainance " + "</br>");   
							        	                                }if(opval3[7].equals("offsetAc")){
							        	                                 stringBuffer.append(   "<input type='checkbox' name='OptionalMenu[]' id='OptionalMenu8' value='offsetAc' checked></input>&nbsp;Offset Account  " + "</br>");
							        	                              }else{
							        	                                 stringBuffer.append(    " <input type='checkbox' name='OptionalMenu[]' id='OptionalMenu8' value='offsetAc'></input>&nbsp;Offset Account " + "</br>");
							        	                               }if(opval3[8].equals("addfreeMaster")){
							        	                                stringBuffer.append(   "  <input type='checkbox' name='OptionalMenu[]' id='OptionalMenu9' value='addfreeMaster' checked></input>&nbsp; Addfree master Maintainance" + "</br>");
							        	                                 }else{
							        	                                  stringBuffer.append(    "  <input type='checkbox' name='OptionalMenu[]' id='OptionalMenu9' value='addfreeMaster' ></input> &nbsp;Addfree master Maintainance" + "</br>");
							        	                               }if(opval3[9].equals("paymentOpeBranch")){                    
							        	                                 stringBuffer.append(     " <input type='checkbox' name='OptionalMenu[]' id='OptionalMenu10' value='paymentOpeBranch' checked></input>&nbsp;Payment operation of branch " + "</br>");
							        	                               }else{
							        	                                  stringBuffer.append(    " <input type='checkbox' name='OptionalMenu[]' id='OptionalMenu10' value='paymentOpeBranch'></input>&nbsp;Payment operation of branch" + "</br>");   
							        	                                }if(opval3[10].equals("batchInput")){
							        	                                 stringBuffer.append(   " <input type='checkbox' name='OptionalMenu[]' id='OptionalMenu11' value='batchInput' checked></input>&nbsp; Batch Input" + "</br>");
							        	                            }else{
							        	                               stringBuffer.append( "          <input type='checkbox' name='OptionalMenu[]' id='OptionalMenu11' value='batchInput'></input>&nbsp; Batch Input" + "</br>");
							        	                             }if(opval3[11].equals("SEPABACS")){         
							        	                                 stringBuffer.append(        " <input type='checkbox' name='OptionalMenu[]' id='OptionalMenu12' value='SEPABACS' checked></input>&nbsp;  SEPA.BACS data Download" + "</br>");
							        	                             }else{ 
							        	                                stringBuffer.append(     "  <input type='checkbox' name='OptionalMenu[]' id='OptionalMenu12' value='SEPABACS'></input> &nbsp; SEPA.BACS data Download" + "</br>");
							        	                                }               
							        	                       stringBuffer.append( " </td>"+
							        	                       " </tr>"+
							        	                       /*" <tr>"+
							        	                          " <td align='center'>Operation unit</td>"+
							        	                           " <td>");
							        	                   if(operationUnit.equals("Company")){
							        	                          stringBuffer.append(  "  <input type='radio' name='operationUnit' id='operationUnit1' value='Company' checked></input> Company" + "</br>");
							        	                 }else{
							        	                          stringBuffer.append(  "  <input type='radio' name='operationUnit' id='operationUnit1' value='Company' ></input> Company" + "</br>");
							        	                  }if(operationUnit.equals("Branch")){
							        	                            stringBuffer.append( "<input type='radio' name='operationUnit' id='operationUnit2' value='Branch' checked></input> Branch" + "</br>");
							        	                  }else{
							        	                           stringBuffer.append( " <input type='radio' name='operationUnit' id='operationUnit2' value='Branch'></input> Branch" + "</br>");
							        	                  }if(operationUnit.equals("Region")){
							        	                          stringBuffer.append( " <input type='radio' name='operationUnit' id='operationUnit3' value='Region' checked></input> Region" + "</br>");
							        	               }else{
							        	                            stringBuffer.append( "  <input type='radio' name='operationUnit' id='operationUnit3' value='Region'></input> Region" + "</br>");
							        	                 }*/
							        	                  /*stringBuffer.append(  " </td>"+
							        	                  "</tr>"+*/
							        	                  /*"<tr>"+
							        	                  " <td align='center'>Operation range(If Additional comp)</td>"+
							        	                  " <td align='left'>"+
							        	                  "1)<input type='text' name='operationRangeOptional1' id='idoperationRangeOptional1' value='' size='10' maxlength='10'/>"+
							        	                  "(2)<input type='text' name='operationRangeOptional2' id='idoperationRangeOptional2' value='' size='10' maxlength='10'/><br>"+
							        	                  "(3)<input type='text' name='operationRangeOptional3' id='idoperationRangeOptional3' value='' size='10' maxlength='10'/>"+
							        	                  "(4)<input type='text' name='operationRangeOptional4' id='idoperationRangeOptional4' value='' size='10' maxlength='10'/><br>"+
							        	                  "(5)<input type='text' name='operationRangeOptional5' id='idoperationRangeOptional5' value='' size='10' maxlength='10'/>"+
							        	                  "(6)<input type='text' name='operationRangeOptional6' id='idoperationRangeOptional6' value='' size='10' maxlength='10'/> "+  
							        	                  " </td>"+
							        	                  " </tr>"+*/
							        	                 /* " <tr>"+
							        	                  "  <td align='center'>Display unit</td>"+
							        	                  " <td>");
							        	                 if(dispUnit.equals("Company")){
							        	                	 stringBuffer.append(" <input type='radio' name='dispUnit' id='dispUnit1' value='Company' checked></input>Company " + "</br>");
							        	                  }else{
							        	                  stringBuffer.append("<input type='radio' name='dispUnit' id='dispUnit1' value='Company' ></input>Company " + "</br>");
							        	                  }if(dispUnit.equals("Branch")){
							        	                  stringBuffer.append(" <input type='radio' name='dispUnit' id='dispUnit2' value='Branch' checked></input>Branch" + "</br>");
							        	                  }else{
							        	                  stringBuffer.append("<input type='radio' name='dispUnit' id='dispUnit2' value='Branch'></input>Branch" + "</br>");
							        	                  }if(dispUnit.equals("Region")){
							        	                  stringBuffer.append("<input type='radio' name='dispUnit' id='dispUnit3' value='Region' checked></input>Region" + "</br>");
							        	                 }else{
							        	                  stringBuffer.append("<input type='radio' name='dispUnit' id='dispUnit3' value='Region'></input>Region" + "</br>");
							        	                 } 
							        	                  stringBuffer.append( " </td>"+
							        	                  "</tr>"+
							        	                  "<tr>"+
							        	                  " <td align='center'>Display range(If Additional comp)</td>"+
							        	                  " <td align='left'>"+
							        	                  "(1)<input type='text' name='dispRange1'	id='dispRange1' size='10' maxlength='44' />"+
							        	                  "(2) <input type='text' name='dispRange2'	id='dispRange2' size='10' maxlength='44' /><br/>"+
							        	                  "(3)<input type='text' name='dispRange3'	id='dispRange3' size='10' maxlength='44' />"+
							        		              "(4)<input type='text' name='dispRange4'	id='dispRange4' size='10' maxlength='44' /><br/>"+
							        	                  "(5) <input type='text' name='dispRange5'	id='dispRange5' size='10' maxlength='44' />"+
							        	                  "(6)<input type='text' name='dispRange6'	id='dispRange6' size='10' maxlength='44' />"+
							        	                           
							        	                  " </td>"+
							        	                  "</tr>"+*/
							        	                  "</table>"+
							        	                  "</td>"+
							        	                  " </tr>"+
							        	                 /* " <tr>"+
							        	                  "<td align='left'>TV</td>"+
							        	                  " <td colspan=2>"+
							        	                  "<table border=1>"+
							        	                  "<tr>"+
							        	                  "  <td align='left'>TV Application</td>"+
							        	                  " <td>");
							        	                 if(TVApp.equals("ClaExpByUr")){
							        	                 stringBuffer.append( " <input type='radio' name='TVApp' id='TVApp1' value='ClaExpByUr' checked>Claiming Expense by yourself</input> " + "</br>");
							        	                  }else{
							        	                  stringBuffer.append(" <input type='radio' name='TVApp' id='TVApp1' value='ClaExpByUr' >Claiming Expense by yourself</input>" + "</br>");
							        	                 }if(TVApp.equals("ClaExpByOther")){
							        	                  stringBuffer.append("<input type='radio' name='TVApp' id='TVApp2' value='ClaExpByOther' checked>Claiming Expense by others</input> " + "</br>");
							        	            }else{
							        	                  stringBuffer.append( "   <input type='radio' name='TVApp' id='TVApp2' value='ClaExpByOther'>Claiming Expense by others</input>" + "</br>");
							        	                 }
							        	                 stringBuffer.append( "   </td>"+
							        	                  " </tr>"+
							        	                  "<tr>"+
							        	                  "<td align='left'>Employee Type</td>"+
							        	                  " <td>");
							        	                if(empType.equals("localEmp")){
							        	                	 stringBuffer.append( " <input type='radio' name='empType' id='empType1' value='localEmp' checked>Local employee</input> " + "</br>");
							        	                }else{
							        	                  stringBuffer.append( " <input type='radio' name='empType' id='empType1' value='localEmp' >Local employee</input>" + "</br>");
							        	               }if(empType.equals("transEmp")){
							        	                  stringBuffer.append(" <input type='radio' name='empType' id='empType2' value='transEmp' checked>Transfer employee</input>" + "</br>");
							        	                }else{
							        	                  stringBuffer.append("<input type='radio' name='empType' id='empType2' value='transEmp'>Transfer employee</input>" + "</br>");
							        	                  }
							        	               stringBuffer.append(  "</td>"+
							        	                  "</tr>"+*/
							        	                  "</table>"+
							        	                  " </td>"+
							        	                  "</tr>"+
							        	                /*  "<tr>"+
							        	                  "<td align='left'>HR menu</td>"+
							        	                  "<td align='left'><input type='text' name='HRMenu'	id='idHRMenu' size='50' maxlength='44' value="+HRMenu+"></td>"+
							        	                  " </tr>"+*/
							        	                  " </table>"+
							        	                  "</td>"+
							        	                  " </tr>"+
							        	                  /*" <tr>"+
							        	                  "<td align='left'><font color=red>*</font>(10)Use Date(dd,mm,yyyy)  :</td>"+
							        	                  "<td style='text-align: left;' colspan='3'><input type='text' name ='date1' id='datepicker' placeholder='Date' value="+date1+"></td>"+
							        	                  "</tr>"+*/
							        	  
						               			
						        			
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
							       
			              
			               
			               
							        pst3 = con.prepareStatement("select * from form12_nexas_item  WHERE form_no=? AND desg <> 'none' ORDER BY id ASC");
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
