<%@page contentType="application/vnd.ms-excel" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import = "java.util.Date" %>
<%@page import = "java.sql.*" %> 
<%@page import = "java.text.DateFormat" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%@page import = "net.sf.jasperreports.view.*" %>
<%@page import = "java.text.DateFormatSymbols" %>
<%@page import = "net.sf.jasperreports.engine.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" />
<jsp:useBean id = "timeDiff" class="CON2.TimeDifference" />
<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>IMS REPORT</title>
		<link rel="shortcut icon" type="image/x-icon" href="../../images/favicon.ico" />
	<link rel='stylesheet' type='text/css' href='css/style4.css' />
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
	              String req1,req,req2;
	            String total_val=null;
	              
	            
	            
	            
	            
	              Connection2 dbConn = new Connection2();
	              Object logInName = null,desg=null,realname=null,city=null,Initiator=null;
	            // String transId = null;  
	             
	            // String textArea1,textArea2,txtDate,textArea3,textArea4,VendorText,rupes,taxes,desg,emp,po_date,theName,delivery,paytrm,warranty,orderval,vat1,vat2,totalcon,vattext,abcvat1,vat3,nmrupees,abc1,abc2,abc3,abc4,termscond,tarea2,tarea22,tarea3,tarea33,tarea4,tarea44,transid,mr_idpo,mr_assetpo,itemhead;
	            String idextend,complain_id,cm_name,cm_location,cm_date,emp,transid,cm_type,cm_problem,mail,status,cm_status,admin_remarks;
	            
	            Timestamp cm_time,cm_time2,cm_time_diff=null;
	            String newDate,newDate2;
	%>


     <%
                 // transId = "abc"+String.valueOf(Math.random()); 
     req1 = request.getParameter("aabbcc");
     req = request.getParameter("aabbc");
     int x =Integer.parseInt(req);
     req2 = request.getParameter("aabbc2");
     
     SimpleDateFormat monthParse = new SimpleDateFormat("MM");
     SimpleDateFormat monthDisplay = new SimpleDateFormat("MMMM");
     String tt= monthDisplay.format(monthParse.parse(req));
    
    // System.out.println("return  :"+monthDisplay.format(monthParse.parse(req)));
     
   %>
     
<body background="images/u.jpg">

 <form name="form">  

<center>
<table border="1" cellspacing="1" width="800" align="center" background="images/s.jpg">
<tr><td colspan="5" align="left"><center><b><font size="3" style="font-size: medium;">IMS DAILY WORK LOG</font></b></center></td></tr>
</table>



<br />
   <%

Connection cn2 = null;
Statement st2= null; 
ResultSet rs2 = null;
cn2 = con.getConnection2();
st2=cn2.createStatement();
rs2 = st2.executeQuery("select csm_name from current_status_master ORDER BY csm_name Asc");

%>
 
