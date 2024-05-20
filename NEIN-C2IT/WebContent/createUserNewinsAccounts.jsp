<%@page import="CON2.DbUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ include file="banner.jsp" %>    
<%@ page import="java.io.*"%>
<%@page import="CON2.Connection2"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="con" class="CON2.Connection2" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="js/layout.js"></script>
	<script language="javascript"   type="text/javascript" src="js/popWindowAtCenter.js"></script>
	
	
	<link rel='stylesheet' type='text/css' href='css/homePage.css' />
		<!-- Help Page pop up starts  -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type = "text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="css/FormsHelpSmallSize.css" title="style" />
    <script language="javascript"   type="text/javascript" src="js/FormsHelp.js"></script>
	<!-- Help Page pop up ends -->
<%
session.setMaxInactiveInterval(20*60);
if(session==null||session.getAttribute( "Nname" )==null)
{
	response.sendRedirect("adminlink.jsp?msg=1");
}
%>
<script language="javascript" type="text/javascript">
	
   function validate()
   {
       
       var d1=document.form.selectVal;
    if ((d1.value==null)||(d1.value=="NULL"))
				{
  				 alert("Select Name!");
   			         d1.focus();
  				 return false;
  				 }

      
  	 
else
return true;
   }
</script>
<script type="text/javascript">
function  get_val4()
{
 var shipt =document.getElementById("idShiptoSelect"),
 txtbox = document.getElementById('idName'),
 shiptid = document.getElementById('idEmpNo'),
 shiptid2 = document.getElementById('idDesig'),
 shiptid3 = document.getElementById('idMail'),

 selOption = shipt.options[shipt.selectedIndex];
 //alert("SELECTED VALUE "+selOption.value);
 var arrayOfStrings = (selOption.value).split('--');
 var a1 = arrayOfStrings[0];
 var a2 = arrayOfStrings[1];
 var a3 = arrayOfStrings[2];
 var a4 = arrayOfStrings[3];
 //alert("SLIPTED VALUE :"+arrayOfStrings);
 //alert("DESIGNATION :"+a1);
 //alert("NAME :"+a2);
 //alert("MAIL ID :"+a3);
 //alert("EMP NO :"+a4);
 
 document.getElementById('idName').value = a1;
 document.getElementById('idEmpNo').value = a2;
 document.getElementById('idDesig').value = a3;
 document.getElementById('idMail').value = a4;

 

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
	<%!String Name=null,desg=null,city=null,b_no=null,email_id=null,Initiator=null,admin=null; %>
<%
Name = (String) session.getAttribute("Nname");
desg = (String) session.getAttribute("desg");
city = (String) session.getAttribute("city");
b_no = (String) session.getAttribute("b_no");
admin =  (String) session.getAttribute("admin");
email_id = (String) session.getAttribute("Nmail");
System.out.println("-------------------------------------");
System.out.println("Name Number :"+Name);
System.out.println("desg Number :"+desg);
System.out.println("city Number :"+city);
System.out.println("Branch Number :"+b_no);
System.out.println("admin Number :"+admin);
System.out.println("email_id Number :"+email_id);
System.out.println("------------------------------------");

%>

<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70" style="overflow-x: hidden; overflow-y: hidden;">
<div id="wrapper">
<div id="id">
<table>
<tr>
<td>
<img src="images/nippon.gif" height="35" width="220"> </td>
<td align="right">
<img src="images/cs-soft.jpg" height="30" width="100" hspace="796" ></td>
</table> 
 <form name="form" method="post" onSubmit="return validate()" action="createUserNewinsAccountBack.jsp">

<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#ec691f"><strong><font size ="4" color="white"><b>CREATE NEWINS USERS</b><br />
    
 </font></strong></td></tr>
 <tr align="center">
 <td bgcolor="#2f4377"><strong><font size ="4" color="white">CONNECT TO IT (C2IT)</font></strong></td></tr>
</table>

<br>
<br />


 <div id='right_table'>


<%
String tot_val="";
Connection cn02 = null;
Statement st02 = null; 
ResultSet rs02 = null;
try{
cn02 = con.getConnection2();
st02=cn02.createStatement();
rs02 = st02.executeQuery("select Nname,post,Nmail,Nno FROM login WHERE b_no='90' AND DEPT_NAME='NON' ORDER BY Nname Asc ");

%>



<table width="920" height="3" cellpadding="0" cellspacing="0" ID="Table1">


  <tr>
  <td width="10%" align="justify" valign="top"></td>
    <td width="31%" align="justify" valign="top">

<img vspace="15" src="images/e.jpg" width="193" height="220" border="0">
</td>
<td width="5%" align="justify" valign="top"></td>
<td width="5%" align="justify" valign="top"></td>
<td width="48%">
<table width="100%" border="2" >
    <tr>
<td align=center width=60%  colspan=2  background=".jpg">
<font color=darkblue size=3 > CREATE NEWINS USERS</font>
</td>
</tr>
	<tr>

			<td>
			<font size="2" face="Swiss" id="hiderow">Select&nbsp;Name</font> <font
				color="red">*:</font> 
				</td>
				<td>
				<select id="idShiptoSelect" onchange="get_val4()" name="selectVal">
				<option value="NULL">Select Name</option>
				
				<%while(rs02.next()){ %>
				<%tot_val =  rs02.getString("Nname") + "--"  + rs02.getString("Nno") + "--" + rs02.getString("post") + "--" + rs02.getString("Nmail");%>
				<option value="<%=tot_val%>"><%=rs02.getString("Nname")%></option>
				<%} %>
				</select>
		   </td>
		</tr>
	
	<tr><td><font size=2>NAME:<font color=red>*</font></font></td>
	<td><input type="text" id="idName" name="name" value="" size=30 readonly="readonly">
	<input style="display: none;" type="text"  name="adminName" value="<%=Name%>" />
		<input style="display: none;" type="text"  name="adminMail" value="<%=email_id%>" />
	
	</td></tr>
	<tr><td><font size="2">EMP NO.:</font><font color=red>*</font></td><td><input type="text" id="idEmpNo" name="EmpNo" value="" readonly="readonly"></td></tr>
	<tr><td><font size=2>DESIGNATION:<font color=red>*</font></font></td><td><input type="text" id="idDesig" name="Designation" value="" size=30 readonly="readonly"></td></tr>
	<tr><td><font size=2>MAIL-ID:<font color=red>*</font></font></td><td><input type="text" id="idMail" name="Mail_id" value="" size=30 readonly="readonly"></td></tr>

	

	<tr><td>
    <a href="DisplayUserNewinsAccounts.jsp?msg=1" onclick="return popitup('DisplayUserNewinsAccounts.jsp?msg=1')"><font size=3>View Form Users</font></a> </td>

	<td><input type=submit name="button" value="SAVE" id="button" onclick="return validation();" >
	    <input type="reset" value="RESET"/>
	    
	       	<input type="button" id="btnShowSimple" value="HELP" />
	    </td></tr>
	
	</table>
	</td>
	
	<td width="39%">
	
	</td>
</tr>

</table>


                 </div>
                 <div id="dialog" class="web_dialog">
   <table style="width: 100%; border: 0px;" cellpadding="3" cellspacing="0">
      <tr>
         <td class="web_dialog_title"><center>HELP PAGE</center></td>
         <td class="web_dialog_title align_right">
            <a href="#" id="btnClose">Close</a>
         </td>
      </tr>
      </table><br />
     <label style="text-align:center;"></label>
     <br />
<label>Employee should be Admin </label>
<br />
<label  style="font-size: 30px;"></label>
<br />
<label>Employee should be NON IT Person</label>
<br />
<label  style="font-size: 30px;"></label>
<br />
<label>Employee should be of Head Office</label>

<br />
<br />
</div>
	</form>
	
	
	<%
}
catch (Exception e) { System.out.println(e); }
finally{
	
	DbUtil.closeDBResources(rs02,st02,null);
	
  }
	%>


<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="HOME.jsp"><img src="home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 

<td width="115" align="right"> 
<a href="adminbom.jsp?msg=1"><img src="bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address>

</td> 
</tr> 
</table> 


<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#2f4377" align="center"><strong><font size ="3" color="white">NIPPON EXPRESS (INDIA) PRIVATE LIMITED </font></strong></td>
    
  </tr>
</table> 


</div>
</div>
</body>
</html>