<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="org.apache.poi.hssf.record.formula.functions.Replace"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.util.Date" %>
<%@page import = "java.sql.*" %> 
<%@page import = "java.text.DateFormat" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%@page import = "net.sf.jasperreports.view.*" %>
<%@page import = "net.sf.jasperreports.engine.*" %>
<jsp:useBean id="dateFormat" class="CON2.DateFormat" />
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %><%@ include file="../banner.jsp" %>
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" />
<jsp:useBean id = "timeDiff" class="CON2.TimeDifference" />

<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>BRANCH WISE IMS</title>
	<link rel="shortcut icon" type="image/x-icon" href="../images/favicon.ico" />
<style type="text/css">
@media print {
    #printbtn {
        display :  none;
    }
}
</style>
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
#table1{
margin-top:80px;

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
	              String req,req1,req11,req2,req3,complaintStatus=null,hw_sw1="";
	            String total_val=null;
	              
	              Connection2 dbConn = new Connection2();
	              Object logInName = null,desg=null,realname=null,city=null,Initiator=null;
	            
	            String root_cause="", steps_taken="",idextend,complain_id,cm_name,cm_location,cm_date,emp,transid,cm_type,cm_problem,mail,status,cm_status,admin_remarks,pType;
	            
	            Timestamp cm_time,cm_time2,cm_time_diff=null;

	            String newDate,newDate2;
	            
	%>


     <%System.out.println("WORKINGGGGGGGGGG Coming Back ");
                 
               String a=request.getParameter("f");
    
   %>
      
<%String SessionName=null,Sessiondesg=null,SessionmailId=null;
SessionName = (String) session.getAttribute("Nname");
Sessiondesg = (String) session.getAttribute("desg");
SessionmailId = (String) session.getAttribute("Nmail");
%>
     
<body background="images/u.jpg">

 <form name="form">  

<center>
<table border="1" cellspacing="1" width="780" align="center" background="images/s.jpg" id="table1">
<tr><td colspan="5" align="left"><center><b><font size="3" style="font-size: medium;">COMPLAINT LOG - REPORT</font></b></center></td></tr>
<tr style="visibility: hidden; display: none">
	<td><input name="deleteBy" value="<%=SessionName %>" />
	<input name="deleteDesig" value="<%=Sessiondesg %>" />
	<input name="deleteMail" value="<%=SessionmailId %>" />
	 </td>
	</tr>
</table>



<br />
   <%
