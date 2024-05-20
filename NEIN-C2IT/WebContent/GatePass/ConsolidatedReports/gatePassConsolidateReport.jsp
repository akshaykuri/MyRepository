
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="../banner.jsp" %>
<%@page import="java.util.ResourceBundle"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<body background =".jpg" >
<head><title>GatePassConsolidatedReport</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel='stylesheet' type='text/css' href='../../css/headerColor.css' />
<link rel="shortcut icon" href="../images/faviconnnnn.ico" />

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
div#id
 {
  width:100px;
  height:100px;
 }
</style>
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
    background-color: #D5F5E3  ;
    }
.modal-content {
    position: relative;
    background-color: #D5F5E3  ;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 50%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
    }
.modal-header {
     padding: 2px 16px;
     background-color: #D5F5E3  ;
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
 <style>
.dynatable1 {
	border: solid 1px #000; 
    border-collapse: collapse;
	}
.dynatable1 td {
	border: solid 1px #000; 
	padding: 2px 10px;
	width: 100px;
	text-align: left;
	}
.dynatable1 .prototype {
	display:none;
	}
</style>
</head>
<script type="text/javascript">
$(document).ready(function () 
    {
	$("#iddatefrom").datepicker({ changeMonth: true, changeYear: true,  dateFormat: 'dd-mm-yy ' }).val();  
	$("#iddateto").datepicker({ changeMonth: true, changeYear: true,  dateFormat: 'dd-mm-yy' }).val();  
	
    });

</script>
<script>

function validate1()
    {
	// iditnonit,idRETURNABLE_NON,iddatefrom,iddateto,idbranch
	var itnon=document.getElementById("iditnonit").value;
	var passtype=document.getElementById("idRETURNABLE_NON").value;
	var formdate=document.getElementById("iddatefrom").value;
	var todate=document.getElementById("iddateto").value;
	var branch=document.getElementById("idbranch").value;
	//alert(passtype);
	//alert(formno);
	if(itnon=="" && passtype=="" && formdate=="" && todate=="" && branch=="")
	    {
	    alert("Please selcet any one serach field..");
	    return false;
	    }
	else
        return true;
       
 }
</script>  

    <script type="text/javascript">




 function link1() {
   			// document.form.action="PoDayToDayExcel";
   			document.form.action="gatePassReportExcel.jsp";
   			 document.form.method="post";
   			 document.form.submit();
   			     }
 function OnButton1() {
	         //alert("Here..");
   			 document.form.action="gatePassReportView.jsp";
   			 document.form.method="post";
   			 document.form.submit();
   			     }

</script>            



<body > 
<div id="wrapper">
<br><br><br>
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td width="1000" align="left"><img src="../../images/nippon.gif" height="35" width="220"> </td>
      
    </tr>
  <tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	C2IT (CONNECT TO IT) </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">GATE PASS CONSOLIDATED REPORT</font></strong></td>
</tr>
  <tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2">DESG :<%=session.getAttribute("desg")%> </font></td>
  </tr>
</table>
<br />
<br />
<form name="form" method="post" onsubmit="return validate()"  onsubmit="POPUPW = window.open('about:blank','POPUPW',   'width=900,height=1000,location=1,status=1,scrollbars=1');">
<div class="modal-content">
<div class="modal-header">
      <center> <h2>GATE PASS CONSOLIDATED REPORT</h2></center>
    </div>
    <div class="modal-body">
<CENTER>
<%
String city = (String) session.getAttribute("city");
String b_no = (String) session.getAttribute("b_no");
System.out.println("City Name :"+city);
System.out.println("Branch Number :"+b_no);
String addr=null,loc=null;
Connection conn=null;
Statement st=null,st1=null; 
ResultSet rs=null,rs1=null;

%>
<input type="hidden" name="city" value="<%=city%>" />
<input type="hidden" name="cityno" id="idcityno" value="<%=b_no%>" />
<table class="dynatable1" width="85%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor=#D5F5E3  >
          <tr>
                  <td colspan="2"><font size="2" face="Swiss" id="hiderow">IT/NONIT<font color=red>*</font></font>
				  <select name="itnonit"  id="iditnonit"  style="width: 60px">
        					   <option value="">Select</option>
        					   <option value="IT">IT</option>
                               <option value="NONIT">NONIT</option>
                          </select>	
				  </td>
                  <td colspan="2"><font size="2" face="Swiss" id="hiderow">Returnable/NonReturnable<font color=red>*</font></font> 
                     <select name="RETURNABLE_NON"  id="idRETURNABLE_NON"  style="width: 130px">
        	  	           <option value="">Select</option>
        	  	           <option value="RETURNABLE">RETURNABLE</option>
                           <option value="NON_RETURNABLE">NON-RETURNABLE</option>
                        </select>	
		         </td>
			 
		
          </tr>
          <tr>
               <td colspan="2"><font size="2" face="Swiss" id="hiderow">From Date:<font color=red>*</font></font>
				 <input type="text" name="datefrom" maxlength="99" id="iddatefrom"  value="" size=10 /></td>
			  <td colspan="2"><font size="2" face="Swiss" id="hiderow">To Date:<font color=red>*</font></font>
				  <input type="text" name="dateto" maxlength="99" id="iddateto"  value="" size=10 /></td>
          </tr>
          
          <tr>
                <td colspan="2"><font size="2" face="Swiss" id="hiderow">GatePass Branch :<font color=red>*</font></font></p></td> 
		  	    <td colspan=2>
                       <select name="branch"  id="idbranch"  style="width:200px">
                       <option value="">Select</option>
                            <%
                            ResourceBundle dbProperties = ResourceBundle.getBundle("nepldb");
                        	String userName = dbProperties.getString("nepldb.username");
                        	String password = dbProperties.getString("nepldb.password");
                        	String url = dbProperties.getString("nepldb.url");
                        	String driver = dbProperties.getString("nepldb.driverName");
                        	String dbName = dbProperties.getString("nepldb.dbName");
                            
                            
                            
                            try{
                            	Class.forName(driver).newInstance();
                                conn = DriverManager.getConnection(url+dbName,userName,password); 
                            	String query = "select * from billto order by bto_location asc";
                            	st = conn.createStatement();
                            	rs = st.executeQuery(query);
                            while(rs.next())
                                  {
                            	addr=rs.getString(3);loc=rs.getString(4);
                                  %>
        					      <option value="<%=loc%>"><%=loc%></option>
        					      <%}
        					       }catch(Exception ex)
	                                    {
		    	                        ex.printStackTrace();
		 	                       }%>
        	           </select>				
			    
           </tr>
          <tr>
             <td colspan=4> <center><input style="font-size:1" type="submit" value="View" name="save3" id="save1" onclick="return OnButton1();"/>
                                    <input style="font-size:1" type="submit" value="Excel" name="save3" id="save2" onclick="return link1()"/>
	                                <input type="button" onclick="history.go(0)" value="CANCLE" /></center>
	         </td>
          </tr>
</table>
<br>
<br>
</CENTER>	
</div>
</div>
<br>
</form>
<br>
<br>

<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../../HOME.jsp"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 
<td width="115" align="right"> 
<a href="../../adminHR.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table> 


<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center"> <td class="greenLine" style="font-style: italic;"></td></tr>
<tr align="center"><td class="blueLine" style="font-style: italic;"></td></tr>
</table> 
</div>




</body>
</html>