<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LOTUS NOTES USERS APPLICATION FORM</title>
<link rel="shortcut icon" href="../images/favicon.ico">
<link rel="stylesheet" href="../Css/Formcss.css">
</head>
<body id="bodylen">
<table id="header">
<tr><td id="logo1"><img alt="Nippon Express" src="../images/nippon.gif"></td><td id="logo2"><img alt="cs" src=""></td></tr>
<tr class="nameal"><td id="cs1">CS SOFT</td></tr>
<tr class="nameal"><td id="cs2">LOTUS NOTES USERS APPLICATION FORM</td></tr>
<!--  <tr id="logout "><td><a href = "Logout">LOGOUT</a></td></tr>-->
</table>
<br>
<table id="table2">
<tr>
<td  style="text-align: right;">Branch :</td>
<td style="text-align:left;"><select id="branch"><option value="">Select</option><option>Testing</option></select></td> 

<td  style="text-align: right;">Department :</td>
<td style="text-align:left;"><select id="dept"><option value="">Select</option><option>Testing</option></select></td> 

<td  style="text-align: right;">Designation :</td>
<td style="text-align:left;"><select id="design"><option value="">Select</option><option>Testing</option></select></td>

</tr>
<tr>
<td  style="text-align: right;">First Name :</td>
<td style="text-align:left;"><input type="text" name="firstname" id="fname"></td>

<td  style="text-align: right;">Last Name :</td>
<td style="text-align:left;"><input type="text" name="lastname" id="lname"></td>

<td  style="text-align: right;">Initial :</td>
<td style="text-align:left;"><input type="text" name="initial" id="init"></td>
</tr>

<tr>
<td  style="text-align: right;">Scope Of Work  :</td>
<td style="text-align:left;"><input type="text" name="scope" id="sow"></td>

<td  style="text-align: right;">Employee Code :</td>
<td style="text-align:left;"><input type="text" name="employee" id="ecode"></td>

<td  style="text-align: right;">Reporting Officer  :</td>
<td style="text-align:left;"><input type="text" name="reporting_officer" id="rofficer"></td>

</tr>

<tr>
<td align="right">Request  :</td>
<td style="font-weight:bold;font-style:italic;width:17px;"> 
     <input style="" type ="checkbox" name = "cb1" value ="new" />New
     <input type ="checkbox" name = "cb2" value ="change" />Delete
     <input type ="checkbox" name = "cb3" value ="change" />Change</td>
</tr>

<tr>
<td style="text-align: right;">Requested E-Mail Id :</td>
<td style="text-align:left;"><input type="text" name="email" id="id" size="60"></td>

<td  style="text-align: right;">Password(Default) :</td>
<td style="text-align:left;"><input type="text" name="password" readonly="readonly" value="pass1234"></td>


</tr>
</table>

<table id="it">
<tr><td id="ita">Reason</td></tr>
<tr><td><textarea rows="3" cols="142" id="ta"></textarea>
</table>

<table id="it">
<tr><td id="ita">IT Dept Use Only</td></tr>
</table>

<table id="table3">
<tr>
<td class="it2" style="text-align: right;width:23%;"> Email Address :</td>
<td class="it2"  style="text-align:left;width:25%;"> <input type="text" name="email1" id="eid1" maxlength="100"></td>
</tr>

<tr>
<td class="it2" style="text-align: right;width:23%;">ID File :</td>
<td class="it2"  style="text-align:left;width:25%;"> <input type="text" name="text" id="txt" maxlength="100"></td></tr>


<tr>
<td class="it2" style="text-align: right;width:23%;"> Remarks :</td>
<td class="it2"  style="text-align:left;width:25%;"> <input type="text" name="remark" id="rem" size="60"></td>
</table>
<br />
<label style="font-style:italic;font-weight:bold;">Send To: </label>
<br />
<table style="width:767px;" ><tr>
<td>  
<select name="desg"  style="width: 130px;" id="desg">      
<option value="none">-----Select-----</option>
<option value="IT SUPPORT">IT SUPPORT</option> 
 </select></td></tr>
   </table>  
   
                                                                    
    
 <table style="margin-left: auto;margin-right: auto;" ><tr>
 
     
      <td style="size:1"><input  type="submit" value="SEND" name="save1" id="save1" onclick="return check()" /></td>
   	<td style="size:1">&nbsp;&nbsp;<input type="reset"  value="RESET"/></td></tr>
 
</table> 
 
 <table id="footer">
<tr class="nameal"><td id="cs5">NIPPON EXPRESS (INDIA) PRIVATE LIMITED - GLOBAL LOGISTICS PROVIDER</td></tr>
</table>
 
</body>
</html>