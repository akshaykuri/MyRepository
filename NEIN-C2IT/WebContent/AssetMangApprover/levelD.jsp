<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="banner.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <script language="javascript"   type="text/javascript" src="jquery-1.5.1.min.js"></script> <!-- this is for dynamic table -->
<title>MR Level</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
if(session==null||session.getAttribute("city")==null||session.getAttribute("Nname")==null)
    {
	String msgg=null;
	msgg="Session__Time__out \\n Login__In__Again ";
	response.sendRedirect("loginho.jsp?msg="+msgg);
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

<script language="javascript" type="text/javascript"> 



function myFunction()
   {
   document.getElementById("iditnonit").value ="";
   document.getElementById("idbranch").value="";
   
   document.getElementById("idrmaster").value ="";
   
   document.getElementById("iduseroffice").value="";
   }
function validatefield()
    {
	var  p;
	//alert("Please entere po no..");
	//idabc5,idabc9,idInvDate,idabc6,idabc7,idabc8
	
	var rmaster=document.getElementById("idrmaster").value;
	var itnonit=document.getElementById("iditnonit").value;
	var branch=document.getElementById("idbranch").value;
	var useroffice=document.getElementById("iduseroffice").value;
	//alert(invdate);
	
	
	if(rmaster==null || rmaster=="")
	    {
	    alert("Please selcet Master For.");
	    idrmaster.focus();
        return false;
	    }
	
	if(itnonit==null || itnonit=="")
	    {
	    alert("Please selcet IT/NONIT..");
	    iditnonit.focus();
        return false;
	    }
	else if(branch==null || branch=="")
        {
         alert("Please select branch..");
         idbranch.focus();
         return false;
         } 
	else if(useroffice==null || useroffice=="")
    {
     alert("Please select user office..");
     iduseroffice.focus();
     return false;
     } 
 }
</script>  

<body onload="myFunction()">
<form  method="post" onsubmit="return validatefield()" action="levelDisp.jsp?id=1"  name="form1" id="form">
<input type="hidden" id="idflag" name="idflag" value="0"/>
<br><br>
 <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td width="1000" align="left"><img src="nippon.gif" height="35" width="220"> </td>
        <td width="115" align="right"><img src="cs-soft.jpg" height="30" width="100" > </td>
    </tr>
  <tr align="center">
    <td bgcolor="#ec691f" colspan="2"><strong><font size ="4" color="white"><b>WELCOME</b> <br />
    
 </font></strong></td></tr>
 <tr align="center">
 <td bgcolor="#2f4377" colspan="2"><strong><font size ="4" color="white">ASSET MANGEMENT LEVEL DISP</font></strong></td></tr>
<tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2">DESG :<%=session.getAttribute("desg")%> </font></td>
 </tr>
</table>
<br>
 <div class="modal-content">
<div class="modal-header">
      <center> <h2>ASSET MANAGMENT LEVEL SEARCH FORM</h2></center>
    </div>
    <div class="modal-body">
<br>
<center>
<table class="dynatable" width="75%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
        
          <tr>
          <td ><font size="2" face="Swiss" id="hiderow">SELECT MASTER FOR </font><font color=red>*</font></td> 
          <td>
		                 <select name="rmaster" class="crmaster" id="idrmaster" >
        					<option value="">Select</option>
                            <option value="DISPOSAL">DISPOSAL</option>
                            <option value="TRANSFER">TRANSFER</option>
					    </select>	
				  </td>
                  <td><font size="2" face="Swiss" id="hiderow">IT/NONIT ASSET<font color=red>*</font></font></td> 
                  <td>
		                 <select name="itnonit" class="Citnonit" id="iditnonit" >
        					<option value="">Select</option>
                            <option value="IT">IT</option>
                            <option value="NONIT">NONIT</option>
					    </select>	
				  </td>
				  <td><font size="2" face="Swiss" id="hiderow">Branch<font color=red>*</font></font></td> 
		          <td><%Connection con = null;
                        String url = "jdbc:mysql://localhost:3306/";
                        String db = "csdb";
                        String driver = "com.mysql.jdbc.Driver";
                        String userName ="root";
                        String password="";
                            // int sumcount=0;
                        Statement st=null;
                        ResultSet rs=null; 
                     try
                       {
                    	// id="idBranch"
						Class.forName(driver).newInstance();
						con = DriverManager.getConnection(url+db,userName,password);
						String query = "select b_name,b_no from branch_master ORDER BY b_name Asc";
						st = con.createStatement();
 						rs = st.executeQuery(query);
						%>
							<select name="branch" id="idbranch" onchange="return checkchangeit_nonit(),featchitems(this.value); " onclick="return checkchangeit_nonit1();">
							<option value="">Select</option>
							<%while(rs.next()){%>
								<option value="<%=rs.getString(2)%>"><%=rs.getString(1)%></option>
									
    						<%}%>
							</select>
					<%} catch (SQLException ex) {
    											ex.printStackTrace();
												}	
						finally{
							//	DbUtil.closeDBResources(rs,st,con);
							con.close();
					   }%>
                   </td>
                   <td><font size="2" face="Swiss" id="hiderow">USER/OFFICE<font color=red>*</font></font></td> 
                  <td>
		                 <select name="useroffice"  id="iduseroffice" >
        					<option value="">Select</option>
                            <option value="USER">USER</option>
                            <option value="OFFICE">OFFICE</option>
					    </select>	
				  </td>
     </tr>
	   
   </table>
</center>
	                          	 <br>
	                          	 <center>
	                          	 
			                       <input style="font-size:1" type="submit" value="SEARCH" name="save3" id="save1" />
	                               
		                          <input type="button" onclick="history.go(-1)" value="CANCLE" />
		                             </center>
		                             <br>

    </div>
</div>
<br>
 <table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../HOME.jsp"><img src="home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 
<td width="115" align="right"> 
<a href="../levelOfApprovar.jsp?msg=1"><img src="bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table>                        
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#2f4377" align="center"><strong><font size ="3" color="white"> NIPPON EXPRESS (INDIA) PRIVATE LIMITED - GLOBAL LOGISTICS PROVIDER</font></strong></td>
    
  </tr>
</table> 
</form>

<div id="resultFromAjax2" style="display:none;">
        
</div>



</body>
</html>