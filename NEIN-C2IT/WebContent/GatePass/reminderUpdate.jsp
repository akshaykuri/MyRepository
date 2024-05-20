
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="banner.jsp" %>
<%@page import="java.util.ResourceBundle"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<body background =".jpg" >
<head><title>GatePassReport</title>
<link rel="shortcut icon" href="../images/faviconnnnn.ico" />

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />

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
    width: 30%;
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

<script>

function validate()
    {
	// idRETURNABLE_NON, idpassFormNo
	//var passtype=document.getElementById("idRETURNABLE_NON").value;
	var formno=document.getElementById("idpassFormNo").value;
	//alert(passtype);
	//alert(formno);
	
     if(formno==null || formno=="Select")
        {
         alert("Please select form no..");
         return false;
         } 
 }
</script>  




<body > 
<div id="wrapper">
<br><br><br>
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
       
    </tr>
  <tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	C2IT (CONNECT TO IT) </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">GATE PASS REMINDER UPDATE</font></strong></td>
</tr>
  <tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2">DESG :<%=session.getAttribute("desg")%> </font></td>
  </tr>
</table>
<br />
<br />
<form name="form" method="post" onsubmit="return validate()" action="reminderUpdateBack.jsp?msg=1" method="post" name="form" >
<div class="modal-content">
<div class="modal-header">
      <center> <h2>GATE PASS REMINDER UPDATE</h2></center>
    </div>
    <div class="modal-body">
<CENTER>
<%
String city = (String) session.getAttribute("city");
String b_no = (String) session.getAttribute("b_no");
System.out.println("City Name :"+city);
System.out.println("Branch Number :"+b_no);
%>

<%
    //System.out.println("Here");
    String name=null;
    Connection conn = null;
    /* String url = "jdbc:mysql://localhost:3306/";
    String dbName = "csdb";
    String driver = "com.mysql.jdbc.Driver";
    String userName = "root"; 
    String password = ""; */
    ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
	String userName = dbProperties.getString("csdb.username");
	String password = dbProperties.getString("csdb.password");
	String url = dbProperties.getString("csdb.url");
	String driver = dbProperties.getString("csdb.driverName");
	String dbName = dbProperties.getString("csdb.dbName");
    try{ 
    	Class.forName(driver).newInstance();
        conn = DriverManager.getConnection(url+dbName,userName,password); 
        Statement stmt = conn.createStatement(); 
        Statement stmt1 = conn.createStatement(); 
        ResultSet rs=null,rs1=null;
     //   if(s.equals("90"))
              rs1 = stmt1.executeQuery("SELECT DISTINCT formno from GatePassForm where approvalStatus='Approved' and passType='RETURNABLE' and  cityNo='" + b_no + "' and reminderUpdateFlag='0' order by formno desc");
        
           //System.out.println("buffer :"+buffer);
   %>
 
<input type="hidden" name="city" value="<%=city%>" />
<input type="hidden" name="cityno" id="idcityno" value="<%=b_no%>" />
<table class="dynatable1" width="85%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor=#D5F5E3  >
          <tr>
            
			 <td ><font size="2" face="Swiss" id="hiderow">Gate Pass No. :<font color=red>*</font></font> 	</td>
                  <td>	
                		 <select name="passFormNo" id="idpassFormNo" >  
                        <option selected="">Select</option> 
                         <%
                         while(rs1.next())
                         {%>
                	        <option value='<%=rs1.getString(1)%>'><%=rs1.getString(1)%></option>
                       <%}%>
                   </select> 
                   </td>
		
          </tr>
          <tr>
             <td colspan=4> <center><input style="font-size:1" type="submit" value="SUBMIT" name="save3" id="save1" />
	              <input type="button" onclick="history.go(0)" value="BACK" /></center>
	         </td>
          </tr>
</table>

<%} catch(Exception e)
                {   
	            System.out.println(e);
	            } 
                   finally
	                 {
	            	  conn.close();
			         }%>
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
<a href="../HOME.jsp"><img src="home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 
<td width="115" align="right"> 
<a href="../adminHR.jsp?msg=1"><img src="bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
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