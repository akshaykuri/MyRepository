<%-- <%@page import="CON2.DbUtil"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="CON2.DbUtil"%>
<%@ page import = "java.util.ResourceBundle" %>
<%@page language="java"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@page import = "java.util.Date" %>

<%@ page import="java.sql.*" %>
<%@page import = "java.text.DateFormat" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%@ include file="banner.jsp" %>
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" />
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css"/>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<script src="http://api.jqueryui.com/datepicker/#option-beforeShowDay"></script> 


<link href="stylelog.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" type="image/x-icon" href="../images/faviconnnnn.ico" />

<title>login</title>
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />
<title>login HO</title>
<script type="text/javascript"> //<![CDATA[ 
var tlJsHost = ((window.location.protocol == "https:") ? "https://secure.trust-provider.com/" : "http://www.trustlogo.com/");
document.write(unescape("%3Cscript src='" + tlJsHost + "trustlogo/javascript/trustlogo.js' type='text/javascript'%3E%3C/script%3E"));
//]]>
</script>

<style>
 body,html {
	height: 98.5%;
	overflow: hidden;
}

.bg { /* The image used */
	background-image: url(../images/NipponHomePage.JPG);
	/* Full height */
	height: 100%;
	/* Center and scale the image nicely */
	background-position: relative;
	background-repeat: no-repeat;
	background-size: 100% 100%;
}
</style> 



<style type="text/css">
.ui-datepicker {
    background: #728FCE;
    border: 1px solid #555;
    color: #EEE;
    width: 400px;
    height:260px;
}
#highlight, .highlight {
    /*background-color: #000000;*/
}
.highlight > a.ui-state-default {
    
    border: 1px solid blue;
    color: white;
    background-color: #f4a341;
}
div#id
 {
  width:100px;
  height:100px;
 }
 
 </style>
<script>
function getinfo(aa)
        {
		alert("selected date:: "+aa);
	    }
</script>

<script language="javascript" type="text/javascript">

$(function() {

	var fromdays = [];
	var aaa=[];
	var todays = [];
	var bbb=[];
	
	var x = document.getElementById("fromdays").value;
	var aa = x.split(','); 
	for(q = 0; q < aa.length; q++)
	  {
		    aaa = aa[q].split('-');
		    fromdays[q]=new Date(aaa[0], aaa[1]- +1, aaa[2]);	
	  } 
	
	var y = document.getElementById("todays").value;
	var bb = y.split(',');  
	for(s = 0; s < bb.length; s++)
	  {     
		    bbb = bb[s].split('-');
		    todays[s]=new Date(bbb[0], bbb[1]- +1, bbb[2]);	
	  } 
	
    $('#datepicker').datepicker({
    	dateFormat: 'yy-mm-dd',
        numberOfMonths: [1, 1],
        beforeShowDay: highlightDays
    }).click(function() {
        $('.ui-datepicker-today a', $(this).next()).removeClass('ui-state-highlight ui-state-hover');
        //$('.highlight a', $(this).next()).addClass('ui-state-highlight');
    });


    $('#datepicker').click(function() {
        // put your selected date into the data object
        var data = $('#datepicker').val();
     /*
        $.get('getdata.php?date=' + data, function(data) {
            $('#events').html(data).show('slow');
        });*/
    });

    function highlightDays(date) { 
        for (var xa = 0;xa < fromdays.length; xa++){
        	
        	if(fromdays[xa].getTime()  == date.getTime()) { 
	                    return [true, 'highlight'];
	              } 
	        	
        }
        	
     return [true, ''];    
    }
    
});
</script>
 <script language="javascript" type="text/javascript">
	 function checkAddress(str){
		  
         
		   var re = /[^\s]+[a-zA-Z ]*[^\s]+[0-9][/][(][)][.]/g; 
       if (re.test(str)) return false;
       return true;
     }

   function validate()
   {
       
       var d1=document.form1.t1;
       var d2=document.form1.t2;
    if ((d1.value==null)||(d1.value=="NULL"))
				{
  				 alert("Enter Valid Admin ID!");
   			         d1.focus();
  				 return false;
  				 }
    if ((d2.value==null)||(d2.value=="NULL"))
	{
		 alert("Enter Valid Password!");
	         d2.focus();
		 return false;
		 }
      
  	 
else
return true;
   }
</script>




<script type="text/javascript">

