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
<title>HO USER</title>
<script type="text/javascript" src="js/layout.js"></script>
<link rel='stylesheet' type='text/css' href='css/homePage.css' />
<link rel='stylesheet' type='text/css' href='css/headerColor.css' />
<style type="text/css">

.sidebarmenu ul{
margin: 0;
padding: 0;
list-style-type: none;
font: bold 13px Verdana;
width: 150px; /* Main Menu Item widths */
border-bottom: 1px solid #ccc;
}
 
.sidebarmenu ul li{
position: relative;
}

/* Top level menu links style */
.sidebarmenu ul li a{
display: block;
overflow: auto; /*force hasLayout in IE7 */
color: white;
text-decoration: none;
padding: 6px;
border-bottom: 1px solid #778;
border-right: 1px solid #778;
}

.sidebarmenu ul li a:link, .sidebarmenu ul li a:visited, .sidebarmenu ul li a:active{
background-color: #012D58; /*background of tabs (default state)*/
}

.sidebarmenu ul li a:visited{
color: white;
}

.sidebarmenu ul li a:hover{
background-color: #ec691f;
}

/*Sub level menu items */
.sidebarmenu ul li ul{
position: absolute;
width: 170px; /*Sub Menu Items width */
top: 0;
visibility: hidden;
}

.sidebarmenu a.subfolderstyle{
background: url(right.gif) no-repeat 97% 50%;
}

 
/* Holly Hack for IE \*/
* html .sidebarmenu ul li { float: left; height: 1%; }
* html .sidebarmenu ul li a { height: 1%; }
/* End */

</style>

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
    disp = disp.replace("%27", " ");
    disp = disp.replace("__","  ");
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
</script>
<script type="text/javascript">

//Nested Side Bar Menu (Mar 20th, 09)
//By Dynamic Drive: http://www.dynamicdrive.com/style/

var menuids=["sidebarmenu1"] //Enter id(s) of each Side Bar Menu's main UL, separated by commas

function initsidebarmenu(){
for (var i=0; i<menuids.length; i++){
  var ultags=document.getElementById(menuids[i]).getElementsByTagName("ul")
    for (var t=0; t<ultags.length; t++){
    ultags[t].parentNode.getElementsByTagName("a")[0].className+=" subfolderstyle"
  if (ultags[t].parentNode.parentNode.id==menuids[i]) //if this is a first level submenu
   ultags[t].style.left=ultags[t].parentNode.offsetWidth+"px" //dynamically position first level submenus to be width of main menu item
  else //else if this is a sub level submenu (ul)
    ultags[t].style.left=ultags[t-1].getElementsByTagName("a")[0].offsetWidth+"px" //position menu to the right of menu item that activated it
    ultags[t].parentNode.onmouseover=function(){
    this.getElementsByTagName("ul")[0].style.display="block"
    }
    ultags[t].parentNode.onmouseout=function(){
    this.getElementsByTagName("ul")[0].style.display="none"
    }
    }
  for (var t=ultags.length-1; t>-1; t--){ //loop through all sub menus again, and use "display:none" to hide menus (to prevent possible page scrollbars
  ultags[t].style.visibility="visible"
  ultags[t].style.display="none"
  }
  }
}

