<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="CON2.DbUtil"%>

<%@page language="java"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.util.Date" %>
<%@page import = "java.sql.*" %> 
<%@page import = "java.text.DateFormat" %>
<%@page import = "java.text.SimpleDateFormat" %>

<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %><%@ include file="banner.jsp" %>
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" />

<%@page import="CON2.ConnectionLMS" %> 
<jsp:useBean id = "lms" class="CON2.ConnectionLMS" />

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<script language="javascript" type="text/javascript" src="../js/datetimepicker.js"></script>
	<link rel='stylesheet' type='text/css' href='../css/style4.css' />
<script language="javascript"   type="text/javascript" src="../js/Calendar.js"></script>
	<script language="javascript"   type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
	<script language="javascript" type="text/javascript">
	function dynamicValidation()
	{ 		//alert("working");	
	            var bkColor = "red";
				var bkColor2 = "white";
				var sa = document.form.SessionName;
				var sl = document.form.SessionCity;
				var sd = document.form.Created_date;
				var s2 = document.form.location;
				//alert("value :"+s2.value);
				 var ma = document.form.from_date;
				 var mrd = document.form.to_date;
				// var hb = document.form.mailingCheck;
				//var radios = document.getElementsByTagName('mailingCheck');
				var radios = document.form.mailingCheck;
				var ischecked_method = false;
				var ischecked_method2 = false;
					//alert(ma.value);
				 if ((sa.value==null)||(sa.value=="")||(sa.value=="NULL")){
						alert("Session Name is Empty \n Login again");
						sa.focus();
						sa.style.bkColor = sa.style.backgroundColor;
						sa.style.backgroundColor = bkColor;
						return false;
						}
				 if ((s2.value==null)||(s2.value=="")||(s2.value=="--Select--")){
						alert("Please select the Location name");
						sl.focus();
						s2.style.bkColor = s2.style.backgroundColor;
						s2.style.backgroundColor = bkColor;
						return false;
						}
				 
				/*  if ((sl.value==null)||(sl.value=="")||(sl.value=="NULL")){
						alert("Session City is Empty \n Login again");
						sl.focus();
						sl.style.bkColor = sl.style.backgroundColor;
						sl.style.backgroundColor = bkColor;
						return false;
						} */
				 if ((sd.value==null)||(sd.value=="")||(sd.value=="NULL")){
						alert("Session Date is Empty \n Login again");
						sd.focus();
						sd.style.bkColor = sd.style.backgroundColor;
						sd.style.backgroundColor = bkColor;
						return false;
						}
				 if ((ma.value==null)||(ma.value=="")||(ma.value=="NULL")){
						alert("Select From Date");
						ma.focus();
						ma.style.bkColor = ma.style.backgroundColor;
						ma.style.backgroundColor = bkColor;
						return false;
						}
				 if ((mrd.value==null)||(mrd.value=="")||(mrd.value=="NULL")){
						alert("Select To Date");
						mrd.focus();
						mrd.style.bkColor = mrd.style.backgroundColor;
						
						mrd.style.backgroundColor = bkColor;
						//mr.style.backgroundColor = bkColor2;
						return false;
						}
				
		
			var frm=document.forms[0],flds=[frm['I_date'],frm['I_time'],frm['I_viewedBy'],frm['I_viewedByIT'],frm['IncidentR'],frm['I_Remarks']],total=0;
			 if(id==0)
					//	 if(flds.length<=0)
					   {
					   alert("Please Click ADD button to Insert New Details");
					   return false;
					   }
		   
		   for (var z0=1;z0<flds[0].length;z0++)
			{
			
			   //alert("Please Click ADD button to Insert New Details :"+flds[0].length);  
			 if(flds[0][z0].value== null || flds[0][z0].value=="" || flds[0][z0].value.length == 1 )
			 {
				
			    // flds[2][z0].value = flds[0][z0].value*flds[1][z0].value;
			     //alert("Enter the ItemName ");
			     alert("Select the Date : Row - "+[z0]);
			     flds[0][z0].focus();
			     flds[0][z0].style.bkColor = flds[0][z0].style.backgroundColor;
			     flds[0][z0].style.backgroundColor = bkColor;
			     return false;
		     }
			 
			 if(flds[1][z0].value==null||flds[1][z0].value=="" || flds[1][z0].value=="NULL")
				 {
				// alert("Enter the ItemQuantity");
				 alert("Select the Time : Row - "+[z0]);
				 flds[1][z0].focus();
			     flds[1][z0].style.bkColor = flds[1][z0].style.backgroundColor;
			     flds[0][z0].style.backgroundColor = bkColor2;
			     flds[1][z0].style.backgroundColor = bkColor;
				return false;
				 }
		
			 if (flds[2][z0].value.length==0||flds[2][z0].value==null)
			 {
			    // flds[2][z0].value = flds[0][z0].value*flds[1][z0].value;
			    // alert("Select the Abbreviation");
			     alert("Enter the Name! : Row - "+[z0]);
			
			     flds[2][z0].focus();
			     flds[2][z0].style.bkColor = flds[2][z0].style.backgroundColor;
			     flds[1][z0].style.backgroundColor = bkColor2;
			     flds[2][z0].style.backgroundColor = bkColor;
			     return false;
		     }
			 if (flds[3][z0].value.length==0||flds[3][z0].value==null)
			 {
			   
			     alert("Enter the footage reviewed by IT : Row - "+[z0]);
			
			     flds[3][z0].focus();
			     flds[3][z0].style.bkColor = flds[3][z0].style.backgroundColor;
			     flds[3][z0].style.backgroundColor = bkColor2;
			     flds[3][z0].style.backgroundColor = bkColor;
			     return false;
		     }
		
			 if(flds[4][z0].value==null||flds[4][z0].value=="" || flds[4][z0].value=="NULL")
			 {
			 //alert("Enter the itemRate");
			 alert("Select Incident Status : Row - "+[z0]);
			 flds[4][z0].focus();
		     flds[4][z0].style.bkColor = flds[4][z0].style.backgroundColor;
		     flds[4][z0].style.backgroundColor = bkColor2;
		     flds[4][z0].style.backgroundColor = bkColor;
			 return false;
			 }  
		
					 
			 if( (flds[5][z0].value==null||flds[5][z0].value=="") )
			 {
			 //alert("Enter the itemRate");
			 alert("Enter the Remarks : Row - "+[z0]);
			 flds[5][z0].focus();
		     flds[5][z0].style.bkColor = flds[5][z0].style.backgroundColor;
		     flds[5][z0].style.backgroundColor = bkColor2;
		     flds[5][z0].style.backgroundColor = bkColor;
			 return false;
			 }
			 //flds[5][z0].style.backgroundColor = bkColor2;
		
			
	     } 
		 
		     
		     var checked = null;
		     var inputs = document.getElementsByName('mailingCheck');
		     for (var i = 0; i < inputs.length; i++) {
		               if (inputs[i].checked) {
		                checked = inputs[i];
		                break;
		        }
		     }
		     if(checked==null)
		     {
		         alert('Please choose an option');
		         return false;
		     }

		   /* if ((hb.value==null)||(hb.value=="")||(hb.value=="NULL")){
				alert("Select Mail ID");
				hb.focus();
				//hb.style.bkColor = hb.style.backgroundColor;
				//hb.style.backgroundColor = bkColor;
				//mr.style.backgroundColor = bkColor2;
				return false;
				} */
		  
		  return true;
		 
	}
	
	</script>	
	<script  type="text/javascript">