function saveroles()
{
	var rolename="",rolename1=	"";
	rolename=document.getElementById("t1").value.length;
	rolename1=document.getElementById("t2").value;
	if(rolename<1)
	{
		alert("Plz Enter the Admin ID");
	}
	else if(rolename1<1)
	  {
	    alert("PLZ ENTER THE PASSWORD");
	    } 
	    
	      
	else
	{		
		Rolesave(rolename1);
		document.getElementById("t1").value="";
		window.setInterval("savereset('hi')", 3000);
	}
}
 function popitup2(url) {
	newwindow=window.open(url,'name','directories=no,titlebar=no,toolbar=no,menubar=no,height=200,width=300,location=no,status=1,scrollbars=0,resizable=yes,channelmode=yes');
	if (window.focus) {newwindow.focus()}
	return false;
} 
 function getbookingdetails(url) {
		newwindow=window.open(url,'name','height=300,width=900,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
		if (window.focus) {newwindow.focus()}
		return false;
	}

/* function popupwindow(url, title, w, h) {
	  var left = (screen.width/2)-(w/2);
	  var top = (screen.height/2)-(h/2);
	  return window.open(url, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width='+w+', height='+h+', top='+top+', left='+left);
	} */
</script>




 <script  type="text/javascript">

<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27", "");
    disp = disp.replace("__", "  ");
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
</script> 
<script type="text/javascript" language="javascript">
 window.onload=blinkOn;
 
function blinkOn()
{
  document.getElementById("blink").style.color="#ec691f"
  setTimeout("blinkOff()",1000)
}
 
function blinkOff()
{
  document.getElementById("blink").style.color="#2f4377"
  setTimeout("blinkOn()",1000)
}
 
 
 
</script>

</head>

<body style="overflow-x: hidden; overflow-y: hidden;">
<div class="bg"></div>


<aside style="float: left;margin-left:50px;margin-top:-24%;">
 <div  style="opacity:0.7;" id="datepicker" align="center" onchange="getbookingdetails('Displaybookinginfo.jsp?msg='+this.value)" > </div> 
 
</aside>					
 <aside style="float: right;margin-right:10%;margin-top:-19%;">

							<div style="width: 45%;margin: auto;"> 
								<form method="get"  name="form1"  action="LoginConRoomBack.jsp">
								
						
								   <fieldset class="fieldset" style="width: 125%;margin: auto;background-color:#728FCE;opacity:0.7;">
									      <legend class="legend" style="color:black;background-color:#8ec300;border-radius:10px; width: 90%;margin-left:10px;opacity:0.7;"><b><center>Conference Room Booking Login</center></b></legend>  
											 <table> 
												<tr>
												   <td style="color: black;"><b>User Id:</b></td>
												   <td><input type="text" name="t1" id="t1" placeholder="User Id" ></td>
											    </tr>
												<tr>
												    <td style="color:black;"> <b>Password:</b></td>
												    <td><input type="password" name="t2" id="t2" placeholder="Password" ></td>
												</tr>
												<tr>
												  <td  align="center" class="buttons"> <a href="../HOME.jsp" ><font size="2" style="color:black;"><b>HOME</b></font></a></td> 
												  <td  align="right"><input class="buttons" id="login" type="submit" value="Login" style="background-color:#EAEDED;cursor: pointer;font-weight:bold;" onclick="return check()"></td>
											    </tr>
											</table>
								</fieldset>
								
								
											<br> 
								 <div   style="margin-left:150px;margin-top:40%;"> 
								<script language="JavaScript" type="text/javascript">
                                    TrustLogo("../images/sectigo_trust.png", "CL1", "none");
                                </script>
                                </div>
								</form>
								</div>
								
								
						</aside>

























<div id="id">
<!-- 
<img src="images/nippon.gif" height="35" width="220"> <img src="images/cs-soft.jpg" height="20" width="100" align="right">
  -->
<table>
<tr>
<td>
<img src="../images/nippon.gif" height="35" width="220"> </td>
<td align="right">
<img src="../images/cs-soft.jpg" height="30" width="100" hspace="796" ></td>
</table> 
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">

  <tr align="center">
    <td bgcolor="#ec691f"><strong><font size ="4" color="white"><b>C2IT (CONNECT TO IT)</b><br />
    
 </font></strong></td></tr>
 <tr align="center">
 <td bgcolor="#2f4377"><strong><font size ="4" color="white">USER LOGIN</font></strong></td></tr>
</table>




<!-- 
<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr>
<td width="1118" align="right"> 
<a href="javascript:top.window.close(),close1()"><img src="logout-icon.png" height="35" width="35" title="LOGOUT"></a>

<a href="logout.jsp"><font size=2>LOGOUT</font></a>
</td> 
</tr> 
</table> -->

<form method="get"  name="form1"   action="LoginConRoomBack.jsp" >
<table width="1118" height="290" border="0" cellpadding="0" cellspacing="0" ID="Table1">


 <tr>
  <td width="360" align="justify" valign="top"></td>
  <td width="360" align="justify" valign="top"></td>
  <td width="260" align="justify" valign="top"></td>
  
  <td width="1" align="justify" valign="middle" >
  <div id="datepicker" align="center" onchange="getbookingdetails('Displaybookinginfo.jsp?msg='+this.value)" > </div>
    <!-- <img src="../images/g.jpg" width="530" height="220" border=""> -->
  </td>
  <td width="60" align="justify" valign="top"></td>
  <td width="560" align="justify"  valign="top" height="50"></td>
  <td width="540" align="center" valign="top" height="50">
  
 <table width="100%" height=120 border="0" cellpadding="3" cellspacing="1" bgcolor="" height="80">

  <tr>

 <td colspan="3"><strong><u>USER LOGIN</u></strong></td>
 </tr>
 </table>
<marquee>PLEASE ENTER HRMS EMPID AND PASSWORD</marquee>
 <table width="100%" border="0" cellpadding="3" cellspacing="1" height="50" bgcolor="#ec691f">
 <tr>
 <td colspan="3"><strong>User Login </strong></td>
 </tr>
 <tr>
 <td width="78">User Id</td>
 <td width="6">:</td>
 <td width="294"><input name="t1" type="text" id="t1"></td>
 </tr>
 <tr>
 <td>Password</td>
 <td>:</td>
 <td><input name="t2" type="password" id="t2"></td>
 </tr>
 <tr>
 <td width="425"><a href="Conference/forgotpasswordconference.jsp?msg=1" onclick="return popitup2('../Conference/forgotpasswordconference.jsp?msg=1')" id="hiderow"><font size="1">Forgot password</font></a></td>
 <td>&nbsp;</td>
 <td width="1118" align="center" > <input type="image" align="middle" src="../login3.jpg" height="25" width="80" name="button" id="button" value="Submit" onclick="saveroles()" onmouseout="this.className='buttons'" onmouseover="this.className='buttons buttonsHover'"/>
 </tr>

 </table>
 <br>
<!--  <a href="changePwdAdmin.jsp?msg=1" onclick="return popitup2('changePwdAdmin.jsp?msg=1')" id="hiderow"><font size=2>Change Password</font></a>
  --></td>

<%-- <table width="100%" height="100%" border="0" cellpadding="0"  cellspacing="0" ID="Table2">
	<tr> --%>
	
		
		<td width="400" height="258" align="justify" valign="middle">&nbsp;</td>
		
		
</tr>

</table>


<%

String swid = request.getParameter("id");
//System.out.println("idddddd----edit page"+swid);
Connection conn=null;

ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");

Statement st=null,st2=null,st3=null;
ResultSet rs=null,rs2=null,rs3=null;
 try 
  {
	 Class.forName(driver).newInstance();
	 conn= DriverManager.getConnection(url+dbName,userName,password);
   int i1=0;
   String dateco="";
   String dateco1="";
   String todaysDate="2018-04-20";
   String query1 = "SELECT `from_date`,`to_date` FROM `conference_room_booking` where `status`='Active' ";
   st2 = conn.createStatement();
   rs2 = st2.executeQuery(query1);  %>
    
   <%while(rs2.next()){ 
	   if(i1==0)
	      {
	      dateco=rs2.getString("from_date");
	      dateco1=rs2.getString("to_date");
	      i1++;
	      }
	   else
	   {
		   dateco+=","+rs2.getString("from_date"); 
		   dateco1+=","+rs2.getString("to_date"); 
	   }
   
	  }%>
            <input type="hidden" id="fromdays" size="100" value="<%=dateco%>" />
            <input type="hidden" id="todays" size="100" value="<%=dateco1%>" />
           

          <% }catch (SQLException ex) 
             {
              ex.printStackTrace();
             }     	
     finally{
			} %>
			

 



</form>
</div>
</body>
</html>