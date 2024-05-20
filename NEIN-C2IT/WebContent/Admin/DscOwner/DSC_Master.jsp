<%@page import="com.sun.jndi.cosnaming.CNCtx"%>
<%@page import="CON2.DbUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="banner.jsp" %>
    <%@ page import="java.io.*"%>
<%@page import="CON2.Connection2"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="con" class="CON2.Connection2" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">




<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>DSC MASTER</title>
<script type="text/javascript" src="../../js/layout.js"></script>
<link href="stylelog.css" rel="stylesheet" type="text/css" />
<link rel='stylesheet' type='text/css' href='../../css/homePage.css' />
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
	response.sendRedirect("../../adminlink.jsp?msg=1");
}
%>
		<script  type="text/javascript">

<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27", " ");
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
              var c=document.form.cin_no;
              var e = document.form.emp_code;
              var o = document.form.owner_name;
              var b = document.form.branch;
              var dt = document.form.department;
              var sc = document.form.scopeWork;
              var deg = document.form.Designation;
              var ro = document.form.Rofficer;
            if ((c.value==null)||(c.value=="")||(c.value=="Null")){
            alert("Please Enter CIN number!");
            c.focus();
            return false;
            }
            /* if (checkAddress(w.value)==false){
            w.value="";
            alert("Invalid category selection!");
            w.focus();
            return false;
            } */
            if ((e.value==null)||(e.value=="")||(e.value=="Null")){
                alert("Please Enter Employee Code");
                e.focus();
                return false
                }
            if ((o.value==null)||(o.value=="")||(o.value=="Null")){
                alert("Please Enter Owner Name");
                o.focus();
                return false
                }
            if ((b.value==null)||(b.value=="")||(b.value=="Null")){
                alert("Please Enter Branch");
                b.focus();
                return false
                }
            if ((dt.value==null)||(dt.value=="")||(dt.value=="Null")){
                alert("Please Enter Department");
                dt.focus();
                return false
                }
            if ((sc.value==null)||(sc.value=="")||(sc.value=="Null")){
                alert("Please Enter Scope Of Work");
                sc.focus();
                return false
                }
            if ((deg.value==null)||(deg.value=="")||(deg.value=="Null")){
                alert("Please Enter Designation");
                deg.focus();
                return false
                }
            if ((ro.value==null)||(ro.value=="")||(ro.value=="Null")){
                alert("Please Enter Reporting Officer");
                ro.focus();
                return false
                }
                
                       
	 else
       return true;
}
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
<script language="javascript" type="text/javascript">
<!--
function popitup(url) {
	newwindow=window.open(url,'name','height=300,width=900,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
	if (window.focus) {newwindow.focus()}
	return false;
}
 

// -->
</script>
<%String SessionName=null,SessionDesg=null;
SessionName = (String) session.getAttribute("Nname");
SessionDesg = (String) session.getAttribute("desg");  %>
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
    <td bgcolor="#ec691f"><strong><font size ="4" color="white"><b>DSC MASTER</b><br />
    
 </font></strong></td></tr>
 <tr align="center">
 <td bgcolor="#2f4377"><strong><font size ="4" color="white">CONNECT TO IT (C2IT)</font></strong></td></tr>
  <tr > <td colspan="2" bgcolor=""><font size ="2">NAME :<%=SessionName%> </font>&nbsp;&nbsp; 
                <font size ="2">DESG :<%=SessionDesg%> </font></td>
 </tr>
 
</table>


 
  <form name="form" method="post" onSubmit="return validate()" action="DSC_MasterBack.jsp">

 <div id='right_table'>

<!-- backup_name,backup_detail -->
<%
String p_type=request.getParameter("p_type");
Connection cn02 = null,cn03 = null,cn04 = null,cn05 = null,cn4r=null;
Statement st02 = null,st03 = null,st04 = null,st05 = null,st4r=null; 
ResultSet rs02 = null,rs03 = null,rs04 = null,rs05 = null,rs4r=null;

try{
cn02 = con.getConnection2();
st02=cn02.createStatement();
//rs02 = st02.executeQuery("select name from prob_type_master_main ORDER BY name Asc");
rs02 = st02.executeQuery("Select DISTINCT p_type from  prob_master ORDER BY p_type ASC");

cn03 = con.getConnection2();
st03=cn03.createStatement();
rs03 = st03.executeQuery("select b_name,b_location from branch_master ORDER BY b_name Asc"); 

cn04 = con.getConnection2();
st04=cn04.createStatement();
rs04 = st04.executeQuery("select dept_name from department_master ORDER BY dept_name Asc"); 

cn05 = con.getConnection2();
st05=cn05.createStatement();
rs05 = st05.executeQuery("select DESIGNATION from desg ORDER BY DESIGNATION Asc"); 



cn4r = con.getConnection2();
st4r =cn4r.createStatement();
rs4r = st4r.executeQuery("select DISTINCT Nname from  formuser_master WHERE Npost <> 'IT SUPPORT' AND Npost <> 'SOFTWARE ENGINEER' AND Npost <> 'EXECUTIVE' ORDER BY Nname Asc"); 

%>
	<br>
	<br>
<table width="1118" height="3"  cellpadding="0" cellspacing="0" ID="Table1">

  <tr>
  <td width="10%" align="justify" valign="top"></td>
    <td width="25%" align="justify" valign="top">
      <p> <img src="../../images/digital signature.jpg" height="180" width="340">
    </td>

  <td width="30%" align="justify" valign="top"></td>
<td >

<table width="400" border="2" >    
<tr>
<td align=center width="100%" colspan=2  background=".jpg">
<font color=darkblue size=3 > CREATE DSC OWNER DETAILS</font>
</td>
</tr>

	<tr>
	<td width="40%"><font size="2">CIN NO.:</font><font color=red>*</font></td>
	<td width="60%">
	<input type="hidden" name="sessionName" value="<%=SessionName%>" />
	<input type="text" size="40" name="cin_no" value="" placeholder="CIN NUMBER" maxlength="49"></td>
	</tr>
	<tr><td><font size="2">EMP CODE:</font><font color=red>*</font></td><td><input type="text" size="40" name="emp_code" value="" placeholder="EMPLOYEE CODE" maxlength="49"></td></tr>
	<tr><td><font size="2">OWNER NAME:</font><font color=red>*</font></td><td><input type="text" size="40" name="owner_name" value="" placeholder="FULL NAME" maxlength="99"></td></tr>
	
	
	<tr><td><font size="2">BRANCH:</font><font color=red>*</font></td><td>
    <select name="branch">
			<option value="Null">Select</option>
			<%while(rs03.next()){ %>
			
			<option><%=rs03.getString("b_name")%></option>
			<%} %>
		</select>
    </td></tr>
    	<tr><td><font size="2">DEPARTMENT:</font><font color=red>*</font></td><td>
    <select name="department">
			<option value="Null">Select</option>
			<%while(rs04.next()){ %>
			
			<option><%=rs04.getString("dept_name")%></option>
			<%} %>
		</select>
    </td></tr>
    <tr><td><font size="2">SCOPE OF WORK:</font><font color=red>*</font></td><td><input type="text" size="40" name="scopeWork" value="" placeholder="SCOPE OF WORK" maxlength="89"></td></tr>
    <tr><td><font size="2">DESIGNATION:</font><font color=red>*</font></td><td>
    <select name="Designation">
			<option value="Null">Select</option>
			<%while(rs05.next()){ %>
			
			<option><%=rs05.getString("DESIGNATION")%></option>
			<%} %>
		</select>
    </td></tr>
    
     <tr><td><font size="2">REPORTING OFFICER:</font><font color=red>*</font></td><td>
    <select name="Rofficer">
			<option value="Null">Select</option>
			<%while(rs4r.next()){ %>
			
			<option><%=rs4r.getString("Nname")%></option>
			<%} %>
		</select>
    </td></tr>
<!--    <tr><td><font size="2">STATUS:</font><font color=red>*</font></td><td>
    <select name="status">
			<option value="Null">Select</option>
			<option value="Active">Active</option>
			<option value="Deactivated">Deactivated</option>
			
			
		</select>
    </td></tr> -->     
   
</table>
	<table width="100%" align=center border=2 background=".jpg"  bordercolor=#aaaccc>
	
	<tr>
	<td align="center"><input type=submit name="button" value="SAVE" id="button" onclick="return validate();"></td>
	<td align="center"><input type="reset" value="RESET"/></td>
	<td align="center">
    <a href="DisplaySubProb.jsp" onclick="return popitup('DisplayDSC.jsp')">View DSC owner</a> </td>

	

	                 </tr>
	                 </table></td>
<td width="30%" align="justify" valign="top"></td>
		<%} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
	DbUtil.closeDBResources(rs02,st02,cn02);
	DbUtil.closeDBResources(rs03,st03,cn03);
	DbUtil.closeDBResources(rs04,st04,cn04);
	DbUtil.closeDBResources(rs05,st05,cn05);
	DbUtil.closeDBResources(rs4r,st4r,cn4r);
			} %>   

	
</tr>

</table>
	                 </div>
	                 
	</form>
	
	



<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../../HOME.jsp"><img src="../../images/home12.jpg" border="0" height="35" width="35"></a> 
<address><font size="2">HOME</font></address>
</td> 

<td width="115" align="right"> 
<a href="../../adminbom.jsp?msg=1"><img src="../../images/bakk.png" border="0" height="35" width="35"></a>
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