if (window.addEventListener)
window.addEventListener("load", initsidebarmenu, false)
else if (window.attachEvent)
window.attachEvent("onload", initsidebarmenu)

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
<script language = "Javascript">
          function checkEmail() {
            if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(form.email.value)){
            return true;
            }
            return false; 
          }
          function checkName(str){
             var re = /[^a-zA-Z]\s/g
                 // var re = ^([a-zA-Z]+(_[a-zA-Z]+)*)(\s([a-zA-Z]+(_[a-zA-Z]+)*))*$
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
        
              var nn=document.form.Nname;
              var no = document.form.Nno;
              var i=document.form.idd;
              var p=document.form.Npwd;
              var pl=document.form.Naddr;
              var ph=document.form.Ncontact;
              var co=document.form.Npost;
              var desgno = document.form.DESG_NO;
              var pco=document.form.NpostingCo;
              var emailID=document.form.Nmail;
              var dn = document.form.deptName;
              var dns = document.form.subDept;
              
             
           
               
            if ((nn.value==null)||(nn.value=="")){
            alert("Please Enter Name!")
            nn.focus()
            return false
            }
            if (checkName(nn.value)==false){
            nn.value=""
            alert("Invalid Name!");
            nn.focus()
            return false
            }
            if ((no.value==null)||(no.value=="")){
                alert("Please Enter EMP No.!")
                no.focus()
                return false
                }
                if (checkName(no.value)==false){
                no.value=""
                alert("Invalid No.!");
                no.focus()
                return false
                }
                if ((i.value==null)||(i.value=="")){
                    alert("Please Enter ID!")
                    i.focus()
                    return false
                    }
                    if (checkAddress(i.value)==false){
                    i.value=""
                    alert("Invalid ID!");
                    i.focus()
                    return false
                    }
                  
               if ((p.value==null)||(p.value=="")){
            alert("Please Enter PASSWORD!")
            p.focus()
            return false
            }
            if (checkAddress(p.value)==false){
            p.value=""
            alert("Invalid PASSWORD!");
            p.focus()
            return false
            }
            pl.focus()
            ph.focus()
           
            if ((pl.value==null)||(pl.value=="")){
            alert("Please Enter ADDRESS!")
            pl.focus()
            return false
            }
            if (checkAddress(pl.value)==false){
            pl.value=""
            alert("Invalid ADDRESS!");
            pl.focus()
            return false
            }
            
            if ((ph.value==null)||(ph.value=="")){
            alert("Please Enter phone No!")
            ph.focus()
            return false
            }
            if (checkNumber(ph.value)==false){
            ph.value=""
            alert("Invalid phone No!");
            ph.focus()
            return false
            }
       
                
            
           /*  if ((desgno.value==null)||(desgno.value=="")||(desgno.value=="0")){
            alert("SELECT DESIGNATION")
            desgno.focus()
            return false
            } */
            
             if ((pco.value==null)||(pco.value=="")||(pco.value=="0")){
            alert("Please Select Reporting Officer Branch!");
            pco.focus();
            return false
            }
            if (checkAddress(pco.value)==false){
            pco.value="";
            alert("Invalid COMPANY!");
            pco.focus();
            return false;
            }
         
                if ((emailID.value==null)||(emailID.value=="")||(emailID.value=="0")){
                    alert("Enter Validate Email ID!");
                    emailID.focus();
                    return false;
                    }
                    if (validateEmailsh(emailID.value)==false){
                    	emailID.value="";
                    alert("Invalid Email ID!");
                    emailID.focus();
                    return false;
                    }
                    if ((dn.value==null)||(dn.value=="")||(dn.value=="0")){
                        alert("Please Select Department");
                        dn.focus();
                        return false;
                        }   
                    
                    if ((dn.value=="NON") && (dns.value=="Select"))
            		{
            			 alert("Kindly Select Sub Department!");
            		         dn.focus();
            			 return false;
            			 }
           else
       return true;
}
       
