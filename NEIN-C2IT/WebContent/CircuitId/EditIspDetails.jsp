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
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script>
function myfunction() {
	
	 var connectionRestoredTime1 = document.forms["form1"]["connectionRestoredTime1"].value;
	 var connectionRestoredTime2 = document.forms["form1"]["connectionRestoredTime2"].value;
	 var connectionRestoreddate = document.forms["form1"]["connectionRestoreddate"].value;  
	 if(connectionRestoreddate == ''){	
		 alert("Enetr  connection Restored date");
       return false;     
	    }  
	 if(connectionRestoredTime1 == "HH"){	
		 alert("Select connection Restored Hours");
        return false;     
	    }
	 if(connectionRestoredTime2 == "MM"){	
		 alert("Select connection Restored Minutes");
        return false;     
	    }
	
	  var callLoggedTime = document.forms["form1"]["callLoggedTime"].value;
	  var conRestoredTime1 = document.forms["form1"]["connectionRestoredTime1"].value;  
	  var conRestoredTime2 = document.forms["form1"]["connectionRestoredTime2"].value; 
	  var conRestoredTime=conRestoredTime1+":"+conRestoredTime2;
	  
	  var caldate = document.forms["form1"]["callLoggeddate"].value;
	  var conRedate = document.forms["form1"]["connectionRestoreddate"].value;
	  	                  
	  var aaa= callLoggedTime.substring(0, 2);
	  var bbb=conRestoredTime.substring(0, 2); 
	  var aaaa= callLoggedTime.substring(3, 5);
	  var bbbb=conRestoredTime.substring(3, 5);
	  
	  var sptdate = String(caldate).split("-");
	  var myYear = sptdate[0];
	  var myMonth = sptdate[1];
	  var myDay = sptdate[2];
	  
	  var combineDatestr =  myYear + "/" + myMonth + "/" + myDay;
	  var dt = new Date(combineDatestr);

	  var sptdate1 = String(conRedate).split("-");
	  var myDay1 = sptdate1[0];
	  var myMonth1 = sptdate1[1];
	  var myYear1= sptdate1[2];	
	  
	  var combineDatestr1 =  myYear1 + "/" + myMonth1 + "/" + myDay1;
	  var dt1 = new Date(combineDatestr1);	 
	  var days   = ((dt1 - dt)/1000/60/60/24)+1;	
	  
	  days=(days-1)*24;	
	  
	  var hours=days;	
	  var min;
	 	  
    if(aaaa < bbbb){   
		  min=+bbbb - +aaaa;		  
	  }
     if(aaaa > bbbb){ 
    	 min=+60 - +aaaa;
    	 hours=+hours -1;
	  }
     if(aaaa == bbbb){		  
		  min=00;		  
	  }
	 
	  if(days == 0){		
		  if( (aaa>bbb) || ( (aaa == bbb)&&(aaaa>bbbb) ) ){	  
			  alert("Please select Time Call Logged Time less then Link Restored Time");
			  document.getElementById("TotalDownTime").value =""; 		
			  return false;
		   }
		  else{	
			  hours=+hours + +bbb - +aaa;
			  document.getElementById("TotalDownTime").value =hours+":"+min;		  
		   }			  
	    }
	  else{		
		  hours=+hours + +bbb - +aaa;		
		  document.getElementById("TotalDownTime").value =hours+":"+min;		   		  
	  }	
	  
	  
	 if(hours <= 4){
		  
		  document.getElementById("remarks").value ="Good";	  
	  }
	 else if((hours > 4) && (hours <= 24)){
		  
		  document.getElementById("remarks").value ="Satisfactory";	  
	  }
	 else if((hours > 24) && (hours <= 48)){
	  
	  document.getElementById("remarks").value ="Poor";	  
     }
	 
	 else{
		 
		 document.getElementById("remarks").value ="Worst";	  
	 }
	  
 }
</script>
<script type="text/javascript">

