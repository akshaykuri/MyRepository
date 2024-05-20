<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="CON2.DbUtil"%>
<%@page language="java"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import = "java.util.Date" %>
<%@page import = "java.sql.*" %> 
<%@page import = "java.text.DateFormat" %>
<%@page import = "java.text.SimpleDateFormat" %>

<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ include file="../banner.jsp" %>
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />

<script type="text/javascript">
$(document).ready(function() {

	      $("#connectionDowndate").datepicker({dateFormat: 'dd-mm-yy'});
	      $("#callLoggeddate").datepicker({dateFormat: 'dd-mm-yy'});
	      $("#etrdate").datepicker({dateFormat: 'dd-mm-yy'});
	        
});	  
</script>
<script>
function popitup(url)
        {
		newwindow=window.open(url,'name','height=400,width=950,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
		if (window.focus) {newwindow.focus()}
		return false;
	    }
</script>

<script  type="text/javascript">

<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27", " ");
    disp = disp.replace("__","  ");
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
</script>

<script language="javascript" type="text/javascript">
	function Validation()
	{ 		 
		
		 var connectionDowntime1 = document.forms["form1"]["connectionDowntime1"].value;
		 var callLoggedTime1 = document.forms["form1"]["callLoggedTime1"].value; 
		 var connectionDowntime2 = document.forms["form1"]["connectionDowntime2"].value;
		 var callLoggedTime2 = document.forms["form1"]["callLoggedTime2"].value; 
		 var ttno = document.forms["form1"]["ttno"].value; 
		 var reason = document.forms["form1"]["reason"].value;  
		 var circuitid = document.forms["form1"]["circuitid"].value;  
		 var connectionDowndate = document.forms["form1"]["connectionDowndate"].value;  
		 var callLoggeddate = document.forms["form1"]["callLoggeddate"].value;  
	
		 var handledby = document.forms["form1"]["handledby"].value; 
		 var outageplanned = document.forms["form1"]["outageplanned"].value;  
		 var outagereportss = document.forms["form1"]["outagereportss"].value; 
		 var anyPlans = document.forms["form1"]["anyPlans"].value;
		 var etrdate = document.forms["form1"]["etrdate"].value;
		 var etrhrs = document.forms["form1"]["etrhrs"].value;
		 var etrmins = document.forms["form1"]["etrmins"].value;
		 var plannedorunplanned = document.forms["form1"]["plannedorunplanned"].value;
		 
		  
		 
		 if(plannedorunplanned == "Select"){	
			 alert("Select Outage planned or unplanned");
            return false;     
		    }
		 if(circuitid == "Select"){	
			 alert("Select Circuit Id");
            return false;     
		    } 
		 
		 if(connectionDowntime1 == "HH"){	
			 alert("Select Link Down Hours");
             return false;     
		    }  
		 if(connectionDowntime2 == "MM"){	
			 alert("Select Link Down Minutes");
             return false;     
		    }  
		if(connectionDowndate == ''){	
			 alert("Enter connection Down date");
             return false;     
		    }  
		if(etrdate == ''){	
			 alert("Enter Expected connection Restoring date");
           return false;     
		    } 
		if(etrhrs == "HH"){	
			 alert("Enter Expected connection Restoring Hours");
            return false;     
		    }  
		 if(etrmins == "MM"){	
			 alert("Enter Expected connection Restoring Minutes");
            return false;     
		    } 
		 if(ttno == ''){	
			 alert("Enter TT NO");
            return false;     
		    }  
		if(callLoggeddate == ''){	
			 alert("Enter call Logge date");
           return false;     
		    }  
		if(callLoggedTime1 == "HH"){	
			 alert("Select call Logged Hours");
            return false;     
		    }  
		if(callLoggedTime2 == "MM"){	
			 alert("Select call Logged Minutes");
           return false;     
		    }  
		
		if(reason == ''){	
			 alert("Enter reason");
            return false;     
		    } 
		if(handledby == ''){	
			 alert("Enter Case handeled by");
           return false;     
		    } 
		 if(outageplanned == ''){	
			 alert("Enter Why the outage is Planned/Unplanned");
           return false;     
		    } 
		
		 if(outagereportss == ''){	
			 alert("Enter Outage report from ISP:");
           return false;     
		    } 
		 
		 if(anyPlans == ''){	
			 alert("Any plans to fix,circumstance or risks,etc.(if any)");
           return false;     
		    }
		 
var         intimation = document.forms["form1"]["intimation"].value; 

		 if(intimation == '0'){	
			 alert("Select atleast one Group for Send intimation");
           return false;     
		    }
		 
		 
		return true;
	}
	
</script>	

<script type="text/javascript"> 
$(function () {
    $(".groupClass").click(function () {  
    	var id=this.id;
    	var value1 = document.forms["form1"][id].value;
    	var intimation = document.forms["form1"]["intimation"].value; 
    	
        if (this.checked) { 
        	document.getElementById("intimation").value=intimation+","+value1;
        	
        }
        else{
        	var aa=","+value1;
        	var bb=intimation.replace(aa, '');
        	document.getElementById("intimation").value = bb;
        }
        
    });
});
</script> 

<script> 
function getdetails(str){  
	
	if (typeof XMLHttpRequest != "undefined"){    
      xmlHttp= new XMLHttpRequest();    
        }      else if (window.ActiveXObject){    
          xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
              }      if (xmlHttp==null){   
                                       alert("Browser does not support XMLHTTP Request");   
                                       return;     
                                       }      
              
                         var url="GetCircuitBranchDetails.jsp";  
                           url +="?circuitid=" +str;   
                           xmlHttp.onreadystatechange = onstateChange1;  
                           xmlHttp.open("GET", url, true);   
                           xmlHttp.send(null);    
         }   
         
function onstateChange1()
{     

var str1=xmlHttp.responseText;
if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
        { 
        
        document.getElementById("resultFromAjax1").innerHTML = str1;
        document.getElementById("Linktype").value =  document.getElementById("p3").value;
        document.getElementById("Location").value =  document.getElementById("p4").value;
        document.getElementById("LAN").value =  document.getElementById("p5").value;
        document.getElementById("WAN").value =  document.getElementById("p6").value;
        document.getElementById("Bandwidth").value =  document.getElementById("p8").value;
        document.getElementById("Media").value =  document.getElementById("p9").value;
        document.getElementById("ARC").value =  document.getElementById("p10").value;
        document.getElementById("OTC").value =  document.getElementById("p11").value;
        document.getElementById("Account_Relationship").value =  document.getElementById("p7").value;
        document.getElementById("b_id").value =  document.getElementById("p12").value;
        document.getElementById("b_no").value =  document.getElementById("p13").value;
        document.getElementById("isp_name").value =  document.getElementById("p14").value;         
        document.getElementById("domesticmpls").value =  document.getElementById("p15").value;  
        document.getElementById("b_name").value =  document.getElementById("p16").value; 
        //document.getElementById("pxy").value =  document.getElementById("pxy").value;
        
        }
   else
        { 
        document.getElementById("resultFromAjax1").innerHTML = str1;
        document.getElementById("Linktype").value = "";
        document.getElementById("Location").value =""; 
        document.getElementById("LAN").value = "";
        document.getElementById("WAN").value = "";
        document.getElementById("Bandwidth").value = "";
        document.getElementById("Media").value =""; 
        document.getElementById("ARC").value = "";
        document.getElementById("OTC").value = "";
        document.getElementById("Account_Relationship").value = "";
        document.getElementById("b_id").value = "";
        document.getElementById("b_no").value = "";
        document.getElementById("isp_name").value = "";        
        document.getElementById("domesticmpls").value =  "";    
        document.getElementById("b_name").value = ""; 
        }
     
}
</script>

<script type="text/javascript"> 
$(function () {
    $(".serviceType").click(function () {  
    	var id=this.id;
    	var serviceTypeIds = document.getElementById(id).value;  
    	var serviceType = document.forms["form1"]["serviceTypeids"].value;
    	      	
        if (this.checked) {   
              serviceType=serviceType+","+serviceTypeIds;  
        	  document.getElementById("serviceTypeids").value =serviceType;
        	
        }
        else{
        	var aa=","+serviceTypeIds;
        	var bb=serviceType.replace(aa, '');
        	document.getElementById("serviceTypeids").value = bb;
        }
        
    });
});
</script> 
<script type="text/javascript"> 
$(function () {
    $(".notserviceType").click(function () {  
    	var id=this.id;
    	var serviceTypeIdsnot = document.getElementById(id).value;
    	var serviceTypenot = document.forms["form1"]["serviceTypeidsnot"].value;
    	    	
        if (this.checked) {  
        		serviceTypenot=serviceTypenot+","+serviceTypeIdsnot;
        	    document.getElementById("serviceTypeidsnot").value =serviceTypenot;
        	
        }
        else{
        	var aa=","+serviceTypeIdsnot;
        	var bb=serviceTypenot.replace(aa, '');
        	document.getElementById("serviceTypeidsnot").value = bb;
        }
        
    });
});
</script> 

</head>

<body background="../images/u.jpg">
<form method="post" name="form1" action="InsertIsp.jsp">
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
   <tr align="center">
         <td width="1000" align="left"><img src="../images/logo.png" height="35" width="220"> </td>
         <!-- <td width="115" align="right"><img src="../images/cs-soft.jpg" height="30" width="100" > </td> -->
     </tr> 
   <tr align="center">
          <td class="greenLine"><strong><font size ="4" color="white" ><b> WELCOME </b></font></strong></td>
   </tr>
   <tr align="center">
    <td class="blueLine"><strong><font size ="4" color="white">C2IT (CONNECT TO IT)</font></strong></td>
   </tr>
   <tr> 
      <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp;<font size ="2">DESG :<%=session.getAttribute("desg")%> </font>

                <input type="hidden" name="empid" id="empid" value='<%=session.getAttribute("empid")%>'>
                <input type="hidden" name="branch_no" id="branch_no" value='<%=session.getAttribute("b_no")%>'>
                <input type="hidden" name="i_email_id" id="i_email_id" value='<%=session.getAttribute("Nmail")%>'>
                <input type="hidden" name="i_name" id="i_name" value='<%=session.getAttribute("Nname")%>'>
       </td>
    </tr>
   </table>
   
   <%
     String handledby=null;
            handledby=(String)session.getAttribute("Nname")+","+(String)session.getAttribute("Nmail");
   
   %>
   
<br><br>
<table  align="center" border="1" width="70%" style="margin-left:110px;"> 
   <tr>
       <td><span style="color:red;">*</span>Outage</td>
       <td><select name="plannedorunplanned" id="plannedorunplanned" >
		        <option value="Select">Select</option> 
		        <option value="Planned">Planned</option> 
		        <option value="Unplanned">Unplanned</option> 
	           </select>
	  </td>
   <td><span style="color:red;">*</span>Circuit Id:</td><td>
   <%        
						     Connection con1 = null; 
						     Connection2 dbConn = new Connection2();
						     con1 = dbConn.getConnection2();
						    
                             Statement st1=null,st2=null,st3=null,st4=null;
                             ResultSet rs1=null,rs2=null,rs3=null,rs4=null; 
                             
                             String bNo=(String)session.getAttribute("b_no"); 
                             String query=null;
                           try
                              {
	                           
                               
                              if(bNo.equals("90")){
                            	  query = "SELECT * FROM `circuitidmaster_details` c INNER JOIN branch_master b1 ON b1.id=c.`branch_id` where b1.b_no in(90) ";
                                 }
                              if(bNo.equals("40")){
                           	   
	                           	   query = "SELECT * FROM `circuitidmaster_details` c INNER JOIN branch_master b1 ON b1.id=c.`branch_id` where b1.b_no in(40,41,52,43,42) ";
                               }
                              if(bNo.equals("20")){ 
                           	   
                            	  query = "SELECT * FROM `circuitidmaster_details` c INNER JOIN branch_master b1 ON b1.id=c.`branch_id` where b1.b_no in(20,51,21,89,88,22,23,24,25,26,27,28)";
                              }
                              if(bNo.equals("30")){ 
                           	   
                            	  query = "SELECT * FROM `circuitidmaster_details` c INNER JOIN branch_master b1 ON b1.id=c.`branch_id` where b1.b_no in(30,31,53,32,11)";
                              }
                              if(bNo.equals("10")){ 
                           	   
                            	  query = "SELECT * FROM `circuitidmaster_details` c INNER JOIN branch_master b1 ON b1.id=c.`branch_id` where b1.b_no in(10)";
                              }
                              if(!(bNo.equals("10") || bNo.equals("20") || bNo.equals("30") || bNo.equals("40") || bNo.equals("90"))){ 
                            	  query = "SELECT * FROM `circuitidmaster_details` c INNER JOIN branch_master b1 ON b1.id=c.`branch_id` where b1.b_no='"+bNo+"'";
                              }
                               
                              
                            //   String query = "SELECT * FROM `circuitidmaster_details`";
                               st1 = con1.createStatement();
                               rs1 = st1.executeQuery(query);
                              %>
                <select name="circuitid" id="circuitid" onchange="getdetails(this.value)">
		        <option >Select</option>
	              <%while(rs1.next()){%>
			        <option value="<%=rs1.getString(2)%>"><%=rs1.getString(2)%></option>
    	            <%}%> 
	           </select>

                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                       //	DbUtil.closeDBResources(rs,st,con);
		                     
                            	}%>
        </td>
		<td> <span style="color:red;">*</span>Link Type:</td>
		<td><input type="text" name="Linktype" id="Linktype"   readonly size ="30"></td>
	</tr>
	<tr>
		<td> <span style="color:red;">*</span>ISP Name:</td>
		<td><input type="text" name="isp_name" id="isp_name"   readonly size ="30"></td>
		<td> <span style="color:red;">*</span>Location:</td>   
		<td><input type="text" name="Location" id="Location"   readonly size ="30">
		    <input type="hidden" name="b_id" id="b_id"   readonly size ="30">
		    <input type="hidden" name="b_no" id="b_no"   readonly size ="30">
		    <input type="hidden" name="b_name" id="b_name"   readonly size ="30"> 
		    </td>
        <td><span style="color:red;">*</span>LAN Pool:</td>   
        <td><input type="text" name="LAN" id="LAN"  readonly size ="30"></td>	
	 </tr>
     <tr>
		<td><span style="color:red;">*</span>WAN Pool:</td>   
		<td><input type="text" name="WAN" id="WAN"   readonly size ="30"></td>
		 <td><span style="color:red;">*</span>Account/Relationship No: </td> 
		<td><input type="text" name="Account_Relationship" id="Account_Relationship"  readonly size ="30"></td>
		<td><span style="color:red;">*</span>BandWidth:</td> 
		<td><input type="text" name="Bandwidth" id="Bandwidth"   readonly size ="30"></td>
	 </tr>
     <tr>
		<td><span style="color:red;">*</span>Media: </td>     
		<td><input type="text" name="Media" id="Media"   readonly size ="30"></td>
	    <td><span style="color:red;">*</span>ARC:  </td>      
		<td><input type="text" name="ARC" id="ARC"   readonly size ="30"></td>
       	<td><span style="color:red;">*</span>OTC: </td>       
        <td><input type="text" name="OTC" id="OTC"   readonly size ="30"></td>	
	 </tr>
     <tr> 
		<td><span style="color:red;">*</span>Link Down Time: </td>  
		<td>
		  <input type="text" name="connectionDowndate" id="connectionDowndate"  size ="10"   placeholder="dd-mm-yy" readonly>
		  <select name="connectionDowntime1" id="connectionDowntime1">
		  <option value="HH">HH</option>
		  <option value="00">00</option>
		  <option value="01">01</option>
		  <option value="02">02</option>
		  <option value="03">03</option>
		  <option value="04">04</option>
		  <option value="05">05</option>
		  <option value="06">06</option>
		  <option value="07">07</option>
		  <option value="08">08</option>
		  <option value="09">09</option>
		  <option value="10">10</option>
		  <option value="11">11</option>
		  <option value="12">12</option>
		  <option value="13">13</option>
		  <option value="14">14</option>
		  <option value="15">15</option>
		  <option value="16">16</option>
		  <option value="17">17</option>
		  <option value="18">18</option>
		  <option value="19">19</option>
		  <option value="20">20</option>
		  <option value="21">21</option>
		  <option value="22">22</option>
		  <option value="23">23</option>
		  </select>
		  
		   <select name="connectionDowntime2" id="connectionDowntime2">
		  <option value="MM">MM</option>
		  <option value="00">00</option>
		  <option value="15">15</option>
		  <option value="30">30</option>
		  <option value="45">45</option>
		  </select>
		</td>
		<td><span style="color:red;">*</span>Expected Time Of Restoring: </td>  
		<td>
		  <input type="text" name="etrdate" id="etrdate"  size ="10"   placeholder="dd-mm-yy" readonly>
		  <select name="etrhrs" id="etrhrs">
		  <option value="HH">HH</option>
		  <option value="00">00</option>
		  <option value="01">01</option>
		  <option value="02">02</option>
		  <option value="03">03</option>
		  <option value="04">04</option>
		  <option value="05">05</option>
		  <option value="06">06</option>
		  <option value="07">07</option>
		  <option value="08">08</option>
		  <option value="09">09</option>
		  <option value="10">10</option>
		  <option value="11">11</option>
		  <option value="12">12</option>
		  <option value="13">13</option>
		  <option value="14">14</option>
		  <option value="15">15</option>
		  <option value="16">16</option>
		  <option value="17">17</option>
		  <option value="18">18</option>
		  <option value="19">19</option>
		  <option value="20">20</option>
		  <option value="21">21</option>
		  <option value="22">22</option>
		  <option value="23">23</option>
		  </select>
		  
		   <select name="etrmins" id="etrmins">
		  <option value="MM">MM</option>
		  <option value="00">00</option>
		  <option value="15">15</option>
		  <option value="30">30</option>
		  <option value="45">45</option>
		  </select>
		</td>
		
		<td><span style="color:red;">*</span>TT No:</td>      
		<td><input type="text" name="ttno" id="ttno"   size ="30"></td>
	</tr>	
	<tr>	
		<td><span style="color:red;">*</span>CallLogged Time:</td>   
		<td>
		   <input type="text" name="callLoggeddate" id="callLoggeddate"  size ="10" placeholder="dd-mm-yy" readonly>
		  <select name="callLoggedTime1" id="callLoggedTime1">
		  <option value="HH">HH</option>
		  <option value="00">00</option>
		  <option value="01">01</option>
		  <option value="02">02</option>
		  <option value="03">03</option>
		  <option value="04">04</option>
		  <option value="05">05</option>
		  <option value="06">06</option>
		  <option value="07">07</option>
		  <option value="08">08</option>
		  <option value="09">09</option>
		  <option value="10">10</option>
		  <option value="11">11</option>
		  <option value="12">12</option>
		  <option value="13">13</option>
		  <option value="14">14</option>
		  <option value="15">15</option>
		  <option value="16">16</option>
		  <option value="17">17</option>
		  <option value="18">18</option>
		  <option value="19">19</option>
		  <option value="20">20</option>
		  <option value="21">21</option>
		  <option value="22">22</option>
		  <option value="23">23</option>
		  </select>
		  
		   <select name="callLoggedTime2" id="callLoggedTime2">
		  <option value="MM">MM</option>
		  <option value="00">00</option>
		  <option value="15">15</option>
		  <option value="30">30</option>
		  <option value="45">45</option>
		  </select>
		</td> 
        <td><span style="color:red;">*</span>Case handled by:</td>
        <td colspan="3"><input type="text" name="handledby" id="handledby" value="<%=handledby%>" readonly size="60"></td>
   </tr>
   <tr>
        <td colspan="2"><span style="color:red;">*</span>Reason/What went wrong:</td>   
		<td colspan="4"><textarea rows="2" cols="70" name="reason" id="reason"></textarea></td>
   </tr>
    <tr>
      <td colspan="2"><span style="color:red;">*</span>Why the outage is Planned/Unplanned:</td>
      <td colspan="4"><textarea rows="1" cols="70" name="outageplanned" id="outageplanned"></textarea></td>
    </tr>
    <tr> 
      <td colspan="2"><span style="color:red;">*</span>Impacted domestic MPLS sites:</td>
      <td colspan="4">
        <textarea rows="2" cols="70" name="domesticmpls" id="domesticmpls" readonly></textarea>
      </td>
    </tr>
    <tr>
      <td colspan="2"><span style="color:red;">*</span>Outage report from ISP:</td>
      <td colspan="4"><textarea rows="1" cols="70" name="outagereportss" id="outagereportss"></textarea></td>
    </tr>
    <tr>
      <td colspan="2"><span style="color:red;">*</span>List of services affected:</td>
      <td colspan="4"><!-- <textarea rows="2" cols="70" name="affectedServices" id="affectedServices"></textarea> -->
         
         <%
         try
         {
           
       	  String query1 = "SELECT * FROM `servicetype_master` ";
       	  st2 = con1.createStatement();
          rs2 = st2.executeQuery(query1);
            
          int xyz=0;
          while(rs2.next()){ 
    	       xyz=xyz+1;
    	       String idxyz="serviceType"+xyz;
       %>
           <input type="checkbox" id="<%=idxyz%>" name="serviceType" value="<%=rs2.getString("serviceType")%>" class="serviceType" > 
           <%=rs2.getString("serviceType")%>&nbsp;&nbsp;
          
           <%}%>
           <input type="hidden" id="serviceTypeids" name="serviceTypeids" readonly>
          
         <%}catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                       //	DbUtil.closeDBResources(rs,st,con);
		                     
                            	}%>
      </td>
    </tr>
    <tr>
      <td colspan="2"><span style="color:red;">*</span>List of services not affected:</td>
      <td colspan="4">
      <!-- <textarea rows="1" cols="70" name="notaffectedServices" id="notaffectedServices"></textarea> -->
      
      <%
         try
         {
          
       	  String query2 = "SELECT * FROM `servicetype_master` ";
       	  st3 = con1.createStatement();
          rs3 = st3.executeQuery(query2);
           
          int xyz1=0;
          while(rs3.next()){ 
    	       xyz1=xyz1+1;
    	       String idxyz11="notserviceType"+xyz1;
       %>
           <input type="checkbox" id="<%=idxyz11%>" name="notserviceType"  value="<%=rs3.getString("serviceType")%>" class="notserviceType" > 
           <%=rs3.getString("serviceType")%>&nbsp;&nbsp;
          
           <%}%>
           <input type="hidden" id="serviceTypeidsnot" name="serviceTypeidsnot" readonly>
          
         <%}catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                       //	DbUtil.closeDBResources(rs,st,con);
		                      
                            	}%>
      
      </td>
    </tr> 
    <tr>
      <td colspan="2"><span style="color:red;">*</span>Any plans to fix,circumstance or risks,etc.(if any):</td>
      <td colspan="4"><textarea rows="1" cols="80" name="anyPlans" id="anyPlans"></textarea></td>
    </tr>
   <tr>
      <td colspan="2"> <span style="color:red;">*</span><b>Intimation Send To:</b>  </td>
                      
      
      <td colspan="4">
