<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!--  <link rel="stylesheet" href="../Css/Body.css">-->
<link rel="stylesheet" href="../css/Formcss.css">
<title>IT ClEARANCE CHECK SHEET</title>
<link rel="shortcut icon" href="../images/favicon.ico">
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script> 
<link rel="stylesheet" href="/resources/demos/style.css">
<script type="text/javascript">
  $(function() {
    $( "#datepicker" ).datepicker({ dateFormat: "dd-mm-yy" }).val();
  });
  
  $(function() {
	    $( "#datepicker1" ).datepicker({ dateFormat: "dd-mm-yy" }).val();
	  });
  </script>
  
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
	 else if(document.getElementById("design").value == ""){
		 alert("Enter Designation");
		 document.getElementById("design").focus();
		 return false;
	 }
	 else if(document.getElementById("rofficer").value == ""){
		 alert("Enter Reporting Officer");
		 document.getElementById("rofficer").focus();
		 return false;
	 }
	 else if(document.getElementById("datepicker").value == ""){
		 alert("Enter Date Of Resignation");
		 document.getElementById("datepicker").focus();
		 return false;
	 }
	 else if(document.getElementById("datepicker1").value == ""){
		 alert("Select Date Of Relieving");
		 document.getElementById("datepicker1").focus();
		 return false;
		 
	 }
	 else if(document.getElementById("ta").value == "")
		 {
		 alert("Enter Remarks");
		 document.getElementById("ta").focus();
		 return false;
		 }
	 else if(document.getElementById("desg").selectedIndex == ""){
		 alert("Select designation");
		 document.getElementById("desg").focus();
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
<tr class="nameal"><td id="cs2">IT CLEARANCE CHECK SHEET FOR RESIGNED EMPLOYEE</td></tr>
<!--  <tr id="logout "><td><a href = "Logout">LOGOUT</a></td></tr>-->
</table>
<br>

<table id="table1" >

</table>
<br>
<table id="table2">
<tr>
<td  style="text-align: right;">Branch :</td>
<td style="text-align:left;"><select id="branch"><option value="">Select</option><option>Testing</option></select></td> 

<td  style="text-align: right;">Department :</td>
<td style="text-align:left;"><select id="dept"><option value="">Select</option><option>Testing</option></select></td> 
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
<td  style="text-align: right;">Designation :</td>
<td style="text-align:left;"><select id="design"><option value="">Select</option><option>Testing</option></select></td>

<td  style="text-align: right;">Reporting Officer  :</td>
<td style="text-align:left;"><input type="text" name="reporting_officer" id="rofficer"></td>

<td  style="text-align: right;">Employee Code :</td>
<td style="text-align:left;"><input type="text" name="employee" id="ecode"></td>
</tr>
<tr>
<td  style="text-align: right;">Date Of Resignation :</td>
<td style="text-align:left;"><input type="date" name="dor" id="datepicker"></td>

<td  style="text-align: right;">Date Of Reliving :</td>
<td style="text-align:left;"><input type="text" name="dore" id="datepicker1"></td>
</tr>
</table>
<br>

<table id="it">
<tr><td id="ita">IT ASSET PROVIDED</td></tr>
</table>

<table id="table3">
<tr>

<td class="it1" align="center">1  </td>
<td class="it1" align="center"><input type ="checkbox" name = "cb1" value ="YES" /></td>

<td class="it2" style="text-align: right;width:23%;"> Laptop/Desktop Model :</td>
<td class="it2"  style="text-align:left;width:25%;"> <input type="text" name="model" id="mod" maxlength="100"></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="remarks" id="rem1" size="60"></td>
</tr>

<tr>
<td class="it1" align="center">2  </td>
<td class="it1" align="center"><input type ="checkbox" name = "cb2" id="cb2" value ="YES" /></td>

<td class="it2" style="text-align: right;width:23%;">Data Card :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="text" name="datacard" id="dc" maxlength="100"></td>


<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="remarks" id="rem2" size="60"></td>
</tr>

<tr>
<td class="it1" align="center">3  </td>
<td class="it1" align="center"><input type ="checkbox" name = "cb3" id="cb3" value ="YES" /></td>


<td class="it2" style="text-align: right;width:23%;">Email Id :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="text" name="email" id="eid" maxlength="100"></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="remarks" id="rem3" size="60"></td>
</tr>

<tr>
<td class="it1" align="center">4  </td>
<td class="it1" align="center"><input type ="checkbox" name = "cb4" id="cb4" value ="YES" /></td>


<td class="it2" style="text-align: right;width:23%;">Newins Id :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="text" name="newins" id="nid" maxlength="100"></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="remarks4" id="rem4" size="60"></td>
</tr>

<tr>
<td class="it1" align="center">5  </td>
<td class="it1" align="center"><input type ="checkbox" name = "cb5" id="cb5" value ="YES" /></td>


<td class="it2" style="text-align: right;width:23%;">Domain User :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="text" name="domain" id="du"></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="remarks5" id="rem5" size="60"></td>
</tr>

<tr>
<td class="it1" align="center">6  </td>
<td class="it1" align="center"><input type ="checkbox" name = "cb6" id="cb6" value ="YES" /></td>


<td class="it2" style="text-align: right;width:23%;">Mobile Phone Model :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="number" name="mobile" id="mpd" ></td>

<td class="it2">Remarks :</td>
<td class="it2"><input type="text" name="remarks6" id="rem6" size="60"></td>
</tr>

<tr>
<td class="it1" align="center">7  </td>
<td class="it1" align="center"><input type ="checkbox" name = "cb7" id="cb7" value ="YES" /></td>


<td class="it2" style="text-align: right;width:23%;">Mobile No :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="text" name="mobileno" id="mno" ></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="remarks7" id="rem7" size="60"></td>
</tr>

<tr>
<td class="it1" align="center">8  </td>
<td class="it1" align="center"><input type ="checkbox" name = "cb8" id="cb8" value ="YES" /></td>


<td class="it2" style="text-align: right;width:23%;">Access Card :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="text" name="accesscard" id="acard"></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="remarks8" id="rem8" size="60"></td>
</tr>

<tr>
<td class="it1" align="center">9  </td>
<td class="it1" align="center"><input type ="checkbox" name = "cb9" id="cb9" value ="YES" /></td>


<td class="it2" style="text-align: right;width:23%;">Hard Disk/Pen Drive :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="text" name="harddisk" id="hp"></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="remarks8" id="rem8" size="60"></td>
</tr>


<tr>
<td class="it1" align="center">10  </td>
<td class="it1" align="center"><input type ="checkbox" name = "cb10" id="cb10" value ="YES" /></td>


<td class="it2" style="text-align: right;width:23%;">Any Other Asset :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="text" name="asset" id="asset1"></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="remarks8" id="rem8" size="60"></td>
</tr>
</table>
<br>
<table id="it">
<tr><td id="ita">Remarks(Above Assets Are Handed Over To)</td></tr>
<tr><td><textarea rows="3" cols="142" id="ta"></textarea>
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