<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27", " ");
    disp = disp.replace("__", "  "); 
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
</script>
<script type="text/javascript">
function popitup(url) {
	newwindow=window.open(url,'name','height=300,width=1100,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
	if (window.focus) {newwindow.focus()}
	return false;
}
function ButtonClicked()
{
	
   document.getElementById("formsubmitbutton").style.display = "none"; // to undisplay
   document.getElementById("buttonreplacement").style.display = ""; // to display
   return true;
}
var FirstLoading = true;
function RestoreSubmitButton()
{
   if( FirstLoading )
   {
      FirstLoading = false;
      return;
   }
   document.getElementById("formsubmitbutton").style.display = ""; // to display
   document.getElementById("buttonreplacement").style.display = "none"; // to undisplay
}
// To disable restoring submit button, disable or delete next line.
document.onfocus = RestoreSubmitButton;

</script> 
		<style>
			.dynatable {
				border: solid 1px #000; 
				border-collapse: collapse;
			}
			
			.dynatable td {
				border: solid 1px #000; 
				padding: 2px 10px;
				width: 100px;
				text-align: center;
			}
			.dynatable .prototype {
				display:none;
			}
		</style>
		<script language="javascript"   type="text/javascript" src="../js/DynamicMR.js"></script>		<script>
		var id =0;
		
		$(document).ready(function() {
			
			
			// Add button functionality
			$("table.dynatable button.add").click(function() {
				id++;
			//alert("Alert");
				var master = $(this).parents("table.dynatable");
				
				// Get a new row based on the prototype row
				var prot = master.find(".prototype").clone();
				prot.attr("class", "")
				prot.find(".id").attr("value", id);
/* 				prot.find(".incText").attr("id","iditemName"+id); 
				
			//	prot.find(".incText").attr("id","iditemName"+id); 
				prot.find(".incHead").attr("id","idHead"+id); 
				prot.find(".incSelect").attr("id",id);
			//	prot.find(".incSel").attr("id",id); 
				
				prot.find(".incSel").attr("id",id); 
				prot.find(".incRate").attr("id","rate"+id); */
				prot.find(".incQuantity").attr("id","quantity"+id); 
				prot.find(".incTotal").attr("id","total"+id);
				master.find("tbody").append(prot);
			});
			
			// Remove button functionality
			$("table.dynatable button.remove").live("click", function() {
				$(this).parents("tr").remove();
				id--;
			});
			
		});
		
		
		
		</script>
		
<link rel='stylesheet' type='text/css' href='../css/style2.css' />
	<link rel="stylesheet" type="text/css" href="../css/Calender.css" title="style" />
<title>Insert title here</title>

</head>

<body background="../images/u.jpg">
<%
String SessionName = null,SessionCity=null,SessionCityNo=null,SessionDesg=null,SessionEmail=null;

SessionName =(String) session.getAttribute("Nname");
SessionCity =(String) session.getAttribute("NpostingCo");
SessionCityNo =(String) session.getAttribute("b_no");
SessionDesg =(String) session.getAttribute("desg");
SessionEmail =(String) session.getAttribute("Nmail");
Connection cn1 = null;
Statement st1 = null,st2 = null; 
ResultSet rs1 = null,rs2 = null;;
cn1 = con.getConnection2();
st1=cn1.createStatement();
st2=cn1.createStatement();
rs1 = st1.executeQuery("SELECT DISTINCT Nname FROM nentryho WHERE Npost='IT SUPPORT' ORDER BY Nname ASC");
rs2 = st2.executeQuery("select * from assigned_master where Locname='"+SessionName+"'");
%>
	<%
	//DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy"); %>
<form method="post" name="form" action="IncidentLogBack.jsp">
<center>
<table border="1" cellspacing="1" width="800" align="center" background="../images/s.jpg">
<tr><td colspan="5" align="left">
			<center><b><font size="3" style="font-size: medium;">CCTV Surveillance & Security Systems</font></b></center>
			<br>
			<center><b><font size="3" style="font-size: medium;">Incident Log</font></b></center>
			</td></tr>

<tr>
<td>SYS ADMIN:<%=SessionName%></td>




<td>Location Name :<select name="location" style="font-size : 8pt">
					<option value="" style="background: lightgrey;" >--Select--</option>
					<%while(rs2.next()){ %>
					<option> <%=rs2.getString("assignedLocation")%> </option> 
					<%} %> </select></td>



<%-- <td>Location Name :<%=SessionCity%></td> --%>
<td>Creating Date:<textarea id="temp_date" name="Created_date" readonly="readonly" rows="1" cols="15"> <%= po_date.format(new java.util.Date()) %> </textarea></td>
<td style="visibility: hidden; display: none">
<input type="hidden" name="idextend" value="" />
<input type="hidden" name="SessionName" value="<%=SessionName %>" />
<input type="hidden" name="SessionCity" value="<%=SessionCity %>" />
<input type="hidden" name="SessionCityNo" value="<%=SessionCityNo %>" />
<input type="hidden" name="SessionDesg" value="<%=SessionDesg %>" />
<input type="hidden" name="SessionEmail" value="<%=SessionEmail %>" />
<input type="hidden" name="f_date" value="<%= po_date.format(new java.util.Date())%>" readonly="readonly" size="28"/>
</td>
</tr>
<tr>
<td colspan="2"></td>
<td style="text-align:left;" width="220">

<input type="text"  style="width: 6em"  name="from_date" id="idCalendar3" onclick="showCalendarControl(this)" placeholder="From date" onkeypress="showCalendarControl(this)" readonly="readonly" />
		 <img src="../images/cal.gif" id="idForDay"  name="imgForDate" width="12em" height="12em"  onclick="showCalendarControl(document.getElementById('idCalendar3'))"></img>

<input type="text"  style="width: 6em"  name="to_date" id="idCalendar4" onclick="showCalendarControl(this)" placeholder="To date" onkeypress="showCalendarControl(this)" readonly="readonly" />
		<img src="../images/cal.gif" id="idForDay"  name="imgForDate" width="12em" height="12em"  onclick="showCalendarControl(document.getElementById('idCalendar4'))"></img>
		</td> 					        
</tr>
</table>
<table class="dynatable" width="80%" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
			
				<tr>
				    <td width="6" align="center"  height="21" ><button class="add" type='button'>Add</button></td>
					<td width="67" align="center"  height="21" >Sl No</td>
					<td width="67" align="center"  height="21" ><font color="red" size="4">*</font>Date</td>	
					<!-- <td width="67" align="center"  height="21" ><font color="red" size="4">*</font>Asset</td> -->				
					<td width="67" align="center"  height="21" ><font color="red" size="4">*</font>Time</td>
					<td width="67" align="center"  height="21" ><font color="red" size="4">*</font>CCTV footage Reviewed By</td>
					<td width="20" align="center"  height="21" ><font color="red" size="4">*</font>CCTV footage Reviewed By IT Dept</td>
					<td width="" align="center"  height="21" ><font color="red" size="4">*</font>Incident status</td>
					<td width="200" align="center"  height="21" ><font color="red" size="4">*</font>Remarks</td>
					
				</tr>
			
				<tr class="prototype">
				    <td width="3" align="center"  height="21" ><button class="remove" type='button'>Remove</button></td>
					<td width="67" align="center"  height="21" ><input type="text" name="id[]" value="0" size=1 class="id" readonly="readonly"/></td>
				 <!--<a href="ItemPO.jsp" onclick="return popitup('ItemPO.jsp')" id="hiderow"><font size=1>New</font></a>--></td>	
				
<!-- 					<td width="5" align="center"  height="21" ><input type="text" size="4" name="I_date" placeholder="Date"  value="" class="incQuantity" maxlength="12"/></td> -->
<td><input type="text"  style="width: 6em"  name="I_date" id="idCalendar5" onclick="showCalendarControl(this)" placeholder="Date" onkeypress="showCalendarControl(this)" readonly="readonly" />
<!-- 		 <img src="../images/cal.gif" id="idForDay"  name="imgForDate" width="12em" height="12em"  onclick="showCalendarControl(document.getElementById('idCalendar5'))"></img> --></td>

					
					<td width="67" align="center"  height="21" ><!-- <input type="datetime-local" size="4" name="I_time"  placeholder="Time" value="" class="incRate" maxlength="12"/> -->
					<div style="width: 80px; overflow: hidden;">
					    <select name="I_time" id="time" class="incRate" style="width: auto;">
		<option value="NULL" >SELECT</option>
    	<option value="5:00 AM" >5:00 AM</option>
    	<option value="5:15 AM" >5:15 AM</option>
    	<option value="5:30 AM" >5:30 AM</option>
    	<option value="5:45 AM" >5:45 AM</option>
     
    	<option value="6:00 AM" >6:00 AM</option>
    	<option value="6:15 AM" >6:15 AM</option>
    	<option value="6:30 AM" >6:30 AM</option>
    	<option value="6:45 AM" >6:45 AM</option>
     
    	<option value="7:00 AM" >7:00 AM</option>
    	<option value="7:15 AM" >7:15 AM</option>
    	<option value="7:30 AM" >7:30 AM</option>
    	<option value="7:45 AM" >7:45 AM</option>
     
    	<option value="8:00 AM" >8:00 AM</option>
    	<option value="8:15 AM" >8:15 AM</option>
    	<option value="8:30 AM" >8:30 AM</option>
    	<option value="8:45 AM" >8:45 AM</option>
     
    	<option value="9:00 AM" >9:00 AM</option>
    	<option value="9:15 AM" >9:15 AM</option>
    	<option value="9:30 AM" >9:30 AM</option>
    	<option value="9:45 AM" >9:45 AM</option>
     
    	<option value="10:00 AM" >10:00 AM</option>
    	<option value="10:15 AM" >10:15 AM</option>
    	<option value="10:30 AM" >10:30 AM</option>
    	<option value="10:45 AM" >10:45 AM</option>
     
    	<option value="11:00 AM" >11:00 AM</option>
    	<option value="11:15 AM" >11:15 AM</option>
    	<option value="11:30 AM" >11:30 AM</option>
    	<option value="11:45 AM" >11:45 AM</option>
     
    	<option value="12:00 PM" >12:00 PM</option>
    	<option value="12:15 PM" >12:15 PM</option>
    	<option value="12:30 PM" >12:30 PM</option>
    	<option value="12:45 PM" >12:45 PM</option>
     
    	<option value="1:00 PM" >1:00 PM</option>
    	<option value="1:15 PM" >1:15 PM</option>
    	<option value="1:30 PM" >1:30 PM</option>
    	<option value="1:45 PM" >1:45 PM</option>
     
    	<option value="2:00 PM" >2:00 PM</option>
    	<option value="2:15 PM" >2:15 PM</option>
    	<option value="2:30 PM" >2:30 PM</option>
    	<option value="2:45 PM" >2:45 PM</option>
     
    	<option value="3:00 PM" >3:00 PM</option>
    	<option value="3:15 PM" >3:15 PM</option>
    	<option value="3:30 PM" >3:30 PM</option>
    	<option value="3:45 PM" >3:45 PM</option>
     
    	<option value="4:00 PM" >4:00 PM</option>
    	<option value="4:15 PM" >4:15 PM</option>
    	<option value="4:30 PM" >4:30 PM</option>
    	<option value="4:45 PM" >4:45 PM</option>
     
    	<option value="5:00 PM" >5:00 PM</option>
    	<option value="5:15 PM" >5:15 PM</option>
    	<option value="5:30 PM" >5:30 PM</option>
    	<option value="5:45 PM" >5:45 PM</option>
     
    	<option value="6:00 PM" >6:00 PM</option>
    	<option value="6:15 PM" >6:15 PM</option>
    	<option value="6:30 PM" >6:30 PM</option>
    	<option value="6:45 PM" >6:45 PM</option>
     
    	<option value="7:00 PM" >7:00 PM</option>
    	<option value="7:15 PM" >7:15 PM</option>
    	<option value="7:30 PM" >7:30 PM</option>
    	<option value="7:45 PM" >7:45 PM</option>
     
    	<option value="8:00 PM" >8:00 PM</option>
    	<option value="8:15 PM" >8:15 PM</option>
    	<option value="8:30 PM" >8:30 PM</option>
    	<option value="8:45 PM" >8:45 PM</option>
     
    	<option value="9:00 PM" >9:00 PM</option>
    	<option value="9:15 PM" >9:15 PM</option>
    	<option value="9:30 PM" >9:30 PM</option>
    	<option value="9:45 PM" >9:45 PM</option>
     
    	<option value="10:00 PM" >10:00 PM</option>
    	<option value="10:15 PM" >10:15 PM</option>
    	<option value="10:30 PM" >10:30 PM</option>
    	<option value="10:45 PM" >10:45 PM</option>
     
    	<option value="11:00 PM" >11:00 PM</option>
    	<option value="11:15 PM" >11:15 PM</option>
    	<option value="11:30 PM" >11:30 PM</option>
    	<option value="11:45 PM" >11:45 PM</option>
    </select>
		</div>			
					</td>
<!-- 					<td width="67" align="center"  height="21" ><input type="textbox" size="20" name="I_viewedBy"  placeholder="Name" value="" id="total" class="incTotal" maxlength="99" /></td> -->
					<td width="100"><select name="I_viewedBy" style="font-size : 8pt">
					<option value="" style="background: lightgrey;" >--Select--</option>
					<%while(rs1.next()){ %>
					<option> <%=rs1.getString("Nname")%> </option> 
					<%} %> </select></td>
					<td width="20">
					    <select width="10" name="I_viewedByIT" style="max-width:40%;">
					        <option value="" style="background: lightgrey;" >Select</option>
					 	    <option value="Yes">Yes</option> 
					 	    <option value="No">No</option> 
					    </select>
					</td>
					<td width="107" align="center"  height="21" >
						<div style="width: 140px; overflow: hidden;">
					    <select name="IncidentR" id="icR"  style="width: auto;">
						<option value="NULL" >SELECT</option>
				    	<option value="Incident Reported" >Incident Reported</option>
				    	<option value="No Incident Reported" >No Incident Reported</option>
                        </select>
		                </div>			
															     </td>
					<td width="67" align="center"  height="21" ><input type="text" size="55" name="I_Remarks" placeholder="Remarks" maxlength="199"   value="" /></td>
					
				</tr>

  <tr style="visibility: hidden; display: none;">
  <td>
  
  </td>
  </tr>
	 
</table> 
<br />
	<!-- 	<label style="font-style:italic;font-weight:bold;">Send To: </label> -->
	<b>Send To : </b>
		<%   

        
		Connection cn13=null,cn131=null;
		Statement st13=null,stlms1=null; 
		ResultSet rs13=null,rslms1=null; 

		try{
		  cn13 = con.getConnection2();
		  cn131 = lms.getConnectionlms();
		  st13=cn13.createStatement();
		  System.out.println("Location  No: "+SessionCityNo);
		 //rs13 = st13.executeQuery("SELECT DISTINCT Nname,Npost,Nmail FROM  formuser_master WHERE admin='SuperAdmin' AND (Npost LIKE '%HR%' OR Npost LIKE '%SR.MANAGER IT%') AND SUBSTR(NpostingCo,-2,2)= '"+SessionCityNo+"'");
	    rs13 = st13.executeQuery("SELECT DISTINCT empid,empname,empdesg,empmailid FROM formapproval WHERE formtype='INCIDENTLOG' AND 	branch= '"+SessionCityNo+"'");
		 while(rs13.next())
		        {
			    String NAME = rs13.getString("empname");	  
				String Mailing=rs13.getString("empmailid");
				String Designation = rs13.getString("empdesg");
				String emp_no = rs13.getString("empid");
				
				String emailLms1=""; 
			    stlms1=cn131.createStatement();
			    rslms1 = stlms1.executeQuery("SELECT email FROM user WHERE emp_id='"+emp_no+"' ");
				if(rslms1.next())
				     {
					 emailLms1 = rslms1.getString("email");
					 }  
				
				
				
				
				String tot = NAME + "--"  + Designation + "--" + emailLms1;
		        %>
		
		
		<input type="radio" name="mailingCheck" value="<%=tot%>"/><%=NAME%> - <%=emailLms1%>
		
		
		
		<%}}
		  catch(Exception ex){
				ex.printStackTrace();
			}
			finally{
				DbUtil.closeDBResources(rs13,st13,cn13);
		
			}
		
		%>
		<br />
		<br>
      <table>
      <tr>
      <!-- <td style="size:1"><input style="font-size:1" type="submit" title="Click to Save and Send mail" value="SEND REPORT" name="save1" id="save" onclick="return(validate() && validateCheck());"  /></td> -->
	  <td style="size:1"><div id="formsubmitbutton"><input style="font-size:1" type="submit" title="Click to Save and Send mail" value="SEND REPORT" name="save1" id="save"  onclick="return (dynamicValidation());" /></div>

	    <div id="buttonreplacement" style="display:none;">
	<img src="http://www.willmaster.com/images/preload.gif" alt="loading..." />
	</div> 
	</td>

      <td>
      
      
      <a href="IncidentLogHelp.jsp" onclick="return popitup('IncidentLogHelp.jsp')" id="hiderow"><font size=2>HELP ?</font></a></td>
  <td style="font-size: 1"><input style="size: 1;" type="button" title="Back To Selection Date Page" value="BACK" onclick="window.location.href='../OtherPage.jsp?msg=1'" /></td>
	 
 
 </tr>
 
</table>
</center>
</form>
</body>
</html>