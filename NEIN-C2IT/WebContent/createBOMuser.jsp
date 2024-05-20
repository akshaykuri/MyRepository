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
	<!-- Help Page pop up starts  -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type = "text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="css/FormsHelpSmallSize.css" title="style" />
    <script language="javascript"   type="text/javascript" src="js/FormsHelp.js"></script>
    <link rel='stylesheet' type='text/css' href='css/headerColor.css' />
	<!-- Help Page pop up ends -->
	<script language="javascript"   type="text/javascript" src="js/onSubmitWait.js"></script>
<link rel='stylesheet' type='text/css' href='css/homePage.css' />

<%
//HttpSession session = request.getSession();
//session.setMaxInactiveInterval(20*60); 
session.setMaxInactiveInterval(20*60);

if(session==null||session.getAttribute( "Nname" )==null)
{
	response.sendRedirect("adminlink.jsp?msg=1");
}
%>
<style type="text/css">
a:HOVER {
	background-color: #ec691f;/*Orange*/
}
.colorChange {
	background-color: #2f4377;
	font-weight:bold;
	color:white;
}
.colorChange:HOVER {
	background-color: #ec691f;
}

</style>
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
              var formUser = document.form.form_user;
              var dt = document.form.department;
              var ro = document.form.reportingOff;
             
           
               
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
            alert("Please Select Reporting Branch!");
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
                    if (formUser.value==""){
                        alert("Select Form Module Entery Allowed!");
                        formUser.focus();
                        return false;
                        }
                    if ((dt.value==null)||(dt.value=="")||(dt.value=="null")){
                        alert("Select Department!");
                        dt.focus();
                        return false;
                        }
                    if ((ro.value==null)||(ro.value=="")||(ro.value=="null")||(ro.value=="0")){
                        alert("Select Reporting Officer!");
                        ro.focus();
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
            
            var al =document.form.assignedLocation;
           // var w = document.form.ww;
         	  for(var i=0;i<al.length;i++)
      	  {
      	  if(al[i].checked)
      		  break;
      	  
      	  }
            if(i==al.length)
          	  {
          	  alert("Assigned Location \n Click Checkbox");
          	 al[0].focus();
          	  return false;
          	  }
            
            if(al[i].value==pco.value)
  		  {
            	//alert("SAME VALUE");
  			  al[i].checked = false;
  			 // alert("after value ");
  			alert("U Have Clicked Same Branch \n Select Assiging Location");
  		    return false;
  		  }
           // alert("."+(i+1)+"is Assigned"); 
           
	 else
       return true;
}
         /*  function evalGroup()
          {
          var al =document.form.assignedLocation;
       	  for(var i=0;i<al.length;i++)
    	  {
    	  if(al[i].checked)
    		  break;
    	  
    	  }
          if(i==al.length)
        	  {
        	  return alert("Assigned Location \\n Click Checkbox");
        	  }
          alert("."+(i+1)+"is Assigned");
          } */
        </script>
        <!-- <script type="text/javascript">
        function makeitup()
        {
        	 var pco1=document.form.NpostingCo;
        	 var al1 =document.form.assignedLocation;
             // var w = document.form.ww;
             alert("vallll");
           	  for(var k=0;k<al1.length;k++)
        	  {
        	  if(al1[k].checked)
        		  break;
        	  
        	  
        	  }
              if(k==al1.length)
            	  {
            	  alert("Assigned Location \n Click Checkbox");
            	 al1[0].focus();
            	  return false;
            	  }
              
              if(al1[k].value==pco1.value)
    		  {
              	alert("SAME VALUE");
    			  al1[k].checked = false;
    			 // alert("after value ");
    			 alert("UnCheck Same Location");
    		    return false;
    		  }
             // alert("."+(i+1)+"is Assigned"); 
             
  	 else
         return true;
  }
        </script> -->
<script>
function dynamicValidation()
{
	   var frm=document.form[0],flds=[frm['assignedLocation']],total=0;
		
	   
	   for (var z0=1;z0<flds[0].length;z0++)
		{
		  
		 if(flds[0][z0].value== null || flds[0][z0].value=="" || flds[0][z0].value.length == 1 )
		 {
			
		    // flds[2][z0].value = flds[0][z0].value*flds[1][z0].value;
		     alert("Enter the ItemName ");
		     flds[0][z0].focus();
		     return false;
	     }
		
	 } 
	  return true;
	 
}


