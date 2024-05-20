<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="CON2.DbUtil"%>
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
<%@ page import="java.io.*" %><%@ include file="../../../banner.jsp" %>
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" />
<jsp:useBean id = "timeDiff" class="CON2.TimeDifference" />

<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>BRANCH WISE IMS</title>
	<link rel="shortcut icon" type="image/x-icon" href="../../../images/favicon.ico"/>
<!-- 	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type = "text/javascript"></script> -->
	<link rel="stylesheet" type="text/css" href="../../../css/FormsHelp.css" title="style" />
    <script language="javascript"   type="text/javascript" src="../../../js/FormsHelp.js"></script>
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
<script type="text/javascript" language="javascript">
function close()
{
 close();
}
</script>
<script language="javascript">

function deleteRecord(id)
{    
	if(confirm('You are above to delete a Sent Mail to IT support'))
	{
var f=document.form;    
f.method="post";    
f.action='ITsupportDelete.jsp?id='+id;    
f.submit();
}
	else{}
}

</script>
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
	              String req,req2,req3;
	            String total_val=null;
	              
	              Connection2 dbConn = new Connection2();
	              Object logInName = null,desg=null,realname=null,city=null,Initiator=null;
	            // String transId = null;  
	             
	            // String textArea1,textArea2,txtDate,textArea3,textArea4,VendorText,rupes,taxes,desg,emp,po_date,theName,delivery,paytrm,warranty,orderval,vat1,vat2,totalcon,vattext,abcvat1,vat3,nmrupees,abc1,abc2,abc3,abc4,termscond,tarea2,tarea22,tarea3,tarea33,tarea4,tarea44,transid,mr_idpo,mr_assetpo,itemhead;
	            String idextend,complain_id,cm_name,cm_location,cm_date,emp,transid,cm_type,cm_problem,mail,status,cm_status,admin_remarks;
	            
	            Timestamp cm_time,cm_time2,cm_time_diff=null;
	            
	           // Timestamp time1=null,time2=null;
	            String newDate,newDate2;
	%>


     <%
                 // transId = "abc"+String.valueOf(Math.random()); 
     req = request.getParameter("branch4");
     req2 = request.getParameter("date4");
     req3 = request.getParameter("date44");
     System.out.println("req   "+req);
     System.out.println("req2   "+req2);

     session.setAttribute("branch4",req);
     session.setAttribute("date4",req2);
     session.setAttribute("date44",req3);
     
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
     
     String dateF = dateString[2]+"-"+dateString[1]+"-"+dateString[0];
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
     
     String dateFF = dateString2[2]+"-"+dateString2[1]+"-"+dateString2[0];
     System.out.println("BRANCH : "+req);
     System.out.println("date 1 : "+dateF);
      System.out.println("date 2 : "+dateFF);
   %>
      

     
<body background="images/u.jpg">

 <form name="form">  

<center>
<table border="1" cellspacing="1" width="800" align="center" background="images/s.jpg">
<tr><td colspan="5" align="left" bgcolor="grey"><center><b><font size="3" style="font-size: medium;">SENT MAIL TO IT SUPPORT - DATE TO DATE REPORT</font></b></center></td></tr>
</table>



<br />
   <%

