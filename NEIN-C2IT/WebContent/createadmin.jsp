

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="CON2.DbUtil"%>
<html xmlns="http://www.w3.org/1999/xhtml">

<%@ page import="java.io.*"%>
<%@page import="CON2.Connection2"%>
<%@page language="java"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.sf.jasperreports.view.*"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@ page import="java.util.*"%>
<%@ include file="banner.jsp" %>
<jsp:useBean id="con" class="CON2.Connection2" />
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>ADMIN PAGE</title>
<link href="stylelog.css" rel="stylesheet" type="text/css" />
<link rel='stylesheet' type='text/css' href='css/headerColor.css' />
<script type="text/javascript">
</script>
	
	<!-- Help Page pop up starts  -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type = "text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="css/FormsHelpSmallSize.css" title="style" />
    <script language="javascript"   type="text/javascript" src="js/FormsHelp.js"></script>
    <script language="javascript"   type="text/javascript" src="js/onSubmitWait.js"></script>
	<!-- Help Page pop up ends -->
	<link rel='stylesheet' type='text/css' href='css/homePage.css' />
<script type="text/javascript" src="js/layout.js"></script>
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

<script type="text/javascript">
function checkEmail() {
    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(form.email.value)){
    return true;
    }
    return false; 
  }
  function checkName(str){
      var re = /[^a-zA-Z]\s/g;
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
    	var re = /[^[a-z][A-Z][0-9]]/g;
      if (re.test(str)) return false;
      return true;
    }
    
  function validate(){
	  var nn=document.form.Nname;
	  var l=document.form.Nno;
      var i=document.form.UID;
      
      var p=document.form.UPWD;
      var g=document.form.Nmail;
        var co=document.form.post;
        var dno = document.form.DESG_NO;
        var c=document.form.city;
        
        var dn=document.form.DEPT_NAME;
        var dns = document.form.subDept;
         if ((nn.value==null)||(nn.value=="")){
    alert("Please Enter Name!");
    nn.focus();
    return false;
    }
    if (checkName(nn.value)==false){
    nn.value="";
    alert("Invalid Name!");
    nn.focus();
    return false;
    }
    if ((l.value==null)||(l.value=="")){
        alert("Please Enter No.!");
        l.focus();
        return false;
        }
        if (checkNumber(l.value)==false){
        l.value="";
        alert("Invalid No.!");
        l.focus();
        return false;
        }
    
       if ((i.value==null)||(i.value=="")){
    alert("Please Enter ID!");
    i.focus();
    return false;
    }
    if (checkAddress(i.value)==false){
    i.value="";
    alert("Invalid ID!");
    i.focus();
    return false;
    }
   
       if ((p.value==null)||(p.value=="")){
    alert("Please Enter PASSWORD!");
    p.focus();
    return false;
    }
    if (checkAddress(p.value)==false){
    p.value="";
    alert("Invalid PASSWORD!");
    p.focus();
    return false;
    }
     if ((g.value==null)||(g.value=="")||(g.value=="0")){
        alert("Please Enter Mail ID!");
        g.focus();
        return false;
        }
         if (validateEmailsh(g.value)==false){
        g.value="";
        alert("Invalid Invalid Mail ID!");
        g.focus();
        return false;
        }  
  
     if ((co.value=="Select")||(co.value=="0")){
    alert("Please Enter DESIGNATION!");
    co.focus();
    return false;
    }
    if (checkAddress(co.value)==false){
    co.value="";
    alert("Invalid DESIGNATION!");
    co.focus();
    return false;
    }
    if ((dno.value==null)||(dno.value=="")||(dno.value=="0")){
        alert("Please select Designation value!");
        dno.focus();
        return false;
        }
        if (checkAddress(dno.value)==false){
        dno.value="";
        alert("Invalid Designation Value!");
        dno.focus();
        return false;
        }
     if ((c.value==null)||(c.value=="")||(c.value=="0")){
    alert("Please Enter Branch!");
    c.focus();
    return false;
    }
    if (checkAddress(c.value)==false){
    c.value="";
    alert("Invalid Branch!");
    c.focus();
    return false;
    }
    if ((dn.value=="0")||dn.value.length<=1){
        alert("Please Select Department!");
        dn.focus();
        return false;
        }
    if ((dn.value=="NON") && (dns.value=="Select"))
	{
		 alert("Kindly Select Sub Department!");
	         dn.focus();
		 return false;
		 }
    var dnn =document.form.right;
   
    // var w = document.form.ww;
  	  for(var i=0;i<dnn.length;i++)
	  {
	  if(dnn[i].checked)
		  break;
	  
	  }
     if(i==dnn.length)
   	  {
   	  alert("Assign Rights to "+nn.value+" \n \n \n Kindly Select Radio Button");
   	 dnn[0].focus();
   	  return false;
   	  } 
     
     var nui =document.form.newinsUser;
     //alert("newins User :"+nui);
     //alert("newins User :"+nui.length);
     // var w = document.form.ww;
   	  for(var j=0;j<nui.length;j++)
 	  {
 	  if(nui[j].checked)
 		  break;
 	  
 	  }
      if(j==nui.length)
    	  {
    	  alert("Is Newins User "+nn.value+" \n \n \n Kindly Select Radio Button");
    	 nui[0].focus();
    	  return false;
    	  }
 
  /*   var rad = document.form.right;
    if ((rad.value=="4")||(rad.value=="5")){
        alert("Please Select Rights!");
        rad.focus();
        return false;
        } */
       
    
    
    
  
   
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

function ChangeDesg(no)
{
document.getElementById('iddesg').value = no;
}
</script>
<script type="text/javascript">
function validateEmail() {
	//alert("maillll  1");
    var emailText = document.getElementById('idNmail').value;
    var pattern = /^[a-zA-Z0-9\-_]+(\.[a-zA-Z0-9\-_]+)*@[a-z0-9]+(\-[a-z0-9]+)*(\.[a-z0-9]+(\-[a-z0-9]+)*)*\.[a-z]{2,4}$/;
    if (pattern.test(emailText)) {
        return true;
    } else {
        alert('Bad email address: ' + emailText);
        return false;
    }
}

</script>
<script type="text/javascript">
function  get_val4()
{
 var shipt =document.getElementById("idCitySelect"),
 txtbox = document.getElementById('idBranchNo'),
 selOption = shipt.options[shipt.selectedIndex];
 var arrayOfStrings = (selOption.value).split('-');
 var a1 = arrayOfStrings[0];
 var a2 = arrayOfStrings[1];
 document.getElementById('idBranchNo').value = a2;
}

</script>
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
</head>

<%
//HttpSession session = request.getSession();
//session.setMaxInactiveInterval(20*60); 
session.setMaxInactiveInterval(20*60);

if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute("city")==null||session.getAttribute("admin")==null||session.getAttribute("b_no")==null||session.getAttribute("b_no")=="null")
{	
	String msg2=null;
	msg2="Session Time Out \\n Login Again";
	response.sendRedirect("adminlink.jsp?msg="+msg2);
	//response.sendRedirect("adminlink.jsp?msg=1");
}
%>

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



