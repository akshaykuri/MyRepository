<%@page import="CON2.DbUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*"%>
<%@page import="CON2.Connection2"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="con" class="CON2.Connection2" />
    <%@include file="../../banner.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">




<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>FEEDBACK MASTER</title>
<link rel='stylesheet' type='text/css' href='../../css/homePage.css' />
<script type="text/javascript" src="../../js/layout.js"></script>
<link href="stylelog.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
</script>

</head>

<body background =".jpg" >
<%
//HttpSession session = request.getSession();
//session.setMaxInactiveInterval(20*60); 
session.setMaxInactiveInterval(20*60);

if(session==null||session.getAttribute( "Nname" )==null)
{
	String msg=null;
	msg="Session Time Out \\n Login Again";
	response.sendRedirect("adminlink.jsp?msg="+msg);
}
%>
		<script  type="text/javascript">

<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
   disp = disp.replace("%20", "");
    disp = disp.replace("__","   ");
   
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
</script>

 <script language = "Javascript">
          
            function checkAddress(str){
              var re = /[^[a-z][A-Z][0-9][/][#][[][]][,][.]/g
              if (re.test(str)) return false;
              return true;
            }
            
          function validate(){
              var w=document.form.photocopier_name;
              var ab=document.form.photocopier_detail;
              var bk = document.form.bkLocation;
            if ((w.value==null)||(w.value=="")){
            alert("Please Enter Name!")
            w.focus()
            return false
            }
            if (checkAddress(w.value)==false){
            w.value=""
            alert("Invalid Name!");
            w.focus()
            return false
            }
           
               if ((ab.value==null)||(ab.value=="")){
            alert("Please Enter Detail!")
            ab.focus()
            return false
            }
            if (checkAddress(ab.value)==false){
            ab.value=""
            alert("Invalid Detail!");
            ab.focus()
            return false;
            }
            if ((bk.value==null)||(bk.value=="")||(bk.value=="Null")){
                alert("Select Location");
                bk.focus();
                return false
                }
                if (checkAddress(bk.value)==false){
                	bk.value="";
                alert("Invalid Location!");
                	bk.focus();
                return false;
                }           
	 else
       return true;
}
        </script>

<script language="javascript" type="text/javascript">
<!--
function popitup(url) {
	newwindow=window.open(url,'name','height=300,width=900,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
	if (window.focus) {newwindow.focus()}
	return false;
}
 

// -->
</script>

<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70" style="overflow-x: hidden; overflow-y: hidden;">
<div id="wrapper"><div id="id">
<table>
<tr>
<td>
<img src="../../images/nippon.gif" height="35" width="220"> </td>
<td align="right">
<img src="../../images/cs-soft.jpg" height="30" width="100" hspace="796" ></td>
</table> 

<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#ec691f"><strong><font size ="4" color="white"><b>FEEDBACK MASTER</b><br />
    
 </font></strong></td></tr>
 <tr align="center">
 <td bgcolor="#2f4377"><strong><font size ="4" color="white">CONNECT TO IT (C2IT)</font></strong></td></tr>
</table>


 
  <form name="form" method="post" onSubmit="return validate()" action="feedbackAbout_MasterBack.jsp">

 <div id='right_table'>

<!-- backup_name,backup_detail -->
<%
String photocopier_name=request.getParameter("photocopier_name");
String photocopier_detail=request.getParameter("photocopier_detail");
Connection cn02 = null;
Statement st02 = null; 
ResultSet rs02 = null;
try{
cn02 = con.getConnection2();
st02=cn02.createStatement();
rs02 = st02.executeQuery("select name from about_master ORDER BY name Asc");
%>
	<br>
	<br>
<table width="920" height="3" cellpadding="0" cellspacing="0" ID="Table1">


  <tr>
  <td width="25%" align="justify" valign="top"></td>
    <td width="21%" align="justify" valign="top">
      <p> <img src="../../images/cs2.jpg" height="150" width="340">
</td>
<td width="5%" align="justify" valign="top"></td>
<td width="5%" align="justify" valign="top"></td>
<td width="79%"><table width="100%" border="2" > 
  
    
<tr>
<td align=center width=60% colspan=2  background=".jpg">
<font color=darkblue size=3 >CREATE FEEDBACK DETAILS</font>
</td>
</tr>

	<tr><td><font size="2">FEEDBACK NAME:</font><font color=red>*</font></td><td><input type="text" size="20" name="name" value=""></td></tr>

	

 
	</table>
	<table width="100%" align=center border=2 background=".jpg"  bordercolor=#aaaccc>
	
	<tr>
	<td>
    <a href="DisplayFeedback.jsp" onclick="return popitup('DisplayFeedback.jsp')">View Feedback</a> </td>
	<td><input type=submit name="button" value="SAVE" id="button"></td>
	<td><input type="reset" value="RESET"/></td>

	                 </tr>
	                 </table></td>
	
	

	
</tr>

</table>
	  	<%
}
catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(rs02,st02,cn02);
	
  }
	%>               </div>
	                 
	</form>
	
	



<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../../HOME.jsp"><img src="../../home12.jpg" border="0" height="35" width="35"></a> 
<address><font size="2">HOME</font></address>
</td> 

<td width="115" align="right"> 
<a href="../../adminbom.jsp?msg=1"><img src="../../bakk.png" border="0" height="35" width="35"></a>
<address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table> 


<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#2f4377"><strong><font size ="3" color="white"> NIPPON EXPRESS (INDIA) PRIVATE LIMITED  </font></strong></td>
    
  </tr>
</table> 

</div>

</div>
</body>
</html>