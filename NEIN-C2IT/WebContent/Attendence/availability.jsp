<%@page import="CON2.DbUtil"%>
<%@ page import="java.io.*"%>
<%@page import="CON2.Connection2"%>
<%@page language="java"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.sf.jasperreports.view.*"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@ page import="java.util.*"%>
<%@ include file="banner.jsp" %>
<jsp:useBean id="con" class="CON2.Connection2" />
<html>
<link rel='stylesheet' type='text/css' href='../css/homePage.css' />
<link rel="stylesheet" type="text/css" href="../css/Calender.css" title="style" />
<link rel="shortcut icon" type="../image/x-icon" href="../images/favicon.ico">
<script language="javascript"   type="text/javascript" src="../js/Calendar.js"></script>
  <script language="javascript"   type="text/javascript" src="../js/onSubmitWait.js"></script>
<script type="text/javascript">
function cancel()
{
   close();
}
</script>
<%
session.setMaxInactiveInterval(20*60);
if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute("city")==null||session.getAttribute("admin")==null||session.getAttribute("b_no")==null||session.getAttribute("b_no")=="null")
{	
	String msg2=null;
	msg2="Session__Time__Out \\n __ __ Login__Again";
	response.sendRedirect("../SessionTimeOutWithOkButton.jsp?msg="+msg2);
}
%>
<script  type="text/javascript">
<%--
session.setMaxInactiveInterval(30*60);

if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute("theName")==null||session.getAttribute("AdminSign")==null)
{   
	String msg=null;
	msg="Session Time Out \\n Login Again";
	response.sendRedirect("adminlink.jsp?msg="+msg);
}
--%>
<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27", "");
    disp = disp.replace("__","  ");
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
</script>
<script type="text/javascript">
	function validateEmailsh(email)
{
    var splitted = email.match("^(.+)@(.+)$");
    if (splitted == null) return false;
    if (splitted[1] != null)
    {
        var regexp_user = /^\"?[\w-_\.]*\"?$/;
        if (splitted[1].match(regexp_user) == null) return false;
    }
    if (splitted[2] != null)
    {
        var regexp_domain = /^[\w-\.]*\.[A-Za-z]{2,4}$/;
        if (splitted[2].match(regexp_domain) == null)
        {
            var regexp_ip = /^\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\]$/;
            if (splitted[2].match(regexp_ip) == null) return false;
        } // if
        return true;
    }
    return false;
}

</script>
<script type="text/javascript">
function Validation()
{
	 var d1=document.f.name;
	 var d2= document.f.user_mail_id;
	// var d3=document.f.branch;
	 var d4= document.f.aboutWhat;
	 var d44 = document.f.systemAdmin;
	 var dat1 = document.f.date1;
	 var dat2 = document.f.date11;
	 var d=document.f.feedback;
	
	
	
	    if ((d1.value==null)||(d1.value=="NULL")||(d1.value==""))
					{
	  				 alert("Enter Your Name!");
	   			         d1.focus();
	  				 return false;
	  				 }
	    if ((d2.value==null)||(d2.value=="NULL")||(d2.value==""))
		{
			 alert("Enter Your Mail ID!");
		         d2.focus();
			 return false;
			 }
	    if (validateEmailsh(d2.value)==false){
	        d2.value="";
	        alert("Invalid Email ID!");
	        d2.focus();
	        return false;
	        }
	  /*   if ((d3.value==null)||(d3.value=="NULL")||(d3.value==""))
		{
			 alert("Select Your Branch!");
		         d3.focus();
			 return false;
			 } */
	    if ((d4.value==null)||(d4.value=="NULL")||(d4.value==""))
		{
			 alert("Select Your About selection list!");
		         d4.focus();
			 return false;
			 }
	    
			    if ((d4.value=="On Duty") && (d44.value=="Select"))
				{
					 alert("Kindly Select On Duty!");
				         d4.focus();
					 return false;
					 }
			    
			    if ((dat1.value=="null") || (dat1.value==null))
				{
					 alert("Kindly Select From Date!");
				         dat1.focus();
					 return false;
					 }
			    
			    if ((dat2.value=="null") || (dat2.value==null))
				{
					 alert("Kindly Select To Date!");
				         dat2.focus();
					 return false;
					 }
	    if ((d.value==null)||(d.value=="NULL")||(d.value==""))
		{
			 alert("Enter Your Remarks/Complaints/Feedback!");
		         d.focus();
			 return false;
			 }
	else
	return true;
	   }
	