<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80"  >
<div id="wrapper">
<div id="id">
<table>
<tr>
<td>
<img src="images/nippon.gif" height="35" width="220"> </td>

</table> 

<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	CREATE ADMINISTRATOR </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">C2IT (CONNECT TO IT)</font></strong></td>
</tr>
 
</table>


 
  <form name="form" method="post" action="addsadmin.jsp">

 <div id='right_table'>


<%
String Nname=request.getParameter("Nname");
String UID=request.getParameter("UID");
String UPWD=request.getParameter("UPWD");

String post=request.getParameter("post");
String city=request.getParameter("city");
String Nmail=request.getParameter("Nmail");
%>
<% 
Connection cn01 = null;
Statement st01 = null; 
ResultSet rs01 = null;
cn01 = con.getConnection2();
st01=cn01.createStatement();
rs01 = st01.executeQuery("select DESIGNATION,DESG_NO from desg ORDER BY DESIGNATION Asc");
Connection cn02 = null;
Statement st02 = null; 
ResultSet rs02 = null;
cn02 = con.getConnection2();
st02=cn02.createStatement();
rs02 = st02.executeQuery("select m_b_name,m_b_no from branch_master_main ORDER BY m_b_name Asc");
String tot=null;
Connection cn01e = null;
Statement st01e = null; 
ResultSet rs01e = null;
cn01e = con.getConnection2();
st01e=cn01e.createStatement();
rs01e = st01e.executeQuery("select dept_name from department_master WHERE dept_name NOT LIKE '%IT%' ORDER BY dept_name Asc");
try{
%>
	<br>
	<br>



<table width="920" height="3" cellpadding="0" cellspacing="0" ID="Table1">


  <tr>
  <td width="25%" align="justify" valign="top"></td>
    <td width="21%" align="justify" valign="top">
      <p> <img src="images/21.jpg" height="220" width="240">
</td>
<td width="5%" align="justify" valign="top"></td>
<td width="5%" align="justify" valign="top"></td>
<td width="79%"><table width="100%" border="2" > 
<tr>
<td align=center width=60% colspan=2  background=".jpg">
<font color=darkblue size=3 > CREATE ADMINISTRATOR</font>
</td>
</tr>
    	<tr><td><font size="2">ADMINISTRATOR NAME:</font><font color=red>*</font></td><td><input type="text" name="Nname" value=""/></td></tr>
    	<tr><td><font size="2">EMP NO.:</font><font color=red>*</font></td><td><input type="text" name="Nno" value=""/></td></tr>
	<tr><td><font size="2">NEW ADMIN ID:</font><font color=red>*</font></td><td><input type="text" name="UID" value=""/></td></tr>	
	<tr><td><font size="2">PASSWORD:</font><font color=red>*</font></td><td><input type="text" name="UPWD" value=""/></td></tr>
	<tr><td><font size="2">MAIL ID:</font><font color=red>*</font></td><td><input type="text" size="35" name="Nmail" id="idNmail" value=""/></td></tr>
	<tr><td><font size="2">ADDRESS:</font><font color=red>*</font></td><td><input type="text" name="Naddr" value="" maxlength="99"/></td></tr>
	<tr><td><font size="2">CONTACT:</font><font color=red>*</font></td><td><input type="text" name="Ncontact" maxlength="44" value=""/></td></tr>
 	<tr><td><font size="2">DESIGNATION</font><font color=red>*</font></td>
    <td><select id="selectBox" onchange="changeFunc(this.id);">
			<option value="0">Select</option>
			<%while(rs01.next()){ %>
			
			<option value="<%=rs01.getString("DESG_NO")%>"><%=rs01.getString("DESIGNATION")%></option>
			<%} %>
		</select><a href="NewDesignation.jsp?msg=1"  onclick="return popitup('NewDesignation.jsp?msg=1')">New</a>
  		</td>
   </tr>
	<tr style="display: none; "><td><font size="2">CODE</font></td><td>
	<input style="display: none;" type="text" id="iddesgg" name="post" value="" />
	<input style="display: none;" type="text"  name="adminName" value="<%=Name%>" />
		<input style="display: none;" type="text"  name="adminMail" value="<%=email_id%>" />
	
	<input type="text" id="iddesg" name="DESG_NO" value="" readonly="readonly" /></td></tr>
	
	<tr><td><font size="2">BRANCH:</font><font color=red>*</font></td>
	   
	    <td><select name="city" id="idCitySelect" onchange="get_val4()">
			<option value="0">Select</option>
			<%while(rs02.next())
			{ 
				tot = rs02.getString(1) + "-"  + rs02.getString(2);
			%>
			<%-- <option><%=rs02.getString("m_b_name")%></option> --%>
			<option value="<%=tot%>" ><%=rs02.getString(1)+" - "+rs02.getString(2)%> </option>
			<%} %>
		</select>
		<input type="hidden" value="" name="branch_no" id="idBranchNo" />
  		</td>
	    
	    
	    
	    
	 </tr>
	 
	<tr><td><font size="2">DEPT-NAME</font><font color=red>*</font></td>
	<!-- <td>DEPT-NAME<font color=red>*</font></td><td><input type="text" name="DEPT_NAME" value=""></td> -->
	<td>
	<!-- <select name="DEPT_NAME" style="width: 200px; float: left;"> -->
	<select name="DEPT_NAME" >
			<option onclick="hideHigherTR();"  value="0">Select</option>
		    <option onclick="hideHigherTR();"  value="IT">IT</option>
			<option onclick="showHigherTR();" value="NON">NONIT</option>
			
		

		
		</select>
		<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="DepartName.jsp?msg=1"  onclick="return popitup('DepartName.jsp?msg=1')">New</a>
		<input name="DEPT_NAME" style="width: 185px; margin-left: -199px; margin-top: 1px; border: none; float: left;"/> -->
  		</td>
	
	</tr>
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
	<tr ><td><font size="2">RIGHTS</font></td><td>
	
	<input type="radio" name="right" value="4"/>Admin
	<input type="radio" name="right" value="5"/>Super Admin
	</td></tr>
	<tr ><td><font size="2">NEWINS USER ?</font></td><td>
	
	<input type="radio" name="newinsUser" value="Yes"/>Yes
	<input type="radio" name="newinsUser" value="No"/>No
	</td></tr>
	</table>
	<table width="100%" align=center border=2 background=".jpg"  bordercolor=#aaaccc>
	
	<tr>
	<td>
    <a href="displayadmin.jsp?msg=1" onclick="return popitup('displayadmin.jsp?msg=1')">View Administrator</a> </td>
<!-- 	<td><input type="submit" name="button" value="Create" id="button" onClick="return( validateEmail() && validate());" /></td> -->
	<!-- <td style="size:1"><input style="font-size:1 ;color: blue;"  type="submit" value="SAVE" name="save1" id="save1" onclick="return validate();"/> -->
	<td> <div id="formsubmitbutton"> <input style="font-size:1 ;color: blue;"  type="submit" value="SAVE" name="save1" id="save1" onclick="return(validate() && ButtonClicked());"/></div>
     					   <div id="buttonreplacement" style="margin-left:30px; display:none;"><img src="http://www.willmaster.com/images/preload.gif" alt="loading..." /></div></td>
	<td><input type="reset" value="Reset"/></td>
	<td>   	<input type="button" id="btnShowSimple" value="HELP" /></td>

	                 </tr>
	                 </table></td>
	
	
 	<%
}
catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(rs01,st01,cn01);
	DbUtil.closeDBResources(rs02,st02,cn02);
	DbUtil.closeDBResources(rs01e,st01e,cn01e);

  }
	%>
	
