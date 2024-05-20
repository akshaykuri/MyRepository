<%-- <%@page import="CON2.DbUtil"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="CON2.DbUtil"%>
<%@ page import = "java.util.ResourceBundle" %>
<%@page language="java"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.util.Date" %>

<%@ page import="java.sql.*" %>
<%@page import = "java.text.DateFormat" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%@ include file="banner.jsp" %>
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Booking Details</title>
    <link rel='stylesheet' type='text/css' href='css/style.css' />
    <link rel='stylesheet' type='text/css' href='../css/headerColor.css' />
<link rel="shortcut icon" type="image/x-icon" href="../images/faviconnnnn.ico" />
    
	<link rel='stylesheet' type='text/css' href='css/print.css' media="print" />
	<link rel='stylesheet' type='text/css' href='css/show.css' media="show" />
	<script type='text/javascript' src='js/jquery-1.3.2.min.js'></script>
	<script type='text/javascript' src='js/example.js'></script>
    <link rel='stylesheet' type='text/css' href='css/homePage.css' />
    
<style>
.button {
    background:none!important;
     border:none; 
     padding:0!important;
    
    /*optional*/
    font-family:arial,sans-serif; /*input has OS specific font-family*/
     color:red;
     text-decoration:underline;
  
</style>
    
 
    
<SCRIPT Language="Javascript">

/*
This script is written by Eric (Webcrawl@usa.net)
For full source code, installation instructions,
100's more DHTML scripts, and Terms Of
Use, visit dynamicdrive.com
*/

function printit(){  
if (window.print) {
    window.print() ;  
} else {
    var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
document.body.insertAdjacentHTML('beforeEnd', WebBrowser);
    WebBrowser1.ExecWB(6, 2);//Use a 1 vs. a 2 for a prompting dialog box    WebBrowser1.outerHTML = "";  
}
}
function btnClick() { 
         close(); 
}
</script>

<script language="javascript">
function reBook(id,id1,id2,id3)
    {  
	//alert("editttttt idddd"+id);
    var f=document.form;    
    f.method="post";    
    f.action='ReBookingPage.jsp?id='+id+'&id1='+id1+'&id2='+id2+'&id3='+id3;    
    f.submit();
    }
    
/* function editRecord(id)
{  
//alert("editttttt idddd"+id);
var f=document.form;    
f.method="post";    
f.action='EditBookingPage.jsp?id='+id;    
f.submit();
} */
 </script>
 <%
String city_no=null;
String city= null,department=null;
String rights=null;
rights=(String) session.getAttribute("rights");
city_no = (String) session.getAttribute("bno");

%> 
</head>
<body>
<br><br>
 <form method="post" name="form" > 
 <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center">
    <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
        
    </tr>
 
 
 <tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	C2IT (CONNECT TO IT) </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">CANCELLED BOOKING DETAILS</font></strong></td>
</tr>
<tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("fullname")%> </font>&nbsp;&nbsp; 
                <%-- <font size ="2">DESG :<%=session.getAttribute("desg")%> </font> --%>
     <input type="hidden" name="demo1" maxlength="99" id="demo" value="" size=20 readonly/>           
       <input type="hidden" name="empid" value="<%=session.getAttribute("empid")%>" >        
                </td>
 </tr>
</table>

<center>
 <br />
                
	<table border="1" width="120%" align="center" bgcolor="#F0F0F0" bordercolor="#74c1b9">
		<tr>
		<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>Booking Number</b></font></td>
		<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>Booked Date</b></font></td>
		<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>Booked By</b></font></td>
		<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>Canceled By</b></font></td>
	    <td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>From Date</b></font></td>
	    <td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>To Date</b></font></td>
	    <td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>From Time</b></font></td>
	    <td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>To Time</b></font></td>
		<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>Reason For Cancel</b></font></td>
		 <%	 if((rights !=null) && (rights.equals("1")))            
	{%>
		<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>REBOOK</b></font></td>
	 <%} %> 
		</tr>
	
<%
response.setContentType("text/html;charset=UTF-8");
//PrintWriter out1 = response.getWriter();

//System.out.println("in viewwwwwwwwwwww paggggeeeeeeeeeee");
String empid=null;
empid = (String) session.getAttribute("empid");
System.out.println("in edit page empid==="+empid);

String branch=request.getParameter("bpcity");

System.out.println("branch"+branch);


Connection con1 = null;
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");


Statement st=null,st1=null,st2=null,st3=null;
ResultSet rs=null,rs1=null,rs2=null,rs3=null; 
try
{
	Class.forName(driver).newInstance();
	con1= DriverManager.getConnection(url+dbName,userName,password);
String query =null;
PreparedStatement prds=null;

         if(branch.equals("all"))
         {
         query = "SELECT * FROM `conference_room_booking` WHERE status='Inactive' ";
              	 
         }
         else
         {
		  query = "SELECT * FROM `conference_room_booking` WHERE booking_for_branch='"+branch+"' and status='Inactive' ";
         }
		  prds = con1.prepareStatement(query);
		rs = prds.executeQuery();
	
%>
<%while(rs.next()){%>
<tr>
 
<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("Booking_no")%></font></td>
<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><center><%=rs.getString("booked_date")%></center></font></td>
<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("user_name")%></font></td>
<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("cancelled_by")%></font></td>
<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><center><%=rs.getString("from_date")%></center></font></td>
<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><center><%=rs.getString("to_date")%></center></font></td>
<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><center><%=rs.getString("from_time")%></center></font></td>
<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><center><%=rs.getString("to_time")%></center></font></td>
<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("Cancel_remarks")%></font></td>
<%	 if((rights !=null) && (rights.equals("1")))            
	{%>
<td style="background-color:#d2f7f3"><input id="hiderow" type="button" size="2" name="rebook" value="ReBook" style="background-color:white;font-weight:bold;color:black;" onclick='reBook("<%=rs.getString("Booking_no")%>","<%=rs.getString("from_date")%>","<%=rs.getString("to_date")%>","<%=rs.getString("from_time")%>","<%=rs.getString("to_time")%>");' ></td>

 <%} %> 
<%-- <td style="background-color:#d2f7f3"><input id="hiderow" type="button" size="2" name="edit" value="Edit" style="background-color:white;font-weight:bold;color:black;" onclick='editRecord("<%=rs.getString("Booking_no")%>");' ></td>
 --%> 
 <%}%>
 
<%} catch (SQLException ex) {
    ex.printStackTrace();
}	
finally{
			}%>

	</table>
<br>
</form> 

<br>
<br>
<form action="../ConferenceRoomReport" method="get">
<input type="hidden" name="view" value="cancel">
 <input type="hidden" name="branch" value="<%=branch%>">
		<table align="center" border="0" width="1200">
			<tr>    
				<td align="center"><input type="submit" value="ExportToExcel" class="hollow">
				</td>
			</tr>
		</table>
</form>
<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../HOME.jsp"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 
<td width="115" align="right"> 
<a href="SearchCancelBooking.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table>                        
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
   <tr align="center"> <td class="greenLine" style="font-style: italic;"></td></tr>
<tr align="center"><td class="blueLine" style="font-style: italic;"></td></tr>
</table> 

</body>
</html>