</script>
<script type="text/javascript">
function hideHigherTR()
{
/*  document.getElementById('idApproved1').style.display="none";
 document.getElementById('idApproved1').style.visibility="hidden"; */
/*  document.getElementById('idPwd1').style.display="none";
 document.getElementById('idPwd1').style.visibility="hidden"; */
 document.getElementById('idApprovedd').style.display="table-row";
 document.getElementById('idApprovedd').style.display="none";

}
 function showHigherTR()
{
/*  document.getElementById('idApproved1').style.display="table-row";
 document.getElementById('idApproved1').style.visibility="visible"; */

 document.getElementById('idApprovedd').style.display="table-row";
 document.getElementById('idApprovedd').style.visibility="visible";

}
function selectAdmin()
{
	// ALERTS REQUIRE ONE ARGUMENT
	var message = "Kindly Enter On Duty";
	 document.getElementById('idApprovedd').style.display="table-row";
	 document.getElementById('idApprovedd').style.display="none";
	 //alert("Mail Will Be Sent To IT (Head Office)");
	// ALERTS DO NOT RETURN A VALUE
	// ALERTS ARE INFORMATIONAL ONLY
	

}
</script>
<style type="text/css">
html, body{height: 70%; width: 100%; border: 0; padding: 0; margin: 0; background:'../last1.jpg' ;}

#spacer{
display: block;
height: 85%;
width: 1px;
padding: 0;
margin: 0;
border: 0;
background:../images/last1.jpg ; /* same as body bg */
float: right;
}

#bodycontent {
width: 100%;
margin: 0;
padding: 0;
border: 0;
float: right;
margin-right: -1px; /* this is the key to avoid the 1px jog caused by spacer */
}




#footer{
display: block;
clear: both;
width: 100%;
padding: 0;
margin: 0;
background: #ddd;
text-align: center;
margin-right: 0px;
}

#footer p{background: #ddd;}



</style>
<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70"  >

<form name="f" method="post" action="availabilityBack.jsp" >
<center title="Feedback" >
<fieldset style="margin: 2 cm; border-bottom-color: black; width: 80%; " >