Connection cn3 = null;
Statement st3= null,st2=null; 
ResultSet rs3 = null,rs2=null;
try{
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
 
<%-- <label><%=req%></label><label><%=req2%></label> --%>
<%-- <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor=""><strong><font size ="4" color="black"><b><%=req%></b><br />
    
 </font></strong></td>
 <td align="left" >BRANCH:<label><font size ="2" color="red"><%=req%></font></label></td>
 
 
 </tr>

</table> --%>
<table id="invoicetable" width="80%" bgcolor="" cellpadding="4" cellspacing="6" align="center" border=1>
	<tr>
	
	
	<td   height="21" bgcolor="lightgrey" style="font-size: 1" width="10" align="center">FROM DATE:</td>
	<td  width="10" height="21" bgcolor="lightgrey" style="font-size: 1" align="center"><b><%=dateF%></b></td>
	<td   height="21" bgcolor="lightgrey" style="font-size: 1" width="10" align="center">TO DATE:</td>
	<td  width="10" height="21" bgcolor="lightgrey" style="font-size: 1" align="center" ><b><%=dateFF%></b></td>
	</tr>
	</table> 

	<table class="dynatable" width="80%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey" align="center">
			
				<tr style="background-color:gray;">
				    
				    
				
				    
					<td width="5%" align="center"  height="21" ><b>Sl No</b></td>
				    <td width="10%" align="center"  height="21" bgcolor="grey"><font size="2">NAME</font></td>
				    <td width="10%" align="center"  height="21" bgcolor="grey"><font size="2">DATE</font></td>
					
					<td width="15%" align="center"  height="21" bgcolor="grey"><font size="2">ABOUT</font></td>
				
					<td width="30%" align="center"  height="21" bgcolor="grey"><font size="2">REMARKS/FEEDBACK</font></td>
					
					<td id="hiderow" width="10%" align="center"  height="21" bgcolor="grey"><font size="2" >DELETE</font></td>
			
					
				</tr>  
				    
				    <%int flag=0;
				            int i=0;int k=0;
				            conn = con.getConnection2();
				            st2 = conn.createStatement();
				           // rs = st.executeQuery("select complain_id,cm_name,transid,cm_location,cm_problem,DATE_FORMAT(cm_time,'%h:%i:%s') as cm_time,DATE_FORMAT(cm_time2,'%h:%i:%s') as cm_time2,TIMEDIFF(cm_time2,cm_time) as cm_time_diff,cm_status,admin_remarks,emp from complain_master_item WHERE cm_date='"+dateF+"'");
				             //rs = st.executeQuery("select cm_time,DATE_FORMAT(STR_TO_DATE(cm_time2,'%d-%m-%y %h:%i:%s'),'%h:%i:%s') as cm_time2,TIMEDIFF(cm_time2,cm_time) as cm_time_diff,complain_id,cm_name,transid,cm_location,cm_problem,cm_status,admin_remarks,emp from complain_master_item WHERE cm_date='"+dateF+"'");
				           //rs = st.executeQuery("select cm_time,FROM_UNIXTIME(UNIX_TIMESTAMP(STR_TO_DATE(cm_time2, '%M %d %Y %h:%i%p')),'%h:%i:%p') as cm_time2,TIMEDIFF(cm_time2,cm_time) as cm_time_diff,complain_id,cm_name,transid,cm_location,cm_problem,cm_status,admin_remarks,emp from complain_master_item WHERE cm_date='"+dateF+"'");
				           //rs = st.executeQuery("select TIME(cm_time),TIME(cm_time2),TIMEDIFF(cm_time2,cm_time) as cm_time_diff,complain_id,cm_name,transid,cm_location,cm_problem,cm_status,admin_remarks,emp from complain_master_item WHERE cm_date='"+dateF+"'");
				           //rs2 = st2.executeQuery("select TIME(cm_time),TIME(cm_time2),TIMEDIFF(cm_time2,cm_time) as cm_time_diff,complain_id,cm_name,transid,cm_location,cm_problem,cm_status,admin_remarks,emp from complain_master_item WHERE MONTH(cm_date)='"+req+"' AND YEAR(cm_date)='"+req2+"' AND emp='"+req3+"'");
				           //rs2 =  st2.executeQuery("Select DISTINCT po.mr_idpo,po.pordernon,DATE_FORMAT(po_date,'%d/%m/%Y') as po_date,totalcon,vat3,rupes,b_name,b_no,VendorText,invoice_no,deliveryDate,invoiceDate,cheque_no,chequeDate,w_Date,ex_w_Date,asset_tag,mr_assetpo,theName,vname From Po Left Join delivery_master On(po.pordernon = delivery_master.DeliveryPO_No) Left Join branch_master On(substr(po.pordernon,6,2)=branch_master.b_no) Left Join vendormaster On(po.VendorText=vendormaster.vname) Left Join potable On(po.transid = potable.transid) WHERE po_date >= '"+date1+"' and po_date <= '"+date2+"' AND status = 'normal' ORDER BY YEAR(po_date),MONTH(po_date),DATE(po_date)");
				           //WHERE po_date >= '"+date1+"' and po_date <= '"+date2+"' AND status = 'normal' ORDER BY YEAR(po_date),MONTH(po_date),DATE(po_date)
				           //rs2 = st2.executeQuery("select TIME(cm_time),TIME(cm_time2),TIMEDIFF(cm_time2,cm_time) as cm_time_diff,DATE(cm_time),DATE(cm_time2),complain_id,cm_name,transid,cm_location,cm_problem,cm_status,admin_remarks,emp,cm_type,cm_time,cm_time2 from complain_master_item WHERE cm_location = '"+req+"' and YEAR(cm_date) >= '"+dateF+"' AND YEAR(cm_date) <='"+dateFF+"' ORDER BY YEAR(cm_date),MONTH(cm_date),DATE(cm_date),complain_id");
				           String name=null,date2=null,branch=null,about=null,systemAdmin=null,feedback=null;
				           rs2 = st2.executeQuery("SELECT id,sentby_name,sentby_mail_id,sending_date,remarks FROM sendingmail_it_support WHERE  sending_date >= '"+dateF+"' AND sending_date <='"+dateFF+"' ORDER BY id ASC");
				           java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("HH:mm:ss");
				           java.text.SimpleDateFormat sdf2 = new SimpleDateFormat("dd/mm/yyyy");
				            while(rs2.next()){
				            	flag=1;
				            	name = rs2.getString("sentby_name");
								//System.out.println("emp "+empp);
								date2 = rs2.getString("sending_date");
								
								about = rs2.getString("sentby_mail_id");
								
								feedback = rs2.getString("remarks");
				            	i++;       		    		 
				            %>
				            <script>id++; </script>
				   
					<tr>
	                 <td align="center" width="10"><%=i%></td>
   					 <td width="" align=center  ><font size="2" ><%=name%></font> </td> 
   					 <td width="" align="center"  height="21" ><font size="2" ><%=date2%></font></td>
					
						<td width="" align="center"  height="21" ><font size="2" ><%=about%></font></td>
						
						<td width="" align="center"  height="21" ><font size="2" ><%=feedback%></font></td>
						
                        <td id="hiderow"><input type="button" size="2" name="delete" value="Delete" style="background-color:white;font-weight:bold;color:black;" onclick="deleteRecord(<%=rs2.getString("id")%>);" /></td>
						
				</tr>
				 <% }%>
				
	</table> 

	 <font color="red" size="4">
				 <%
				            if(flag==0){
				            	out.println("Sorry...! Data Not Exist ");
				            }
				 %></font>
<br /><br /><br />
	<%
}
catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(rs,st,cn3);

	DbUtil.closeDBResources(rs2,st2,conn);
	DbUtil.closeDBResources(rs3,st3,null);

  }
	%>
	
