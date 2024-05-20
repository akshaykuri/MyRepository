<%@page contentType="application/vnd.ms-excel" pageEncoding="UTF-8"%>
<%response.setContentType("application/x-download"); 
response.setHeader("Content-Disposition", "attachment; filename=complaintLogReport.xls");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page language="java"%> 

<%@page import = "java.util.Date" %>
<%@page import = "java.sql.*" %> 
<%@page import = "java.text.DateFormat" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%@page import = "net.sf.jasperreports.view.*" %>
<%@page import = "net.sf.jasperreports.engine.*" %>
<jsp:useBean id="dateFormat" class="CON2.DateFormat" />
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" />
<jsp:useBean id = "timeDiff" class="CON2.TimeDifference" />


<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>BRANCH WISE IMS</title>
	<link rel="shortcut icon" type="image/x-icon" href="../images/favicon.ico" />

	<script src="http://code.jquery.com/jquery-1.5.1.min.js"></script>
 <style type="text/css"> 
textarea.special { 
font-family:arial; 

font-size:11px; 
overflow: auto;
}

select {
    font-size:0.8em;
     /* border-color:#999;  without this, it won't work */
}

input[type="text"][readonly],
textarea[readonly] {
  background-color: #ccc;
}
</style>
<script language="javascript">
function printit(){  
if (window.print) {
    window.print() ;  
} else {
    var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
document.body.insertAdjacentHTML('beforeEnd', WebBrowser);
    WebBrowser1.ExecWB(6, 2);//Use a 1 vs. a 2 for a prompting dialog box    WebBrowser1.outerHTML = "";  
}
}
function popitup(url) {
	newwindow=window.open(url,'name','height=300,width=1100,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
	if (window.focus) {newwindow.focus()}
	return false;
} 
</script>
		
</head>

<%!
	              Connection conn = null;
	              Statement st;
	              ResultSet rs;
	              String req,req1,req11,req2,req3,complaintStatus,hw_sw1="";
	              String total_val=null;
	              
	              Connection2 dbConn = new Connection2();
	              Object logInName = null,desg=null,realname=null,city=null,Initiator=null;
	            // String transId = null;  
	             
	            // String textArea1,textArea2,txtDate,textArea3,textArea4,VendorText,rupes,taxes,desg,emp,po_date,theName,delivery,paytrm,warranty,orderval,vat1,vat2,totalcon,vattext,abcvat1,vat3,nmrupees,abc1,abc2,abc3,abc4,termscond,tarea2,tarea22,tarea3,tarea33,tarea4,tarea44,transid,mr_idpo,mr_assetpo,itemhead;
	            String root_cause="", steps_taken="",idextend,complain_id,cm_name,cm_location,cm_date,emp,transid,cm_type,cm_problem,mail,status,cm_status,admin_remarks,pType;
	            
	            Timestamp cm_time,cm_time2,cm_time_diff=null;
	            
	           // Timestamp time1=null,time2=null;
	            String newDate,newDate2;
	            
	%>


     <%//System.out.println("WORKINGGGGGGGGGG Coming Back ");
                 // transId = "abc"+String.valueOf(Math.random()); 
     req = request.getParameter("req1");//branch
     req1 = request.getParameter("req2");//type of prob
     req11 = request.getParameter("req3");//admin name
     req2 = request.getParameter("date4");//from date
     req3 = request.getParameter("date44");//to date
     complaintStatus = request.getParameter("complaintStatus");
     hw_sw1 = request.getParameter("hw_sw");


     Date date1 = dateFormat.getFormatedDateforCalenderReport(req2);
     String[] dateString = req2.split("-");
     
     System.out.println(dateString[1]);
    
     if (dateString[1].equals("Jan"))
     {
   	  dateString[1]="01";
     }
     if (dateString[1].equals("Feb"))
     {
   	  dateString[1]="02";
     }
     if (dateString[1].equals("Mar"))
     {
   	  dateString[1]="03";
     }
     if (dateString[1].equals("Apr"))
     {
   	  dateString[1]="04";
     }
     if (dateString[1].equals("May"))
     {
   	  dateString[1]="05";
     }
     if (dateString[1].equals("Jun"))
     {
   	  dateString[1]="06";
     }
     if (dateString[1].equals("Jul"))
     {
   	  dateString[1]="07";
     }
     if (dateString[1].equals("Aug"))
     {
   	  dateString[1]="08";
     }
     if (dateString[1].equals("Sep"))
     {
   	  dateString[1]="09";
     }
     if (dateString[1].equals("Oct"))
     {
   	  dateString[1]="10";
     }
     if (dateString[1].equals("Nov"))
     {
   	  dateString[1]="11";
     }
     if (dateString[1].equals("Dec"))
     {
   	  dateString[1]="12";
     }
     
     String dateF = dateString[0]+"-"+dateString[1]+"-"+dateString[2];
 String[] dateString2 = req3.split("-");
     
     System.out.println(dateString2[1]);
    
     if (dateString2[1].equals("Jan"))
     {
   	  dateString2[1]="01";
     }
     if (dateString2[1].equals("Feb"))
     {
   	  dateString2[1]="02";
     }
     if (dateString2[1].equals("Mar"))
     {
   	  dateString2[1]="03";
     }
     if (dateString2[1].equals("Apr"))
     {
   	  dateString2[1]="04";
     }
     if (dateString2[1].equals("May"))
     {
   	  dateString2[1]="05";
     }
     if (dateString2[1].equals("Jun"))
     {
   	  dateString2[1]="06";
     }
     if (dateString2[1].equals("Jul"))
     {
   	  dateString2[1]="07";
     }
     if (dateString2[1].equals("Aug"))
     {
   	  dateString2[1]="08";
     }
     if (dateString2[1].equals("Sep"))
     {
   	  dateString2[1]="09";
     }
     if (dateString2[1].equals("Oct"))
     {
   	  dateString2[1]="10";
     }
     if (dateString2[1].equals("Nov"))
     {
   	  dateString2[1]="11";
     }
     if (dateString2[1].equals("Dec"))
     {
   	  dateString2[1]="12";
     }
     
     String dateFF = dateString2[0]+"-"+dateString2[1]+"-"+dateString2[2];
     
     String msg=null;
   %>
      

     
<body background="images/u.jpg">

 <form name="form">  

<center>
<table border="1" cellspacing="1" width="800" align="center" background="images/s.jpg">
<tr><td colspan="5" align="left"><center><b><font size="3" style="font-size: medium;">IMS DAILY WORK LOG</font></b></center></td></tr>
</table>



<br />
   <%

Connection cn3 = null;
Statement st3= null,st2=null,stswhw=null;  
ResultSet rs3 = null,rs2=null,rsswhw=null;
cn3 = con.getConnection2();
st3=cn3.createStatement();
//rs3 = st3.executeQuery("select csm_name from current_status_master ORDER BY csm_name Asc");
rs3 = st3.executeQuery("select b_no from branch_master WHERE b_name='"+req+"'");
while(rs3.next())
{
	String Noo = rs3.getString("b_no");
	System.out.println("String No : "+Noo);
}
%>
 

<table id="invoicetable" width="1000" bgcolor="" cellpadding="4" cellspacing="6" align="center" border=1>
	<tr>
	<td   height="21" bgcolor="lightgrey" style="font-size: 1" width="10" align="center"><font size="2">BRANCH NAME:<b><%=req%></b></font></td>
	<td   height="21" bgcolor="lightgrey" style="font-size: 1" width="10" align="center"><font size="2">PROBLEM TYPE:<b><%=req1%></b></font></td>
	<td   height="21" bgcolor="lightgrey" style="font-size: 1" width="10" align="center"><font size="2">SYSTEM ADMIN NAME:<b><%=req11%></b></font></td>

	
	<td   height="21" bgcolor="lightgrey" style="font-size: 1" width="10" align="center"><font size="2">FROM DATE:<b><%=req2%></b></font></td>
		<td   height="21" bgcolor="lightgrey" style="font-size: 1" width="10" align="center"><font size="2">TO DATE:<b><%=req3%></b></font></td>
	
	</tr>
	</table> 

	<table class="dynatable" width="1000" border="" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey" align="center">
			
				<tr style="background-color:gray;">
				    
				    
				
				    
					<td width="" align="center"  height="21" ><font size="2" ><b>Sl No</b></font></td>
					<td width="67" align="center"  height="21" ><font size="2" ><b>Complain ID</b></font> </td>	
					<td width="6" align="center"  height="21" ><font size="2" ><b>User Name</b></font></td>	
					<td width="67" align="center"  height="21" ><font size="2" ><b>Module</b></font></td>				
					<td width="67" align="center"  height="21" ><font size="2" ><b>Problem Description</b></font></td>
					<td width="67" align="center"  height="21" ><font size="2" ><b>Problem Type</b></font></td>
					<td width="67" align="center"  height="21" ><font size="2" ><b>Problem Category</b></font></td>
					<td width="67" align="center"  height="21" ><font size="2" ><b>HW/SW</b></font></td>
					<td width="67" align="center"  height="21" ><font size="2" ><b>Resolve By</b></font></td>
					<td width="67" align="center"  height="21" ><font size="2" ><b>Report Time</b></font></td>
					<td width="67" align="center"  height="21" ><font size="2" ><b>Completed Time</b></font></td>
					<td width="67" align="center"  height="21" ><font size="2" ><b>Total Duration</b></font></td>
					<td width="67" align="center"  height="21" ><font size="2" ><b>Current status</b></font></td>
					
					<td width="67" align="center"  height="21" ><font size="2" ><b>Root Cause</b></font></td>
					<td width="67" align="center"  height="21" ><font size="2" ><b>Steps Taken To Resolve The Issue</b></font></td>
					
					<td width="67" align="center"  height="21" ><font size="2" ><b>Admin Remarks</b></font></td>
					
	
			
					
				</tr>  
				    
				    <%int flag=0;
				            int i=0;int k=0;
				            conn = con.getConnection2();
				            st2 = conn.createStatement();
				           System.out.println("DATE 1 "+dateF);
				           System.out.println("DATE 2 "+dateFF); 
				           System.out.println("branch : "+req);
				           System.out.println("Admin name:"+req11);
				           System.out.println("Type of prob : "+req1);
				           System.out.println("complaiunt status: "+complaintStatus);
				           
				           
				      			            PreparedStatement psmt2=null,psmtswhw=null;
				            String query2 = "select TIME(cm_time),TIME(cm_time2),TIMEDIFF(cm_time2,cm_time) as cm_time_diff,DATE(cm_time), "+
				                            "DATE(cm_time2),complain_id,cm_name,transid,cm_location,cm_problem,cm_status,admin_remarks,emp,cm_type, "+
				                            "cm_time,cm_time2,cm_date,id,pType,root_cause,steps_taken from complain_master_item "+
								           "WHERE "+
								            "(cm_location = ? or ? = '') "+
						        		     "AND (cm_type= ? or ? = '') "+
						        		     "AND (emp = ?  or ? = '') "+
						        		     "AND (cm_status = ? or ? = '') "+
						        		     "AND "+ 
						        		     "cm_date >= ? AND cm_date <= ? ORDER BY id ";
							                               
							    psmt2 = conn.prepareStatement(query2);
							    psmt2.setString(1,req);//cm_loacation - Branch
							    psmt2.setString(2,req);
							    psmt2.setString(3,req1);//cm type -type of problem
							    psmt2.setString(4,req1);
							    psmt2.setString(5,req11);//emp - IT SUPPORT
							    psmt2.setString(6,req11);
							    psmt2.setString(7,complaintStatus); //status - pending/Resolved
							    psmt2.setString(8,complaintStatus);
							    psmt2.setString(9,dateF);
							    psmt2.setString(10,dateFF);
					            rs2 = psmt2.executeQuery();
				           
				           
				           
				           
				           
				           
				           
				           
				           
				           
				           
				           
				           java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("HH:mm:ss");
				           java.text.SimpleDateFormat sdf2 = new SimpleDateFormat("dd/mm/yyyy");
				            while(rs2.next()){
				            	flag=1;
				        						k++;
				            					complain_id = rs2.getString("complain_id");
                								emp = rs2.getString("emp");
                	 						    cm_name = rs2.getString("cm_name");
                							    cm_location = rs2.getString("cm_location");
                	 						    cm_problem = rs2.getString("cm_problem");
                	 						    cm_type = rs2.getString("cm_type");
                	                            cm_time = rs2.getTimestamp(1);
                							    cm_time2 = rs2.getTimestamp(2);
                							 	//String cm_time_diff2 = rs2.getString(3);
                							 	
		                							 	Date time11 = rs2.getDate(4);
		                							 	Date time12 = rs2.getDate(5);
                							 	SimpleDateFormat format1 = new SimpleDateFormat("dd-MM-yyyy");
		                							 	newDate = format1.format(time11);
		                							 	newDate2 = format1.format(time12);
                							 	
                							 	
                							 	Timestamp t1 = rs2.getTimestamp("cm_time");
                							 	Timestamp t2 = rs2.getTimestamp("cm_time2");
                							 	String diffTime = timeDiff.getTimeDifference(t1.toString(),t2.toString());
                							 	cm_status = rs2.getString("cm_status");
                							    admin_remarks = rs2.getString("admin_remarks");
                							    
                							    root_cause = rs2.getString("root_cause");
                    						    steps_taken = rs2.getString("steps_taken"); 
                    						    
                    						    transid = rs2.getString("transid");
                    						    
                    						    pType = rs2.getString("pType");
				    			        	       
				        		    	   		     String tot_val=null;
				            	      		   	     String head = "ComplainId";
				            	       				 String itemN = "iditemName";
				            	       				 
				            	       				 
				            	       				 
				            	       				    String hw_sw="";
								            	       	stswhw = conn.createStatement();
												        String query2s = "select sw_hw from prob_type_master_sub where pt_descriptions='"+pType+"'";
													    psmtswhw = conn.prepareStatement(query2s);
								            	        rsswhw = psmtswhw.executeQuery();	
								            	        if(rsswhw.next())
								            	             {
								            	        	 hw_sw=rsswhw.getString(1);
								            	             }
								            	       		 
								            	        if(hw_sw==null)hw_sw="";
				            	       		    		 
				            %>
				            <script>id++; </script>
						       <%if(hw_sw1.equals("")) 
						             { i++;%>     
						            
									    <tr>
									    <td align="center" width="10"><font size="2" ><%=i%></font></td>
										<td width="100"><font size="2" ><%=complain_id%></font></td>
										<td width="80"><font size="2" ><%=cm_name %></font></td>
										<td width="100"><font size="2" ><%=cm_location %></font></td>
										<td width="100" align="center"  height="21" ><font size="2" ><%=cm_problem%></font></td>
										<td width="100" align="center"  height="21" ><font size="2" ><%=cm_type%></font></td>
										<td width="100" align="center"  height="21" ><font size="2" ><%=pType%></font></td>
										<td width="100" align="center"  height="21" ><font size="2" ><%=hw_sw%></font></td>
										<td width="100" align="center"  height="21" ><font size="2" ><%=emp%></font></td>
								  	    <td width="100" align="center"  height="21" ><font size="2" ><%=time11 %></font></td> 
									    <td width="100" align="center"  height="21" ><font size="2" ><%=time12%></font></td>
									    <td width="67" align="center"  height="21" ><font size="2" ><%=diffTime%></font></td>
										<td width="100" align="center">
										<%if(cm_status.equals("Pending")){ %>
										<font size="2" color="red"><%=cm_status %></font>
										<%}else {
											
										%>
										<font size="2" color="green"><%=cm_status %></font>
										<%} %>
										</td>
										
											<td width="100"><font size="2" ><%=root_cause %></font></td>
									<td width="100"><font size="2" ><%=steps_taken %></font></td>
									
										<td width="100"><font size="2" ><%=admin_remarks %></font></td>
										
										</tr>
										
								<%}else{ 
					                  if(hw_sw1.equals(hw_sw)){ i++;%>		
										
										<tr>
									    <td align="center" width="10"><font size="2" ><%=i%></font></td>
										<td width="100"><font size="2" ><%=complain_id%></font></td>
										<td width="80"><font size="2" ><%=cm_name %></font></td>
										<td width="100"><font size="2" ><%=cm_location %></font></td>
										<td width="100" align="center"  height="21" ><font size="2" ><%=cm_problem%></font></td>
										<td width="100" align="center"  height="21" ><font size="2" ><%=cm_type%></font></td>
										
										<td width="100" align="center"  height="21" ><font size="2" ><%=pType%></font></td>
										<td width="100" align="center"  height="21" ><font size="2" ><%=hw_sw%></font></td>
										<td width="100" align="center"  height="21" ><font size="2" ><%=emp%></font></td>
										<td width="100" align="center"  height="21" ><font size="2" ><%=time11 %></font></td> 
									    <td width="100" align="center"  height="21" ><font size="2" ><%=time12%></font></td>
									
										<td width="67" align="center"  height="21" ><font size="2" ><%=diffTime%></font></td>
										<td width="100" align="center">
										<%if(cm_status.equals("Pending")){ %>
										<font size="2" color="red"><%=cm_status %></font>
										<%}else {
											
										%>
										<font size="2" color="green"><%=cm_status %></font>
										<%} %>
										</td>
										
											<td width="100"><font size="2" ><%=root_cause %></font></td>
									<td width="100"><font size="2" ><%=steps_taken %></font></td>
										<td width="100"><font size="2" ><%=admin_remarks %></font></td>
										
										</tr>
										
										
										
										
										
										
									<%}}%>			
										
									
				 <% }%>
				
	</table> 

	 <font color="red" size="4">
				 <%
				            if(flag==0){
				            	out.println("Sorry...! Data Not Exist ");
				            }
				 %></font>
<br /><br /><br />
<table width="" align=center bgcolor="lightgrey">
<tr> 
<td style="font-size: 1"><input style="size: 1;" type="button" title="Back To Selection Date Page" value="BACK" onclick="window.location.href='cs_BranchDayToDayWise.jsp?msg=1'" /></td>
<td align="right" id="hiderow">

<SCRIPT Language="Javascript">  
var NS = (navigator.appName == "Eclipse");
var VERSION = parseInt(navigator.appVersion);
if (VERSION > 3) {
    document.write('<form><input id="hiderow" type="button" value="PRINT" style="background-color:white;font-weight:bold;color:black;" height="60" width="55" name="Print" onClick="printit()" </form>');        
} 
</script>
</td>

<!-- <td><a href="HelpPageAdmin.jsp" onclick="return popitup('HelpPageAdmin.jsp')" id="hiderow"><font size=2>HELP ?</font></a></td>
 -->

</tr>
</table>
</center>
	<br /><br /><br />

</form>	

</body>

</html>