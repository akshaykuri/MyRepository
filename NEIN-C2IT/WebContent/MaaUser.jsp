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
<title>MAA USER</title>
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
<script language = "Javascript">
          function checkEmail() {
            if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(form.email.value)){
            return true;
            }
            return false; 
          }
          function checkName(str){
              var re = /[^a-zA-Z]\s/g
              if (re.test(str)) return false;
              return true;
            }
            function checkNumber(str){
              var re = /[^[0-9][/]]/g
              if (re.test(str)) return false;
              return true;
            }
            function checkAddress(str){
              var re = /[^[a-z][A-Z][0-9][/][#][[][]][,][.]/g
              if (re.test(str)) return false;
              return true;
            }
            
          function validate(){
              var i=document.form.idd;
              var nn=document.form.Nname;
                   var p=document.form.Npwd;
                   
              
         
          
                var co=document.form.Npost;
                var pco=document.form.NpostingCo;
                
                var pl=document.form.Naddr;
            var emailID=document.form.Nmail;
                var ph=document.form.Ncontact;
            
            
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
            
            
            /*if ((pl.value==null)||(pl.value=="")){
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
            }*/
             if ((co.value==null)||(co.value=="")){
            alert("Please Enter POST!")
            co.focus()
            return false
            }
            if (checkAddress(co.value)==false){
            co.value=""
            alert("Invalid POST!");
            co.focus()
            return false
            }
             if ((pco.value==null)||(pco.value=="")){
            alert("Please Enter POSTING COMPANY!")
            pco.focus()
            return false
            }
            if (checkAddress(pco.value)==false){
            pco.value=""
            alert("Invalid COMPANY!");
            pco.focus()
            return false;
            }
          
            
            
            /*if ((emailID.value==null)||(emailID.value=="")){
            alert("Please Enter your Email ID!")
            emailID.focus()
            return false
            }
            if (checkEmail(emailID.value)==false){
            emailID.value=""
            alert("Invalid Email Adderess!");
            emailID.focus()
            return false;
            }*/
            
           
	 else
       return true;
}
        </script>

<script language="javascript" type="text/javascript">
<!--
function popitup(url) {
	//newwindow=window.open(url,'name','height=300,width=900,location=1,status=1,scrollbars=1');
	//if (window.focus) {newwindow.focus()}
	//return false;
	
		newwindow=window.open(url,'name','fullscreen=yes,height=,width=,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
	if (window.focus) {newwindow.focus()}
	return false;
}
 

// -->
</script>
</head>
<body bgcolor="" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70">

<div id="wrapper">
<img src="images/nippon.gif" height="35" width="220"> <img src="images/cs-soft.jpg" height="25" width="100" align="right">
 <form name="form" method="post" onSubmit="return validate()" action="AddsMaa.jsp">

<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#ec691f"><strong><font size ="4" color="white"><b>CHENNAI BRANCH</b><br />
    
 </font></strong></td></tr>
 <tr align="center">
 <td bgcolor="#2f4377"><strong><font size ="4" color="white">CHECK SHEET (CS-SOFT)</font></strong></td></tr>
</table>

<br>
<br />


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


Connection cn02 = null;
Statement st02 = null; 
ResultSet rs02 = null;
cn02 = con.getConnection2();
st02=cn02.createStatement();
rs02 = st02.executeQuery("select b_name from branch_master ORDER BY b_name Asc");
%>



<table width="920" height="3" cellpadding="0" cellspacing="0" ID="Table1">


  <tr>
  <td width="25%" align="justify" valign="top"></td>
    <td width="21%" align="justify" valign="top">



<div class="sidebarmenu">
<ul id="sidebarmenu1">
       <li><a href="createBOMuser.jsp?msg=1">HO</a></li>
    <li><a href="BlrUser.jsp?msg=1">BLR</a></li>
    <li><a href="BomUser.jsp?msg=1">BOM</a></li>
    
    <li><a href="DelUser.jsp?msg=1">DEL</a></li>
    <li><a href="CcuUser.jsp?msg=1">CCU</a></li>
   
    <li><a href="MaaUser.jsp?msg=1">MAA</a></li>
</ul>
</div>
</td>
<td width="5%" align="justify" valign="top"></td>
<td width="5%" align="justify" valign="top"></td>
<td width="79%"><table width="100%" border="2" >
    <tr>
<td align=center width=60%  colspan=2  background=".jpg">
<font color=darkblue size=3 > CREATE SPECIFIC USER</font>
</td>
</tr>

	<tr><td><font size=2>NEW USER ID:<font color=red>*</font></font></td><td><input type="text" name="idd" value="" size=30></td></tr>
	<tr><td><font size=2>NAME:<font color=red>*</font></font></td><td><input type="text" name="Nname" value="" size=30></td></tr>
	<tr><td><font size=2>PASSWORD:<font color=red>*</font></font></td><td><input type="text" name="Npwd" value="" size=30></td></tr>
	<tr><td><font size=2>ADDRESS:</font></td><td><input type="text" name="Naddr" value="" size=30></td></tr>
	<tr><td><font size=2>CONTACT NO:</font></td><td><input type="text" name="Ncontact" value="" size=30></td></tr>
	<tr><td><font size=2>POST:<font color=red>*</font></font></td><td><input type="text" name="Npost" value="" size=30></td></tr>
	<tr>
	<td><font size=2>POSTING<font color=red>*</font></font></td><td><select name="NpostingCo">
			<option value="0">Select</option>
			<%while(rs02.next()){ %>
			
			<option><%=rs02.getString("b_name")%></option>
			<%} %>
		</select>
  		</td>
</tr>
	<tr><td><font size=2>MAIL ID:</font></td><td><input type="text" name="Nmail" value="" size=30></td></tr>
	
	<tr><td>
    <a href="DisplayDelMaa.jsp" onclick="return popitup('DisplayDelMaa.jsp')">View Detail</a> </td>
	<td><input type=submit name="button" value="Create" id="button">
	    <input type="reset" value="Reset"/></td></tr>
	
	</table></td>
	
	

	
</tr>

</table>




                 </div>
	</form>
	
	



<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="HOME.jsp"><img src="home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 

<td width="115" align="right"> 
<a href="adminbom.jsp"><img src="bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table> 


<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#2f4377"><strong><font size ="3" color="white"> NIPPON EXPRESS (INDIA) PRIVATE LIMITED  </font></strong></td>
    
  </tr>
</table> 



</div>
</body>
</html>