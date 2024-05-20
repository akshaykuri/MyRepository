<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="CON2.DbUtil"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java"%> 
<%@page import = "java.util.Date" %>
<%@page import = "java.sql.*" %> 
<%@page import = "java.text.DateFormat" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%@page import = "net.sf.jasperreports.view.*" %>
<%@page import = "net.sf.jasperreports.engine.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@page import="CON2.Connection2" %> 
<%@page import="CON2.CurrentTime" %>
<%@ include file="banner.jsp" %>
<jsp:useBean id = "con" class="CON2.Connection2" />
<jsp:useBean id = "currentTime" class="CON2.CurrentTime" />

<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>MATERIAL REQUISITION</title>
	<link rel='stylesheet' type='text/css' href='css/style2.css' />
	<script src="http://code.jquery.com/jquery-1.5.1.min.js"></script>
	
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

		<script type="text/javascript">
		      function linkInsert()
		        {
		            document.form.action = "PurchaseOrderBack.jsp";  
		        	document.form.method = "post";
		        	document.form.submit();
		        
		        }
		       function popitup(url) {
		    		newwindow=window.open(url,'name','height=300,width=900,location=1,status=1,scrollbars=1,resizable=yes');
		    		if (window.focus) {newwindow.focus()}
		    		return false;
		    	}
		</script>
		<script  type="text/javascript">

<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("__","  ");
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
</script>
	
</head>
<%
if(session==null)
{
	response.sendRedirect("loginho.jsp?msg=1");
}
%>
<%!String req;
	              Connection conn = null;
	              Statement st,st2,st3,st4,st5,st6,st7,st8,stt1,stt2,stt3,stt4,stt5;
	              ResultSet rs,rs2,rs3,rs4,rs5,rs6,rs7,rs8,rst1,rst2,rst3,rst4,rst5;
	              String []id;
	              Object logInName = null,desg=null,realname=null,city=null,Initiator=null;
	              
	              String []itemName=null;
	              String []itemQuantity;
	              String []itemRate;
	              String []abbreviation;
	              String []asset;
	              String []itemAmount;
	              Connection2 dbConn = new Connection2();
	      String transid = null;       
	%>


     <%
     req = request.getParameter("aabbcc");
                  transid = "abc"+String.valueOf(Math.random());
     
     		   logInName = session.getAttribute("theName");
     		  realname =  session.getAttribute("Nname");
     		   desg = session.getAttribute("desg");
     		   city = session.getAttribute("NpostingCo");
     		   Initiator = session.getAttribute("Nmail");
     		  System.out.println("Branch nameeee Mrho  "+city);
     		  System.out.println("Initiator NAMEEEEEEEE "+Initiator);
     %>
<body>



<%-- %><form name="form" method="post" action="PurchaseOrderBack.jsp" onsubmit="popupform(this, 'join')">  --%>
<form action="CheckList_PageOne_HOBack.jsp" method="post" name="form" target="POPUPW"    onsubmit="POPUPW = window.open('about:blank','POPUPW',   'width=300,height=200');">
<input type="hidden" name="transid" value="<%=transid%>" />

<textarea id="hiderow" name="theName" rows="1" cols="30" readonly="readonly" style="color:BLUE value:WELCOME; visibility:hidden; display:none;"><%= session.getAttribute( "theName" ) %></textarea>

 <br />
		
	

		
	 <br />
		
<div id="leftfeature"><input type="button" value="BACK" onclick="window.location.href='CheckSheetSelectionHO.jsp?msg=1'"/></div>
	<div id="page-wrap">
   
   
		<%-- <div id="header">PURCHASE ORDER <span class="back_button"><input style="size:1;font-size: 1.1em;" type="button"  value="BACK" onclick="window.location.href='HO.jsp'"/></span></div>--%>
		
		
		
	
	

		
		
		<table width="100%"  cellspacing="0" cellpadding="0" bgcolor="lightgrey">
	<tr>
		<td><font size="3">
		<b><center><label>
		NIPPON EXPRESS (INDIA) PRIVATE LIMITED</label> </center>
		</b></font></td>
	</tr>
</table>
<br />
<br />
<center>
<label><font color="black"><u><b>IT CHECK SHEET</b></u></font></label> <br />
</center>
	 <br />








		

		<%--java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy"); --%>


		<%--
                Date po_date = new Date();
                --%>
		<!--                
                <script type="text/javascript"> 
var currentDate = new Date() 
  var day = currentDate.getDate() 
  var month = currentDate.getMonth() + 1 
  var year = currentDate.getFullYear() 
  document.write("<b>" + day + "/" + month + "/" + year + "</b>") 
</script>-->
		
		<div style="clear:both"></div>
		
		<div id="customer">


		
		</div>
		
		