<table id="invoicetable" width="1200" bgcolor="" cellpadding="4" cellspacing="6" align="center" border=1>
	<tr>
	<td   height="21" bgcolor="lightgrey"  width="10" align="center">MONTH:</td>
	<td  width="40" height="21" bgcolor="lightgrey"  align="center" colspan="2"><b><%=tt%></b></td>
	<td   height="21" bgcolor="lightgrey"  width="50%" align="center">MONTH WISE REPORT</td>
	<td   height="21" bgcolor="lightgrey"  width="10" align="center">YEAR:</td>
	<td  width="10" height="21" bgcolor="lightgrey"  align="center"><b><%=req2%></b></td>
	</tr>
	</table> 
	<table class="dynatable" width="1200" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey" align="center">
			
				<tr style="background-color:gray;">
				    
				    
				
				    
					<td width="" align="center"  height="21" ><font size="2" ><b>Sl No</b></font></td>
					<td width="67" align="center"  height="21" ><font size="2" ><b>Complain ID</b></font> </td>	
					<td width="67" align="center"  height="21" ><font size="2" ><b>User Name</b></font> </td>	
					<td width="67" align="center"  height="21" ><font size="2" ><b>Module</b></font></td>				
					<td width="67" align="center"  height="21" ><font size="2" ><b>Problem Description</b></font></td>
					<td width="67" align="center"  height="21" ><font size="2" ><b>Problem Type</b></font></td>
					<td width="67" align="center"  height="21" ><font size="2" ><b>Report Time</b></font></td>
					<td width="67" align="center"  height="21" ><font size="2" ><b>Completed Time</b></font></td>
					<td width="67" align="center"  height="21" ><font size="2" ><b>Total Duration</b></font></td>
					<td width="67" align="center"  height="21" ><font size="2" ><b>Current status</b></font></td>
					<td width="67" align="center"  height="21" ><font size="2" ><b>Remarks</b></font></td>
			
					
				</tr>  
				    
				    <%int flag=0;
				            int i=0;int k=0;
				            conn = con.getConnection2();
				            st2 = conn.createStatement();
				            rs2 = st2.executeQuery("select TIME(c.cm_time),TIME(c.cm_time2),TIMEDIFF(c.cm_time2,c.cm_time) as cm_time_diff,DATE(cm_time),DATE(cm_time2),c.complain_id,c.cm_name,c.transid,c.cm_location,c.cm_problem,c.cm_status,c.admin_remarks,c.emp,c.cm_type,cm_time,cm_time2  from complain_master_item  c INNER JOIN (select COUNT(d.cm_problem) as CountOfProb,d.cm_location from complain_master_item  d WHERE MONTH(d.cm_date)='"+req+"' AND YEAR(d.cm_date)='"+req2+"' GROUP BY d.cm_location) as P On C.cm_location = P.cm_location WHERE MONTH(c.cm_date)='"+req+"' AND YEAR(c.cm_date)='"+req2+"' Order by P.CountOfProb desc,c.complain_id asc");
				            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("HH:mm:ss");
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
                							 //	String cm_time_diff2 = rs2.getString(3);
                							 	
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
                    						    transid = rs2.getString("transid");
                    						    cm_type = rs2.getString("cm_type");
				    			        	        i++;
				        		    	   		     String tot_val=null;
				            	      		   	     String head = "ComplainId";
				            	       				 String itemN = "iditemName";
				            %>
				            <script>id++; </script>
				    <tr>
				    <td align="center" width="10"><font size="2" ><%=i%></font></td>
					<td width="100"><font size="2" ><%=complain_id%></font></td>
					<td width="100"><font size="2" ><%=cm_name %></font></td>
					<td width="100"><font size="2" ><%=cm_location %></font></td>
					<td width="100" align="center"  height="21" ><font size="2" ><%=cm_problem%></font></td>
					<td width="100" align="center"  height="21" ><font size="2" ><%=cm_type%></font></td>
					<td width="100" align="center"  height="21" ><font size="2" ><%= newDate%></font></td>
				   <td width="100" align="center"  height="21" ><font size="2" ><%=newDate2%></font></td>
				
					<td width="67" align="center"  height="21" ><font size="2" ><%=diffTime%></font></td>
					<td width="100"><font size="2" ><%=cm_status %></font></td>
					<td width="100"><font size="2" ><%=admin_remarks %></font></td>
					
					</tr>
				 <% }%>
	</table> 
	<font color="red" size="4">
				 <%
				            if(flag==0){
				            	out.println("Sorry...! Data Not Exist ");
				            }
				 %></font>
<br />
<table width="" align=center bgcolor="lightgrey">
<tr> 
<td style="font-size: 1"><input style="size: 1;" type="button" title="Back To Selection Date Page" value="BACK" onclick="window.location.href='cs_imsGroupWise.jsp?msg=1'" /></td>
<td align="right" id="hiderow">

<SCRIPT Language="Javascript">  
var NS = (navigator.appName == "Eclipse");
var VERSION = parseInt(navigator.appVersion);
if (VERSION > 3) {
    document.write('<form><input id="hiderow" type="button" value="PRINT" style="background-color:white;font-weight:bold;color:black;" height="60" width="55" name="Print" onClick="printit()" </form>');        
} 
</script>
</td>
<!-- <td><a href="HelpPageAdmin.jsp" onclick="return popitup('HelpPageAdmin.jsp')" id="hiderow"><font size=2>HELP ?</font></a></td> -->
</tr>
</table>
</center>
	<br /><br /><br />

</form>	

</body>

</html>