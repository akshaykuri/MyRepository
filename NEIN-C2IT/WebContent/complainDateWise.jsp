<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
 <%@ include file="banner.jsp" %> 
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<body background =".jpg" >

<head><title>Complain Page</title>
<link rel="stylesheet" type="text/css" href="css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="js/Calendar.js"></script>
<link rel='stylesheet' type='text/css' href='css/headerColor.css' />


<script type="text/javascript">

var showdata="";
function check(value){ 
xmlHttp=GetXmlHttpObject();
var url="imsAjaxValidity.jsp";
url=url+"?aabbcc="+value;
xmlHttp.onreadystatechange=stateChanged; 
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
}
function stateChanged(){ 
if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
showdata = xmlHttp.responseText; 
//alert(showdata);

document.getElementById("mydiv").innerHTML= showdata;
} 
}
function GetXmlHttpObject(){
var xmlHttp=null;
try{
xmlHttp=new XMLHttpRequest();
}
catch (e) {
try {
xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
}
catch (e){
xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
}
}
return xmlHttp;
}
</script>
</head>
<script language="javascript" type="text/javascript">
<!--
function popitup(url) {

	newwindow=window.open(url,'name','height=300,width=900,location=1,status=1,scrollbars=1');
	if (window.focus) {newwindow.focus()}
	return false;
}
 

// -->
   function get_val9(tot_val)
   {
   		
   		 form.action = "complainPageAdmin.jsp?msg=1";
   		 form.method = "post";
 		 form.submit();
      
   }
</script>
<%
if(session==null||session.getAttribute("NpostingCo")==null||session.getAttribute("b_no")==null)
{
	String msgg="Session TimeOut";
	response.sendRedirect("loginho.jsp?msg="+msgg);
}
%>
	<script  type="text/javascript">

<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("__", "   ");
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
     
     
</script>
<script language="javascript" type="text/javascript">
    function ValidateForm() {
        var isValidForm = true;
        var errorMessages = "";
   
       var CommentsTextArea = document.getElementById("idCalendar");
            if (CommentsTextArea.value == "") {
            	
              alert("Select Date");
              CommentsTextArea.focus();
              isValidForm = false;
            }    
      
        return isValidForm;
    }   
</script>
<%
//String city = request.getParameter( "city" );
session.getAttribute("city");

%><%!
	            //  Connection conn = null;
	              Statement st;
	              ResultSet rs;
	              String []id;
	              Object logInName = null,desg=null,realname=null,city=null,Initiator=null;
	              
	%>
	 <%
              logInName = session.getAttribute("theName");
     		  realname =  session.getAttribute("Nname");
     		   desg = session.getAttribute("desg");
     		   city = session.getAttribute("NpostingCo");
     		   Initiator = session.getAttribute("Nmail");
     		  System.out.println("logInName  "+logInName);
     		  System.out.println("realname  "+realname);
     		  System.out.println("desg  "+desg);
     		  System.out.println("Branch nameeee  "+city);
     		  System.out.println("Initiator NAMEEEEEEEE "+Initiator);
     %>
<%-- <font > Welcome :<%= session.getAttribute( "city" ) %></font> --%>
<body bgcolor="" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70">

<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<img src="images/logo.png" height="35" width="220">
</td> 

</tr> 
</table>


<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 
<tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	COMPLAINT DETAILS </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white"><%=city %></font></strong></td>
</tr>

</table>
<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr>
<td width="1118" align="left"><%-- <font color="blue"> 
<%= session.getAttribute( "NpostingCo" ) %>-BRANCH</font> --%>
</td>
<td width="1118" align="right"> 
<a href="logout.jsp"><font size=2>LOGOUT</font></a>
</td> 
</tr> 
</table>
<br />
<br />

<%--
String tot_val;
Connection cn9 = null;
Statement st9 = null; 
ResultSet rs9 = null;
cn9 = con.getConnection2();
st9=cn9.createStatement();
//rs9 = st9.executeQuery("select DISTINCT mr_id from mr_master");
//rs9 = st9.executeQuery("select DISTINCT ims_id from ims_master WHERE ims_id LIKE 'NEIN/CS/IMS/90%' ");
rs9 = st9.executeQuery("select DISTINCT ims_id from ims_master Left Join branch_master On(substr(ims_id,13,2)=branch_master.b_no) WHERE '"+city+"'=branch_master.b_name GROUP BY ims_id");

--%>
<!-- <form name="form1" method="post" action="CheckListViewHO.jsp?msg=1" onsubmit="return ValidateForm();"> -->
<form name="form1" method="post" action="complainPageStatusBranch.jsp?msg=1" onsubmit="return ValidateForm();">
	
	 
<table align="center">
<tr>
<th>ENTER IMS NUMBER </th>
</tr>
</table>

<br>
<br>	 
	 
  <table width="280" align="center" border="0" cellpadding="3" cellspacing="1" bgcolor="#ec691f">
   
  
    
   <tr><!--<th>BRANCH:</th>
	--><%-- <td>
	  <label>Select</label>
      <select  name="ims_idname"  id="hiderow">     <option value="NULL">SELECT</option> 
                                                
										        <%while(rs9.next()){ %> 
										        <% tot_val = rs9.getString("ims_id");%>
										        
										        
										       <option><%=rs9.getString("ims_id")%> </option>
										        <%} %> 
										        </select>
      </td> --%>
      <td><label>Select Date</label></td>
     <td><input type="text"  style="width: 6em"  name="txtCalendar" value="" id="idCalendar" onclick="showCalendarControl(this)" readonly="readonly"></td> 
      		<td> <img src="images/cal.gif" id="idForDay" style="float: left;margin: 0.5em 0.5em 0.5em 0.5em;" name="imgForDate" width="16" height="16"  onclick="showCalendarControl(document.getElementById('idCalendar'))">	</td>
	</tr>
     
      
	</tr>


	<tr align="center">
	       <td align=center>&nbsp;</td>
	       <td>&nbsp;</td>
	       <%-- %><td><input type=submit name="button" value="DISPLAY" id="b2"  ;></td>
	
	<td>
	<input type="submit" name="subpopup" value="DISPLAY"    onclick="myform.target='POPUPW'; POPUPW = window.open(   'about:blank','POPUPW','width=600,height=400');">
	</td> --%>
	<td align="center">
	<input style="background-color:#2f4377;font-weight:bold;color:white;" type="submit" align="middle" name="subpopup" value="DISPLAY"/></td>
	</tr>
	</table>
	
	
	
	</form>

	
	<br>
<br>
<br>
<br>







<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="HOME.jsp"><img src="home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 




<td width="115" align="right"> 
<a href="OtherPage.jsp?msg=1"><img src="bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table> 


<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center"> <td class="greenLine" style="font-style: italic;"></td></tr>
<tr align="center"><td class="blueLine" style="font-style: italic;"></td></tr>
</table> 





</body>
</html>