$(document).ready(function() {
	 
	      /*  $("#connectionDowntime").datepicker({dateFormat: 'dd-mm-yy'+"   "+hours+":"+minutes});		 
	       $("#callLoggedTime").datepicker({dateFormat: 'dd-mm-yy'+"  "+hours+":"+minutes});	 */
	      /* $("#connectionDowndate").datepicker({dateFormat: 'dd-mm-yy'});	
		   $("#connectionDowntime").timepicker({
		   		         timeFormat: 'HH:mm',
		   	             minTime: '01:00',
		   	             maxHour: 12,
		   	             maxMinutes: 55,	    	           
		   	             startTime: new Date(0,0,0,12,0,0),
		   	             interval: 05});
	       
		  $("#callLoggeddate").datepicker({dateFormat: 'dd-mm-yy'});	
	      $("#callLoggedTime").timepicker({
	   		         timeFormat: 'HH:mm',
	   	             minTime: '01:00',
	   	             maxHour: 12,
	   	             maxMinutes: 55,	    	           
	   	             startTime: new Date(0,0,0,12,0,0),
	   	             interval: 05});
	       */
	      var caldate = document.forms["form1"]["callLoggeddate"].value;	 
	       
	       var sptdate = String(caldate).split("-");
	 	   var myYear = sptdate[0];
	 	   var myMonth = sptdate[1];
	 	   var myDay = sptdate[2];
	       var mind=myDay+"-"+myMonth+"-"+myYear;
	 	   
	      $("#connectionRestoreddate").datepicker({dateFormat: 'dd-mm-yy',minDate: mind});	
	       
	     /*  $("#connectionRestoredTime").timepicker({
	   		         timeFormat: 'HH:mm',
	   	             minTime: '00:00',
	   	             maxHour: 23,
	   	             maxMinutes: 55,	    	           
	   	             startTime: new Date(0,0,0,0,0,0),
	   	             interval: 15}); */

       }); 
	
</script>
<script language="javascript" type="text/javascript">
	function Validation()
	{ 		
		 var connectionRestoredTime1 = document.forms["form1"]["connectionRestoredTime1"].value;
		 var connectionRestoredTime2 = document.forms["form1"]["connectionRestoredTime2"].value;
		 var conRedate = document.forms["form1"]["connectionRestoreddate"].value;
		 if(conRedate == ''){	
			 alert("Select connection Restored date");
	        return false;     
		    }
		 if(connectionRestoredTime1 == "HH"){	
			 alert("Select connection Restored Hours");
	        return false;     
		    }
		 if(connectionRestoredTime2 == "MM"){	
			 alert("Select connection Restored Minutes");
	        return false;     
		    }
		 //var callLoggedTime = document.forms["form1"]["callLoggedTime"].value; 
		 var ttno = document.forms["form1"]["ttno"].value; ; 
		 var reason = document.forms["form1"]["reason"].value;  
		 var circuitid = document.forms["form1"]["circuitid"].value;  
		 //var connectionRestoredTime = document.forms["form1"]["connectionRestoredTime"].value;  
		 var OutageReport = document.forms["form1"]["OutageReport"].value;  
		 var TotalDownTime = document.forms["form1"]["TotalDownTime"].value;  
		 var connectionRestoreddate = document.forms["form1"]["connectionRestoreddate"].value;  
		 
		 
		 if(connectionRestoreddate == ''){	
			 alert("Enetr  connection Restored date");
           return false;     
		    }  
		 
		 
		 if(OutageReport == ''){	
			 alert("Enter Outage Report");
            return false;     
		    }  
		 
		if(TotalDownTime == ''){	
			 alert("Enter Total Down Time");
             return false;     
		    }  
		 
		 
		 if(circuitid == "Select"){	
			 alert("Select Circuit Id");
            return false;     
		    }  
		 
		 if(ttno == ''){	
			 alert("Enter TT NO");
            return false;     
		    }  
		
		if(reason == ''){	
			 alert("Enter reason");
            return false;     
		    }  
		
		 
		return true;
	}
	
</script>	

</head>
<body background="../images/u.jpg">
<form method="post" name="form1" action="UpdateIsp.jsp">
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
   <tr align="center">
         <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
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
                
                </td>
 </tr>
   </table>
