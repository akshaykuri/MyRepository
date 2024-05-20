<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="CON2.DbUtil"%>
<%@ page import = "java.util.ResourceBundle" %>
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
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />
<link rel="shortcut icon" type="image/x-icon" href="../images/faviconnnnn.ico" />

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<title>Search page</title>
<script  type="text/javascript">
<% 
String msg[] = request.getQueryString().toString().split("=");

String disp = msg[1].toString();
disp = disp.replace("%20", "");
disp = disp.replace("%27", " ");
disp = disp.replace("__","   ");

    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
</script>
<script type="text/javascript">
$(document).ready(function() {
	           
	      $("#fromdate").datepicker({dateFormat: 'yy-mm-dd'});	
	      $("#todate").datepicker({dateFormat: 'yy-mm-dd'});
       }); 
	
</script>
<script language="javascript" type="text/javascript">
	function Validation()
	{ 		
		 //alert("hiiiiiiiiiii");
		 var fromdate = document.getElementById("#fromdate").value; 
		 var todate = document.getElementById("#todate").value;
	  
		
	  if(fromdate ==''){		
            alert("select fromdate");
            return false;
       }  
	  if(todate ==''){		
          alert("select todate");
          return false;
     }  
	 
		return true;
	}
	
</script>
</head>

<body background="../images/u.jpg">
<form method="post" name="form1" action="ViewAllBooking.jsp?result=0">

<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
         <tr align="center">
    <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
        
    </tr>
 
         <tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	C2IT (CONNECT TO IT) </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">SEARCH PAGE</font></strong></td>
</tr>
         <tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("fullname")%> </font>&nbsp;&nbsp; 
                <%-- <font size ="2">DESG :<%=session.getAttribute("desg")%> </font> --%></td>
 </tr>
   </table>
<br><br>
 <div align="center"> 
          Select Branch:
            <%Connection con1 = null;
 ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
 String userName = dbProperties.getString("csdb.username");
 String password = dbProperties.getString("csdb.password");
 String url = dbProperties.getString("csdb.url");
 String driver = dbProperties.getString("csdb.driverName");
 String dbName = dbProperties.getString("csdb.dbName");
                                                  // int sumcount=0;
                                                  Statement st1=null;
                                                  ResultSet rs1=null; 
                                                  int flag=0;
                                                  try
                                                     {
                                                	  Class.forName(driver).newInstance();
                                                	  con1= DriverManager.getConnection(url+dbName,userName,password);
                                                     String query = "select * from leavemanagement.branchmaster ORDER BY branch_name";
                                                     st1 = con1.createStatement();
                                                     rs1= st1.executeQuery(query);
                                                 %>
                                       <select name="bpcity" onchange="showEmp(this.value)" style="font-size: 11px;width: 142px;overflow: auto;height: 20px " autofocus>      
                                       <option value="none">Select</option>
                                       <option value="all">All Branch</option>
	                                            <%while(rs1.next()){ flag=1;%>
	                                           <!--  <option value="all">All Branch</option> -->
			                                    <option value="<%=rs1.getString("branch_type_code")%>"><%=rs1.getString("branch_name")%></option>
    	                                        <%}%>
	                                  </select>

                                          <%} catch (SQLException ex) {
                                                     ex.printStackTrace();
                                                     }	
                                              finally{
	                                            	//	DbUtil.closeDBResources(rs,st,con);
		                                             con1.close();
                                        			}%> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
            <br><br> From Date:<input type="text" name="fromdate" id="fromdate" required>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp 
        To Date:<input type="text" name="todate" id="todate" required>
        <input type="hidden" name="msg" id="msg" value="1">
        <br><br> <input type="submit" value="Submit" ></div><br><br> <br><br>

<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
	<tr> 
	<td width="1000" align="left"> 
	<a href="../HOME.jsp?msg=1"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
	</td> 
	<td width="115" align="right"> 
	<a href="ConRoomHome.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
	</td> 
	</tr> 
</table>  
  <br>
  <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center"> <td class="greenLine" style="font-style: italic;"></td></tr>
<tr align="center"><td class="blueLine" style="font-style: italic;"></td></tr>
  </table>
</form>
</body>
</html>