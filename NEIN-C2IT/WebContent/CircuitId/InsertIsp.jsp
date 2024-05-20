<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page language="java"%> 
<%@page import = "java.util.Date" %>
<%@page import = "java.sql.*" %> 
<%@page import = "java.text.DateFormat" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%@page import="CON2.Connection2" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<jsp:useBean id = "pdf" class="com.ck.file.FileAttachment" /> 
 
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="net.sf.jasperreports.engine.*" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.FileNotFoundException" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>

<jsp:useBean id = "postMail" class="CON2.PostMail" />
 
      <%             
                       response.setContentType("text/html;charset=UTF-8");
                      // PrintWriter out1 = response.getWriter();
                       
                       String fileName=null;
                       
                       
                       String i_email_id=request.getParameter("i_email_id");
                       String i_name=request.getParameter("i_name"); 
                       String circuitid=request.getParameter("circuitid");
                       String isp_name=request.getParameter("isp_name");
                       String linktype=request.getParameter("Linktype");
                       String location=request.getParameter("b_id");
                       String b_no=request.getParameter("b_no");
                       int branchNo=Integer.parseInt(b_no);
        
                       String Lanpool=request.getParameter("LAN");
                       String Wanpool=request.getParameter("WAN");
                       String Account_Relationship=request.getParameter("Account_Relationship");
                       String Bandwidth=request.getParameter("Bandwidth");
                       String Media=request.getParameter("Media");
                       String ARC=request.getParameter("ARC");
                       String OTC=request.getParameter("OTC");
                       String b_name=request.getParameter("b_name");
                       String ttno=request.getParameter("ttno");
                       String intimation=request.getParameter("intimation");
                       
                       String conDowntimetypetime1=request.getParameter("connectionDowntime1");
                       String callLogTime1=request.getParameter("callLoggedTime1");
                       
                       String conDowntimetypetime2=request.getParameter("connectionDowntime2");
                       String callLogTime2=request.getParameter("callLoggedTime2");
                       
                       String conDowntimetypetime=conDowntimetypetime1+":"+conDowntimetypetime2;
                       String callLogTime=callLogTime1+":"+callLogTime2;
                       
                       String reason=request.getParameter("reason");
                       String empid=request.getParameter("empid");
                       
                       String connectionDowndate1=request.getParameter("connectionDowndate");
                       Date utilDate1 = new SimpleDateFormat("dd-MM-yyyy").parse(connectionDowndate1);
	                   java.sql.Date connectionDowndate = new java.sql.Date(utilDate1.getTime()); 
	                	
                       String callLogddate1=request.getParameter("callLoggeddate");
                       Date utilDate2 = new SimpleDateFormat("dd-MM-yyyy").parse(callLogddate1);
	                   java.sql.Date callLogddate = new java.sql.Date(utilDate2.getTime()); 
                    
                       String connectionDowntime=conDowntimetypetime;
                       String callLoggedTime=callLogTime;  
                       
                       String etrdate=request.getParameter("etrdate"); 
                       Date xx = new SimpleDateFormat("dd-MM-yyyy").parse(etrdate);
	                   java.sql.Date expectedRestoreDate = new java.sql.Date(xx.getTime()); 
                       String etrhrs=request.getParameter("etrhrs");
                       String etrmins=request.getParameter("etrmins"); 
                       String expectedRestoreTime=etrhrs+":"+etrmins;
                       
                       String plannedType=request.getParameter("plannedorunplanned");
                       String whyoutageplanned=request.getParameter("outageplanned");
                       String outageisp=request.getParameter("outagereportss");
                       String anyplans=request.getParameter("anyPlans");  
                       String handledby=request.getParameter("handledby");   
                       
                       String affectedServices=request.getParameter("serviceTypeids");
                       if(affectedServices == ""){
                    	   affectedServices=" ";
                       }
                       else{
                           affectedServices = affectedServices.substring(1);
                       }
                       String notaffectedServices=request.getParameter("serviceTypeidsnot");  
                       if(notaffectedServices == ""){
                    	   notaffectedServices=" ";
                       }
                       else{
                          notaffectedServices = notaffectedServices.substring(1);
                       }
                       String impacteddomesticmplsList=request.getParameter("domesticmpls");
                       
                       
                        int i=0;
                        String isp=null;
                       
                         Connection con = null; 
					     Connection2 dbConn = new Connection2();
					     con = dbConn.getConnection2();
                    
                        Statement st=null,st1=null,st2=null,st3=null;
                        ResultSet rs=null,rs1=null,rs2=null,rs3=null;
                        PreparedStatement prds=null;
                        
                        String new_id = null; 
                        String msg=null,ccmail="";
						
                        String query3 = " SELECT distinct `empEmail` as CcMail FROM `ispoutageemailgroup_master` i1 "+
			                        	" INNER JOIN ispoutageemailadd_master i2 on i2.`groupId`= i1.`id`  "+
			                        	" WHERE i1.`id` IN ("+intimation+")"; 
                         
                        st3 = con.createStatement();
 						rs3 = st3.executeQuery(query3);
 						while(rs3.next()){
 							ccmail=ccmail+","+rs3.getString("CcMail");
 						}
                        //System.out.println("ccmail ::"+ccmail);
                        
 						String query1 = "select count(branchNo) as count1 from circuitid_details where branchNo='"+branchNo+"'";
					    st = con.createStatement();
 						rs = st.executeQuery(query1); 
 					   
 						if(rs.next()){
 							
 						isp="NEIN/CID/"+branchNo+"-"+rs.getInt("count1");
 						fileName=branchNo+"-"+rs.getInt("count1");
 						System.out.println("isp ::"+isp);
 						String  fileLocation="E://neinSoft//files//C2IT//Ispoutage//NEIN//CID//"+branchNo+"//"+fileName+".pdf ";
 						
 						String query2 = "SELECT `ispoutageno` FROM `circuitid_details` WHERE ispoutageno = '"+isp+"'";
					    st1 = con.createStatement();
 						rs1 = st1.executeQuery(query2);
 						
 					if(!rs1.next()){ 
 								
 						prds = con.prepareStatement("INSERT INTO `circuitid_details`(`circuit_Id`, `linktype_id`, `branch_id`, `lanpool`, `wanpool`,"+
 								"`Acc_relation_no`, `bandwidth`, `media`, `arc`, `otc`, `ttno`, `linkdowntime`, `calllogtime`, `reason`, `ispoutageno`,"+
 								"`initiator_id`,`status`,`connectionDowndate`,`callLoggeddate`,`branchNo`,`isp_name`,`plannedType`, "+ 
 		                        "`expectedrestoredate`, `expectedrestoretime`,`whyoutageplanned`, `domesticmpls`,`handledby`,"+
 		                        " `outageisp`, `affectedServices`,`anyplans`,`notAffectedServices`,`filePath`) VALUES "+
 		                        " (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");   
	 				       
 						    prds.setString(1,circuitid);
	 				        prds.setString(2,linktype);
	 				        prds.setString(3,location);
	 				        prds.setString(4,Lanpool);
	 				        prds.setString(5,Wanpool);
	 				        prds.setString(6,Account_Relationship);
	 				        prds.setString(7,Bandwidth);
	 				        prds.setString(8,Media);
					        prds.setString(9,ARC);
					        prds.setString(10,OTC);
					        prds.setString(11,ttno);
	 				        prds.setString(12,connectionDowntime);
					        prds.setString(13,callLoggedTime);
					        prds.setString(14,reason);
					                          
					        prds.setString(15,isp);
					        prds.setString(16,empid);
					        prds.setString(17,"Pending");
					        
					        prds.setDate(18,connectionDowndate);
					        prds.setDate(19,callLogddate);
					        prds.setInt(20,branchNo);
					        prds.setString(21,isp_name);
					        
					        prds.setString(22,plannedType);
					        prds.setDate(23,expectedRestoreDate);
					        prds.setString(24,expectedRestoreTime);
					        prds.setString(25,whyoutageplanned);
					        prds.setString(26,impacteddomesticmplsList);
					        prds.setString(27,handledby);
					        prds.setString(28,outageisp);
					        prds.setString(29,affectedServices); 
					        prds.setString(30,anyplans);
					        prds.setString(31,notaffectedServices);
					        prds.setString(32,fileLocation);
					                         
 				        i= prds.executeUpdate();
 				        
 				 if(i != 0){ 
 					try {
 					     
 					    String branchNo1=""+branchNo;
 						pdf.getAttachmentFileForISP(isp,branchNo1,fileName);
 					    
 					   } catch (Exception e) {
 					         e.printStackTrace();
 					      }
 					      
 					 
 					String message=" ";
 					//message=" <h4>http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h4><br>" +
				                //   " <h4>http://neinsoft1.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp</h4>" ;
				                   
 					postMail.SendMailToAllIspOutage(i_email_id,i_name,"pass1234",ccmail,"NEIN-C2IT: ISP OUTAGE",message,fileName,""+branchNo);
 					
 					 msg = "ISPOutage__INSERTED__SUCCESSFULLY";
 				    }
 				 else{
 					msg = "Error";
 				 }
 				        response.sendRedirect("InsertIspOutage.jsp?msg=" +msg);
 				        
 				        
 						}
 						else{
 							//System.out.println("Circuit id already entered ");
 							msg = "Error__occured";
 	 				        response.sendRedirect("InsertIspOutage.jsp?msg=" +msg);
 							
 						}	
				   
 		      	}
 						
 						%> 