<br><br>
<table  align="center" border="1" width="70%" style="margin-left:110px;"> 
<%                           Connection con5 = null;  
                             String isp =request.getParameter("msg");
                              
                             Statement st5=null,st6=null,st7=null,st8=null;
                             ResultSet rs5=null,rs6=null,rs7=null,rs8=null;  
                             
                             Connection2 dbConn = new Connection2();
                             con5 = dbConn.getConnection2();                       
                           try
                              {
	                            
                               String query5 = "SELECT * ,b.b_name FROM `circuitid_details` INNER JOIN branch_master b ON b.id=circuitid_details.branch_id where ispoutageno='"+isp+"'";
                               st5 = con5.createStatement();
                               rs5 = st5.executeQuery(query5);
                             
                               while(rs5.next()){
                            	    
                               %>
                             
                             
   <tr>
       <td colspan="6"><span style="color:red;">*</span>
            ISP Outage No: <input type="text" name="ispoutage" id="ispoutage" value='<%=rs5.getString("ispoutageno")%>'  readonly size ="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Outage: <input type="text" name="ispoutage" id="ispoutage" value='<%=rs5.getString("plannedType")%>'  readonly size ="30">
       </td>
  </tr>                     
   
   <tr>
        <td><span style="color:red;">*</span>
		  Circuit Id:</td><td>
		  <input type="text" name="circuitid" id="circuitid" value='<%=rs5.getString(4)%>'  readonly size ="30">
		 </td>
		<td> <span style="color:red;">*</span>Link Type:</td>
		<td><input type="text" name="Linktype" id="Linktype" value='<%=rs5.getString("linktype_id")%>'  readonly size ="30"></td>
		<td> <span style="color:red;">*</span>ISP Name:</td>
		<td><input type="text" name="isp_name" id="isp_name" value='<%=rs5.getString("isp_name")%>'  readonly size ="30"></td>
	 </tr>

   <tr>	
   <td> <span style="color:red;">*</span>Location:</td>   
		<td><input type="text" name="Location" id="Location"  value='<%=rs5.getString("b_name")%>' readonly size ="30">
		    <input type="hidden" name="b_id" id="b_id"  value='<%=rs5.getString("branch_id")%>' readonly size ="30"></td>
        <td><span style="color:red;">*</span>LAN Pool:</td>   
        <td><input type="text" name="LAN" id="LAN" value='<%=rs5.getString("lanpool")%>' readonly size ="30"></td>	
		<td><span style="color:red;">*</span>WAN Pool:</td>   
		<td><input type="text" name="WAN" id="WAN" value='<%=rs5.getString("wanpool")%>'  readonly size ="30"></td>
		
   </tr>
   <tr>	<td><span style="color:red;">*</span>Account/Relationship No: </td> 
		<td><input type="text" name="Account_Relationship" id="Account_Relationship" value='<%=rs5.getString("Acc_relation_no")%>' readonly size ="30"></td>
		<td><span style="color:red;">*</span>BandWidth:</td> 
		<td><input type="text" name="Bandwidth" id="Bandwidth" value='<%=rs5.getString("bandwidth")%>'  readonly size ="30"></td>
		<td><span style="color:red;">*</span>Media: </td>     
		<td><input type="text" name="Media" id="Media" value='<%=rs5.getString("media")%>'  readonly size ="30"></td>
		
   </tr>

   <tr>	<td><span style="color:red;">*</span>ARC:  </td>      
		<td><input type="text" name="ARC" id="ARC" value='<%=rs5.getString("arc")%>'  readonly size ="30"></td>
        <td><span style="color:red;">*</span>OTC: </td>       
        <td><input type="text" name="OTC" id="OTC" value='<%=rs5.getString("otc")%>'  readonly size ="30"></td>	
		<td><span style="color:red;">*</span>TT No:</td>      
		<td><input type="text" name="ttno" id="ttno" value='<%=rs5.getString("ttno")%>'  size ="30" readonly></td>
		
   </tr>
   <tr>	<td><span style="color:red;">*</span>Link Down Time: </td>  
		<td>
		   <input type="text" name="connectionDowndate" id="connectionDowndate"  size ="10" value='<%=rs5.getString("connectionDowndate")%>' readonly>
		   <input type="text" name="connectionDowntime" id="connectionDowntime"  size ="6" value='<%=rs5.getString("linkdowntime")%>' readonly>
		 </td>
		 <td><span style="color:red;">*</span>Expected Time Of Restoring:: </td>  
		<td>
		   <input type="text" name="etrdate" id="etrdate"  size ="10" value='<%=rs5.getString("expectedrestoredate")%>' readonly>
		   <input type="text" name="etrtime" id="etrtime"  size ="6" value='<%=rs5.getString("expectedrestoretime")%>' readonly>
		 </td>
		<td><span style="color:red;">*</span>CallLogged Time:</td>   
		<td>
		   <input type="text" name="callLoggeddate" id="callLoggeddate"  size ="10" value='<%=rs5.getString("callLoggeddate")%>' readonly>
		   <input type="text" name="callLoggedTime" id="callLoggedTime"  size ="6" value='<%=rs5.getString("calllogtime")%>' readonly>
		 </td>
	 </tr>
    <tr> 
		<td><span style="color:red;">*</span>Link Restored Time: </td> 
		<td>
		    <input type="text" name="connectionRestoreddate" id="connectionRestoreddate"  size ="10"   placeholder="dd-mm-yy" readonly>
		    <select name="connectionRestoredTime1" id="connectionRestoredTime1">
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
		   <select name="connectionRestoredTime2" id="connectionRestoredTime2">
		      <option value="MM">MM</option>
		      <option value="00">00</option>
		      <option value="15">15</option>
		      <option value="30">30</option>
		      <option value="45">45</option>
		   
		   </select>
		 </td>		
		 <td><span style="color:red;">*</span>Total Connection Down Time:</td>      
		 <td><input type="text" name="TotalDownTime" id="TotalDownTime"  onclick="myfunction()" readonly></td>
		 <td> <span style="color:red;">*</span>Remarks:</td>
	     <td ><input type="text" name="remarks" id="remarks"  readonly></td>  
	 </tr> 
	 <tr>
	     <td><span style="color:red;">*</span>Outage Report:</td> 
		 <td colspan="5"><input type="text" name="OutageReport" id="OutageReport"  size ="100"  ></td>
	 </tr>  
    <tr >   
        <td><span style="color:red;">*</span>Reason/What went wrong:</td>   
		<td colspan="6"><textarea rows="2" cols="70"  readonly><%=rs5.getString("reason")%></textarea></td> 
    </tr> 
    <tr >   
        <td><span style="color:red;">*</span>Why the outage is Planned/Unplanned:</td>   
		<td colspan="6"><textarea rows="1" cols="70"  readonly><%=rs5.getString("whyoutageplanned")%></textarea></td> 
    </tr> 
    
    <tr >   
        <td><span style="color:red;">*</span>Impacted domestic MPLS sites:</td>   
		<td colspan="6"><textarea rows="1" cols="70"  readonly><%=rs5.getString("domesticmpls")%></textarea></td> 
    </tr> 
    <tr >   
        <td><span style="color:red;">*</span>Outage report from ISP:</td>   
		<td colspan="6"><textarea rows="1" cols="70" readonly><%=rs5.getString("outageisp")%></textarea></td> 
    </tr> 
    <tr >   
        <td><span style="color:red;">*</span>List of services affected:</td>   
		<td colspan="6"><textarea rows="1" cols="70"  readonly><%=rs5.getString("affectedServices")%></textarea></td> 
    </tr> 
    <tr >   
        <td><span style="color:red;">*</span>List of services not affected:</td>   
		<td colspan="6"><textarea rows="1" cols="70"  readonly><%=rs5.getString("notAffectedServices")%></textarea></td> 
    </tr> 
    <tr >   
        <td><span style="color:red;">*</span>Any plans to fix,circumstance or risks,etc.(if any):</td>   
		<td colspan="6"><textarea rows="1" cols="70"  readonly><%=rs5.getString("anyplans")%></textarea></td> 
    </tr> 
   <% } 
          }
           catch (SQLException ex) {
                    ex.printStackTrace();
                  }	
                    finally{
	                       //	DbUtil.closeDBResources(rs,st,con);
		                     con5.close();
                            	}%>
     <tr>
      <td colspan="6" align="center"><input type="submit" value="Submit" onclick="return (Validation());">&nbsp &nbsp &nbsp &nbsp <input type="reset" value="Reset"></td>
   </tr>
 </table>
   <div align="center"><br><br>
      <input style="size: 1;" type="button" title="Back To Selection Date Page" value="GO TO BACK" onclick="window.location.href='../OtherPage.jsp?msg=1'"/>
  </div> 
  <!-- <div id="resultFromAjax2" style="display:none;">
        
       </div>
       <div id="resultFromAjax1" style="display:none;">
        
       </div> -->
   <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
<tr align="center"> <td class="greenLine" >&nbsp;</td></tr>
<tr align="center"><td class="blueLine" >&nbsp;</td></tr>
  </table>
</form>
</body>
</html>