<table width="" align=center bgcolor="lightgrey">
<tr> 
<td style="font-size: 1"><input style="size: 1;" type="button" title="Back To Selection Date Page" value="BACK" onclick="window.location.href='ITsupport.jsp?msg=1'" /></td>
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
<td>
<input type="button" id="btnShowSimple" value="HELP" />
</td>
</tr>
</table>
<div id="dialog" class="web_dialog">
   <table style="width: 100%; border: 0px;" cellpadding="3" cellspacing="1">
      <tr>
         <td class="web_dialog_title" width="80%"><center>Help Page</center></td>
         <td class="web_dialog_title align_right" >
            <a href="#" id="btnClose" style="color:maroon;">X - Close</a>
         </td>
      </tr>
      <tr>
      <td colspan="2"><p>Feedback - Branch wise report will give detail of feedback/complaints/remarks from all branches</p></td>
      </tr>
       <tr>
      <td colspan="2"><p>These reports are visible only to Super Admin</p></td>
      </tr>
       <tr>
      <td colspan="2"><p>Main Keys are Branch Name , From date and To date</p></td>
      </tr>
      <tr>
      <td colspan="2"><p>If data not exists within date you have entered , it will displays alert:  "Sorry...! Data Not Exist"  </p></td>
      </tr>
 
      </table>

</div>

	
	


</center>
	<br /><br /><br />

</form>	

</body>

</html>