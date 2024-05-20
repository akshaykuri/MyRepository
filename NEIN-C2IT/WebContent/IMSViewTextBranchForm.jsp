<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="CON2.DbUtil"%>
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
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %><%@ include file="banner.jsp" %>
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" />

<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>PURCHASE ORDER</title>
	<script language="javascript"   type="text/javascript" src="js/selectLocationWiseHO.js"></script>
	<script language="javascript"   type="text/javascript" src="js/SelectionComplain.js"></script> 
	<script language="javascript" type="text/javascript" src="js/datetimepicker.js">
	/* 
    Date Time Picker script- by TengYong Ng of http://www.rainforestnet.com
	Script featured on JavaScript Kit (http://www.javascriptkit.com)
	For this script, visit http://www.javascriptkit.com */

	</script>
	<link rel='stylesheet' type='text/css' href='css/style4.css' />
	<script src="http://code.jquery.com/jquery-1.5.1.min.js"></script>
	 <script language="javascript" type="text/javascript">
	 function checkAddress(str){
         
         
		   var re = /[^\s]+[a-zA-Z ]*[^\s]+[0-9][/][(][)][.]/g; 
         if (re.test(str)) return false;
         return true;
       }

   function validate()
   {
       
       var d1=document.form.timeIn;
       var d2=document.form.timeOut;
       var m=document.form.mail;
    if ((d1.value==null)||(d1.value=="")){
   alert("Enter Login Time!");
   d1.focus();
   return false;
   }
   if (checkAddress(d1.value)==false){
   d1.value="";
   alert("Invalid Login Time");
   d1.focus();
   return false;
   }
   if ((d2.value==null)||(d2.value=="")){
	   alert("Enter Log Out Time!");
	   d2.focus();
	   return false;
	   }
	   if (checkAddress(d2.value)==false){
	   d2.value="";
	   alert("Invalid Log Out Time");
	   d2.focus();
	   return false;
	   }   
	   if ((m.value==null)||(m.value=="")){
		   alert("Enter Designation And Employee Name!");
		   m.focus();
		   return false;
		   }
		   if (checkAddress(m.value)==false){
		   m.value="";
		   alert("Invalid Designation And Employee Name");
		   m.focus();
		   return false;
		   }
else
return true;
   }
   function popitup(url) {
		newwindow=window.open(url,'name','height=300,width=1100,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
		if (window.focus) {newwindow.focus()}
		return false;
	} 
</script>

  <style type="text/css"> 
textarea.special { 
font-family:arial; 

font-size:11px; 
overflow: auto;
}
    
function printit(){  
if (window.print) {
    window.print() ;  
} else {
    var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
document.body.insertAdjacentHTML('beforeEnd', WebBrowser);
    WebBrowser1.ExecWB(6, 2);//Use a 1 vs. a 2 for a prompting dialog box    WebBrowser1.outerHTML = "";  
}
}
select {
    font-size:0.8em;
     /* border-color:#999;  without this, it won't work */
}

</style>

		<style>
			.dynatable {
				border: solid 1px #000; 
				border-collapse: collapse;
			}
			
			.dynatable td {
				border: solid 1px #000; 
				padding: 2px 10px;
				width: 170px;
				text-align: center;
			}
			.dynatable .prototype {
				display:none;
			}
		</style>
		
		
</head>

<%!
	              Connection conn = null;
	              Statement st,stt5=null;
	              ResultSet rs,rst5=null;
	              String total_val=null;
	             // String req;
	              Object req = null;
	              Connection2 dbConn = new Connection2();
	          	 String Send_date,admin_name,time_in,admin_city,time_out,ims_id,desg,emp,mail,idextend;
	             String complain_id,cm_name,cm_location,cm_prob,cm_reported,cm_completed,cm_status,admin_remarks,cm_time_diff;
	 %>


     <%
                  
    // req = session.getAttribute("ims_id");
     req= request.getParameter("aabbcc");
     //req = request.getParameter("ims_id");    
                  System.out.println("Request payload: .............................................."+ req);
					conn = con.getConnection2();
                   st = conn.createStatement();
                 rs = st.executeQuery("select Send_date,admin_name,time_in,admin_city,time_out,ims_id,desg,emp,mail,idextend from ims_master WHERE ims_id='"+req+"' AND ims_id LIKE 'NEIN/CS/IMS%'");
                   while(rs.next()){
                	  
                	   Send_date = rs.getString("Send_date");
                	   admin_name =rs.getString("admin_name");
                	   time_in = rs.getString("time_in");
                	   admin_city = rs.getString("admin_city");
                	   time_out =rs.getString("time_out");
                	   ims_id = rs.getString("ims_id");
                	   desg = rs.getString("desg");
                	   mail = rs.getString("mail");
                	   emp = rs.getString("emp");
                	   
                	      
                   }
                   try{
  %>

     
<body background="images/u.jpg">
<form name="form" method="post" action="ims_HO_Save_Back.jsp">  
<textarea id="hiderow" name="theName" rows="1" cols="30" readonly="readonly" style="color:BLUE value:WELCOME; visibility:hidden; display:none;"><%= session.getAttribute( "theName" ) %></textarea>
<div style="clear:both"></div>
<div id="customer">
</div>


<br />

<center>
<table border="1" cellspacing="1" width="800" align="center" background="images/s.jpg">
<tr><td colspan="5" align="left"><center><b><font size="3" style="font-size: medium;">IMS DAILY REPORT</font></b></center></td></tr>
<%-- <tr>
<td colspan="4"  class="meta-head" align="left">Client Name:NIPPON EXPRESS (INDIA) PRIVATE LIMITED</td>
<td colspan=""  class="meta-head" align="left">DATE:<textarea id="temp_date" name="Send_date" readonly="readonly" rows="1" cols="15"> <%=Send_date %> </textarea></td>
</tr>
<tr>
<td colspan="4" align="left">SYSTEM ADMINISTRATOR NAME:<textarea rows="1" cols="25" readonly="readonly" name="admin_name"><%=admin_name%></textarea> </td>
<td class="meta-head" width="100" align="left">Time IN : <textarea id="" name="time_in" rows="1" cols="10"><%=time_in %></textarea></td>
</tr>
<tr>
<td colspan="3" align="left">Location Name :<textarea rows="1" cols="15	" readonly="readonly" name="admin_city"><%=admin_city%></textarea></td>
<td colspan="" align="left">IMS Number :<textarea rows="1" cols="25	" readonly="readonly" name="ims_id"><%=ims_id%></textarea></td>
<td class="meta-head" width="100" align="left">Time OUT : <textarea id="" name="time_out" rows="1" cols="10"><%=time_out %></textarea></td>
</tr> --%>
<tr>
<td>SYS ADMIN:<%=admin_name%></td>
<td>Location Name :<%=admin_city%></td>
<td>DATE:<%= Send_date %></td>

</tr>
</table>



<br />
<table  width="900" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey" align="center">
			
				<tr>
				 <td width="" align="center"  height="21" >Sl No</td>
					<td width="67" align="center"  height="21" >Complain ID </td>	
					<td width="67" align="center"  height="21" >User Name </td>	
					<td width="67" align="center"  height="21" >Module</td>				
					<td width="67" align="center"  height="21" >Problem Description</td>
					<td width="67" align="center"  height="21" >Report Time</td>
					<td width="67" align="center"  height="21" >Completed Time</td>
					<td width="67" align="center"  height="21" >Total Duration</td>
					<td width="67" align="center"  height="21" >Current status</td>
					<td width="67" align="center"  height="21" >Remarks</td>
			
					
				</tr>  
				    
				    <%
				            int i=0;int k=0;
				            conn = con.getConnection2();
				            st = conn.createStatement();
				          	rs = st.executeQuery("select complain_id,cm_name,cm_location,cm_prob,cm_reported,cm_completed,cm_time_diff,cm_status,admin_remarks from ims_item WHERE ims_id='"+req+"'");
				           java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("HH:mm:ss");
				            while(rs.next()){
				            	
				            	k++;
				            	complain_id = rs.getString("complain_id");
				            	cm_name = rs.getString("cm_name");
				            	cm_location=rs.getString("cm_location");
				            	cm_prob=rs.getString("cm_prob");
				            	
				            	cm_reported=rs.getString("cm_reported");
				            	cm_completed=rs.getString("cm_completed");
				            	cm_time_diff=rs.getString("cm_time_diff");
				            	cm_status=rs.getString("cm_status");
				            	admin_remarks=rs.getString("admin_remarks");
				            	
				            	cm_prob=rs.getString("cm_prob");
				            	        i++;
				            	        String tot_val=null;
				            	        String head = "ComplainId";
				            	        String itemN = "iditemName";
				            %>
				            
				            <script>
				                    
				                     id++;
				                     
				            </script>
				            
				                 
				     <tr>
			<td width="67" align="center"  height="21" ><input type="text" name="id[]\" value="<%=i%>" size=1 class="id" /></td>
					<td>   
					<input type="text" readonly="readonly" name="complain_id" id="<%=head+i%>" value="<%=complain_id%>" id="ComplainId" class="incComplainId" size="20"/></td>
					<td><textarea  readonly="readonly" name="cm_name" id=""  rows="1" cols="25" class="incUserName" id="UserNameId" ><%=cm_name %></textarea></td>
					<td width="100"><textarea  readonly="readonly" name="cm_location" id=""  rows="1" cols="14" class="incModule" id="ModuleId" ><%=cm_location %></textarea></td>
					
	
					<%-- <td width="67" align="center"  height="21" ><input type="text" name="itemQuantity" size="4" value="<%=itemQuanity%>" onclick="showId(this.id)"  /></td> --%>
					<td width="67" align="center"  height="21" ><input type="text" readonly="readonly" name="cm_prob" size="34" id="UserDescripId" class="incUserDescrip" value="<%=cm_prob%>" /></td>
					<td width="67" align="center"  height="21" ><input type="text" readonly="readonly" name="cm_reported" size="4" id="TimeId" class="incTime" value="<%=cm_reported%>"  /></td>
				<td width="67" align="center"  height="21" ><input type="text" readonly="readonly" name="cm_completed" size="4" id="Time2Id" class="incTime2" value="<%=cm_completed %>" class="incRate" /></td>
				
					<td width="67" align="center"  height="21" ><input readonly="readonly" type="text" name="cm_time_diff" size="6" id="TimeDiffId" class="incTimeDiff" value="<%=cm_time_diff%>"  /></td>
					<td width="100"><textarea  name="cm_status" readonly="readonly" id="StatusId"  rows="1" cols="15"  class="incStatus" ><%=cm_status %></textarea>
					
					</td>
					<td width="100"><textarea  name="admin_remarks" readonly="readonly" id="RemarksId"  rows="2" cols="40" class="incRemarks"  ><%=admin_remarks %></textarea></td>
					
					</tr>
				        
				            
				            <%         
				            	        
				            }
				    %>
				   
		
               
	 
		</table> 

  





<br />

<table border="1" cellspacing="1" width="900" align="center" ><tr>SENT TO:
			<%
//cs_id,cs_date,city,cs_time,e_name,e_designation,desg,emp,theName,transId,ps_raw,ps_upsworking,ps_upsbackup,ps_upspreventive,si_working,isp_router,udb,cr_working,wg_firewall,fdb,ln_server,NEWINS,sr_ac,tele,cctv,cctv_backup,access_con,fire_a,fire_l,ids_w,ids_l,ithardware_r,ithardware_n,preventive_e,quarter_r,main_remarks,idextend,mail,status
conn = con.getConnection2();
stt5 = conn.createStatement();
rst5 = stt5.executeQuery("select mailid  from imsmaillist where ims_id  = '"+req+"'");
while(rst5.next()){
					 String mailid = rst5.getString("mailid");
	        %>
       
       <td>
       <input type ="text" readonly="readonly" name = "quarter_r" value ="<%=mailid%>"/>
       </td>  <%} %> 
       </tr>
      
                                      
</table>
		<%
}
catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(rs,st,conn);

  }
	%>
