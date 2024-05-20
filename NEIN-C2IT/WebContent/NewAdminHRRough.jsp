<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu-v.css" />
<title>Insert title here</title>
<script type="text/javascript" src="API/Js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="js/ddsmoothmenu.js"></script>
<script type="text/javascript">

ddsmoothmenu.init({
	mainmenuid: "smoothmenu2", //Menu DIV id
	orientation: 'v', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu-v', //class added to menu's outer DIV
	method: 'toggle', // set to 'hover' (default) or 'toggle'
	arrowswap: true, // enable rollover effect on menu arrow images?
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
});

</script>
</head>
<body>
<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70">

<div id="wrapper">
<form>
<!-- <img src="images/nippon.gif" height="35" width="220"> <img src="images/cs-soft.jpg" height="20" width="100" align="right">
 -->
 <table>
<%System.out.println("NAME : "+session.getAttribute( "Nname" )+"  CITY :"+session.getAttribute("city")+"   ADMIN:"+session.getAttribute("admin")+"   B_NO :"+session.getAttribute("b_no"));%>
<tr>
<td>
<img src="images/nippon.gif" height="35" width="220"> </td>
<td align="right">
<img src="images/cs-soft.jpg" height="30" width="100" hspace="796" ></td>
</table> 
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#ec691f"><strong><font size ="4" color="white" ><b>ADMINISTRATOR </b><br />
    
 </font></strong></td></tr>
 <tr align="center">
 <td bgcolor="#2f4377"><strong><font size ="4" color="white">CHECK SHEET (CS-SOFT)</font></strong></td></tr>
</table>


<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 

<tr>
<td width="1118" align="right"> 
<!--<a href="javascript:top.window.close(),close1()"><img src="logout-icon.png" height="35" width="35" title="LOGOUT"></a>
-->
<a href="logout.jsp"><font size=2>LOGOUT</font></a>
</td> 
</tr> 
</table>


<br />
<table width="920" height="63" border="0" cellpadding="0" cellspacing="0" ID="Table1">


  <tr>
  <td width="360" align="justify" valign="top"></td>
    <td width="560" align="justify" valign="top">
<!--<font style="text-decoration: blink;">
-->
<font > Welcome :<%= session.getAttribute( "Nname" ) %>
<%--
System.out.println("Session Result : "+session.getAttribute("b_no"));
--%>
</font>
<%--if(session.getAttribute("city").equals(null)||session.getAttribute("city").equals("null")||session.getAttribute("city").equals(""))
	{
	out.println("Session Time Out");
	
	response.sendRedirect("http://10.206.10.18:8185/CheckSheet/HOME.jsp");
        return;
    } --%>
<br />
<br>
<div id="smoothmenu2" class="ddsmoothmenu-v">
 <ul id="sidebarmenu1">
  
        <li><a href="#">Resignation</a>
        <ul>
      		<li><a href="ITFORMS/ITclearance.jsp?msg=1">Create</a></li>
      		<li><a href="">View</a>
      		
      		</li>
      		
      	</ul>
      	</li>
      	<li><a href="#">Domain User</a>
      <ul>
      		<li><a href="DomainUser/DomainUserPage.jsp?msg=1">Create</a></li>
      		<li><a href="">View</a></li>
      	</ul>
      	</li>
      	<li><a href="#">Lotus Notes</a>
      <ul>
            <li><a href="LOTUS/LotusPage.jsp?msg=1">Create</a></li>
      		<li><a href="FORMS/lotus.jsp">PAST Create</a></li>
      		<li><a href="">View</a></li>
      	</ul>
      	</li>
      	<li><a href="#">Issue of Access Card</a>
      <ul>
       <li><a href="AccessCard/AccessCardPage.jsp?msg=1">Create</a></li>
      		<li><a href="FORMS/access.jsp">PAST Create</a></li>
      		<li><a href="">View</a></li>
      	</ul>
      	</li>
      	<li><a href="#">Shared Floder Form</a>
      <ul>
       <li><a href="SharedFolder/SharedFolderPage.jsp?msg=1">Create</a></li>
      		<li><a href="FORMS/floder.jsp">PAST Create</a></li>
      		<li><a href="">View</a></li>
      	</ul>
      	</li>
          
          <li><a href="#">Internet Access Form</a>
      <ul>
       <li><a href="InternetAccess/InternetAccessPage.jsp?msg=1">Create</a></li>
      		<li><a href="FORMS/internet.jsp">PAST Create</a></li>
      		<li><a href="">View</a></li>
      	</ul>
      	</li>
      
      <li><a href="#">Newin's Users Form</a>
      <ul>
       
       <li><a href="Newins/NewinsPage.jsp?msg=1">Create</a></li>
      		<li><a href="FORMS/newins.jsp">PAST Create</a></li>
      		<li><a href="">View</a></li>
      	</ul>
      	</li>
  </ul>
  </div>
 <a href="changePwdAdmin.jsp?msg=1" onclick="return popitup2('changePwdAdmin.jsp?msg=1')" id="hiderow"><font size=2>Change Password</font></a>


		<td width="360" height="11" align="justify" valign="bottom">
		<img src="images/file.jpg" width="400" height="250" border="0"></td>
</tr>
</table>





<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="HOME.jsp"><img src="home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address> 
</td> 
 
<td width="115" align="right"> 
<a href="adminlinkHR.jsp?msg = 1"><img src="bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table> 



<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#2f4377" align="center"><strong><font size ="3" color="white">NIPPON EXPRESS (INDIA) PRIVATE LIMITED  </font></strong></td>
    
  </tr>
</table> 
</form>
</div>


</body>

</body>
</html>