<label style="font: 3;font-size: large;"><font size="2">MARK UNAVAILABILITY</font></label>
  <table width="80%" align=center border=2 background=".jpg"  bordercolor=#aaaccc>
   <%
   Connection cn02 = null;
   Statement st02 = null; 
   ResultSet rs02 = null;
   Connection cn022 = null;
   Statement st022 = null; 
   ResultSet rs022 = null;
   Connection cn0222 = null;
   Statement st0222 = null; 
   ResultSet rs0222 = null;
   try{
   cn02 = con.getConnection2();
   st02=cn02.createStatement();
   rs02 = st02.executeQuery("select b_name,b_no from branch_master ORDER BY b_name Asc");
 
   cn022 = con.getConnection2();
   st022=cn022.createStatement();
   rs022 = st022.executeQuery("select Nname,Nmail from nentryho WHERE Npost='IT SUPPORT' ORDER BY Nname Asc");

   cn0222 = con.getConnection2();
   st0222=cn0222.createStatement();
   rs0222 = st0222.executeQuery("select leavetype from leaveType_master ORDER BY leavetype Asc");
   %>
   <% Object newName = session.getAttribute("Nname");%>
   <tr><td align="center" width="40%"><font size="1"> Name</font></td><td><font size="1"><input size="20" type="text"  name="name" value="<%=session.getAttribute( "Nname" ) %>" readonly="readonly" title="Enter Your Name" placeholder="Enter Your Name" ></font></td></tr>
   <tr><td align="center"><font size="1">Mail ID</font></td><td><font size="1"><input size="30" type="text"  name="user_mail_id" value="<%=session.getAttribute( "Nmail" )%>" readonly="readonly" title="Enter Your Mail Id" placeholder="Enter Your Mail Id"></font></td></tr>
   <%-- <tr><td align="center"><font size="1">BRANCH</font></td><td><font size="1"><input size="30" type="text" readonly="readonly" name="branch" value="<%= session.getAttribute( "b_no" ) %>"></font></td></tr> --%>
 <%--   <tr><td align="center" width="20%"><font size="1">Branch</font><font color=red>*</font></td>
	   <td><select name="branch">
			<option value="">Select</option>
			<%while(rs02.next()){ %>
			<option><%=rs02.getString("m_b_name")%></option>
			<option ><%=rs02.getString(1)+" - "+rs02.getString(2)%> </option>
			<option ><%=rs02.getString(1)%> </option>
			<%} %>
		</select>
  		</td>
	 </tr> --%>
	 <tr><td align="center" width="20%"><font size="1">Type</font><font color=red>*</font></td>
	   
	    <td><select name="aboutWhat">
			<!-- <option onclick="hideHigherTR();" value="">Select</option> -->
			<!-- <option onclick="hideHigherTR();" value="Software">Software</option>
			<option onclick="hideHigherTR();" value="Any Other">Any Other</option> -->
		
			<option onclick="hideHigherTR();"  value="">Select</option>
			<%while(rs0222.next()){ %>
			<option  onclick="showHigherTR();"><%=rs0222.getString(1)%> </option>
			<%} %>
			<option onclick="hideHigherTR();" value="On Duty">On Duty</option>
			
		</select>
		</td>
		</tr>
		<tr style="visibility: hidden;display: none;" id="idApprovedd">
		<td align="center" width="20%"><font size="1">Date</font><font color=red>*</font></td>
		<%-- <td>
  		
  			<select name="systemAdmin">
			<option value="Select">Select</option>
			<%while(rs022.next()){ 
			String tot = rs022.getString(1)+"--"+rs022.getString(2);
			%>
			<option value="<%=tot%>" ><%=rs022.getString(1)%> </option>
			<%} %>
		</select> 
		
      
  		</td> --%>
  		<td><label><font size="1">From:</font></label><input type="text"    name="date1" style="width: 6em" value="null" id="idCalendar2" onclick="showCalendarControl(this)" readonly="readonly">
	 <!-- <img src="../images/cal.gif" id="idForDay"  name="imgForDate2" width="" height=""  onclick="showCalendarControl(document.getElementById('idCalendar2'))"> -->
	 <label><font size="1">To:</font></label><input type="text"    name="date11" style="width: 6em" value="null" id="idCalendar3" onclick="showCalendarControl(this)" readonly="readonly">		        
     <!-- <img src="../images/cal.gif" id="idForDay"  name="imgForDate3" width="" height=""  onclick="showCalendarControl(document.getElementById('idCalendar3'))"></td> -->
	 </tr>
	 <%
	 

   } catch (SQLException ex) {
       ex.printStackTrace();
   }	


   finally{
			DbUtil.closeDBResources(rs02,st02,cn02);
   			DbUtil.closeDBResources(rs022,st022,cn022);
   			DbUtil.closeDBResources(rs0222,st0222,cn0222);

   			}
	 %>
<tr><td align="center"><font size="1">Remarks</font></td><td><font size="1">	<textarea rows="5" cols="35" name="feedback" maxlength="198" placeholder="Enter Your remarks"></textarea></font></td></tr>

<tr><td colspan="2" align="center"><div id="formsubmitbutton">
    <input type="submit" value="Send" onclick="return (Validation() && ButtonClicked());"/> 
    <input type="button" value="Close Window" onclick="cancel();" />
      <a href="DisplayAvailability.jsp" onclick="return popitup('DisplayAvailability.jsp')">View</a> </div>
     <div id="buttonreplacement" style="margin-left:30px; display:none;">
	<img src="images/Loading.gif" alt="loading..." />
	</div>
</td></tr>
  
</table>
</fieldset>
</center>
</form>
</body>
</html>