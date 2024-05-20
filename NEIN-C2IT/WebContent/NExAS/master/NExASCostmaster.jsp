<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="banner.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script language="javascript"   type="text/javascript" src="jquery-1.5.1.min.js"></script> <!-- this is for dynamic table -->
<title>FORM APPROVER</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel='stylesheet' type='text/css' href='../../css/headerColor.css' />

<title>Insert title here</title>
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
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 80%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }
.modal-body 
    {
    padding: 2px 16px;
    background-color: #D3D3D3;
    }
.modal-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 60%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
    }
.modal-header {
     padding: 2px 16px;
     background-color: #D3D3D3;
     color: black;
     }
</style>
 <style>
.dynatable {
	border: solid 1px #000; 
    border-collapse: collapse;
	}
.dynatable td {
	border: solid 1px #000; 
	padding: 2px 10px;
	width: 100px;
	text-align: center;
	}
.dynatable .prototype {
	display:none;
	}
</style>
</head>




<%int p =0;%>
 <script>
 		var id =0;
		$(document).ready(function() {
			// Add button functionality
			//alert("ID :"+id);
			$("table.dynatable button.add").click(function() {
				id++;
				//alert("ID 1:"+id);
				var master = $(this).parents("table.dynatable");
			  // Get a new row based on the prototype row
				var prot = master.find(".prototype").clone();
				prot.attr("class", "");
				prot.find(".id").attr("value",id);
				//alert(id);
				prot.find(".cname").attr("id","idcname"+id);
				prot.find(".ccode").attr("id","idccode"+id);
				prot.find(".oprange").attr("id","idoprange"+id);
				master.find("tbody").append(prot);
		});
			// Remove button functionality
			$.noConflict();   // here i am using two jquery one for dynamic table and one for calander so remoce button conflicting jquery so use noconflict method for resolve this..
			$("table.dynatable button.remove").live("click", function() {//alert(id);
				$(this).parents("tr").remove();
				id--;
				
			});
		});
	</script>
<script>

function validatefield()
    {
	var  p;
	//alert("Please entere po no..");
	//idabc5,idabc9,idInvDate,idabc6,idabc7,idabc8

 if(id==0)
	     {
	     alert("Please enter Cost center details..");
	     return false;
	     } 
	else
		 {
	     //alert(id);
	     for(p = 1; p <=id; p++)
	       {
		   var cname = 'idcname'+p.toString();
		   var ccode = 'idccode'+p.toString();
		   var oprange= 'idoprange'+p.toString();
		  
		   //alert("direc :"+direc);
		   var cname1 = document.getElementById(cname).value;
		   //alert("level no :"+lno1);
		   var ccode1=document.getElementById(ccode).value;
		   //alert("empid1 :"+empid1);
		  
		   var oprange1=document.getElementById(oprange).value;
		   //alert("allopt1 :"+allopt1.checked);
		   if(cname1=="")
		    	 {
		    	 alert("Please enter cost name...");
		    	 return false;
		    	 }
	       else if(ccode1=="")
  	             {
  	             alert("Please enter cost code...");
  	             return false;
  	             }
	       else if(oprange1=="")
             {
             alert("Please enter Operation range...");
             return false;
             }
	     
	       }
		}return true;
 }
</script>  
<script language="javascript" type="text/javascript">
<!--
function popitup(url) {
	newwindow=window.open(url,'name','height=300,width=900,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
	if (window.focus) {newwindow.focus()}
	return false;
}
 

// -->
</script>


</head>
<body>
<form  method="post" onsubmit="return validatefield()" action="NExASCostmasterBack.jsp"  name="form1" id="form">
<input type="hidden" id="idflag" name="idflag" value="0"/>
<br><br>
 <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td width="1000" align="left"><img src="nippon.gif" height="35" width="220"> </td>
       
    </tr>
 <tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	WELCOME </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">NExAS COST CENTER MASTER</font></strong></td>
</tr>
 <tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2">DESG :<%=session.getAttribute("desg")%> </font></td>
 </tr>
</table>
<br>
 <div class="modal-content">
<div class="modal-header">
      <center> <h2>COST CENTER ENTERY FORM</h2></center>
    </div>
    <div class="modal-body">
<br>
<center>
<table class="dynatable" width="75%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
        <tr>
          <center><td colspan="9"><font size="5" face="Swiss" id="hiderow">Enter Cost Center Details</font></td></center> 
        </tr>
         
	    <tr>
		     <td width="45" align="center"  height="21" ><button class="add" type='button' onclick="checkit_nonit()">+</button></td>
		     <td><font size="2" face="Swiss" id="hiderow">Sl.No</font></td>
		     <td><font size="2" face="Swiss" id="hiderow">Cost Center Name<font color=red>*</font></font></td>
		     <td><font size="2" face="Swiss" id="hiderow">Cost Center Code<font color=red>*</font></font></td>
		     <td><font size="2" face="Swiss" id="hiderow">Operation Range<font color=red>*</font></font></td>
		   
		   </tr>
		 <tr class="prototype">
		           <td width="4" align="center" height="21">
		              <button class="remove" type='button' ><font size="4">-</font></button>
		           </td>
		           <td width="" align="left"  height="21" ><input type="text" id="id1" name="id[]" value="0" size=1 class="id" readonly="readonly" /></td>
		           <td><input type="text" name="cname" maxlength="99" id="idcname" class="cname" value="" size=15 /></td>
		           <td><input type="text" name="ccode" maxlength="99" id="idccode" class="ccode" value="" size=15 /></td>
		           <td><input type="text" name="oprange" maxlength="99" id="idoprange" class="oprange" value="" size=15 />
		           </td>
	       </tr>
   </table>
</center>
	                          	 <br>
	                          	 <center>
	                          	  <a href="costCodeDisp.jsp" onclick="return popitup('costCodeDisp.jsp')">View </a>
			                       <input style="font-size:1" type="submit" value="SAVE" name="save3" id="save1" />
	                               
		                          <input type="button" onclick="history.go(0)" value="CANCLE" />
		                             </center>
		                             <br>

    </div>
</div>
<br>
 <table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../../adminbom.jsp?msg=1"><img src="home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 
<td width="115" align="right"> 
<a href="../../adminbom.jsp?msg=1"><img src="bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table>                        
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center"> <td class="greenLine" style="font-style: italic;"></td></tr>
<tr align="center"><td class="blueLine" style="font-style: italic;"></td></tr>
</table> 
</form>

<div id="resultFromAjax2" style="display:none;">
        
</div>

</body>
</html>