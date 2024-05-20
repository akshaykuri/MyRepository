<%@page import="CON2.DbUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="banner.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">




<html>
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
<jsp:useBean id="con" class="CON2.Connection2" />
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>AUTHORIZATION PAGE</title>
<link rel='stylesheet' type='text/css' href='css/homePage.css' />
<link href="stylelog.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
</script>
<%
//HttpSession session = request.getSession();
//session.setMaxInactiveInterval(20*60); 
session.setMaxInactiveInterval(20*60);

if(session==null||session.getAttribute( "Nname" )==null)
{
	response.sendRedirect("adminlink.jsp?msg=1");
}
%>
		<script  type="text/javascript">
<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
</script>

</head>

<body background =".jpg" >




<%--
//HttpSession session = request.getSession();
//session.setMaxInactiveInterval(20*60); 
session.setMaxInactiveInterval(20*60);

if(session==null||session.getAttribute( "Nname" )==null)
{
	response.sendRedirect("adminlink.jsp?msg=1");
}
--%>

 <script language = "Javascript">
          function checkEmail() {
            if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(form.email.value)){
            return true;
            }
            return false; 
          }
          function checkName(str){
              var re = /[^a-zA-Z][0-9][\s]/g
              if (re.test(str)) return false;
              return true;
            }
          
             function checkNumber(string)
             {
             var numericExpression = /^[0-9]+$/;
             if(string.match(numericExpression)) {
              return true;
             } else {
             return false;
                }
             }
            function checkAddress(str){
              var re = /[^[a-z][A-Z][0-9][/][#][[][]][,][.]/g
              if (re.test(str)) return false;
              return true;
            }
            
          function validate(){
            
             
                var eno=document.form.EMP_NO;
                  var en=document.form.EMP_NAME
                var des=document.form.DESIGNATION;
                var dno=document.form.DESG_NO;
                var dn=document.form.DEPT_NAME;

           
            if ((eno.value==null)||(eno.value=="")){
            alert("Please Enter EMP-NO!")
            eno.focus()
            return false
            }
            if (checkNumber(eno.value)==false){
            eno.value=""
            alert("Invalid NO!");
            eno.focus()
            return false
            }
            if ((en.value==null)||(en.value=="")){
            alert("Please Enter EMP-NAME!")
            en.focus()
            return false
            }
            if (checkAddress(en.value)==false){
            en.value=""
            alert("Invalid NAME!");
            en.focus()
            return false
            }
             if ((des.value==null)||(des.value=="")){
            alert("Please Enter DESIGNATION!")
            des.focus()
            return false
            }
            if (checkAddress(des.value)==false){
            des.value=""
            alert("Invalid DESIGNATION!");
            des.focus()
            return false
            }
             if ((dno.value==null)||(dno.value=="")){
            alert("Please Enter CODE[1:2:3:4:5:6]!")
            dno.focus()
            return false
            }
            if (checkNumber(dno.value)==false){
            dno.value=""
            alert("Invalid CODE!");
            dno.focus()
            return false
            }
            if ((dn.value==null)||(dn.value=="")){
            alert("Please Enter NAME!")
            dn.focus()
            return false
            }
            if (checkAddress(dn.value)==false){
            dn.value=""
            alert("Invalid NAME!");
            dn.focus()
            return false;
            }
            
           
	 else
       return true;
}
        </script>
        <script type="text/javascript">
function check(value){ 
xmlHttp=GetXmlHttpObject()
var url="DesignationAjaxValidity.jsp";
url=url+"?EMP_NO="+value;
xmlHttp.onreadystatechange=stateChanged 
xmlHttp.open("GET",url,true)
xmlHttp.send(null)
}
function stateChanged(){ 
if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
var showdata = xmlHttp.responseText; 
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
               <SCRIPT TYPE="text/javascript">
<!--
function popupform(myform, windowname)
{
if (! window.focus)return true;
window.open('', windowname, 'height=200,width=400,scrollbars=yes');
myform.target=windowname;
return true;
}
//-->
</SCRIPT>
 <script language="javascript" type="text/javascript">
 function ChangeDesg(no)
		{
		document.getElementById('iddesg').value = no;
		}
<!--
function popitup(url) {
	//newwindow=window.open(url,'name','height=300,width=150,scrollbars=1');
	//if (window.focus) {newwindow.focus()}
	//return false;
		newwindow=window.open(url,'name','height=300,width=1100,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
	if (window.focus) {newwindow.focus()}
	return false;
}

// -->
</script>

<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70">
<div id="wrapper">
<img src="images/nippon.gif" height="35" width="220"> <img src="images/cs-soft.jpg" height="20" width="100" align="right">



<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#ec691f"><strong><font size ="4" color="white"><b> AUTHORIZATION MASTER</b><br />
    
 </font></strong></td></tr>
 <tr align="center">
 <td bgcolor="#2f4377"><strong><font size ="4" color="white">PURCHASE ORDER MANAGMENT SYSTEM (PO-SOFT)</font></strong></td></tr>
</table>
 
  <form name="form" method="post" onSubmit="return validate()" action="designat.jsp">
 <div id='right_table'>


<%
String EMP_NO=request.getParameter("EMP_NO");
String EMP_NAME=request.getParameter("EMP_NAME");
String DESIGNATION=request.getParameter("DESIGNATION");
String DESG_NO=request.getParameter("DESG_NO");
String DEPT_NAME=request.getParameter("DEPT_NAME");
String MAIL_ID=request.getParameter("MAIL_ID");
%>
<% 
Connection cn01 = null;
Statement st01 = null; 
ResultSet rs01 = null;
Connection cn02 = null;
Statement st02 = null; 
ResultSet rs02 = null;
try{
cn01 = con.getConnection2();
st01=cn01.createStatement();
rs01 = st01.executeQuery("select DESIGNATION,DESG_NO from desg ORDER BY DESIGNATION Asc");

cn02 = con.getConnection2();
st02=cn02.createStatement();
rs02 = st02.executeQuery("select Nname,UID from login ORDER BY UID Asc");

%>
	<p></p><br/><p></p>
    
<table width="920" height="3" cellpadding="0" cellspacing="0" ID="Table1">


  <tr>
  <td width="25%" align="justify" valign="top"></td>
    <td width="21%" align="justify" valign="top">
      <p> <img src="images/authorized.jpg" height="180" width="240">
</td>
<td width="5%" align="justify" valign="top"></td>
<td width="5%" align="justify" valign="top"></td>
<td width="79%"><table width="100%" border="2" > 
    
<tr>
<td align=center width=60% colspan=2  background=".jpg">
<font color=darkblue size=3 > ENTER DESIGNATION DETAILS:</font>
</td>                                                        
</tr>
    <tr><td>EMP-NO<font color=red>*</font></td><td><input type="text" name="EMP_NO" value="" onkeyup="check(this.value);" ></td> </tr><div id="mydiv"></div>
   <!--  <tr><td>EMP-NAME<font color=red>*</font></td><td><input type="text" name="EMP_NAME" value=""></td> -->

    <tr> <td>EMP-NAME<font color=red>*</font></td><td><select name="EMP_NAME">
			<option value="0">Select</option>
			<%while(rs02.next()){ %>
			
			<option><%=rs02.getString("UID")%></option>
			<%} %>
		</select>
  		</td>
    
    
    </tr>
    
    <tr><td>DESIGNATION<font color=red>*</font></td>
    <td><select name="DESIGNATION">
			<option value="0">Select</option>
			<%while(rs01.next()){ %>
			
			<option onclick="ChangeDesg('<%=rs01.getString("DESG_NO")%>');"><%=rs01.getString("DESIGNATION")%></option>
			<%} %>
		</select><a href="NewDesignation.jsp?msg=1"  onclick="return popitup('NewDesignation.jsp?msg=1')">New</a>
  		</td>
    
    <!--<td><input type="text" name="DESIGNATION" value=""></td></tr>
	--><tr><td>CODE</td><td><input type="text" id="iddesg" name="DESG_NO" value="" readonly="readonly"></td></tr>
	<tr><td>DEPT-NAME<font color=red>*</font></td>
	<!-- <td>DEPT-NAME<font color=red>*</font></td><td><input type="text" name="DEPT_NAME" value=""></td> -->
	<td>
	<!-- <select name="DEPT_NAME" style="width: 200px; float: left;"> -->
	<select name="DEPT_NAME" >
			<option value="0">Select</option>
		    <option value="IT">IT</option>
			<option value="NON">NONIT</option>
			
		

		
		</select>
		<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="DepartName.jsp?msg=1"  onclick="return popitup('DepartName.jsp?msg=1')">New</a>
		<input name="DEPT_NAME" style="width: 185px; margin-left: -199px; margin-top: 1px; border: none; float: left;"/> -->
  		</td>
	
	</tr>
	<tr><td>MAIL ID<font color=red>*</font></td><td><input type="text" name="MAIL_ID" value="" size="35"></td></tr>
	
	<tr><td align="center">
    <a href="displayAuthorbom.jsp"  onclick="return popitup('displayAuthorbom.jsp')">EDIT</a></td><td>
	<%--<input type=submit name="button" value="Create" id="button" onClick="return checkmail(this.form.myemail)">--%>
	<input type=submit name="button" value="Create" id="button">
	<input type="reset" value="Reset"/></td>

	                 </tr>
	</table></td>
	
	

	
</tr>

</table>
	
	<center><font size="3" color="red">*</font><label><font size="1"><b>NOTE:</b>Authorization person should be Admin first</font></label></center>
	</div>
	</form>
	
	
<%

} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			DbUtil.closeDBResources(rs01,st01,cn01);
			DbUtil.closeDBResources(rs02,st02,cn02);
			}

%>

<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="HOME.jsp"><img src="home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 

<td width="150" align="center">
<a href="Authorizationview.jsp" onclick="return popitup('Authorizationview.jsp')">View Detail</a> </td>
<td width="115" align="right"> 
<a href="adminbom.jsp"><img src="bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table> 


<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#2f4377"><strong><font size ="3" color="white"> NIPPON EXPRESS (INDIA) PRIVATE LIMITED </font></strong></td>
    
  </tr>
</table> 
</div>




</body>
</html>