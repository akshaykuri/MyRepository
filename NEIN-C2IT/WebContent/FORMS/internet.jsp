<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Internet Access Request Form</title>
<link rel="shortcut icon" href="../images/favicon.ico">
<link rel="stylesheet" href="../Css/Formcss.css">
<script type="text/javascript">
function check(){
	 if(document.getElementById("branch").selectedIndex == "")
	  {
	    alert("Select Branch");
	    document.getElementById("branch").focus();
	    return false;
	  }
	 else if(document.getElementById("dept").selectedIndex == ""){
		 alert("Select Department");
		 document.getElementById("dept").focus();
		 return false;
	
	 }
	 else if(document.getElementById("design").value == ""){
		 alert("Enter Designation");
		 document.getElementById("design").focus();
		 return false;
	 }
	 else if(document.getElementById("fname").value == ""){
		 alert("Enter First Name");
		 document.getElementById("fname").focus();
		 return false;
	 }
	 else if(document.getElementById("lname").value == "")
		 {
		 alert("Enter Last Name");
		 document.getElementById("lname").focus();
		 return false;
		 }
	 else if(document.getElementById("init").value == ""){
		 alert("Enter Initial ");
		 document.getElementById("init").focus();
		 return false;
	 }
	 else if(document.getElementById("sow").value == ""){
		 alert("Enter Scope Of Work");
		 document.getElementById("sow").focus();
		 return false;
	 }
	 else if(document.getElementById("ecode").value == ""){
		 alert("Enter Employee Code");
		 document.getElementById("ecode").focus();
		 return false;
	 }
	 else if(document.getElementById("rofficer").value == ""){
		 alert("Enter Reporting Officer ");
		 document.getElementById("rofficer").focus();
		 return false;
	 }
	 chosen = "";
	 len = document.myform.cb.length;

	 for (i = 0; i <len; i++) {
	 if (document.myform.cb[i].checked) {
	 chosen = document.myform.cb[i].value;
	 }
	 }

	 if (chosen == "") {
	 alert("No Radio Button selected");
	 return false;
	 }
	 
	 else if(document.getElementById("ipa").value == ""){
		 alert("Enter IP Address ");
		 document.getElementById("ipa").focus();
		 return false;
	 }
	 
	 else if(document.getElementById("cname").value == ""){
		 alert("Enter Computer name ");
		 document.getElementById("cname").focus();
		 return false;
	 }
	 
	 else if(document.getElementById("req").value == ""){
		 alert("Enter Requseted By ");
		 document.getElementById("req").focus();
		 return false;
	 }
	 
		 else if(document.getElementById("ta").value == ""){
			 alert("Enter Reason ");
			 document.getElementById("ta").focus();
			 return false;
		 }
	 
	
	 else{
		 return true;
	 }
	 
	 
}




</script>
</head>
<body id="bodylen">
<table id="header">
<tr><td id="logo1"><img alt="Nippon Express" src="../images/nippon.gif"></td><td id="logo2"><img alt="cs" src=""></td></tr>
<tr class="nameal"><td id="cs1">CS SOFT</td></tr>
<tr class="nameal"><td id="cs2">INTERNET ACCESS REQUEST FORM</td></tr>
<!--  <tr id="logout "><td><a href = "Logout">LOGOUT</a></td></tr>-->
</table>
<br>
<form name="myform">
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

<td style="text-align: right;">Company Name :</td>
				<td style="text-align: left;"><input type="text"
					name="company_name" id="cname">
				</td>

				<td style="text-align: right;">Scope Of Work :</td>
				<td style="text-align: left;"><input type="text" name="scopeOfWork"
					id="sow">
				</td>
</tr>

<tr>


<td  style="text-align: right;">Employee Code :</td>
<td style="text-align:left;"><input type="text" name="employee" id="ecode"></td>

<td  style="text-align: right;">Reporting Officer  :</td>
<td style="text-align:left;"><input type="text" name="reporting_officer" id="rofficer"></td>

</tr>

<tr>
<td align="right">Request  :</td>
<td style="font-weight:bold;font-style:italic;width:27px;"> 
     <input style="" type ="radio" name = "cb" value ="privilege" />Privilege Access
     <input type ="radio" name = "cb" value ="limited" />Limited Access
     <input type ="radio" name = "cb" value ="cancel" />Cancel Internet </td>
     
</tr>

<tr>

<td style="text-align: right;">IP Address :</td>
<td style="text-align:left;"><input type="text" name="ipaddr" id="ipa" ></td>


<td style="text-align: right;">Computer Name :</td>
<td style="text-align:left;"><input type="text" name="computer" id="cname" ></td>

</tr>

<tr>
<td style="text-align: right;">Requested By :</td>
<td style="text-align:left;"><input type="text" name="request" id="req" size="60"></td>
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
<td class="it2" style="text-align: center;width:130%;"> Internet Access Provided :</td>
<td style="font-weight:bold;font-style:italic;text-align:left;width:70%;"> 
     <input  type ="checkbox" name = "cb1" value ="privilege" />Privilege Access
     <input type ="checkbox" name = "cb2" value ="limited" />Limited Access
     <input type ="checkbox" name = "cb3" value ="cancel" />Cancel Internet </td>
</tr>
<tr>
<td class="it2" style="text-align: right;width:90%;"> Remarks :</td>
<td class="it2"  style="text-align:left;width:6%"> <textarea style="text-align:center;" name="remark" id="rem"  rows="2" cols="40"></textarea></td>
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
 </form>
 <table id="footer">
<tr class="nameal"><td id="cs5">NIPPON EXPRESS (INDIA) PRIVATE LIMITED - GLOBAL LOGISTICS PROVIDER</td></tr>
</table>
 
</body>
</html>