<%try{
//cs_id,cs_date,city,cs_time,e_name,e_designation,desg,emp,theName,transId,ps_raw,ps_upsworking,ps_upsbackup,ps_upspreventive,si_working,isp_router,udb,cr_working,wg_firewall,fdb,ln_server,NEWINS,sr_ac,tele,cctv,cctv_backup,access_con,fire_a,fire_l,ids_w,ids_l,ithardware_r,ithardware_n,preventive_e,quarter_r,main_remarks,idextend,mail,status
conn = con.getConnection2();
stt1 = conn.createStatement();
rst1 = stt1.executeQuery("select * from cs_master where cs_id  = '"+req+"'");
try{
while(rst1.next()){
	
	        String city = rst1.getString("city");
	        String cs_date =rst1.getString("cs_date");
	        String cs_time = rst1.getString("cs_time");
	        
	        String ps_raw = rst1.getString("ps_raw");
	        String ps_upworking = rst1.getString("ps_upsworking");
	        String ps_upsbackup = rst1.getString("ps_upsbackup");
	        String ps_upspreventive = rst1.getString("ps_upspreventive");
	        String si_working = rst1.getString("si_working");

%>

<table border="0" width="900">

<tr>
<td>CheckSheet No.:<textarea id="idcs_id" name="cs_id" rows="1"><%= req %></textarea></td>
<td align="right">Location:<textarea id="idcity" name="city" rows="1"><%=city%></textarea></td>
</tr>
<tr >
<td >Creation Date (dd/mm/yyyy):  <textarea id="idcs_date" name="cs_date" rows="1"><%= cs_date %></textarea></td>
<td align="right">Creation Time:   <textarea id="idcs_time" name="cs_time" rows="1"><%= cs_time %></textarea></td>
</tr>

</table>
<br />

<table border="2" cellspacing="1" width="900">

<tr>




	<td style="visibility: hidden; display: none"><input
			type="hidden" name="idextend" value="<%=id%>" /></td>
			
			
			
			
<td width="25" align="center" height="5" colspan="2"><center>1</center></td>

<td >&nbsp;Power supply </td><td width="443"></td></tr>
<tr>
	<td width="30" align="center" rowspan="5"><center></center></td>
	<td colspan="2">&nbsp;RAW Power Working</td><td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" name = "ps_raw" value ="<%=ps_raw %>" /></td>
</tr>
<tr>
	<td colspan="2">&nbsp;UPS Working</td><td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type ="text" name = ps_upsworking value ="<%=ps_upworking %>" readonly="readonly" /></td>
</tr>
<tr>
	<td colspan="2">&nbsp;UPS Backup Time(To be checked weekly once)</td><td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" name = ps_upsbackup value ="<%=ps_upsbackup %>"  />hours</td>
</tr> 

 <tr>
 	<td colspan="2"  height="20">&nbsp;UPS Preventive Maintenance<br />(to be checked 3 months once) </td>
    <td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" name = ps_upspreventive value ="<%=ps_upspreventive %>" readonly="readonly" /></td>
</tr> 
 <tr></tr>
 
<tr>
<td width="25" align="center" height="5" colspan="2"><center>2</center></td>

<td>&nbsp;Server Status ( HO only)</td><td width="100"></td></tr>
<tr>
	<td width="14" align="center" rowspan="1"><center></center></td>
	<td colspan="2">&nbsp;Working</td><td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" name = si_working value ="<%=si_working %>" readonly="readonly" /></td>
</tr>
<!-- <tr>
	<td colspan="2">&nbsp;<u>HDD space</u></td><td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <label><font color="black"><u><b>Used</b></u></font></label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <label><font color="black"><u><b>Free Space</b></u></font></label> </td>
</tr> -->
<%} 

}
catch (Exception e) {
	 System.out.println(e);
}

finally{
DbUtil.closeDBResources(rst1,stt1,conn);

}
%>
</table>
   <%
Connection cn6 = null;
Statement st6 = null; 
ResultSet rs6 = null;
try{
cn6 = con.getConnection2();
st6=cn6.createStatement();
rs6 = st6.executeQuery("select * from servername ORDER BY sname Asc"); 
%>
<!-- 1st  dynamic table HDD SPACE  DOWNLOAD TIME ------------------------------------------------------------------------------- -->
	<table class="dynatable" border="2" cellspacing="1" width="900" style="height: 150"  bgcolor="">
			
				 <tr><td width="36"   height="21" ></td>
				    
				    <td width="10" align="center"  height="21" >SL<br />NO.</td>
					<td width="213" align="center"  height="21" ><font color="red" size="4">*</font>HDD SPACE</td>				
					<td width="213" align="center"  height="21" >DRIVES</td>
					<td width="213" align="center"  height="21" >USED</td>
					<td width="213" align="center"  height="21" >Free Space</td>
					
				</tr>
			 <%int i=0;
				            conn = con.getConnection2();
				            st = conn.createStatement();
				            rs = st.executeQuery("select * from serveritem where si_cs_id  = '"+req+"'");
				            while(rs.next()){
				            	
				            	        String si_drive = rs.getString("si_drive");
				            	        String si_harddisk =rs.getString("si_harddisk");
				            	        String si_usedspace = rs.getString("si_usedspace");
				            	        String si_freespace = rs.getString("si_freespace");
				            	       i++;
				            	       String si_driveN = "idsi_harddisk";
				            %>
				            
				            <script>
				                    
				                     id++;
				                     
				            </script>
				            
				<tr class="prototype">
				   <td width="36"  height="21" ></td>
				   
					<td width="10" align="center"  height="21" ><input type="text" name="id[]" value="<%=i%>" size=1 class="id" /></td>		
					<td width="217" align="center"  height="21" ><input type="text" name="si_harddisk" size="10" value="<%=si_harddisk %>" id="idsi_harddisk" style="background:lightgrey;" />	 
					</td>
                      <td width="217" align="center"  height="21" ><input type="text" name="si_drive" size="10" value="<%=si_drive %>" id="idsi_harddisk" style="background:lightgrey;" />	 
					</td>
					<td width="218" align="center"  height="21" ><input type="text" name="si_usedspace" size="10" value="<%=si_usedspace%>" class="incRate" style="background:lightgrey;" /></td> 
					<td width="218" align="center"  height="21" ><input type="text" name="si_freespace" size="10" value="<%=si_freespace%>" class="incRate" style="background:lightgrey;" /></td>      
				</tr>

        <%  }
}
catch (Exception e) {
		 System.out.println(e);
}

finally{
DbUtil.closeDBResources(rs6,st6,conn);

}
				            %>
	 
		</table> 

<table border="1" cellspacing="1" width="900">

<tr>
<td width="65" align="center" height="5" colspan="2"><center>3</center></td>

<td width="390">&nbsp;MPLS VPN </td><td width="445"></td></tr>

</table>

<!-- 2 dynamic table HDD SPACE  DOWNLOAD TIME ------------------------------------------------------------------------------- -->

   <%
Connection cn7 = null;
Statement st7 = null; 
ResultSet rs7 = null;
try{
cn7 = con.getConnection2();
st7=cn7.createStatement();
rs7 = st7.executeQuery("select mpls_branch from mpls_master ORDER BY mpls_branch Asc"); 
/* ,id2=0,id3=0,id4=0,id5=0,id6=0 */

int id2=0;

%>
<!--  <script>id++;</script> -->
<!-- 2st  dynamic table HDD SPACE  DOWNLOAD TIME ------------------------------------------------------------------------------- -->
<table class="dynatable2" border="2" cellspacing="1" width="900" style="height: 150"  bgcolor="">
			
				<tr><td width="30" align="center"  height="21" ></td>
				    
				    
				    <td width="20" align="center"  height="21" >SL<br />NO.</td>
					<td width="320" align="center"  height="21" ><font color="red" size="4">*</font>LOCATION</td>				
					<td width="445" align="center"  height="21" colspan="4" >Downtime:<br /> (if NO, pls. specify total no. of hours down)</td>
				</tr>
			
				 <%int j=0;
				            conn = con.getConnection2();
				            st2 = conn.createStatement();
				            rs2 = st2.executeQuery("select * from mpls_item where mi_cs_id  = '"+req+"'");
				            while(rs2.next()){
				            	
				            	        String mpls_name = rs2.getString("mpls_name");
				            	        String mpls =rs2.getString("mpls");
				            	        String mpls_remarks = rs2.getString("mpls_remarks");
				            	       
				            	       j++;
				            	       String mpls_nameN = "idmpls_name";
				            %>
				            
				            <script>
				                    
				                     id2++;
				                     
				            </script>
				<tr class="prototype2">
					<td width="30" align="center"  height="21" ></td>
				
			
					<td width="20" align="center"  height="21" ><input type="text" name="id2[]" value="<%=j%>" size=1 class="id2" /></td>					
					<td width="345" align="center"  height="21" ><input type="text"  size="30" value="<%=mpls_name %>" id="idmpls_name" class="incmpls" />
					</td>
                      <td width="100" align="center"  height="21" ><input type="text" size="6" value="<%=mpls %>" class="incmpls" /></td>
                  
					  <td width="245" align="center"  height="21" ><input type="text"  name="mpls_remarks" value="<%=mpls_remarks %>" /></td>      
				</tr>

           <%} 
}
catch (Exception e) {
		 System.out.println(e);
}

finally{
DbUtil.closeDBResources(rs2,st2,conn);

}
           %>
	 
		</table>

<table border="2" cellspacing="1" width="900">
	<%
//cs_id,cs_date,city,cs_time,e_name,e_designation,desg,emp,theName,transId,ps_raw,ps_upsworking,ps_upsbackup,ps_upspreventive,si_working,isp_router,udb,cr_working,wg_firewall,fdb,ln_server,NEWINS,sr_ac,tele,cctv,cctv_backup,access_con,fire_a,fire_l,ids_w,ids_l,ithardware_r,ithardware_n,preventive_e,quarter_r,main_remarks,idextend,mail,status
conn = con.getConnection2();
stt2 = conn.createStatement();
try{
rst2 = stt2.executeQuery("select isp_router from cs_master where cs_id  = '"+req+"'");
while(rst2.next()){
	
	        String isp_router = rst2.getString("isp_router");
	      

%>
<tr>
	<td width="65" align="center" height="5" colspan="2"><center>4</center></td>
	<td width="300" >&nbsp;ISP (MPLS VPN)Router</td>
	<td width="40">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" name = isp_router value ="<%=isp_router %>" /></td>
</tr>
<%} 
}
catch (Exception e) {
		 System.out.println(e);
}

finally{
DbUtil.closeDBResources(rst2,stt2,conn);

}
%>
<tr>
	<td width="65" align="center" height="5" colspan="2"><center>5</center></td>
	<td width="435" >&nbsp;INTERNET CONNECTION</td><td width="400"></td>
</tr>
</table>

<!-- 3rd dynamic table HDD SPACE  DOWNLOAD TIME ------------------------------------------------------------------------------- -->
<table class="dynatable3" border="2" cellspacing="1" width="900" style="height: 150"  bgcolor="">
			
				<tr><td width="30" align="center"  height="21" ></td>
				    
				    
				    <td width="60" align="center"  height="21" >SL<br />NO.</td>
					<td width="320" align="center"  height="21" ><font color="red" size="4">*</font>INTERNET</td>				
					<td width="445" align="center"  height="21" colspan="4" ></td>
				</tr>
				 <%int k=0;try{
				            conn = con.getConnection2();
				            st3 = conn.createStatement();
				            rs3 = st3.executeQuery("select * from internet_item where ii_cs_id  = '"+req+"'");
				            while(rs3.next()){
				            	
				            	        String int_name = rs3.getString("int_name");
				            	        String internet =rs3.getString("internet");
				            	       	k++;
				            	      	 String int_nameN = "idint_name";
				            %>
				            
				            <script>
				                    
				                     id3++;
				                     
				            </script>
			<tr class="prototype3">
					<td width="30" align="center"  height="21" ></td>
				
				
					<td width="60" align="center"  height="21" ><input type="text" name="id3[]" value="<%=k%>" size=1 class="id3" /></td>					
					<td width="320" align="center"  height="21" ><input type="text" class="incinternet" id="idint_name" value="<%=int_name%>"/></td>
                      <td width="100" align="center"  height="21" ><input type="text" class="incinternet"  value="<%=internet%>"/></td>
					  <td width="245" align="center"  height="21" ></td>      
				</tr>

  <%} 
  
				 }
		            catch (Exception e) {
				 		 System.out.println(e);
					}

finally{
		DbUtil.closeDBResources(rs3,st3,conn);

		}
  %>
	 
		</table>



<table border="2" cellspacing="1" width="900">
<tr>
	<td width="65" align="center" height="5" colspan="2"><center>6</center></td>
	<td width="390" >&nbsp;SERVER BACKUP</td><td width="445"></td>
</tr>
</table>

<!-- 4 dynamic table HDD SPACE  DOWNLOAD TIME ------------------------------------------------------------------------------- -->
<table class="dynatable4" border="2" cellspacing="1" width="900" style="height: 150"  bgcolor="">
			
				<tr><td width="30" align="center"  height="21" ></td>
				    
				    
				    <td width="60" align="center"  height="21" >SL<br />NO.</td>
					<td width="320" align="center"  height="21" ><font color="red" size="4">*</font>Server Backup Details</td>				
					<td width="445" align="center"  height="21" colspan="4" ></td>
				</tr>
				<!-- <tr><td colspan="2"></td>	
					<td width="67" align="center"  height="21" >YES</td>
					<td width="67" align="center"  height="21" >NO</td>
					<td width="67" align="center"  height="21" >Remarks</td>
				</tr> -->
			<%int l=0; try{
				            conn = con.getConnection2();
				            st4 = conn.createStatement();
				            rs4 = st4.executeQuery("select * from backup_item where bi_cs_id  = '"+req+"'");
				            while(rs4.next()){
				            	
				            	        String bkup_name  = rs4.getString("bkup_name");
				            	        String bkup =rs4.getString("bkup");
				            	       	l++;
				            	      	 String int_nameN = "idint_name";
				            %>
				            
				            <script>
				                    
				                     id4++;
				                     
				            </script>
				<tr class="prototype4">
					<td width="30" align="center"  height="21" ></td>
				
				   
					<td width="60" align="center"  height="21" ><input type="text" name="id4[]" value="<%=l%>" size=1 class="id4" /></td>					
					<td width="320" align="center"  height="21" ><%=bkup_name %></td>
                      <td width="100" align="center"  height="21" ><input type="text" class="incbkup" value="<%=bkup%>"/></td>
                 
					  <td width="245" align="center"  height="21" ></td>      
				</tr>
<%} 

			}
            catch (Exception e) {
		 		 System.out.println(e);
			}

finally{
DbUtil.closeDBResources(rs4,st4,conn);

}
%>
  
	 
		</table>
	
<%
//cs_id,cs_date,city,cs_time,e_name,e_designation,desg,emp,theName,transId,ps_raw,ps_upsworking,ps_upsbackup,ps_upspreventive,si_working,isp_router,udb,cr_working,wg_firewall,fdb,ln_server,NEWINS,sr_ac,tele,cctv,cctv_backup,access_con,fire_a,fire_l,ids_w,ids_l,ithardware_r,ithardware_n,preventive_e,quarter_r,main_remarks,idextend,mail,status
try{
conn = con.getConnection2();
stt3 = conn.createStatement();
rst3 = stt3.executeQuery("select * from cs_master where cs_id  = '"+req+"'");
while(rst3.next()){
	
	        String udb = rst3.getString("udb");
	        String cr_working =rst3.getString("cr_working");
	        String wg_firewall = rst3.getString("wg_firewall");
	        
	        String fdb = rst3.getString("fdb");
	        String ln_server = rst3.getString("ln_server");
	        String NEWINS = rst3.getString("NEWINS");
	        String sr_ac = rst3.getString("sr_ac");
	        String tm = rst3.getString("tm");

%>		
<table border="2" cellspacing="1" width="900">

<%-- <tr>
	<td width="65" align="center" height="5" colspan="2"><center>7</center></td>
	<td width="390" >&nbsp;User Emails backup taken(Automatic user backup)<br /> (weekly sheduled backup)</td><td width="445">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" name = udb value ="<%=udb %>" readonly="readonly" onclick="popup();"/></td>
</tr> --%>
<tr>
	<td width="65" align="center" height="5" colspan="2"><center>7</center></td>
	<td width="390" >&nbsp;SAOBB IPVPN & SDWAN Router Working(HO Only)</td><td width="445">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" name = cr_working value ="<%=cr_working %>" readonly="readonly" onclick="popup();"/></td>
</tr>
<tr>
	<td width="65" align="center" height="5" colspan="2"><center>8</center></td>
	<td width="390" >&nbsp;FortiGate 400D Firewall Working(HO Only)</td><td width="445">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" name = wg_firewall value ="<%=wg_firewall %>" readonly="readonly" onclick="popup();"/></td>
</tr>
<%-- <tr>
	<td width="65" align="center" height="5" colspan="2"><center>10</center></td>
	<td width="390" >&nbsp;Firewall Database (10.206.10.11) - (HO only)</td><td width="445">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" name = fdb value ="<%=fdb %>" readonly="readonly" onclick="popup();"/></td>
</tr> --%>
<tr>
	<td width="65" align="center" height="5" colspan="2"><center>9</center></td>
	<td width="390" >&nbsp;Office 365/Microsoft Teams/SharePoint(Working)</td><td width="445">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" name = ln_server value ="<%=ln_server %>" readonly="readonly" onclick="popup();"/></td>
</tr> 
<tr>
	<td width="65" align="center" height="5" colspan="2"><center>10</center></td>
	<td width="390" >&nbsp;NEWINS/NExAS/GS-NET/NEx-GLOW(Working)</td><td width="445">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" name = NEWINS value ="<%=NEWINS %>" readonly="readonly" onclick="popup();"/></td>
</tr>
<tr>
	<td width="65" align="center" height="5" colspan="2"><center>11</center></td>
	<td width="390" >&nbsp;Server Room AC (Working) <br /> Temperature Maintained</td><td width="445">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" name = sr_ac value ="<%=sr_ac %>" readonly="readonly" onclick="popup();"/><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type ="text" size="30" name = "tm" value ="<%=tm %>"  />
        </td>
</tr>
<%} 

}
catch (Exception e) {
		 System.out.println(e);
}

finally{
DbUtil.closeDBResources(rst3,stt3,conn);

}
%>
</table>		
		
	<table border="2" cellspacing="1" width="900">
<tr>
	<td width="65" align="center" height="5" colspan="2"><center>12</center></td>
	<td width="390" >&nbsp;Photocopier</td><td width="445"></td>
</tr>
</table>

<!-- 5 dynamic table HDD SPACE  DOWNLOAD TIME ------------------------------------------------------------------------------- -->
<table class="dynatable5" border="2" cellspacing="1" width="900" style="height: 150"  bgcolor="">
			
				<tr><td width="30" align="center"  height="21" ></td>
				    
				  
				    <td width="60" align="center"  height="21" >SL<br />NO.</td>
					<td width="320" align="center"  height="21" ><font color="red" size="4">*</font>Photocopier Details</td>				
					<td width="445" align="center"  height="21" colspan="4" ></td>
				</tr>
				<!-- <tr><td colspan="2"></td>	
					<td width="67" align="center"  height="21" >YES</td>
					<td width="67" align="center"  height="21" >NO</td>
					<td width="67" align="center"  height="21" >Remarks</td>
				</tr> -->
			<%int m=0;try{
				            conn = con.getConnection2();
				            st5 = conn.createStatement();
				            rs5 = st5.executeQuery("select * from photocopier_item where pi_cs_id  = '"+req+"'");
				            while(rs5.next()){
				            	
				            	        String phto_name  = rs5.getString("phto_name");
				            	        String phto =rs5.getString("phto");
				            	       	m++;
				            	      	// String int_nameN = "idint_name";
				            %>
				            
				            <script>
				                    
				                     id5++;
				                     
				            </script>
				<tr class="prototype5">
					<td width="30" align="center"  height="21" ></td>
				
				    
					<td width="60" align="center"  height="21" ><input type="text" name="id5[]" value="<%=m%>" size=1 class="id5" /></td>					
					<td width="320" align="center"  height="21" ><input type="text" class="incphto" value="<%=phto_name%>"/></td>
                      <td width="100" align="center"  height="21" ><input type="text" class="incphto" value="<%=phto%>"/></td>
                     
					  <td width="245" align="center"  height="21" ></td>      
				</tr>

  <%}
			}
            catch (Exception e) {
		 		 System.out.println(e);
			}

finally{
DbUtil.closeDBResources(rs5,st5,conn);

}  %>
	 
		</table>
		
	<table border="2" cellspacing="1" width="900">
<tr>
	<td width="65" align="center" height="5" colspan="2"><center>13</center></td>
	<td width="390" >&nbsp;Printer(Laser Jet /Dot Matrix)</td><td width="445"></td>
</tr>
</table>

<!-- 6 dynamic table HDD SPACE  DOWNLOAD TIME ------------------------------------------------------------------------------- -->
<table class="dynatable6" border="2" cellspacing="1" width="900" style="height: 150"  bgcolor="">
			
				<tr><td width="30" align="center"  height="21" ></td>
				    
				   
				    <td width="60" align="center"  height="21" >SL<br />NO.</td>
					<td width="320" align="center"  height="21" ><font color="red" size="4">*</font>Printer Details</td>				
					<td width="445" align="center"  height="21" colspan="4" ></td>
				</tr>
				
				<%int n=0;try{
				            conn = con.getConnection2();
				            st6 = conn.createStatement();
				            rs6 = st6.executeQuery("select * from printer_item where prt_cs_id  = '"+req+"'");
				            while(rs6.next()){
				            	
				            	        String prt_name  = rs6.getString("prt_name");
				            	        String prt =rs6.getString("prt");
				            	       	n++;
				            	      	// String int_nameN = "idint_name";
				            %>
				            
				            <script>
				                    
				                     id6++;
				                     
				            </script>
				<tr class="prototype6">
					<td width="30" align="center"  height="21" ></td>
				
				    
					<td width="60" align="center"  height="21" ><input type="text" name="id6[]" value="<%=n %>" size=1 class="id6" /></td>					
					<td width="320" align="center"  height="21" ><input type="text" class="incprt" value="<%=prt_name%>"/></td>
                      <td width="100" align="center"  height="21" ><input type="text" class="incprt" value="<%=prt%>"/></td>
                
					  <td width="245" align="center"  height="21" ></td>      
				</tr>
<%} 
				}
	            catch (Exception e) {
			 		 System.out.println(e);
				}

finally{
	DbUtil.closeDBResources(rs6,st6,conn);

	}
%>
  
	 
		</table>
		
		<table border="2" cellspacing="1" width="900">
<tr>
	<td width="65" align="center" height="5" colspan="2"><center>14</center></td>
	<td width="390" >&nbsp;Fax Machines</td><td width="445"></td>
</tr>
</table>
   <%
Connection cn12 = null;
Statement st12= null; 
ResultSet rs12 = null;
try{
cn12 = con.getConnection2();
st12=cn12.createStatement();
rs12 = st12.executeQuery("select fax_name from fax_master ORDER BY fax_name Asc"); 
%>
<!-- 7 dynamic table HDD SPACE  DOWNLOAD TIME ------------------------------------------------------------------------------- -->
<table class="dynatable7" border="2" cellspacing="1" width="900" style="height: 150"  bgcolor="">
			
				<tr><td width="30" align="center"  height="21" ></td>
				    
				    
				    <td width="60" align="center"  height="21" >SL<br />NO.</td>
					<td width="320" align="center"  height="21" ><font color="red" size="4">*</font>Fax Machines Details</td>				
					<td width="445" align="center"  height="21" colspan="4" ></td>
				</tr>
				<%int o=0;
				            conn = con.getConnection2();
				            st7 = conn.createStatement();
				            rs7 = st7.executeQuery("select * from fax_item where fx_cs_id  = '"+req+"'");
				            while(rs7.next()){
				            	
				            	        String fx_name  = rs7.getString("fx_name");
				            	        String fx =rs7.getString("fx");
				            	       	o++;
				            	      	// String int_nameN = "idint_name";
				            %>
				            
				            <script>
				                    
				                     id7++;
				                     
				            </script>
			
				<tr class="prototype7">
					<td width="30" align="center"  height="21" ></td>
				
				    
					<td width="60" align="center"  height="21" ><input type="text" name="id7[]" value="<%=o%>" size=1 class="id7" /></td>					
					<td width="320" align="center"  height="21" ><input type="text" value="<%=fx_name %>" class="incfx"/></td>
					
                      <td width="100" align="center"  height="21" ><input type="text" value="<%=fx %>" class="incfx"/></td>
					  <td width="245" align="center"  height="21" ></td>      
				</tr>

  <%} 
}
catch (Exception e) {
		 System.out.println(e);
}

finally{
DbUtil.closeDBResources(rs12,st12,conn);

}
  %>
	 
		</table>
				<table border="2" cellspacing="1" width="900">
<tr>
	<td width="65" align="center" height="5" colspan="2"><center>15</center></td>
	<td width="390" >&nbsp;Barcode Scanner/Printer</td><td width="445"></td>
</tr>
</table>
   <%
Connection cn13 = null;
Statement st13= null; 
ResultSet rs13 = null;
try{
cn13 = con.getConnection2();
st13=cn13.createStatement();
rs13 = st13.executeQuery("select barcode_name from barcode_master ORDER BY barcode_name Asc"); 
%>
<!-- 8st  dynamic table HDD SPACE  DOWNLOAD TIME ------------------------------------------------------------------------------- -->
<table class="dynatable8" border="2" cellspacing="1" width="900" style="height: 150"  bgcolor="">
			
				<tr><td width="30" align="center"  height="21" ></td>
				    
				 
				    <td width="60" align="center"  height="21" >SL<br />NO.</td>
					<td width="320" align="center"  height="21" ><font color="red" size="4">*</font>Barcode Scanner/Printer Details</td>				
					<td width="445" align="center"  height="21" colspan="4" ></td>
				</tr>
				<%int p=0;try{
				            conn = con.getConnection2();
				            st7 = conn.createStatement();
				            rs7 = st7.executeQuery("select * from barcode_item where br_cs_id  = '"+req+"'");
				            while(rs7.next()){
				            	
				            	        String br_name  = rs7.getString("br_name");
				            	        String br =rs7.getString("br");
				            	       	p++;
				            	      	// String int_nameN = "idint_name";
				            %>
				            
				            <script>
				                    
				                     id8++;
				                     
				            </script>
			
				<tr class="prototype8">
					<td width="30" align="center"  height="21" ></td>
				
				    
					<td width="60" align="center"  height="21" ><input type="text" name="id8[]" value="<%=p%>" size=1 class="id8" /></td>					
					<td width="320" align="center"  height="21" ><input type="text" class="incbr" value="<%=br_name%>"/></td>
					<td width="100" align="center"  height="21" ><input type="text" class="incbr" value="<%=br%>"/></td>
                     
					  <td width="245" align="center"  height="21" ></td>      
				</tr>
<%} 
				}
	            catch (Exception e) {
			 		 System.out.println(e);
				}

finally{
	DbUtil.closeDBResources(rs13,st13,conn);

	}
%>
  
	 
		</table>
		<%
//cs_id,cs_date,city,cs_time,e_name,e_designation,desg,emp,theName,transId,ps_raw,ps_upsworking,ps_upsbackup,ps_upspreventive,si_working,isp_router,udb,cr_working,wg_firewall,fdb,ln_server,NEWINS,sr_ac,tele,cctv,cctv_backup,access_con,fire_a,fire_l,ids_w,ids_l,ithardware_r,ithardware_n,preventive_e,quarter_r,main_remarks,idextend,mail,status
try{
conn = con.getConnection2();
stt4 = conn.createStatement();
rst4 = stt4.executeQuery("select * from cs_master where cs_id  = '"+req+"'");
while(rst4.next()){
	
	        String tele = rst4.getString("tele");
	        String cctv =rst4.getString("cctv");
	        String cctv_backup = rst4.getString("cctv_backup");
	        
	        String access_con = rst4.getString("access_con");
	        String fire_a = rst4.getString("fire_a");
	        String fire_l = rst4.getString("fire_l");
	        String ids_w = rst4.getString("ids_w");
	        String ids_l = rst4.getString("ids_l");
	      
	        String ithardware_r = rst4.getString("ithardware_r");
	        String ithardware_n = rst4.getString("ithardware_n");
	        String preventive_e = rst4.getString("preventive_e");
	        String quarter_r = rst4.getString("quarter_r");
	        String main_remarks = rst4.getString("main_remarks");
%>	
		<table border="2" cellspacing="1" width="900">
		<tr>
	<td width="32" align="center" height="5" colspan="2"><center>16</center></td>
	<td width="408" >&nbsp;Telephone EPABX /Lines</td><td width="460">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" name = tele value ="<%=tele %>" readonly="readonly" onclick="popup();"/></td>
</tr>
	<tr>
<td width="32" align="center" height="5" colspan="2"><center>17</center></td>

<td width="408">&nbsp;CCTV(Working)</td><td width="460">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" name = cctv value ="<%=cctv %>" readonly="readonly" onclick="popup();"/></td></tr>
		
<tr>
	<td width="32" align="center" rowspan="1"><center></center></td>
	<td colspan="2" width="408">&nbsp;Backup(no. of days)</td><td width="460">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" name = cctv_backup value ="<%=cctv_backup %>"  onclick="popup();"/></td>
</tr>

<tr>
	<td width="32" align="center" height="5" colspan="2"><center>18</center></td>
	<td width="408" >&nbsp;Access Controller(working)</td><td width="460">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" name = access_con value ="<%=access_con %>" readonly="readonly"/></td>
</tr>

	<tr>
<td width="32" align="center" height="5" colspan="2"><center>19</center></td>

<td width="408">&nbsp;Fire Alarm(Working)</td><td width="460">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" name = fire_a value ="<%=fire_a %>" readonly="readonly" onclick="popup();"/></td></tr>
<tr>
	<td width="32" align="center" rowspan="1"><center></center></td>
	<td colspan="2" width="408">&nbsp;When was last checked</td><td width="460">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" name = fire_l value ="<%=fire_l %>" /></td>
</tr>

	<tr>
<td width="32" align="center" height="5" colspan="2"><center>20</center></td>

<td width="408">&nbsp;Intrusion Deduction System (IDS) (working)</td><td width="460" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" name = "ids_w" value ="<%=ids_w %>" /></tr>
<tr>
	<td width="32" align="center" rowspan="1"><center></center></td>
	<td colspan="2" width="408">&nbsp;When was last checked</td><td width="460" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" name = ids_l value ="<%=ids_l %>" /></td>
</tr>
	<tr>
<td width="32" align="center" height="5" colspan="2"><center>21</center></td>

<td width="408">&nbsp;Any IT hardware under Repair(Pls. specify)</td><td width="460">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" name = "ithardware_r" value ="<%=ithardware_r %>" /></td></tr>
<tr>
	<td width="32" align="center" rowspan="1"><center></center></td>
	<td colspan="2" width="408">&nbsp;Status or by it will be rectified and put into use</td><td  width="460">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" name = "ithardware_n" value ="<%=ithardware_n %>"  /></td>
</tr>

	<tr>
<td width="32" align="center" height="5" colspan="2"><center>22</center></td>

<td width="408">&nbsp;Preventive Maintenance (All IT equipment's)</td><td width="460">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" name = "preventive_e" value ="<%=preventive_e %>" readonly="readonly" onclick="popup();"/></tr>
<tr>
	<td width="32" align="center" rowspan="1"><center></center></td>
	<td colspan="2" width="408">&nbsp;To be done every quater without fail <br />&nbsp; If No, provide reason</td><td width="460">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" name = "quarter_r" value ="<%=quarter_r%>"/></td>
</tr>

</table>
 <label>Remarks (If any):</label><br />
<textarea rows="3" cols="175" name="main_remarks" style="background: lightgrey;"><%=main_remarks %></textarea> 
<!-- <table width="900"  cellspacing="0" cellpadding="0" bgcolor="lightgrey">
	<tr>
		<td><font size="3">
		<label>
		NIPPON EXPRESS (INDIA) PRIVATE LIMITED</label> 
		<b><center>
		<textarea rows="3" cols="180" ></textarea>
		</center>
		</b></font></td>
	</tr>
</table> -->
<%}

}
        catch (Exception e) {
	 		 System.out.println(e);
		}

finally{
DbUtil.closeDBResources(rst4,stt4,conn);

}
%>
	 <br />
	
	<!-- 	<table width="767" border="1" cellspacing="0" cellpadding="0">  --> 
<table border="1" cellspacing="1" width="900" align="center" ><tr>SENT TO:
			<%
//cs_id,cs_date,city,cs_time,e_name,e_designation,desg,emp,theName,transId,ps_raw,ps_upsworking,ps_upsbackup,ps_upspreventive,si_working,isp_router,udb,cr_working,wg_firewall,fdb,ln_server,NEWINS,sr_ac,tele,cctv,cctv_backup,access_con,fire_a,fire_l,ids_w,ids_l,ithardware_r,ithardware_n,preventive_e,quarter_r,main_remarks,idextend,mail,status
conn = con.getConnection2();
stt5 = conn.createStatement();
rst5 = stt5.executeQuery("select mailid  from checklistmails where cs_id  = '"+req+"'");
while(rst5.next()){
					 String mailid = rst5.getString("mailid");
	        %>
       
       <td>
       <input type ="text" readonly="readonly" name = "quarter_r" value ="<%=mailid%>"/>
       </td>  <%} 
}
catch (Exception e) {
		 System.out.println(e);
}

finally{
DbUtil.closeDBResources(rst5,stt5,conn);

} 
} catch (SQLException ex) {
    // Exception handling stuff
        ex.printStackTrace();
} finally { 

 
	if (conn != null) {try { conn.close();} catch (SQLException e) { /* ignored */}}
	DbUtil.closeDBResources(rs,st,conn);
	DbUtil.closeDBResources(rs8,st8,conn);

}
       
       
       %> 
       </tr>
      
                                      
</table>

<br />


<center>
<table align=center bgcolor="lightgrey">

   <tr> 
      <td style="font-size:1">&nbsp;&nbsp;<input style="size:1;font-size: 1.1em;" type="button"  value="BACK" onclick="window.location.href='CheckSheetSelectionHO.jsp?msg=1'"/> </td>
	<%-- <td style="size:1"><input style="font-size:1" type="submit" value="SAVE" name="save1" id="save1"/></td><!--
	  <td style="size:1">&nbsp;&nbsp;<input style="font-size:1" type="submit" value="SAVE" name="save1" id="save1" onclick="return operate();"/></td>
      --><td style="size:1">&nbsp;&nbsp;<input style="size:1" type="reset"    value="RESET"/></td>   
     <td style="font-size:1"><input style="size:1;font-size: 1.1em;" type="button"  value="PRINT" onclick="window.location.href='jasper2.jsp'"/> </td>
     <td style="size:1"><input style="font-size:1" type="submit" value="SAVE" name="save" id="save" onclick="this.disabled=true;return true;"/></td>
      <td><input type=button value=printtt onclick="window.open('D:/P1.pdf'); return true;"/></td>
      %><td><input type="button" value="PDF" name="print" id="print" disabled="disabled" onclick="link();"/></td>
       
       <td><input type="button" value="WORD" name="word" id="word" disabled="disabled" onclick="Word();"/></td><!--
      <td><input type="button" value="PDF" name="print" onclick="link();"  id="print" disabled="disabled"/></td>
       
       <td><input type="button" value="WORD" name="word" onclick="Word();" id="word" disabled="disabled"/></td>
       --%>
     <td>&nbsp;&nbsp;<a href="HelpPageCS.jsp" onclick="return popitup('HelpPageCS.jsp')" id="hiderow"><font size=2>HELP</font></a></td>
    
      
 </tr>
 
</table>


</center>
	<br /><br /><br />
</div>
</form>	

</body>

</html>