<% 
				int abc=0;
				String query1=null;
			try
			{
			 
			//String query = "select * from ispoutageemailgroup_master ";
			
			if(bNo.equals("90")){
                query1 = "select distinct isp.id,b.m_b_name,isp.groupName,b.id from ispoutageemailgroup_master isp "+
		                 " INNER JOIN branch_master_main b ON b.id=isp.branchId"+
		                 " INNER JOIN ispoutageemailadd_master i ON i.groupId=isp.id"+
		                 " where isp.branchId IN (select b1.id from branch_master_main b1 where b1.m_b_no in(90))";
              }
           if(bNo.equals("40")){
        	   query1 = "select distinct isp.id,b.m_b_name,isp.groupName,b.id from ispoutageemailgroup_master isp "+
		               "INNER JOIN branch_master_main b ON b.id=isp.branchId"+
		               " INNER JOIN ispoutageemailadd_master i ON i.groupId=isp.id"+
		               " where isp.branchId IN (select b1.id from branch_master_main b1 where b1.m_b_no in(40,41,52,43,42) ORDER BY b_name)";
            }
           if(bNo.equals("20")){ 
        	   query1 = "select distinct isp.id,b.m_b_name,isp.groupName,b.id from ispoutageemailgroup_master isp "+
		               "INNER JOIN branch_master_main b ON b.id=isp.branchId"+
		               " INNER JOIN ispoutageemailadd_master i ON i.groupId=isp.id"+
		               " where isp.branchId IN (select b1.id from branch_master_main b1 where b1.m_b_no in(20,51,21,89,88,22,23,24,25,26,27,28) ORDER BY b_name)";
           }
           if(bNo.equals("30")){ 
        	   query1 = "select distinct isp.id,b.m_b_name,isp.groupName,b.id from ispoutageemailgroup_master isp "+
		               "INNER JOIN branch_master_main b ON b.id=isp.branchId"+
		               " INNER JOIN ispoutageemailadd_master i ON i.groupId=isp.id"+
		               " where isp.branchId IN (select b1.id from branch_master_main b1 where b1.m_b_no in(30,31,53,32) ORDER BY b_name)";
           }
           if(bNo.equals("10")){ 
        	   query1 = "select distinct isp.id,b.m_b_name,isp.groupName,b.id from ispoutageemailgroup_master isp "+
		               "INNER JOIN branch_master_main b ON b.id=isp.branchId"+
		               " INNER JOIN ispoutageemailadd_master i ON i.groupId=isp.id"+
		               " where isp.branchId IN (select b1.id from branch_master_main b1 where b1.m_b_no in(10,11) ORDER BY b_name)";
           }
           if(!(bNo.equals("10") || bNo.equals("20") || bNo.equals("30") || bNo.equals("40") || bNo.equals("90"))){ 
        	   query1 = "select distinct isp.id,b.m_b_name,isp.groupName,b.id from ispoutageemailgroup_master isp "+
		                "INNER JOIN branch_master_main b ON b.id=isp.branchId"+ 
		                " INNER JOIN ispoutageemailadd_master i ON i.groupId=isp.id"+
		                " where isp.branchId IN (select b1.id from branch_master_main b1 where b1.m_b_no ='"+bNo+"' ORDER BY b_name)";
           }
           
			st4 = con1.createStatement();
			rs4 = st4.executeQuery(query1);
			%>
			<%while(rs4.next()){
			   abc=abc+1;%>
			   <input type="checkbox" name="sendto" id="sendto<%=abc%>" value="<%=rs4.getInt(1)%>" class="groupClass">
			   <a href="DisplayISPOutageEmailDetails.jsp?groupName=<%=rs4.getString(3)%>&branchId=<%=rs4.getString(4)%>" onclick="return popitup('DisplayISPOutageEmailDetails.jsp?groupName=<%=rs4.getString(3)%>&branchId=<%=rs4.getString(4)%>')"><%=rs4.getString(3)%></a>
			
			<%}%>
			<input type="hidden" name="intimation" id="intimation" value="0">
			<%} catch (SQLException ex) {
			    ex.printStackTrace();
			}	
			finally{
				con1.close();
						}%> 
     </td> 
    </tr>
   <tr> 
        <td colspan="6" align="center"><input type="submit" value="Submit" onclick="return (Validation());">&nbsp &nbsp &nbsp &nbsp <input type="reset" value="Reset"></td>
   </tr>
 </table>
 
<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
	<tr> 
	<td width="1000" align="left"> 
	<a href="../HOME.jsp?msg=1"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
	</td> 
	<td width="115" align="right"> 
	<a href="../OtherPage.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
	</td> 
	</tr> 
</table> 
   <div id="resultFromAjax2" style="display:none;">
        
       </div>
       <div id="resultFromAjax1" style="display:none;">
        
       </div>
  <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
<tr align="center"> <td class="greenLine" >&nbsp;</td></tr>
<tr align="center"><td class="blueLine" >&nbsp;</td></tr>

  </table>
</form>
</body>
</html>