String cm_dateN=null;
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
 



	<table  width="700" border="" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="white" align="center">
			
			
				    
				    <%int flag=0;
				            int i=0;int k=0;
				            conn = con.getConnection2();
				            st2 = conn.createStatement();
				        
				        		   conn = dbConn.getConnection2();
				        		   PreparedStatement psmt2=null,psmtswhw=null;
				           String query2 = "select TIME(cm_time),TIME(cm_time2),TIMEDIFF(cm_time2,cm_time) as cm_time_diff,DATE(cm_time),DATE(cm_time2),complain_id,cm_name,transid,cm_location,cm_problem,cm_status,admin_remarks,emp,cm_type,cm_time,cm_time2,cm_date,id,pType,root_cause,steps_taken from complain_master_item "+
								           "WHERE "+
								            "(complain_id = ?) ";
						        		     
							                               
							    psmt2 = conn.prepareStatement(query2);
							    psmt2.setString(1,a);
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
                							 	cm_dateN = rs2.getString("cm_date");
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
				    			        	       
				        		    	   		     String tot_val=null;
				            	      		   	     String head = "ComplainId";
				            	       				 String itemN = "iditemName";
				            	       		  		 pType = rs2.getString("pType");
				            	       		  		 
				            	      
				            	       		  		 
				            	        String hw_sw="";
				            	       	stswhw = conn.createStatement();
								        String query2s = "select sw_hw from prob_type_master_sub where pt_descriptions='"+pType+"'";
									    psmtswhw = conn.prepareStatement(query2s);
				            	        rsswhw = psmtswhw.executeQuery();	
				            	        if(rsswhw.next())
				            	             {
				            	        	 hw_sw=rsswhw.getString(1);
				            	             
	%>	
<tr >
<td width="15" align="left"  height="21" ><font size="3" ><b>Complain ID</b></font> </td>	
<td width="40" align="left"  height="21" ><font size="2" ><%=complain_id %></font> </td>
</tr>
<tr>
<td width="15" align="left"  height="21" ><font size="3" ><b>User Name</b></font></td>
<td width="40" align="left"  height="21" ><font size="2" ><%=cm_name%></font></td>	
</tr>
<tr>	
<td width="15" align="left"  height="21" ><font size="3" ><b>Location</b></font></td>
<td width="40" align="left"  height="21" ><font size="2" ><%=cm_location %></font></td>
</tr>
<tr>				
<td width="15" align="left"  height="21" ><font size="3" ><b>Problem Description</b></font></td>
<td width="40" align="left"  height="21" ><font size="2" ><%=cm_problem%></font></td>
</tr>
<tr>
<td width="15" align="left"  height="21" ><font size="3" ><b>Problem Type</b></font></td>
<td width="40" align="left"  height="21" ><font size="2" ><%=cm_type%></font></td>
</tr>
<tr>
<td width="15" align="left"  height="21" ><font size="3" ><b>Problem Category</b></font></td>
<td width="40" align="left"  height="21" ><font size="2" ><%=pType%></font></td>
</tr>
<tr>
<td width="15" align="left"  height="21" ><font size="3" ><b>HW/SW</b></font></td>
<td width="40" align="left"  height="21" ><font size="2" ><%=hw_sw%></font></td>
</tr>
<tr>
<td width="15" align="left"  height="21" ><font size="3" ><b>Resolve By</b></font></td>
<td width="40" align="left"  height="21" ><font size="2" ><%=emp%></font></td>
</tr>
<tr>
<td width="15" align="left"  height="21" ><font size="3" ><b>Report Time</b></font></td>
<td width="40" align="left"  height="21" ><font size="2" ><%=newDate %></font></td>
</tr>
<tr>
<td width="15" align="left"  height="21" ><font size="3" ><b>Completed Time</b></font></td>
<td width="40" align="left"  height="21" ><font size="2" ><%=newDate2%></font></td>
</tr>
<tr>
<td width="15" align="left"  height="21" ><font size="3" ><b>Total Duration</b></font></td>
<td width="40" align="left"  height="21" ><font size="2" ><%=diffTime%></font></td>
</tr>
<tr>
<td width="15" align="left"  height="21" ><font size="3" ><b>Current status</b></font></td>
<td width="40" align="left"  height="21" ><font size="2" ><%=cm_status %></font></td>
</tr>
<tr>
<td width="15" align="left"  height="21" ><font size="3" ><b>Root Cause</b></font></td>
<td width="40" align="left"  height="21" ><font size="2" ><%=root_cause %></font></td>
</tr>
<tr>
<td width="15" align="left"  height="21" ><font size="3" ><b>Steps Taken To Resolve The Issue</b></font></td>
<td width="40" align="left"  height="21" ><font size="2" ><%=steps_taken %></font></td>
</tr>
<tr>
<td width="15" align="left"  height="21" ><font size="3" ><b>Admin Remarks</b></font></td>
<td width="40" align="left"  height="21" ><font size="2" ><%=admin_remarks %></font></td>
</tr>					

<%}
} %>
</table>
<br/>
<table style="margin-left: auto;margin-right: auto;" ><tr>
 
     <td style="font-size:1" id="hiderow">&nbsp;&nbsp;<input style="size:1;font-size: 1.1em;" type="button"  value="BACK" onclick="javascript:history.back()"/> 
    <!--  <a href="javascript:history.back()">BACK</a> -->
     </td>
     </tr>
     </table>
</center>
	<br /><br /><br />
</form>	
</body>
</html>