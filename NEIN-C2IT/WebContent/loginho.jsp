<%@ page language="java" contentType="text/html; charset=ISO-8859-1"   pageEncoding="ISO-8859-1"%>
<%@ include file="banner.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel='stylesheet' type='text/css' href='css/headerColor.css' />
<title>login HO</title>
<script type="text/javascript"> //<![CDATA[ 
var tlJsHost = ((window.location.protocol == "https:") ? "https://secure.trust-provider.com/" : "http://www.trustlogo.com/");
document.write(unescape("%3Cscript src='" + tlJsHost + "trustlogo/javascript/trustlogo.js' type='text/javascript'%3E%3C/script%3E"));
//]]>
</script>
</head>

<script  type="text/javascript">

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
<style>
 body,html {
	height: 98.5%;
	overflow: hidden;
}

.bg { /* The image used */
	background-image: url(images/NipponHomePage.JPG);
	/* Full height */
	height: 100%;
	/* Center and scale the image nicely */
	background-position: relative;
	background-repeat: no-repeat;
	background-size: 100% 100%;
}
</style> 


<body style="overflow-x: hidden; overflow-y: hidden;">
<div class="bg"></div>




                 <aside style="float: right;margin-right:10%;margin-top:-19%;">
							<div style="width: 45%;margin: auto;"> 
								<form method="post"  name="form1"   action="logtestho.jsp">
								
						
								   <fieldset class="fieldset" style="width: 125%;margin: auto;background-color:#728FCE;opacity:0.7;">
									      <legend class="legend" style="color:black;background-color:#8ec300;border-radius:10px; width: 90%;margin-left:10px;opacity:0.7;"><b><center>System Admin Login</center></b></legend>  
											 <table> 
												<tr>
												   <td style="color: black;"><b>User Id:</b></td>
												   <td><input type="text" name="tho" id="tho" placeholder="User Id" ></td>
											    </tr>
												<tr>
												    <td style="color:black;"> <b>Password:</b></td>
												    <td><input type="password" name="t2" id="t2" placeholder="Password" ></td>
												</tr>
												<tr>
												 <td  align="center" class="buttons"> <a href="HOME.jsp" ><font size="2" style="color:black;"><b>HOME</b></font></a></td> 
												  <td  align="center"><input class="buttons" id="login" type="submit" value="Login" style="background-color:#EAEDED;cursor: pointer;font-weight:bold;" onclick="return check()"></td>
											    </tr>
											</table>
								</fieldset>
								<br>  
								 <div   style="margin-left:150px;margin-top:40%;"> 
								<script language="JavaScript" type="text/javascript">
                                    TrustLogo("images/sectigo_trust.png", "CL1", "none");
                                </script>
                                </div>
								</form>
								</div>
						</aside>






















<!--  <table width="100%" height=120 border="0" cellpadding="3" cellspacing="1" bgcolor="" height="80">

  <tr>

 <td colspan="3"><strong><u>USER LOGIN</u></strong></td>
 </tr>
 </table>
 <table width="100%" border="0" cellpadding="3" cellspacing="1" height="50" bgcolor="#ec691f">
 <tr>
 <td colspan="3"><strong>User Login </strong></td>
 </tr>
 <tr>
 <td width="78">User Id</td>
 <td width="6">:</td>
 <td width="294"><input name="tho" type="text" id="tho"></td>
 </tr>
 <tr>
 <td>Password</td>
 <td>:</td>
 <td><input name="t2" type="password" id="t2"></td>
 </tr>


</table> -->
<script type="text/javascript">
 
function check()
{
	 
	var username = document.getElementById("tho");
	var password = document.getElementById("t2");  
	 
	if(username.value == "" || usernameE!=""){
		alert("Please Enter Your Correct UserName");
		username.focus();
		return false;
	}
	else if(password.value == "" || passwordE!=""){
		alert("Please Enter Your Correct Password");
		password.focus();
		return false;
	} 
	 return true; 
}

</script>
</body>
</html>