</tr>

</table>
	                 </div>
	                 
<div id="dialog" class="web_dialog">
   <table style="width: 100%; border: 0px;" cellpadding="3" cellspacing="0">
      <tr>
         <td class="web_dialog_title"><center>Admin / Super Help Page</center></td>
         <td class="web_dialog_title align_right">
            <a href="#" id="btnClose">Close</a>
         </td>
      </tr>
      </table><br />
   
     <label style="text-align:left;">1. Admin/Super should be NON-IT and HO-Finance</label>
     <br />
     <label>/Account department to be Approver for Newins</label>
     <br />
     <label> Form module.</label>
 
     <br />
	 <label style="text-align:left;">2. Super Admin Can View / Delete and Create All </label>
	 <br />
	 <label>Kind of Users / admin / super admin.</label>
     <br />
<label style="text-align:left;">3. Admin Can not able to Create All </label>
	 <br />
	 <label>Kind of Users / admin / super admin.</label>
     <br />
<label style="text-align:left;">4. Sub Location is Meant only For General Manager's </label>
	 <br />
	 <label>to get Feedback for Specific Branch</label>
     <br />
<label style="text-align:left;">5. If New designation , Click on New button to enter </label>
	 <br />
	 <label>and refresh page to get in designation options.</label>
     <br />
     <label style="text-align:left;">6. Mail will be sent to new Created Admin to there</label>
	 <br />
	 <label> mail id with ID , Password , welcome message and </label>
     <br />
     <label>link of software.</label>
     <br />
     <label style="text-align:left;">7. Admin/Super can access Approver/Super Admin page </label>
	 <br />
	 <label>System Admin Page and Form User Page.</label>
     <br />
</div>
	</form>
	
	



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