<br />
<table width="" align=center bgcolor="lightgrey">

   <tr> 

	  <!-- <td style="size:1"><input style="font-size:1" type="submit" value="SEND" name="save1" id="save" onclick="return validate();" /></td> -->
	<!--   <td> <input type="button" value="CANCEL" onclick="goBack();" /></td> -->
	  <td style="font-size: 1"><input style="size: 1; font-size: 1.1em;" type="button" value="BACK" onclick="window.location.href='SelectIms.jsp?msg=1'" /></td>
	   <%-- %><td> <input type="button" value="CANCEL" onclick="window.opener=null; window.close(); return false;" /></td> --%>
      <!--<td style="size:1">&nbsp;&nbsp;<input style="size:1" type="button"  onclick="history.go(0)"  value="RESET"/></td>   
     --><%-- <td style="font-size:1"><input style="size:1;font-size: 1.1em;" type="button"  value="PRINT" onclick="window.location.href='jasper2.jsp'"/> </td>
     <td style="size:1"><input style="font-size:1" type="submit" value="SAVE" name="save" id="save" onclick="this.disabled=true;return true;"/></td>
      <td><input type=button value=printtt onclick="window.open('D:/P1.pdf'); return true;"/></td> 
      <td><input type="button" value="PDF" name="print" id="print" disabled="disabled" onclick="link();"/></td>
       
       <td><input type="button" value="WORD" name="word" id="word" disabled="disabled" onclick="Word();"/></td>  --%>

      
      <!-- <td>
      <a href="NewComplainAddition.jsp?msg=1"  onclick="return popitup('NewComplainAddition.jsp?msg=1')">New</a>
     &nbsp;&nbsp;&nbsp;&nbsp;
      </td> -->
      <td>
      
      
      <a href="imsHelp.jsp" onclick="return popitup('imsHelp.jsp')" id="hiderow"><font size=2>HELP</font></a></td>
</tr>
 
</table>
</center>
	<br /><br /><br />

</form>	

</body>

</html>