</script>
<script type="text/javascript">
function changeFunc() {
    var selectBox = document.getElementById("selectBox");
    var selectedValue = selectBox.options[selectBox.selectedIndex].value;
    var selectedValue2 = selectBox.options[selectBox.selectedIndex].text;
    document.getElementById('iddesg').value = selectedValue;
    document.getElementById('iddesgg').value = selectedValue2;
    
   }
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
</script>
<script language="javascript" type="text/javascript">
function popitup(url) {
	//newwindow=window.open(url,'name','height=300,width=150,scrollbars=1');
	//if (window.focus) {newwindow.focus()}
	//return false;
		newwindow=window.open(url,'name','height=300,width=1100,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
	if (window.focus) {newwindow.focus()}
	return false;
}

</script>

</head>

<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80"  style="overflow-x: hidden; overflow-y: hidden;">
<div id="wrapper">
<div id="id">
<table>
<tr>
<td>
<img src="images/nippon.gif" height="35" width="220"> </td>

</table> 

 <form name="form" method="post" onSubmit="return validate()" action="formUserAdd.jsp">

<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
<tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	CREATE FORM USER </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">C2IT (CONNECT TO IT)</font></strong></td>
</tr>
</table>

<br>
<br />
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


 <div id='right_table'>


<%
String idd=request.getParameter("idd");
String Nname=request.getParameter("Nname");
String Npwd=request.getParameter("Npwd");
String Naddr=request.getParameter("Naddr");
String Ncontact=request.getParameter("Ncontact");
String Npost=request.getParameter("Npost");
String NpostingCo=request.getParameter("NpostingCo");
String Nmail=request.getParameter("Nmail");
Connection cn01e = null;
Statement st01e = null; 
ResultSet rs01e = null;
cn01e = con.getConnection2();
st01e=cn01e.createStatement();
rs01e = st01e.executeQuery("select dept_name from department_master WHERE dept_name NOT LIKE '%IT%' ORDER BY dept_name Asc");

Connection cn02 = null;
Statement st02 = null; 
ResultSet rs02 = null;
cn02 = con.getConnection2();
st02=cn02.createStatement();
rs02 = st02.executeQuery("select m_b_name,m_b_no from branch_master_main ORDER BY m_b_name Asc");
Connection cn022 = null;
Statement st022 = null; 
ResultSet rs022 = null;
cn022 = con.getConnection2();
st022=cn022.createStatement();
rs022 = st022.executeQuery("select b_name from branch_master ORDER BY b_name Asc");
Connection cn01 = null;
Statement st01 = null; 
ResultSet rs01 = null;
cn01 = con.getConnection2();
st01=cn01.createStatement();
rs01 = st01.executeQuery("select DESIGNATION,DESG_NO from desg ORDER BY DESIGNATION Asc");
try{
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
<font color=darkblue size=3 > CREATE FORM USER</font>
</td>
</tr>

	
	<tr><td><font size=2>NAME:<font color=red>*</font></font></td>
	<td><input type="text" name="Nname" value="" size=30>
		<input style="display: none;" type="text"  name="adminName" value="<%=Name%>" />
		<input style="display: none;" type="text"  name="adminMail" value="<%=email_id%>" />
	</td></tr>
	<tr><td><font size="2">EMP NO.:</font><font color=red>*</font></td><td><input type="text" name="Nno" value=""></td></tr>
	<tr><td><font size=2>NEW USER ID:<font color=red>*</font></font></td><td><input type="text" name="idd" value="" size=30></td></tr>
	<tr><td><font size=2>PASSWORD:<font color=red>*</font></font></td><td><input type="text" name="Npwd" value="" size=30></td></tr>
	<tr><td><font size=2>ADDRESS:</font></td><td><input type="text" name="Naddr" value="" size=30></td></tr>
	<tr><td><font size=2>CONTACT NO:</font></td><td><input type="text" name="Ncontact" value="" size=30></td></tr>
	
	<tr>
	<td><font size=2>REPORTING BRANCH<font color=red>*</font></font></td><td><select name="NpostingCo">
			<option value="0">Select</option>
			<%while(rs02.next()){ %>
			
			<%-- <option><%=rs02.getString("m_b_name")%></option> --%>
			<option ><%=rs02.getString(1)+" - "+rs02.getString(2)%> </option>
			<%} %>
		</select>
  		</td>
  		
</tr>

	<tr><td><font size=2>MAIL ID:</font></td><td><input type="text" name="Nmail" value="" size=30></td></tr>
	<tr><td><font size="2">DESIGNATION</font><font color=red>*</font></td>
    <td><select id="selectBox"  onchange="changeFunc(this.id);">
			<option value="0">Select</option>
			<%while(rs01.next()){ %>
			
			<option value="<%=rs01.getString("DESG_NO")%>"><%=rs01.getString("DESIGNATION")%></option>
			<%} %>
		</select><a href="NewDesignation.jsp?msg=1"  onclick="return popitup('NewDesignation.jsp?msg=1')">New</a>
  		</td>
   </tr>
   	<tr style="display: none; "><td><font size="2">CODE</font></td><td>
	<input style="display: none;" type="text" id="iddesgg" name="designation" value="" />
	<input type="text" id="iddesg" name="desg_no" value="" readonly="readonly" /></td></tr>
	
	
	<tr><td><font size="2">DEPT-NAME</font><font color=red>*</font></td>
	<td>
	<select name="deptName" >
			<option onclick="hideHigherTR();" value="0">Select</option>
		    <option onclick="hideHigherTR();" value="IT">IT</option>
			<option onclick="showHigherTR();" value="NON">NONIT</option>
	</select> 
	
	</td>
	
	</tr>
	
					
<%-- 						<tr><td><font size="2">DEPT-NAME</font><font color=red>*</font></td>
	<td>
	<select name="deptName"  style="font-size : 8pt;width: 190px">
					<option value="o" style="background: lightgrey;" > ---Select---</option>
					<%while(rs01e.next()){ %>
					<option> <%=rs01e.getString(1)%> </option> 
					<%} %> </select>
	</td>
	
	</tr> --%>
		<tr style="visibility: hidden;display: none;" id="idApprovedd">
		<td ><font size="2">SUB DEPT-NAME</font><font color=red>*</font></td>
		<td>
  		
  		<select name="subDept">
			<option value="Select">Select</option>
			<%while(rs01e.next()){%>
			<option ><%=rs01e.getString(1)%> </option>
			<%} %>
		</select>
  		</td>
	 </tr>
	<tr><td>
    <a href="DisplayFormUser.jsp?msg=1" onclick="return popitup('DisplayFormUser.jsp?msg=1')"><font size=3>View Form Users</font></a> </td>
<!-- 	<td><input type=submit name="button" value="SAVE" id="button" onclick="return( validate() && dynamicValidation() && evalGroup() && lead());"> -->
	<td><input type=submit name="button" value="SAVE" id="button" onclick="return makeitup();" >
	    <input type="reset" value="RESET"/></td></tr>
	
	</table>
	</td>
	
	<td width="39%">
	
	</td>
</tr>

</table>


                 </div>
	</form>
	
	
	<%
}
catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(rs01,st01,cn01);
	DbUtil.closeDBResources(rs02,st02,null);
	DbUtil.closeDBResources(rs022,st022,cn022);
	DbUtil.closeDBResources(rs01e,st01e,cn01e);
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
  <tr align="center"> <td class="greenLine" style="font-style: italic;"></td></tr>
<tr align="center"><td class="blueLine" style="font-style: italic;"></td></tr>
</table> 

</div>

</div>
</body>
</html>