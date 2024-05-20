<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="CON2.DbUtil"%>

<%@page language="java"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.util.Date" %>
<%@page import = "java.sql.*" %> 
<%@page import = "java.text.DateFormat" %>
<%@page import = "java.text.SimpleDateFormat" %>

<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ include file="../banner.jsp" %>
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" />

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<title>Search page</title>

<script type="text/javascript">
$(document).ready(function() {
	           
	      $("#fromdate").datepicker({dateFormat: 'dd-mm-yy'});	
	      $("#todate").datepicker({dateFormat: 'dd-mm-yy'});
       }); 
	
</script>
<script language="javascript" type="text/javascript">
	function Validation()
	{ 		
		 var branch = document.forms["form1"]["circuitid"].value; 
		 var fromdate = document.forms["form1"]["fromdate"].value; 
		 var todate = document.forms["form1"]["todate"].value; 
	  if(branch == "Select"){		
		              alert("select circuitid");
		              return false;
		    }  
		
	  if(fromdate == ''){		
            alert("select fromdate");
            return false;
       }  
	  if(todate == ''){		
          alert("select todate");
          return false;
     }  
	 
		return true;
	}
	
</script>
</head>

<body background="../images/u.jpg">
<form method="post" name="form1" action="ViewIspOutage.jsp?result=0">

<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
   <tr align="center">
         <td width="1000" align="left"><img src="../images/logo.png" height="35" width="220"> </td>
         <!-- <td width="115" align="right"><img src="../images/cs-soft.jpg" height="30" width="100" > </td> -->
     </tr> 
   <tr align="center">
          <td class="greenLine"><strong><font size ="4" color="white" ><b> WELCOME </b></font></strong></td>
   </tr>
   <tr align="center">
    <td class="blueLine"><strong><font size ="4" color="white">C2IT (CONNECT TO IT)</font></strong></td>
   </tr>
   <tr> 
      <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp;<font size ="2">DESG :<%=session.getAttribute("desg")%> </font>
</td>
 </tr>
   </table>
<br><br>
 <div align="center"> 
          Circuit Id:
             <%              Connection con1 = null;
							 Connection2 dbConn = new Connection2();
							 con1 = dbConn.getConnection2();
                             
                             Statement st1=null;
                             ResultSet rs1=null; 
                             String bNo=(String)session.getAttribute("b_no");
                             String query=null;
                           try
                              { 
                           
                              if(bNo.equals("90")){
                                   query = "SELECT * FROM `circuitidmaster_details`";
                                 }
                              if(bNo.equals("40")){
                           	   
	                           	   query = "SELECT * FROM `circuitidmaster_details` c INNER JOIN branch_master b1 ON b1.id=c.`branch_id` where b1.b_no in(40,41,52,43,42) ";
                               }
                              if(bNo.equals("20")){ 
                           	   
                            	  query = "SELECT * FROM `circuitidmaster_details` c INNER JOIN branch_master b1 ON b1.id=c.`branch_id` where b1.b_no in(20,51,21,89,88,22,23,24,25,26,27,28)";
                              }
                              if(bNo.equals("30")){ 
                           	   
                            	  query = "SELECT * FROM `circuitidmaster_details` c INNER JOIN branch_master b1 ON b1.id=c.`branch_id` where b1.b_no in(30,31,53,32,11)";
                              }
                              if(bNo.equals("10")){ 
                           	   
                            	  query = "SELECT * FROM `circuitidmaster_details` c INNER JOIN branch_master b1 ON b1.id=c.`branch_id` where b1.b_no in(10)";
                              }
                              if(!(bNo.equals("10") || bNo.equals("20") || bNo.equals("30") || bNo.equals("40") || bNo.equals("90"))){ 
                            	  query = "SELECT * FROM `circuitidmaster_details` c INNER JOIN branch_master b1 ON b1.id=c.`branch_id` where b1.b_no='"+bNo+"'";
                              }
                              
                               st1 = con1.createStatement();
                               rs1 = st1.executeQuery(query);
                              %>
                <select name="circuitid" id="circuitid" >
		        <option >Select</option>
		        <option value="All">All</option>
	              <%while(rs1.next()){%>
			        <option value="<%=rs1.getString(2)%>"><%=rs1.getString(2)%></option>
    	            <%}%>
	           </select>

                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                       //	DbUtil.closeDBResources(rs,st,con);
		                     con1.close();
                            	}%>
       
        <br><br> From Date:<input type="text" name="fromdate" id="fromdate">&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp 
        To Date:<input type="text" name="todate" id="todate" >
        <input type="hidden" name="msg" id="msg" value="1">
        <br><br> <input type="submit" value="Submit" onclick="return (Validation());"></div><br><br> <br><br>

<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
	<tr> 
	<td width="1000" align="left"> 
	<a href="../HOME.jsp?msg=1"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
	</td> 
	<td width="115" align="right"> 
	<a href="../OtherPage.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
	</td> 
	</tr> 
</table>  
  <br>
  <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
<tr align="center"> <td class="greenLine" >&nbsp;</td></tr>
<tr align="center"><td class="blueLine" >&nbsp;</td></tr>
  </table>
</form>
</body>
</html>