</script>
<script type="text/javascript">
function changeFunc() {
	//alert("hakdja");
    var selectBox = document.getElementById("selectBox");
    var selectedValue = selectBox.options[selectBox.selectedIndex].value;
    var selectedValue2 = selectBox.options[selectBox.selectedIndex].text;
    document.getElementById('iddesg').value = selectedValue;
    document.getElementById('iddesgg').value = selectedValue2;
   //alert(selectedValue);
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



(function()
{
	/* var npp=document.form.NpostingCo;
	var nppp=document.form.assignedLocation;
	
	//if(npp.value==nppp.value)
	for(p=0;p<nppp.length;p++)
		{
		alert(nppp.value());
		} */
	var npp=document.getElementsByName('assignedLocation[]');
	for(var p=0;p<npp.length();p++)
		{
		   alert("hii"+npp[p]);
		}
})();
</script>
<script type="text/javascript">

// var w = document.form.ww;
function alss(){
	var als =document.form.assignedLocation;
	var pcoow=document.form.NpostingCo;
	alert("city value1 "+pcoow);
	  for(var j=0;j<als.length;j++)
 		{
		  alert("in side for loop ");
		  if(als[j].value==pcoow.value)
		  {
			  als[j].checked = false;
		    return false;
		  }
		  else
		      return true;
 		 }
}
</script>
</head>
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

<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80"   >
<div id="wrapper">
<div id="id">
<table>
<tr>
<td>
<img src="images/nippon.gif" height="35" width="220"> </td>

</table> 
<!--  <form name="form" method="post" onSubmit="return(validate()&& evalGroup())" action="adds.jsp"> -->
 <form id="form" name="form" method="post" onSubmit="return validate()" action="adds.jsp">

<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	CREATE ADMIN </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">C2IT (CONNECT TO IT)</font></strong></td>
</tr>
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
rs02 = st02.executeQuery("select m_b_name,m_b_no from branch_master_main ORDER BY m_b_name Asc");
Connection cn022 = null;
Statement st022 = null; 
ResultSet rs022 = null;
cn022 = con.getConnection2();
st022=cn022.createStatement();
//rs022 = st022.executeQuery("select b_name from branch_master ORDER BY b_name Asc");
rs022 = st022.executeQuery("SELECT DISTINCT s.b_name,s.b_no,b.region FROM branch_master s LEFT JOIN branch_master_main b ON (s.b_no=b.m_b_no)  ORDER BY b.region ASC, s.b_name ASC");
Connection cn01 = null;
Statement st01 = null; 
ResultSet rs01 = null;
cn01 = con.getConnection2();
st01=cn01.createStatement();
//rs01 = st01.executeQuery("select DESIGNATION,DESG_NO from desg ORDER BY DESIGNATION Asc");
rs01 = st01.executeQuery("select DISTINCT Nname,EMP_NO from  formuser_master WHERE Npost <> 'IT SUPPORT' AND Npost <> 'SOFTWARE ENGINEER' AND Npost <> 'EXECUTIVE' ORDER BY Nname Asc");
try{
%>



<table width="980" height="3" cellpadding="0" cellspacing="0" ID="Table1">


  <tr>
  <td width="5%" align="justify" valign="top"></td>
    <td width="21%" align="justify" valign="top">



<!-- <div class="sidebarmenu">
<ul id="sidebarmenu1">
    
    <li><a href="createBOMuser.jsp?msg=1">HO</a></li>
    <li><a href="BlrUser.jsp?msg=1">BLR</a></li>
    <li><a href="BomUser.jsp?msg=1">BOM</a></li>
    
    <li><a href="DelUser.jsp?msg=1">DEL</a></li>
    <li><a href="CcuUser.jsp?msg=1">CCU</a></li>
   
    <li><a href="MaaUser.jsp?msg=1">MAA</a></li>
</ul>
</div> -->
<img vspace="15" src="images/sysadmin.jpg" width="193" height="220" border="0">
</td>
<td width="5%" align="justify" valign="top"></td>
<td width="5%" align="justify" valign="top"></td>
<td width="48%">
<table width="100%" border="2" style="border-collapse: collapse;">
    <tr>
<td align=center width=60%  colspan=2  background=".jpg">
<font color=darkblue size=3 > CREATE  ADMIN</font>
</td>
</tr>

	
	<tr><td><font size=2> ADMIN NAME:<font color=red>*</font></font></td>
	<td><input type="text" name="Nname" value="" size=30>
		<input style="display: none;" type="text"  name="adminName" value="<%=Name%>" />
		<input style="display: none;" type="text"  name="adminMail" value="<%=email_id%>" />
	</td></tr>
	<tr><td><font size="2">EMP NO.:</font><font color=red>*</font></td><td><input type="text" name="Nno" value=""></td></tr>
	<tr><td><font size=2>NEW USER ID:<font color=red>*</font></font></td><td><input type="text" name="idd" value="" size=30></td></tr>
	<tr><td><font size=2>PASSWORD:<font color=red>*</font></font></td><td><input type="text" name="Npwd" value="" size=30></td></tr>
	<tr><td><font size=2>ADDRESS:</font></td><td><input type="text" name="Naddr" value="" size=30></td></tr>
	<tr><td><font size=2>CONTACT NO:</font></td><td><input type="text" name="Ncontact" value="" size=30></td></tr>
	<!-- <tr><td><font size=2>POST:<font color=red>*</font></font></td><td><input type="text" name="Npost" value="" size=30></td></tr>
	 -->
	
	
	
	
		<%-- <tr><td><font size="2">DESIGNATION</font><font color=red>*</font></td>
    <td><select id="selectBox" onchange="changeFunc();">
			<option value="0">Select</option>
			<%while(rs01.next()){ %>
			
			<option value="<%=rs01.getString("DESG_NO")%>"><%=rs01.getString("DESIGNATION")%></option>
			<%} %>
		</select><a href="NewDesignation.jsp"  onclick="return popitup('NewDesignation.jsp')">New</a>
  		</td>
    </tr>
	<tr><td><font size="2">CODE</font></td>
	<td>
	<input type="hidden" id="iddesgg" name="Npost" value=""/>
	<input type="text" id="iddesg" name="DESG_NO" value="" readonly="readonly"></td></tr> --%>
	
	
	<tr>
	<td><font size=2>REPORTING BRANCH<font color=red>*</font></font></td><td>
	    <select name="NpostingCo">
			<option value="0">Select</option>
			<%while(rs02.next()){ %>
			
			<%-- <option><%=rs02.getString("m_b_name")%></option> --%>
			<option ><%=rs02.getString(1)+" - "+rs02.getString(2)%> </option>
			<%} %>
		</select>
  		</td>
  		
</tr>

	<tr><td><font size=2>MAIL ID:</font></td><td><input type="text" name="Nmail" value="" size=30></td></tr>
	<tr><td><font size=2>CREATING FORM ALLOWED:</font></td><td>
	<select name="form_user">
	<option value="">Select</option>
	<option value="YES">YES</option>
	<option value="NO">NO</option>
	</select>
	
	</td></tr>
	<tr>
	<td><font size=2>DEPARTMENT:</font></td>
	<td bgcolor=""><font color="white">
      <select name="department">
      <option value="null">Select</option> 
		<option value="IT SUPPORT">IT SUPPORT</option> 
		<option value="OFFICE ADMINISTRATION">OFFICE ADMINISTRATION</option> 
		<option value="SOFTWARE DEVELOPMENT">SOFTWARE DEVELOPMENT</option> 
		</select>
      </font></td>
	</tr>
	<tr>
		<td><font size=2>REPORTING OFFICE:</font></td>
	<td bgcolor=""><font color="white">
       <select name="reportingOff">
			<option value="0">Select</option>
			<%while(rs01.next()){ %>
			<option ><%=rs01.getString(1)+"--"+rs01.getString(2)%> </option>
			<%} %>
		</select>
      </font></td>
	</tr>
	<tr><td align="center"><a href="DisplayDelHo.jsp?msg=1" onclick="return popitup('DisplayDelHo.jsp?msg=1')"><font size=3>View</font></a>
   </td>
<!-- 	<td><input type=submit name="button" value="SAVE" id="button" onclick="return( validate() && dynamicValidation() && evalGroup() && lead());"> -->
	<!-- <td><input type=submit name="button" value="SAVE" id="button" onclick="return makeitup();" > -->
	
	<td> <div id="formsubmitbutton" > 
	<!-- <input type=submit name="button1" value="SAVE/SEND" id="button" onclick="return(makeitup() && ButtonClicked());" > -->
	<input class="colorChange" type="submit"  value="SAVE/SEND" name=button1 onclick="return( makeitup() && ButtonClicked());" />
     	
	    <input class="colorChange" type="reset" value="RESET"/>	<input class="colorChange" type="button" id="btnShowSimple" value="HELP" />
	     </div>
	    <div id="buttonreplacement" style="margin-left:30px; display:none;"><img src="http://www.willmaster.com/images/preload.gif" alt="loading..." /></div>		   
	    </td>
	    </tr>

	</table>
	</td>
	
	<td width="39%">
	
	</td>
</tr>

</table>


	<table align="center" cellspacing="0" cellpadding="0"  width="1118" border="1"> 
	<tr>
<td align="center" bgcolor="lightgrey" colspan="10"><font size=2 >ASSIGN LOCATION TO ADMIN (East,North,South,West)<font color=red>*</font></font></td>
</tr>


<%
int count=0;
ArrayList<String> branch = new ArrayList<String>();
ArrayList<String> branchRegion = new ArrayList<String>();

while(rs022.next()){ 
					branch.add(rs022.getString(1));
					branchRegion.add(rs022.getString(3));
					} 
//System.out.println(branch.size());
int column = 0;
 
 for(int row=0;row<branch.size();row+=10)
 {
 %> 
  
  <tr>
  
  <% for(column=0;column<10;column++){
  
  if(row+column<branch.size())
  {
	// System.out.print(" -- "+branch.get(row+column));
	 
	 String temp = branch.get(row+column);
	 String regionBr = branchRegion.get(row+column);
	// System.out.println("TEMP "+temp);
	// System.out.println("REGION "+regionBr);
  %>
  
   <td style="padding-left:5px; overflow:hidden; height: 30px;">
  		<INPUT  size="30" width="30" TYPE=CHECKBOX NAME="assignedLocation" onclick="return makeitup();" value="<%=branch.get(row+column)%>" />
  		
  		<%-- <%=branch.get(row+column) %> --%>
  		<%if(regionBr.equals("East")){ %>
  		<font size="2"  style="vertical-align: top;" color="blue"><%=temp %></font>
  		<% } %>
  		<%if(regionBr.equals("North")){ %>
  		<font size="2" style="vertical-align: top;" color="green"><%=temp%></font>
  		<%} %>
  		<%if(regionBr.equals("South")){ %>
  		<font size="2" style="vertical-align: top;" color="Red"><%=temp%></font>
  		<%} %>
  		<%if(regionBr.equals("West")){ %>
  		<font size="2" style="vertical-align: top;" color="black"><%=temp%></font>
  		<%} %>
  		
  		</td>
  <%
  }
  }

  //System.out.println();
  %>
  </tr>
  <%} %>
</table>
<!-- http://www.ryerson.ca/JavaScript/lectures/flowControl/loops/writingTables/simpleTable.html
<SCRIPT Language="JavaScript">

rows = 3
columns = 10
str = ""
str += '<table border="1" cellspacing="1" cellpadding="5">'

for(i = 0; i < rows; i++){
   str += '<tr>'
   for (j = 0; j < columns; j++){
      str += '<td>' +  (i + j) + '</td>'
   }
   str += '</tr>'
}

str += '</table>'
document.write(str)


</SCRIPT> -->
	<%
}
catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(rs01,st01,cn01);
	DbUtil.closeDBResources(rs02,st02,null);
	DbUtil.closeDBResources(rs022,st022,cn022);

  }
	%>
                 </div>
                 <div id="dialog" class="web_dialog">
   <table style="width: 100%; border: 0px;" cellpadding="3" cellspacing="0">
      <tr>
         <td class="web_dialog_title"><center>System Admin Help Page</center></td>
         <td class="web_dialog_title align_right">
            <a href="#" id="btnClose">Close</a>
         </td>
      </tr>
      </table><br />
   
     <label style="text-align:left;">1. System Admin should have sub location for </label>
     <br />
     <label>which he is assigned for.</label>
     <br />
      <label style="text-align:left;">2. System Admin  sub location can be changed </label>
     <br />
     <label>in Edit Page of System Admin.</label>
     <br />
	 <label style="text-align:left;">3. System Admin have option to create Application  </label>
	 <br />
	 <label> Form and Approve Forms.</label>
     <br />
     <label style="text-align:left;">4. All System Admin will appear in home page.  </label>
	 <br />
  <label style="text-align:left;">5.Update/Delete will changed only for System admin </label>
	 <br /> 
	   <label>module not FORM module.  </label>
	 <br />
     <label style="text-align:left;">6. Mail will be sent to new Created Admin to there</label>
	 <br />
	 <label> mail id with ID , Password , welcome message and </label>
     <br />
     <label>link of software.</label>

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