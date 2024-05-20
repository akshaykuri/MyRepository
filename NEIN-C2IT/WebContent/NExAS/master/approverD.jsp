<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="banner.jsp" %>
<%@page import="java.util.ResourceBundle"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <script language="javascript"   type="text/javascript" src="jquery-1.5.1.min.js"></script> <!-- this is for dynamic table -->
<title>APPROVERDISP</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel='stylesheet' type='text/css' href='../../css/headerColor.css' />

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
   document.getElementById("iduseroffice").value="";
   }
function validatefield()
    {
	var  p;
	//alert("Please entere po no..");
	//idabc5,idabc9,idInvDate,idabc6,idabc7,idabc8
	var itnonit=document.getElementById("iditnonit").value;
	var branch=document.getElementById("idbranch").value;
	
	//alert(invdate);
	if(itnonit==null || itnonit=="")
	    {
	    alert("Please selcet FORM TYPE..");
	    iditnonit.focus();
        return false;
	    }
	else if(branch==null || branch=="")
        {
         alert("Please select BRANCH..");
         idbranch.focus();
         return false;
         } 
	
 }
</script>  

<body onload="myFunction()">
<form  method="post" onsubmit="return validatefield()" action="approverDisp.jsp?id=1"  name="form1" id="form">
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
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">C2IT FORM APPROVER DISP</font></strong></td>
</tr>
 <tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2">DESG :<%=session.getAttribute("desg")%> </font></td>
 </tr>
</table>
<br>
 <div class="modal-content">
<div class="modal-header">
      <center> <h2>APPROVER SEARCH FORM</h2></center>
    </div>
    <div class="modal-body">
<br>
<center>
<table class="dynatable" width="75%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
        
          <tr>
                  <td><font size="2" face="Swiss" id="hiderow">FORM TYPE.<font color=red>*</font></font></td> 
                  <td>
		                  <select name="itnonit" class="Citnonit" id="iditnonit" >
        					<option value="">Select</option>
                            <option value="APPLICATION">NEIN APPLICATION FORM</option>
                            <option value="Audit_Form">AUDIT FORM</option> 
                            <option value="GATEPASS">GATEPASS</option>
                            <option value="CHECKLIST">CHECKLIST</option>
                            <option value="INCIDENTLOG">INCIDENTLOG</option>
                            <option value="CCDUser">CCDUSER</option>
                            <option value="CCDReport">CCDREPORT</option>
                            <option value="NEINUser">NEINUSER</option>
                            <!-- <option value="TMSUser">TMSUSER</option>
                            <option value="GSNET">GSNET</option> -->
                            <option value="IT_CLS">IT CLEARANCE</option>
                            <!-- <option value="LOTUS_NOTES">LOTUS_NOTES</option>
                            <option value="DOMAIN">DOMAIN</option>
                            <option value="NEWINS">NEWINS</option> 
                            <option value="ACCESS_CARD">ACCESS CARD</option> -->
                           <!-- <option value="LOTUS_TRAVELER">LOTUS TRAVELER</option>
                             <option value="SHARRED_FOLDER">SHARRED FOLDER</option>
                             <option value="INTERNET_ACCESS">INTERNET ACCESS</option>
                             <option value="USB_ACCESS">USB ACCESS</option> -->
					    </select>	
				  </td>
				  <td><font size="2" face="Swiss" id="hiderow">BRANCH<font color=red>*</font></font></td> 
		          <td><%Connection con = null;
		          ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
		      	String userName = dbProperties.getString("csdb.username");
		      	String password = dbProperties.getString("csdb.password");
		      	String url = dbProperties.getString("csdb.url");
		      	String driver = dbProperties.getString("csdb.driverName");
		      	String dbName = dbProperties.getString("csdb.dbName");
                            // int sumcount=0;
                        Statement st=null;
                        ResultSet rs=null; 
                     try
                       {
                    	// id="idBranch"
						 Class.forName(driver).newInstance();
                         con= DriverManager.getConnection(url+dbName,userName,password); 
						String query = "select m_b_name,m_b_no from branch_master_main ORDER BY m_b_name Asc";
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
                  <!--   <td><font size="2" face="Swiss" id="hiderow">USER/OFFICE<font color=red>*</font></font></td> 
                  <td>
		                 <select name="useroffice"  id="iduseroffice" >
        					<option value="">Select</option>
                            <option value="USER">USER</option>
                            <option value="OFFICE">OFFICE</option>
					    </select>	
				  </td> -->
     </tr>
	   
   </table>
</center>
	                          	 <br>
	                          	 <center>
	                          	 
			                       <input style="font-size:1" type="submit" value="SEARCH" name="save3" id="save1" />
	                               
		                          <input type="button" onclick="history.go(0)" value="CANCLE" />
		                             </center>
		                             <br>

    </div>
</div>
<br>
 <table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../adminbom.jsp"><img src="home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 
<td width="115" align="right"> 
<a href="createrouting.jsp?msg=1"><img src="bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
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