<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/Formcss.css">
<title>Insert title here</title>
</head>
<body id="bodylen">
<table id="header">
<tr><td id="logo1"><img alt="Nippon Express" src="images/nippon.gif"></td><td id="logo2"><img alt="cs" src=""></td></tr>
<tr class="nameal"><td id="cs1">CS SOFT</td></tr>
<tr class="nameal"><td id="cs2">Login Page</td></tr>
</table>
<br><br>
<img style="float: left;width:45%;" alt="Login Screen" src="images/logistics.jpg">

<form style="float: right;padding-top: 60px;" action=""  >

<table style="text-align: right;position:absolute;left:65%;top:30%;;background-color: #ec691f;border:double;">

<tr>
<td style="text-align: right;font-size: small;padding:25px 0px 5px 15px;">Location :</td>
<td style="text-align: left;padding:25px 15px 5px 0px;"><select id="branch" name="location"><option>testing</option></select></td>



</tr>
<tr>
<td style="text-align: right;font-size: small;padding:10px 0px 5px 15px;">Username :</td>
<td style="text-align: left;padding:10px 15px 5px 0px;">
<input style="font-size: small;" id="1" type="text" name="userName"></td></tr>

<tr>
<td style="text-align: right;font-size: small;padding:0px 0px 10px 15px;">Password :</td>
<td style="text-align: left;padding:0px 15px 20px 0px;">
<input style="font-size: small;" id="2" type="password" name="Password"></td></tr>

<tr>
<td style="text-align: center;" colspan="2">
<input type="image" src="images/login-button.png" onclick="return check()" style="padding-bottom: 15px;"></td></tr>



</table>
</form>
<table id="footer">
<tr class="nameal"><td id="cs5">NIPPON EXPRESS (INDIA) PRIVATE LIMITED - GLOBAL LOGISTICS PROVIDER</td></tr>
</table>
</body>
</html>